import 'dart:async';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/context_locator.dart';
import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer/src/dart/analysis/context_builder.dart';
import 'package:analyzer/src/dart/analysis/session.dart';
import 'package:meta/meta.dart';

main() async {
  var flutterPath =
      '/Users/scheglov/dart/Aaronia/trunk/Sources/RTSAMobileDev/aartos';
  while (true) {
    var contexts = _createContexts(
      includedPaths: [
        '$flutterPath',
      ],
    );
    contexts.sort((a, b) {
      var ap = a.contextRoot.root.path;
      var bp = b.contextRoot.root.path;
      return ap.compareTo(bp);
    });

    print('');
    for (var context in contexts) {
      print(context.contextRoot.root);
      print('    files: ${context.contextRoot.analyzedFiles().length}');
    }

    for (var context in contexts) {
      AnalysisSessionImpl sessionImpl = context.currentSession;
      for (var file in context.contextRoot
          .analyzedFiles()
          .where((file) => file.endsWith('.dart'))) {
        await sessionImpl.getResolvedUnit(file);
      }
    }

    await Future.delayed(Duration(seconds: 5));
  }
}

List<AnalysisContext> _createContexts({
  @required List<String> includedPaths,
}) {
  ResourceProvider resourceProvider = PhysicalResourceProvider.INSTANCE;
  final List<AnalysisContext> contexts = [];
  var contextLocator = ContextLocator(
    resourceProvider: resourceProvider,
  );
  var roots = contextLocator
      .locateRoots(includedPaths: includedPaths, excludedPaths: []);
  for (var root in roots) {
    var contextBuilder = ContextBuilderImpl(
      resourceProvider: resourceProvider,
    );
    var context = contextBuilder.createContext(
      contextRoot: root,
//      performanceLog: PerformanceLog(stdout),
    );
    contexts.add(context);
  }
  return contexts;
}
