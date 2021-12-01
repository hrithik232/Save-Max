part of 'parser.dart';

mixin SchemaParser on ParserBase {
  SchemaStatement _create() {
    if (!_matchOne(TokenType.create)) return null;

    if (_check(TokenType.table) || _check(TokenType.virtual)) {
      return _createTable();
    } else if (_check(TokenType.trigger)) {
      return _createTrigger();
    } else if (_check(TokenType.unique) || _check(TokenType.$index)) {
      return _createIndex();
    }

    return null;
  }

  /// Parses a `CREATE TABLE` statement, assuming that the `CREATE` token has
  /// already been matched.
  TableInducingStatement _createTable() {
    final first = _previous;
    assert(first.type == TokenType.create);

    final virtual = _matchOne(TokenType.virtual);

    _consume(TokenType.table, 'Expected TABLE keyword here');

    final ifNotExists = _ifNotExists();

    final tableIdentifier = _consumeIdentifier('Expected a table name');

    if (virtual) {
      return _virtualTable(first, ifNotExists, tableIdentifier);
    }

    // we don't currently support CREATE TABLE x AS SELECT ... statements
    final leftParen = _consume(
        TokenType.leftParen, 'Expected opening parenthesis to list columns');

    final columns = <ColumnDefinition>[];
    final tableConstraints = <TableConstraint>[];
    // the columns must come before the table constraints!
    var encounteredTableConstraint = false;

    do {
      try {
        final tableConstraint = _tableConstraintOrNull();

        if (tableConstraint != null) {
          encounteredTableConstraint = true;
          tableConstraints.add(tableConstraint);
        } else {
          if (encounteredTableConstraint) {
            _error('Expected another table constraint');
          } else {
            columns.add(_columnDefinition());
          }
        }
      } on ParsingError {
        // if we're at the closing bracket, don't try to parse another column
        if (_check(TokenType.rightParen)) break;
        // error while parsing a column definition or table constraint. We try
        // to recover to the next comma.
        _synchronize(TokenType.comma);
        if (_check(TokenType.rightParen)) break;
      }
    } while (_matchOne(TokenType.comma));

    final rightParen =
        _consume(TokenType.rightParen, 'Expected closing parenthesis');

    var withoutRowId = false;
    if (_matchOne(TokenType.without)) {
      _consume(
          TokenType.rowid, 'Expected ROWID to complete the WITHOUT ROWID part');
      withoutRowId = true;
    }

    final overriddenName = _overriddenDataClassName();

    return CreateTableStatement(
      ifNotExists: ifNotExists,
      tableName: tableIdentifier.identifier,
      withoutRowId: withoutRowId,
      columns: columns,
      tableConstraints: tableConstraints,
      overriddenDataClassName: overriddenName,
    )
      ..setSpan(first, _previous)
      ..openingBracket = leftParen
      ..closingBracket = rightParen
      ..tableNameToken = tableIdentifier;
  }

  /// Parses a `CREATE VIRTUAL TABLE` statement, after the `CREATE VIRTUAL TABLE
  /// <name>` tokens have already been read.
  CreateVirtualTableStatement _virtualTable(
      Token first, bool ifNotExists, IdentifierToken nameToken) {
    _consume(TokenType.using, 'Expected USING for virtual table declaration');
    final moduleName = _consumeIdentifier('Expected a module name');
    final args = <SourceSpanWithContext>[];

    if (_matchOne(TokenType.leftParen)) {
      // args can be just about anything, so we accept any token until the right
      // parenthesis closing it of.
      Token currentStart;
      var levelOfParens = 0;

      void addCurrent() {
        if (currentStart == null) {
          _error('Expected at least one token for the previous argument');
        } else {
          args.add(currentStart.span.expand(_previous.span));
          currentStart = null;
        }
      }

      for (;;) {
        // begin reading a single argument, which is stopped by a comma or
        // maybe with a ), if the current depth is one
        while (_peek.type != TokenType.rightParen &&
            _peek.type != TokenType.comma) {
          _advance();
          if (_previous.type == TokenType.leftParen) {
            levelOfParens++;
          }
          currentStart ??= _previous;
        }

        // if we just read the last ) of the argument list, finish. Otherwise
        // just handle the ) and continue reading the same argument
        if (_peek.type == TokenType.rightParen) {
          levelOfParens--;
          if (levelOfParens < 0) {
            addCurrent();
            _advance(); // consume the rightParen
            break;
          } else {
            _advance(); // add the rightParen to the current argument
            continue;
          }
        }

        // finished while loop above, but not with a ), so it must be a comma
        // that finishes the current argument
        assert(_peek.type == TokenType.comma);
        addCurrent();
        _advance(); // consume the comma
      }
    }

    final moorDataClassName = _overriddenDataClassName();
    return CreateVirtualTableStatement(
      ifNotExists: ifNotExists,
      tableName: nameToken.identifier,
      moduleName: moduleName.identifier,
      arguments: args,
      overriddenDataClassName: moorDataClassName,
    )
      ..setSpan(first, _previous)
      ..tableNameToken = nameToken
      ..moduleNameToken = moduleName;
  }

  String _overriddenDataClassName() {
    if (enableMoorExtensions && _matchOne(TokenType.as)) {
      return _consumeIdentifier('Expected the name for the data class')
          .identifier;
    }
    return null;
  }

  /// Parses a "CREATE TRIGGER" statement, assuming that the create token has
  /// already been consumed.
  CreateTriggerStatement _createTrigger() {
    final create = _previous;
    assert(create.type == TokenType.create);

    if (!_matchOne(TokenType.trigger)) return null;

    final ifNotExists = _ifNotExists();
    final trigger = _consumeIdentifier('Expected a name for the identifier');

    TriggerMode mode;
    if (_matchOne(TokenType.before)) {
      mode = TriggerMode.before;
    } else if (_matchOne(TokenType.after)) {
      mode = TriggerMode.after;
    } else {
      const msg = 'Expected BEFORE, AFTER or INSTEAD OF';
      _consume(TokenType.instead, msg);
      _consume(TokenType.of, msg);
      mode = TriggerMode.insteadOf;
    }

    TriggerTarget target;
    if (_matchOne(TokenType.delete)) {
      target = const DeleteTarget();
    } else if (_matchOne(TokenType.insert)) {
      target = const InsertTarget();
    } else {
      _consume(
          TokenType.update, 'Expected DELETE, INSERT or UPDATE as a trigger');
      final names = <Reference>[];

      if (_matchOne(TokenType.of)) {
        do {
          final name = _consumeIdentifier('Expected column name in ON clause');
          final reference = Reference(columnName: name.identifier)
            ..setSpan(name, name);
          names.add(reference);
        } while (_matchOne(TokenType.comma));
      }

      target = UpdateTarget(names);
    }

    _consume(TokenType.on, 'Expected ON');
    _suggestHint(const TableNameDescription());
    final nameToken = _consumeIdentifier('Expected a table name');
    final tableRef = TableReference(nameToken.identifier)
      ..setSpan(nameToken, nameToken);

    if (_matchOne(TokenType.$for)) {
      const msg = 'Expected FOR EACH ROW';
      _consume(TokenType.each, msg);
      _consume(TokenType.row, msg);
    }

    Expression when;
    if (_matchOne(TokenType.when)) {
      when = expression();
    }

    final block = _consumeBlock();

    return CreateTriggerStatement(
      ifNotExists: ifNotExists,
      triggerName: trigger.identifier,
      mode: mode,
      target: target,
      onTable: tableRef,
      when: when,
      action: block,
    )
      ..setSpan(create, _previous)
      ..triggerNameToken = trigger;
  }

  /// Parses a [CreateIndexStatement]. The `CREATE` token must have already been
  /// accepted.
  CreateIndexStatement _createIndex() {
    final create = _previous;
    assert(create.type == TokenType.create);

    final unique = _matchOne(TokenType.unique);
    if (!_matchOne(TokenType.$index)) return null;

    final ifNotExists = _ifNotExists();
    final name = _consumeIdentifier('Expected a name for this index');

    _consume(TokenType.on, 'Expected ON table');
    _suggestHint(const TableNameDescription());
    final nameToken = _consumeIdentifier('Expected a table name');
    final tableRef = TableReference(nameToken.identifier)
      ..setSpan(nameToken, nameToken);

    _consume(TokenType.leftParen, 'Expected indexed columns in parentheses');

    final indexes = _indexedColumns();

    _consume(TokenType.rightParen, 'Expected closing bracket');

    Expression where;
    if (_matchOne(TokenType.where)) {
      where = expression();
    }

    return CreateIndexStatement(
      indexName: name.identifier,
      unique: unique,
      ifNotExists: ifNotExists,
      on: tableRef,
      columns: indexes,
      where: where,
    )
      ..nameToken = name
      ..setSpan(create, _previous);
  }

  @override
  List<IndexedColumn> _indexedColumns() {
    final indexes = <IndexedColumn>[];
    do {
      final expr = expression();
      final mode = _orderingModeOrNull();

      indexes.add(IndexedColumn(expr, mode)..setSpan(expr.first, _previous));
    } while (_matchOne(TokenType.comma));

    return indexes;
  }

  /// Parses `IF NOT EXISTS` | epsilon
  bool _ifNotExists() {
    if (_matchOne(TokenType.$if)) {
      _consume(TokenType.not, 'Expected IF to be followed by NOT EXISTS');
      _consume(TokenType.exists, 'Expected IF NOT to be followed by EXISTS');
      return true;
    }
    return false;
  }

  ColumnDefinition _columnDefinition() {
    final name = _consume(TokenType.identifier, 'Expected a column name')
        as IdentifierToken;

    final typeTokens = _typeName();
    String typeName;

    if (typeTokens != null) {
      typeName = typeTokens.lexeme;
    }

    final constraints = <ColumnConstraint>[];
    ColumnConstraint constraint;
    while ((constraint = _columnConstraint(orNull: true)) != null) {
      constraints.add(constraint);
    }

    return ColumnDefinition(
      columnName: name.identifier,
      typeName: typeName,
      constraints: constraints,
    )
      ..setSpan(name, _previous)
      ..typeNames = typeTokens
      ..nameToken = name;
  }

  @override
  List<Token> _typeName() {
    // sqlite doesn't really define what a type name is and has very loose rules
    // at turning them into a type affinity. We support this pattern:
    // typename = identifier [ "(" { identifier | comma | number_literal } ")" ]
    if (!_matchOne(TokenType.identifier)) return null;

    final typeNames = [_previous];

    if (_matchOne(TokenType.leftParen)) {
      typeNames.add(_previous);

      const inBrackets = [
        TokenType.identifier,
        TokenType.comma,
        TokenType.numberLiteral
      ];
      while (_match(inBrackets)) {
        typeNames.add(_previous);
      }

      _consume(TokenType.rightParen,
          'Expected closing parenthesis to finish type name');
      typeNames.add(_previous);
    }

    return typeNames;
  }

  ColumnConstraint _columnConstraint({bool orNull = false}) {
    final first = _peek;

    final resolvedName = _constraintNameOrNull()?.identifier;

    if (_matchOne(TokenType.primary)) {
      _suggestHint(HintDescription.token(TokenType.key));
      _consume(TokenType.key, 'Expected KEY to complete PRIMARY KEY clause');

      final mode = _orderingModeOrNull();
      final conflict = _conflictClauseOrNull();

      _suggestHint(HintDescription.token(TokenType.autoincrement));
      final hasAutoInc = _matchOne(TokenType.autoincrement);

      return PrimaryKeyColumn(resolvedName,
          autoIncrement: hasAutoInc, mode: mode, onConflict: conflict)
        ..setSpan(first, _previous);
    }
    if (_matchOne(TokenType.not)) {
      _suggestHint(HintDescription.token(TokenType.$null));

      final notToken = _previous;
      final nullToken =
          _consume(TokenType.$null, 'Expected NULL to complete NOT NULL');

      return NotNull(resolvedName, onConflict: _conflictClauseOrNull())
        ..setSpan(first, _previous)
        ..not = notToken
        ..$null = nullToken;
    }
    if (_matchOne(TokenType.unique)) {
      return UniqueColumn(resolvedName, _conflictClauseOrNull())
        ..setSpan(first, _previous);
    }
    if (_matchOne(TokenType.check)) {
      final expr = _expressionInParentheses();
      return CheckColumn(resolvedName, expr)..setSpan(first, _previous);
    }
    if (_matchOne(TokenType.$default)) {
      Expression expr = _literalOrNull();

      // when not a literal, expect an expression in parentheses
      expr ??= _expressionInParentheses();

      return Default(resolvedName, expr)..setSpan(first, _previous);
    }
    if (_matchOne(TokenType.collate)) {
      final collation = _consumeIdentifier('Expected the collation name');

      return CollateConstraint(resolvedName, collation.identifier)
        ..setSpan(first, _previous);
    }
    if (_peek.type == TokenType.references) {
      final clause = _foreignKeyClause();
      return ForeignKeyColumnConstraint(resolvedName, clause)
        ..setSpan(first, _previous);
    }
    if (enableMoorExtensions && _matchOne(TokenType.mapped)) {
      _consume(TokenType.by, 'Expected a MAPPED BY constraint');

      final dartExpr = _consume(
          TokenType.inlineDart, 'Expected Dart expression in backticks');

      return MappedBy(resolvedName, dartExpr as InlineDartToken)
        ..setSpan(first, _previous);
    }
    if (enableMoorExtensions && _matchOne(TokenType.json)) {
      final jsonToken = _previous;
      final keyToken =
          _consume(TokenType.key, 'Expected a JSON KEY constraint');
      final name = _consumeIdentifier('Expected a name for for the json key');

      return JsonKey(resolvedName, name)
        ..setSpan(first, _previous)
        ..json = jsonToken
        ..key = keyToken;
    }

    // no known column constraint matched. If orNull is set and we're not
    // guaranteed to be in a constraint clause (started with CONSTRAINT), we
    // can return null
    if (orNull && resolvedName == null) {
      return null;
    }
    _error('Expected a constraint (primary key, nullability, etc.)');
  }

  TableConstraint _tableConstraintOrNull() {
    final first = _peek;
    final nameToken = _constraintNameOrNull();
    final name = nameToken?.identifier;

    TableConstraint result;
    if (_match([TokenType.unique, TokenType.primary])) {
      final isPrimaryKey = _previous.type == TokenType.primary;

      if (isPrimaryKey) {
        _consume(TokenType.key, 'Expected KEY to start PRIMARY KEY clause');
      }

      final columns = _listColumnsInParentheses(allowEmpty: false);
      final conflictClause = _conflictClauseOrNull();

      result = KeyClause(name,
          isPrimaryKey: isPrimaryKey,
          indexedColumns: columns,
          onConflict: conflictClause);
    } else if (_matchOne(TokenType.check)) {
      final expr = _expressionInParentheses();
      result = CheckTable(name, expr);
    } else if (_matchOne(TokenType.foreign)) {
      _consume(TokenType.key, 'Expected KEY to start FOREIGN KEY clause');
      final columns = _listColumnsInParentheses(allowEmpty: false);
      final clause = _foreignKeyClause();

      result =
          ForeignKeyTableConstraint(name, columns: columns, clause: clause);
    }

    if (result != null) {
      result
        ..setSpan(first, _previous)
        ..nameToken = nameToken;
      return result;
    }

    if (name != null) {
      // if a constraint was started with CONSTRAINT <name> but then we didn't
      // find a constraint, that's an syntax error
      _error('Expected a table constraint (e.g. a primary key)');
    }
    return null;
  }

  IdentifierToken _constraintNameOrNull() {
    if (_matchOne(TokenType.constraint)) {
      final name = _consumeIdentifier('Expect a name for the constraint here');
      return name;
    }
    return null;
  }

  Expression _expressionInParentheses() {
    _consume(TokenType.leftParen, 'Expected opening parenthesis');
    final expr = expression();
    _consume(TokenType.rightParen, 'Expected closing parenthesis');
    return expr;
  }

  ConflictClause _conflictClauseOrNull() {
    _suggestHint(HintDescription.token(TokenType.on));
    if (_matchOne(TokenType.on)) {
      _consume(TokenType.conflict,
          'Expected CONFLICT to complete ON CONFLICT clause');

      const modes = {
        TokenType.rollback: ConflictClause.rollback,
        TokenType.abort: ConflictClause.abort,
        TokenType.fail: ConflictClause.fail,
        TokenType.ignore: ConflictClause.ignore,
        TokenType.replace: ConflictClause.replace,
      };
      _suggestHint(HintDescription.tokens(modes.keys.toList()));

      if (_match(modes.keys)) {
        return modes[_previous.type];
      } else {
        _error('Expected a conflict handler (rollback, abort, etc.) here');
      }
    }

    return null;
  }

  ForeignKeyClause _foreignKeyClause() {
    // https://www.sqlite.org/syntax/foreign-key-clause.html
    _consume(TokenType.references, 'Expected REFERENCES');
    final firstToken = _previous;

    final foreignTable = _consumeIdentifier('Expected a table name');
    final foreignTableName = TableReference(foreignTable.identifier, null)
      ..setSpan(foreignTable, foreignTable);

    final columnNames = _listColumnsInParentheses(allowEmpty: true);

    ReferenceAction onDelete, onUpdate;

    _suggestHint(HintDescription.token(TokenType.on));
    while (_matchOne(TokenType.on)) {
      _suggestHint(
          const HintDescription.tokens([TokenType.delete, TokenType.update]));
      if (_matchOne(TokenType.delete)) {
        onDelete = _referenceAction();
      } else if (_matchOne(TokenType.update)) {
        onUpdate = _referenceAction();
      } else {
        _error('Expected either DELETE or UPDATE');
      }
    }

    return ForeignKeyClause(
      foreignTable: foreignTableName,
      columnNames: columnNames,
      onUpdate: onUpdate,
      onDelete: onDelete,
    )..setSpan(firstToken, _previous);
  }

  ReferenceAction _referenceAction() {
    if (_matchOne(TokenType.cascade)) {
      return ReferenceAction.cascade;
    } else if (_matchOne(TokenType.restrict)) {
      return ReferenceAction.restrict;
    } else if (_matchOne(TokenType.no)) {
      _consume(TokenType.action, 'Expect ACTION to complete NO ACTION clause');
      return ReferenceAction.noAction;
    } else if (_matchOne(TokenType.set)) {
      if (_matchOne(TokenType.$null)) {
        return ReferenceAction.setNull;
      } else if (_matchOne(TokenType.$default)) {
        return ReferenceAction.setDefault;
      } else {
        _error('Expected either NULL or DEFAULT as set action here');
      }
    } else {
      _error('Not a valid action, expected CASCADE, SET NULL, etc..');
    }
  }

  List<Reference> _listColumnsInParentheses({bool allowEmpty = false}) {
    final columnNames = <Reference>[];
    if (_matchOne(TokenType.leftParen)) {
      do {
        final referenceId = _consumeIdentifier('Expected a column name');
        final reference = Reference(columnName: referenceId.identifier)
          ..setSpan(referenceId, referenceId);
        columnNames.add(reference);
      } while (_matchOne(TokenType.comma));

      _consume(TokenType.rightParen,
          'Expected closing paranthesis after column names');
    } else {
      if (!allowEmpty) {
        _error('Expected a list of columns in parantheses');
      }
    }

    return columnNames;
  }
}
