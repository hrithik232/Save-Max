import 'package:moor_generator/moor_generator.dart';
import 'package:moor_generator/src/analyzer/errors.dart';
import 'package:moor_generator/src/analyzer/runner/steps.dart';
import 'package:moor_generator/src/analyzer/moor/create_table_reader.dart';
import 'package:moor_generator/src/analyzer/runner/results.dart';
import 'package:moor_generator/src/model/sql_query.dart';
import 'package:sqlparser/sqlparser.dart';

class MoorParser {
  final ParseMoorStep step;

  MoorParser(this.step);

  Future<ParsedMoorFile> parseAndAnalyze() async {
    final engine = step.task.session.spawnEngine();
    final result = engine.parseMoorFile(step.content);
    final parsedFile = result.rootNode as MoorFile;

    final createdReaders = <CreateTableReader>[];
    final queryDeclarations = <DeclaredMoorQuery>[];
    final importStatements = <ImportStatement>[];

    final createdEntities = <MoorSchemaEntity>[];

    for (final parsedStmt in parsedFile.statements) {
      if (parsedStmt is ImportStatement) {
        final importStmt = parsedStmt;
        importStatements.add(importStmt);
      } else if (parsedStmt is TableInducingStatement) {
        createdReaders.add(CreateTableReader(parsedStmt, step));
      } else if (parsedStmt is CreateTriggerStatement) {
        // the table will be resolved in the analysis step
        createdEntities.add(MoorTrigger.fromMoor(parsedStmt, step.file));
      } else if (parsedStmt is CreateIndexStatement) {
        createdEntities.add(MoorIndex.fromMoor(parsedStmt, step.file));
      } else if (parsedStmt is DeclaredStatement) {
        if (parsedStmt.isRegularQuery) {
          queryDeclarations.add(DeclaredMoorQuery.fromStatement(parsedStmt));
        } else {
          final identifier =
              parsedStmt.identifier as SpecialStatementIdentifier;
          if (identifier.specialName != 'create') {
            step.reportError(
              ErrorInMoorFile(
                span: identifier.nameToken.span,
                message: 'Only @create is supported at the moment.',
              ),
            );
          } else {
            createdEntities.add(SpecialQuery.fromMoor(parsedStmt, step.file));
          }
        }
      }
    }

    for (final error in result.errors) {
      step.reportError(ErrorInMoorFile(
        severity: Severity.error,
        span: error.token.span,
        message: error.message,
      ));
    }

    for (final reader in createdReaders) {
      createdEntities.add(await reader.extractTable(step.mapper));
    }

    final analyzedFile = ParsedMoorFile(
      result,
      declaredEntities: createdEntities,
      queries: queryDeclarations,
      imports: importStatements,
    );
    for (final decl in queryDeclarations) {
      decl.file = analyzedFile;
    }

    return analyzedFile;
  }
}
