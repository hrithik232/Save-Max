// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:collection';
import 'dart:math' as math;

import 'package:analyzer/src/generated/source.dart';
import 'package:analyzer_plugin_fork/protocol/protocol_common.dart';
import 'package:analyzer_plugin_fork/utilities/change_builder/change_builder_core.dart';

/**
 * A builder used to build a [SourceChange].
 */
class ChangeBuilderImpl implements ChangeBuilder {
  /**
   * The end-of-line marker used in the file being edited, or `null` if the
   * default marker should be used.
   */
  String eol = null;

  /**
   * A table mapping group ids to the associated linked edit groups.
   */
  final Map<String, LinkedEditGroup> _linkedEditGroups =
      <String, LinkedEditGroup>{};

  /**
   * The source change selection or `null` if none.
   */
  Position _selection;

  /**
   * The range of the selection for the change being built, or `null` if there
   * is no selection.
   */
  SourceRange _selectionRange;

  /**
   * The set of [Position]s that belong to the current [EditBuilderImpl] and
   * should not be updated in result of inserting this builder.
   */
  final Set<Position> _lockedPositions = new HashSet<Position>.identity();

  /**
   * A map of absolute normalized path to file edit builder.
   */
  final _fileEditBuilders = <String, FileEditBuilderImpl>{};

  /**
   * Initialize a newly created change builder.
   */
  ChangeBuilderImpl();

  @override
  SourceRange get selectionRange => _selectionRange;

  @override
  SourceChange get sourceChange {
    final SourceChange change = new SourceChange('');
    for (var builder in _fileEditBuilders.values) {
      if (builder.hasEdits) {
        change.addFileEdit(builder.fileEdit);
        builder.finalize();
      }
    }
    _linkedEditGroups.forEach((String name, LinkedEditGroup group) {
      change.addLinkedEditGroup(group);
    });
    if (_selection != null) {
      change.selection = _selection;
    }
    return change;
  }

  @override
  Future<void> addFileEdit(
      String path, void buildFileEdit(FileEditBuilder builder)) async {
    FileEditBuilderImpl builder = _fileEditBuilders[path];
    if (builder == null) {
      builder = await createFileEditBuilder(path);
      if (builder != null) {
        _fileEditBuilders[path] = builder;
      }
    }
    if (builder != null) {
      buildFileEdit(builder);
    }
  }

  /**
   * Create and return a [FileEditBuilder] that can be used to build edits to
   * the file with the given [path] and [timeStamp].
   */
  Future<FileEditBuilderImpl> createFileEditBuilder(String path) async {
    // TODO(brianwilkerson) Determine whether this await is necessary.
    await null;
    return new FileEditBuilderImpl(this, path, 0);
  }

  /**
   * Return the linked edit group with the given [groupName], creating it if it
   * did not already exist.
   */
  LinkedEditGroup getLinkedEditGroup(String groupName) {
    LinkedEditGroup group = _linkedEditGroups[groupName];
    if (group == null) {
      group = new LinkedEditGroup.empty();
      _linkedEditGroups[groupName] = group;
    }
    return group;
  }

  @override
  void setSelection(Position position) {
    _selection = position;
  }

  void _setSelectionRange(SourceRange range) {
    _selectionRange = range;
  }

  /**
   * Update the offsets of any positions that occur at or after the given
   * [offset] such that the positions are offset by the given [delta]. Positions
   * occur in linked edit groups and as the post-change selection.
   */
  void _updatePositions(int offset, int delta) {
    void _updatePosition(Position position) {
      if (position.offset >= offset && !_lockedPositions.contains(position)) {
        position.offset = position.offset + delta;
      }
    }

    for (LinkedEditGroup group in _linkedEditGroups.values) {
      for (Position position in group.positions) {
        _updatePosition(position);
      }
    }
    if (_selection != null) {
      _updatePosition(_selection);
    }
  }
}

/**
 * A builder used to build a [SourceEdit] as part of a [SourceFileEdit].
 */
class EditBuilderImpl implements EditBuilder {
  /**
   * The builder being used to create the source file edit of which the source
   * edit will be a part.
   */
  final FileEditBuilderImpl fileEditBuilder;

  /**
   * The offset of the region being replaced.
   */
  final int offset;

  /**
   * The length of the region being replaced.
   */
  final int length;

  /**
   * The range of the selection for the change being built, or `null` if the
   * selection is not inside the change being built.
   */
  SourceRange _selectionRange;

  /**
   * The end-of-line marker used in the file being edited, or `null` if the
   * default marker should be used.
   */
  String _eol = null;

  /**
   * The buffer in which the content of the edit is being composed.
   */
  final StringBuffer _buffer = new StringBuffer();

  /**
   * Initialize a newly created builder to build a source edit.
   */
  EditBuilderImpl(this.fileEditBuilder, this.offset, this.length) {
    _eol = fileEditBuilder.changeBuilder.eol;
  }

  /**
   * Create and return an edit representing the replacement of a region of the
   * file with the accumulated text.
   */
  SourceEdit get sourceEdit =>
      new SourceEdit(offset, length, _buffer.toString());

  @override
  void addLinkedEdit(
      String groupName, void buildLinkedEdit(LinkedEditBuilder builder)) {
    LinkedEditBuilderImpl builder = createLinkedEditBuilder();
    int start = offset + _buffer.length;
    try {
      buildLinkedEdit(builder);
    } finally {
      int end = offset + _buffer.length;
      int length = end - start;
      if (length != 0) {
        Position position = new Position(fileEditBuilder.fileEdit.file, start);
        fileEditBuilder.changeBuilder._lockedPositions.add(position);
        LinkedEditGroup group =
            fileEditBuilder.changeBuilder.getLinkedEditGroup(groupName);
        group.addPosition(position, length);
        for (LinkedEditSuggestion suggestion in builder.suggestions) {
          group.addSuggestion(suggestion);
        }
      }
    }
  }

  @override
  void addSimpleLinkedEdit(String groupName, String text,
      {LinkedEditSuggestionKind kind, List<String> suggestions}) {
    addLinkedEdit(groupName, (LinkedEditBuilder builder) {
      builder.write(text);
      if (kind != null && suggestions != null) {
        for (String suggestion in suggestions) {
          builder.addSuggestion(kind, suggestion);
        }
      } else if (kind != null || suggestions != null) {
        throw new ArgumentError(
            'Either both kind and suggestions must be provided or neither.');
      }
    });
  }

  LinkedEditBuilderImpl createLinkedEditBuilder() {
    return new LinkedEditBuilderImpl(this);
  }

  @override
  void selectAll(void writer()) {
    int rangeOffset = _buffer.length;
    writer();
    int rangeLength = _buffer.length - rangeOffset;
    _selectionRange = new SourceRange(offset + rangeOffset, rangeLength);
  }

  @override
  void selectHere() {
    _selectionRange = new SourceRange(offset + _buffer.length, 0);
  }

  @override
  void write(String string) {
    _buffer.write(string);
  }

  @override
  void writeln([String string]) {
    if (string != null) {
      _buffer.write(string);
    }
    if (_eol == null) {
      _buffer.writeln();
    } else {
      _buffer.write(_eol);
    }
  }
}

/**
 * A builder used to build a [SourceFileEdit] within a [SourceChange].
 */
class FileEditBuilderImpl implements FileEditBuilder {
  /**
   * The builder being used to create the source change of which the source file
   * edit will be a part.
   */
  final ChangeBuilderImpl changeBuilder;

  /**
   * The source file edit that is being built.
   */
  final SourceFileEdit fileEdit;

  /**
   * Initialize a newly created builder to build a source file edit within the
   * change being built by the given [changeBuilder]. The file being edited has
   * the given absolute [path] and [timeStamp].
   */
  FileEditBuilderImpl(this.changeBuilder, String path, int timeStamp)
      : fileEdit = new SourceFileEdit(path, timeStamp);

  /**
   * Return `true` if this builder has edits to be applied.
   */
  bool get hasEdits => fileEdit.edits.isNotEmpty;

  @override
  void addDeletion(SourceRange range) {
    if (range.length > 0) {
      EditBuilderImpl builder = createEditBuilder(range.offset, range.length);
      _addEditBuilder(builder);
    }
  }

  @override
  void addInsertion(int offset, void buildEdit(EditBuilder builder)) {
    EditBuilderImpl builder = createEditBuilder(offset, 0);
    try {
      buildEdit(builder);
    } finally {
      _addEditBuilder(builder);
    }
  }

  @override
  void addLinkedPosition(SourceRange range, String groupName) {
    LinkedEditGroup group = changeBuilder.getLinkedEditGroup(groupName);
    Position position = new Position(
        fileEdit.file, range.offset + _deltaToOffset(range.offset));
    group.addPosition(position, range.length);
  }

  @override
  void addReplacement(SourceRange range, void buildEdit(EditBuilder builder)) {
    EditBuilderImpl builder = createEditBuilder(range.offset, range.length);
    try {
      buildEdit(builder);
    } finally {
      _addEditBuilder(builder);
    }
  }

  @override
  void addSimpleInsertion(int offset, String text) {
    EditBuilderImpl builder = createEditBuilder(offset, 0);
    try {
      builder.write(text);
    } finally {
      _addEditBuilder(builder);
    }
  }

  @override
  void addSimpleReplacement(SourceRange range, String text) {
    EditBuilderImpl builder = createEditBuilder(range.offset, range.length);
    try {
      builder.write(text);
    } finally {
      _addEditBuilder(builder);
    }
  }

  EditBuilderImpl createEditBuilder(int offset, int length) {
    return new EditBuilderImpl(this, offset, length);
  }

  /**
   * Finalize the source file edit that is being built.
   */
  void finalize() {
    // Nothing to do.
  }

  /**
   * Replace edits in the [range] with the given [edit].
   * The [range] is relative to the original code.
   */
  void replaceEdits(SourceRange range, SourceEdit edit) {
    fileEdit.edits.removeWhere((edit) {
      if (range.contains(edit.offset)) {
        if (!range.contains(edit.end)) {
          throw StateError('$edit is not completely in $range');
        }
        return true;
      } else if (range.contains(edit.end)) {
        throw StateError('$edit is not completely in $range');
      }
      return false;
    });

    _addEdit(edit);
  }

  /**
   * Add the edit from the given [edit] to the edits associates with the
   * current file.
   */
  void _addEdit(SourceEdit edit) {
    fileEdit.add(edit);
    int delta = _editDelta(edit);
    changeBuilder._updatePositions(
        edit.offset + math.max<int>(0, delta), delta);
    changeBuilder._lockedPositions.clear();
  }

  /**
   * Add the edit from the given [builder] to the edits associates with the
   * current file.
   */
  void _addEditBuilder(EditBuilderImpl builder) {
    SourceEdit edit = builder.sourceEdit;
    _addEdit(edit);
    _captureSelection(builder, edit);
  }

  /**
   * Capture the selection offset if one was set.
   */
  void _captureSelection(EditBuilderImpl builder, SourceEdit edit) {
    SourceRange range = builder._selectionRange;
    if (range != null) {
      Position position =
          new Position(fileEdit.file, range.offset + _deltaToEdit(edit));
      changeBuilder.setSelection(position);
      changeBuilder._setSelectionRange(range);
    }
  }

  /**
   * Return the current delta caused by edits that will be applied before the
   * [targetEdit]. In other words, if all of the edits that occur before the
   * target edit were to be applied, then the text at the offset of the target
   * edit before the applied edits will be at `offset + _deltaToOffset(offset)`
   * after the edits.
   */
  int _deltaToEdit(SourceEdit targetEdit) {
    int delta = 0;
    for (SourceEdit edit in fileEdit.edits) {
      if (edit.offset < targetEdit.offset) {
        delta += _editDelta(edit);
      }
    }
    return delta;
  }

  /**
   * Return the current delta caused by edits that will be applied before the
   * given [offset]. In other words, if all of the edits that have so far been
   * added were to be applied, then the text at the given `offset` before the
   * applied edits will be at `offset + _deltaToOffset(offset)` after the edits.
   */
  int _deltaToOffset(int offset) {
    int delta = 0;
    for (SourceEdit edit in fileEdit.edits) {
      if (edit.offset <= offset) {
        delta += _editDelta(edit);
      }
    }
    return delta;
  }

  /**
   * Return the delta introduced by the given `edit`.
   */
  int _editDelta(SourceEdit edit) => edit.replacement.length - edit.length;
}

/**
 * A builder used to build a [LinkedEdit] region within an edit.
 */
class LinkedEditBuilderImpl implements LinkedEditBuilder {
  final EditBuilderImpl editBuilder;

  final List<LinkedEditSuggestion> suggestions = <LinkedEditSuggestion>[];

  LinkedEditBuilderImpl(this.editBuilder);

  @override
  void addSuggestion(LinkedEditSuggestionKind kind, String value) {
    suggestions.add(new LinkedEditSuggestion(value, kind));
  }

  @override
  void addSuggestions(LinkedEditSuggestionKind kind, Iterable<String> values) {
    values.forEach((value) => addSuggestion(kind, value));
  }

  @override
  void write(String string) {
    editBuilder.write(string);
  }

  @override
  void writeln([String string]) {
    editBuilder.writeln(string);
  }
}
