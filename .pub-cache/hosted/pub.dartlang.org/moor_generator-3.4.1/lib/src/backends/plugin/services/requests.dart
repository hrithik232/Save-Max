import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer_plugin_fork/utilities/assist/assist.dart';
import 'package:analyzer_plugin_fork/utilities/completion/completion_core.dart';
import 'package:analyzer_plugin_fork/utilities/folding/folding.dart';
import 'package:analyzer_plugin_fork/utilities/highlights/highlights.dart';
import 'package:analyzer_plugin_fork/utilities/navigation/navigation.dart';
import 'package:analyzer_plugin_fork/utilities/outline/outline.dart';
import 'package:moor_generator/src/analyzer/runner/file_graph.dart';
import 'package:moor_generator/src/analyzer/runner/results.dart';
import 'package:source_span/source_span.dart';

mixin _MoorBaseRequest {
  FoundFile get file;

  bool get isMoor => file.type == FileType.moor;
  bool get isMoorAndParsed => isMoor && file.isParsed;
  bool get isMoorAndAnalyzed => isMoor && file.isAnalyzed;

  String get path => file.uri.path;

  ParsedMoorFile get parsedMoor {
    assert(isMoorAndParsed);
    return file.currentResult as ParsedMoorFile;
  }
}

class MoorRequest
    with _MoorBaseRequest
    implements OutlineRequest, HighlightsRequest, FoldingRequest {
  @override
  final FoundFile file;
  @override
  final ResourceProvider resourceProvider;

  MoorRequest(this.file, this.resourceProvider);
}

// todo CompletionRequest likes not to be extended, but there is no suitable
// subclass.
class MoorCompletionRequest extends CompletionRequest with _MoorBaseRequest {
  @override
  void checkAborted() {}

  @override
  final int offset;

  @override
  final ResourceProvider resourceProvider;

  @override
  final FoundFile file;

  MoorCompletionRequest(this.offset, this.resourceProvider, this.file);
}

class MoorRequestAtPosition
    with _MoorBaseRequest
    implements AssistRequest, NavigationRequest {
  @override
  final FoundFile file;

  @override
  final int length;

  @override
  final int offset;

  @override
  final ResourceProvider resourceProvider;

  bool get hasSpan => offset > 0;

  SourceSpan get span {
    return SourceSpan(
      SourceLocation(offset),
      SourceLocation(offset + length),
      'x' * length,
    );
  }

  MoorRequestAtPosition(
      this.file, this.length, this.offset, this.resourceProvider);
}
