import 'package:analyzer/file_system/file_system.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin_fork/plugin/assist_mixin.dart';
import 'package:analyzer_plugin_fork/plugin/completion_mixin.dart';
import 'package:analyzer_plugin_fork/plugin/folding_mixin.dart';
import 'package:analyzer_plugin_fork/plugin/navigation_mixin.dart';
import 'package:analyzer_plugin_fork/plugin/outline_mixin.dart';
import 'package:analyzer_plugin_fork/protocol/protocol.dart';
import 'package:analyzer_plugin_fork/protocol/protocol_generated.dart'
    as plugin;
import 'package:analyzer_plugin_fork/utilities/assist/assist.dart';
import 'package:analyzer_plugin_fork/utilities/completion/completion_core.dart';
import 'package:analyzer_plugin_fork/utilities/folding/folding.dart';
import 'package:analyzer_plugin_fork/utilities/navigation/navigation.dart';
import 'package:analyzer_plugin_fork/utilities/outline/outline.dart';
import 'package:moor_generator/src/analyzer/runner/file_graph.dart';
import 'package:moor_generator/src/backends/common/base_plugin.dart';
import 'package:moor_generator/src/backends/common/driver.dart';
import 'package:moor_generator/src/backends/plugin/services/assists/assist_service.dart';
import 'package:moor_generator/src/backends/plugin/services/autocomplete.dart';
import 'package:moor_generator/src/backends/plugin/services/errors.dart';
import 'package:moor_generator/src/backends/plugin/services/folding.dart';
import 'package:moor_generator/src/backends/plugin/services/navigation.dart';
import 'package:moor_generator/src/backends/plugin/services/outline.dart';
import 'package:moor_generator/src/backends/plugin/services/requests.dart';

import 'logger.dart';

class MoorPlugin extends BaseMoorPlugin
    with
        OutlineMixin,
        FoldingMixin,
        CompletionMixin,
        AssistsMixin,
        NavigationMixin {
  MoorPlugin(ResourceProvider provider) : super(provider) {
    setupLogger(this);
    errorService = ErrorService(this);
  }

  factory MoorPlugin.forProduction() {
    return MoorPlugin(PhysicalResourceProvider.INSTANCE);
  }

  ErrorService errorService;

  @override
  void didCreateDriver(MoorDriver driver) {
    driver.tryToLoadOptions();
    driver.session
        .completedFiles()
        .where((file) => file.isParsed)
        .listen((file) {
      sendNotificationsForFile(file.uri.path);
      errorService.handleResult(file);
    });
  }

  @override
  void contentChanged(String path) {
    driverForPath(path)?.handleFileChanged(path);
  }

  Future<FoundFile> _waitParsed(String path) async {
    final driver = driverForPath(path);
    if (driver == null) {
      throw RequestFailure(plugin.RequestError(
          plugin.RequestErrorCode.INVALID_PARAMETER,
          "Path isn't covered by plugin: $path"));
    }

    final file = await driver.waitFileParsed(path);
    if (file == null) {
      throw RequestFailure(plugin.RequestError(
          plugin.RequestErrorCode.PLUGIN_ERROR,
          'Unknown file: Neither Dart or moor: $path'));
    }

    return file;
  }

  Future<MoorRequest> _createMoorRequest(String path) async {
    final file = await _waitParsed(path);
    return MoorRequest(file, resourceProvider);
  }

  @override
  List<OutlineContributor> getOutlineContributors(String path) {
    return const [MoorOutlineContributor()];
  }

  @override
  Future<OutlineRequest> getOutlineRequest(String path) {
    return _createMoorRequest(path);
  }

  @override
  Future<void> sendHighlightsNotification(String path) async {
    final driver = driverForPath(path);
    final highlights = await driver.ide.highlight(path);

    channel.sendNotification(
        plugin.AnalysisHighlightsParams(path, highlights).toNotification());
  }

  @override
  List<FoldingContributor> getFoldingContributors(String path) {
    return const [MoorFoldingContributor()];
  }

  @override
  Future<FoldingRequest> getFoldingRequest(String path) {
    return _createMoorRequest(path);
  }

  @override
  List<CompletionContributor> getCompletionContributors(String path) {
    return const [MoorCompletingContributor()];
  }

  @override
  Future<CompletionRequest> getCompletionRequest(
      plugin.CompletionGetSuggestionsParams parameters) async {
    final path = parameters.file;
    final file = await _waitParsed(path);

    return MoorCompletionRequest(parameters.offset, resourceProvider, file);
  }

  @override
  List<AssistContributor> getAssistContributors(String path) {
    return const [AssistService()];
  }

  @override
  Future<AssistRequest> getAssistRequest(
      plugin.EditGetAssistsParams parameters) async {
    final path = parameters.file;
    final file = await _waitParsed(path);

    return MoorRequestAtPosition(
        file, parameters.length, parameters.offset, resourceProvider);
  }

  @override
  List<NavigationContributor> getNavigationContributors(String path) {
    return const [MoorNavigationContributor()];
  }

  @override
  Future<NavigationRequest> getNavigationRequest(
      plugin.AnalysisGetNavigationParams parameters) async {
    final path = parameters.file;
    final file = await _waitParsed(path);

    return MoorRequestAtPosition(
        file, parameters.length, parameters.offset, resourceProvider);
  }
}
