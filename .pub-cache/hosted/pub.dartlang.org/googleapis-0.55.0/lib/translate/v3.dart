// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: unused_import, unnecessary_cast

library googleapis.translate.v3;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client translate/v3';

/// Integrates text translation into your website or application.
class TranslateApi {
  /// View and manage your data across Google Cloud Platform services
  static const CloudPlatformScope =
      "https://www.googleapis.com/auth/cloud-platform";

  /// Translate text from one language to another using Google Translate
  static const CloudTranslationScope =
      "https://www.googleapis.com/auth/cloud-translation";

  final commons.ApiRequester _requester;

  ProjectsResourceApi get projects => new ProjectsResourceApi(_requester);

  TranslateApi(http.Client client,
      {core.String rootUrl = "https://translation.googleapis.com/",
      core.String servicePath = ""})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class ProjectsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsResourceApi get locations =>
      new ProjectsLocationsResourceApi(_requester);

  ProjectsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Detects the language of text within a request.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Project or location to make a call. Must refer to a
  /// caller's
  /// project.
  ///
  /// Format: `projects/{project-number-or-id}/locations/{location-id}` or
  /// `projects/{project-number-or-id}`.
  ///
  /// For global calls, use `projects/{project-number-or-id}/locations/global`
  /// or
  /// `projects/{project-number-or-id}`.
  ///
  /// Only models within the same region (has same location-id) can be used.
  /// Otherwise an INVALID_ARGUMENT (400) error is returned.
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [DetectLanguageResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<DetectLanguageResponse> detectLanguage(
      DetectLanguageRequest request, core.String parent,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        ':detectLanguage';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new DetectLanguageResponse.fromJson(data));
  }

  /// Returns a list of supported languages for translation.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Project or location to make a call. Must refer to a
  /// caller's
  /// project.
  ///
  /// Format: `projects/{project-number-or-id}` or
  /// `projects/{project-number-or-id}/locations/{location-id}`.
  ///
  /// For global calls, use `projects/{project-number-or-id}/locations/global`
  /// or
  /// `projects/{project-number-or-id}`.
  ///
  /// Non-global location is required for AutoML models.
  ///
  /// Only models within the same region (have same location-id) can be used,
  /// otherwise an INVALID_ARGUMENT (400) error is returned.
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [displayLanguageCode] - Optional. The language to use to return localized,
  /// human readable names
  /// of supported languages. If missing, then display names are not returned
  /// in a response.
  ///
  /// [model] - Optional. Get supported languages of this model.
  ///
  /// The format depends on model type:
  ///
  /// - AutoML Translation models:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}`
  ///
  /// - General (built-in) models:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`,
  /// `projects/{project-number-or-id}/locations/{location-id}/models/general/base`
  ///
  ///
  /// Returns languages supported by the specified model.
  /// If missing, we get supported languages of Google general base (PBMT)
  /// model.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [SupportedLanguages].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<SupportedLanguages> getSupportedLanguages(core.String parent,
      {core.String displayLanguageCode,
      core.String model,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (displayLanguageCode != null) {
      _queryParams["displayLanguageCode"] = [displayLanguageCode];
    }
    if (model != null) {
      _queryParams["model"] = [model];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/supportedLanguages';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new SupportedLanguages.fromJson(data));
  }

  /// Translates input text and returns translated text.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Project or location to make a call. Must refer to a
  /// caller's
  /// project.
  ///
  /// Format: `projects/{project-number-or-id}` or
  /// `projects/{project-number-or-id}/locations/{location-id}`.
  ///
  /// For global calls, use `projects/{project-number-or-id}/locations/global`
  /// or
  /// `projects/{project-number-or-id}`.
  ///
  /// Non-global location is required for requests using AutoML models or
  /// custom glossaries.
  ///
  /// Models and glossaries must be within the same region (have same
  /// location-id), otherwise an INVALID_ARGUMENT (400) error is returned.
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TranslateTextResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TranslateTextResponse> translateText(
      TranslateTextRequest request, core.String parent,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        ':translateText';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new TranslateTextResponse.fromJson(data));
  }
}

class ProjectsLocationsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsGlossariesResourceApi get glossaries =>
      new ProjectsLocationsGlossariesResourceApi(_requester);
  ProjectsLocationsOperationsResourceApi get operations =>
      new ProjectsLocationsOperationsResourceApi(_requester);

  ProjectsLocationsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Translates a large volume of text in asynchronous batch mode.
  /// This function provides real-time output as the inputs are being processed.
  /// If caller cancels a request, the partial results (for an input file, it's
  /// all or nothing) may still be available on the specified output location.
  ///
  /// This call returns immediately and you can
  /// use google.longrunning.Operation.name to poll the status of the call.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Location to make a call. Must refer to a caller's
  /// project.
  ///
  /// Format: `projects/{project-number-or-id}/locations/{location-id}`.
  ///
  /// The `global` location is not supported for batch translation.
  ///
  /// Only AutoML Translation models or glossaries within the same region (have
  /// the same location-id) can be used, otherwise an INVALID_ARGUMENT (400)
  /// error is returned.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> batchTranslateText(
      BatchTranslateTextRequest request, core.String parent,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        ':batchTranslateText';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Operation.fromJson(data));
  }

  /// Detects the language of text within a request.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Project or location to make a call. Must refer to a
  /// caller's
  /// project.
  ///
  /// Format: `projects/{project-number-or-id}/locations/{location-id}` or
  /// `projects/{project-number-or-id}`.
  ///
  /// For global calls, use `projects/{project-number-or-id}/locations/global`
  /// or
  /// `projects/{project-number-or-id}`.
  ///
  /// Only models within the same region (has same location-id) can be used.
  /// Otherwise an INVALID_ARGUMENT (400) error is returned.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [DetectLanguageResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<DetectLanguageResponse> detectLanguage(
      DetectLanguageRequest request, core.String parent,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        ':detectLanguage';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new DetectLanguageResponse.fromJson(data));
  }

  /// Gets information about a location.
  ///
  /// Request parameters:
  ///
  /// [name] - Resource name for the location.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Location].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Location> get(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Location.fromJson(data));
  }

  /// Returns a list of supported languages for translation.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Project or location to make a call. Must refer to a
  /// caller's
  /// project.
  ///
  /// Format: `projects/{project-number-or-id}` or
  /// `projects/{project-number-or-id}/locations/{location-id}`.
  ///
  /// For global calls, use `projects/{project-number-or-id}/locations/global`
  /// or
  /// `projects/{project-number-or-id}`.
  ///
  /// Non-global location is required for AutoML models.
  ///
  /// Only models within the same region (have same location-id) can be used,
  /// otherwise an INVALID_ARGUMENT (400) error is returned.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [displayLanguageCode] - Optional. The language to use to return localized,
  /// human readable names
  /// of supported languages. If missing, then display names are not returned
  /// in a response.
  ///
  /// [model] - Optional. Get supported languages of this model.
  ///
  /// The format depends on model type:
  ///
  /// - AutoML Translation models:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}`
  ///
  /// - General (built-in) models:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`,
  /// `projects/{project-number-or-id}/locations/{location-id}/models/general/base`
  ///
  ///
  /// Returns languages supported by the specified model.
  /// If missing, we get supported languages of Google general base (PBMT)
  /// model.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [SupportedLanguages].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<SupportedLanguages> getSupportedLanguages(core.String parent,
      {core.String displayLanguageCode,
      core.String model,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (displayLanguageCode != null) {
      _queryParams["displayLanguageCode"] = [displayLanguageCode];
    }
    if (model != null) {
      _queryParams["model"] = [model];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/supportedLanguages';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new SupportedLanguages.fromJson(data));
  }

  /// Lists information about the supported locations for this service.
  ///
  /// Request parameters:
  ///
  /// [name] - The resource that owns the locations collection, if applicable.
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [pageToken] - The standard list page token.
  ///
  /// [pageSize] - The standard list page size.
  ///
  /// [filter] - The standard list filter.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListLocationsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListLocationsResponse> list(core.String name,
      {core.String pageToken,
      core.int pageSize,
      core.String filter,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if (filter != null) {
      _queryParams["filter"] = [filter];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v3/' + commons.Escaper.ecapeVariableReserved('$name') + '/locations';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ListLocationsResponse.fromJson(data));
  }

  /// Translates input text and returns translated text.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Project or location to make a call. Must refer to a
  /// caller's
  /// project.
  ///
  /// Format: `projects/{project-number-or-id}` or
  /// `projects/{project-number-or-id}/locations/{location-id}`.
  ///
  /// For global calls, use `projects/{project-number-or-id}/locations/global`
  /// or
  /// `projects/{project-number-or-id}`.
  ///
  /// Non-global location is required for requests using AutoML models or
  /// custom glossaries.
  ///
  /// Models and glossaries must be within the same region (have same
  /// location-id), otherwise an INVALID_ARGUMENT (400) error is returned.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TranslateTextResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TranslateTextResponse> translateText(
      TranslateTextRequest request, core.String parent,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        ':translateText';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new TranslateTextResponse.fromJson(data));
  }
}

class ProjectsLocationsGlossariesResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsGlossariesResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a glossary and returns the long-running operation. Returns
  /// NOT_FOUND, if the project doesn't exist.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The project name.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> create(Glossary request, core.String parent,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/glossaries';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Operation.fromJson(data));
  }

  /// Deletes a glossary, or cancels glossary construction
  /// if the glossary isn't created yet.
  /// Returns NOT_FOUND, if the glossary doesn't exist.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the glossary to delete.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/glossaries/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> delete(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Operation.fromJson(data));
  }

  /// Gets a glossary. Returns NOT_FOUND, if the glossary doesn't
  /// exist.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the glossary to retrieve.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/glossaries/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Glossary].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Glossary> get(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Glossary.fromJson(data));
  }

  /// Lists glossaries in a project. Returns NOT_FOUND, if the project doesn't
  /// exist.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the project from which to list all of the
  /// glossaries.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [filter] - Optional. Filter specifying constraints of a list operation.
  /// Filtering is not supported yet, and the parameter currently has no effect.
  /// If missing, no filtering is performed.
  ///
  /// [pageToken] - Optional. A token identifying a page of results the server
  /// should return.
  /// Typically, this is the value of [ListGlossariesResponse.next_page_token]
  /// returned from the previous call to `ListGlossaries` method.
  /// The first page is returned if `page_token`is empty or missing.
  ///
  /// [pageSize] - Optional. Requested page size. The server may return fewer
  /// glossaries than
  /// requested. If unspecified, the server picks an appropriate default.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListGlossariesResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListGlossariesResponse> list(core.String parent,
      {core.String filter,
      core.String pageToken,
      core.int pageSize,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (filter != null) {
      _queryParams["filter"] = [filter];
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/glossaries';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ListGlossariesResponse.fromJson(data));
  }
}

class ProjectsLocationsOperationsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsOperationsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Starts asynchronous cancellation on a long-running operation.  The server
  /// makes a best effort to cancel the operation, but success is not
  /// guaranteed.  If the server doesn't support this method, it returns
  /// `google.rpc.Code.UNIMPLEMENTED`.  Clients can use
  /// Operations.GetOperation or
  /// other methods to check whether the cancellation succeeded or whether the
  /// operation completed despite cancellation. On successful cancellation,
  /// the operation is not deleted; instead, it becomes an operation with
  /// an Operation.error value with a google.rpc.Status.code of 1,
  /// corresponding to `Code.CANCELLED`.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource to be cancelled.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/operations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> cancel(CancelOperationRequest request, core.String name,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' + commons.Escaper.ecapeVariableReserved('$name') + ':cancel';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Deletes a long-running operation. This method indicates that the client is
  /// no longer interested in the operation result. It does not cancel the
  /// operation. If the server doesn't support this method, it returns
  /// `google.rpc.Code.UNIMPLEMENTED`.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource to be deleted.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/operations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Gets the latest state of a long-running operation.  Clients can use this
  /// method to poll the operation result at intervals as recommended by the API
  /// service.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/operations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> get(core.String name, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Operation.fromJson(data));
  }

  /// Lists operations that match the specified filter in the request. If the
  /// server doesn't support this method, it returns `UNIMPLEMENTED`.
  ///
  /// NOTE: the `name` binding allows API services to override the binding
  /// to use different resource name schemes, such as `users / * /operations`.
  /// To
  /// override the binding, API services can add a binding such as
  /// `"/v1/{name=users / * }/operations"` to their service configuration.
  /// For backwards compatibility, the default name includes the operations
  /// collection id, however overriding users must ensure the name binding
  /// is the parent resource, without the operations collection id.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation's parent resource.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [pageToken] - The standard list page token.
  ///
  /// [pageSize] - The standard list page size.
  ///
  /// [filter] - The standard list filter.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListOperationsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListOperationsResponse> list(core.String name,
      {core.String pageToken,
      core.int pageSize,
      core.String filter,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if (filter != null) {
      _queryParams["filter"] = [filter];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v3/' + commons.Escaper.ecapeVariableReserved('$name') + '/operations';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ListOperationsResponse.fromJson(data));
  }

  /// Waits for the specified long-running operation until it is done or reaches
  /// at most a specified timeout, returning the latest state.  If the operation
  /// is already done, the latest state is immediately returned.  If the timeout
  /// specified is greater than the default HTTP/RPC timeout, the HTTP/RPC
  /// timeout is used.  If the server does not support this method, it returns
  /// `google.rpc.Code.UNIMPLEMENTED`.
  /// Note that this method is on a best-effort basis.  It may return the latest
  /// state before the specified timeout (including immediately), meaning even
  /// an
  /// immediate response is no guarantee that the operation is done.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource to wait on.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/operations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> wait(WaitOperationRequest request, core.String name,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v3/' + commons.Escaper.ecapeVariableReserved('$name') + ':wait';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Operation.fromJson(data));
  }
}

/// The batch translation request.
class BatchTranslateTextRequest {
  /// Optional. Glossaries to be applied for translation.
  /// It's keyed by target language code.
  core.Map<core.String, TranslateTextGlossaryConfig> glossaries;

  /// Required. Input configurations.
  /// The total number of files matched should be <= 1000.
  /// The total content size should be <= 100M Unicode codepoints.
  /// The files must use UTF-8 encoding.
  core.List<InputConfig> inputConfigs;

  /// Optional. The labels with user-defined metadata for the request.
  ///
  /// Label keys and values can be no longer than 63 characters
  /// (Unicode codepoints), can only contain lowercase letters, numeric
  /// characters, underscores and dashes. International characters are allowed.
  /// Label values are optional. Label keys must start with a letter.
  ///
  /// See https://cloud.google.com/translate/docs/advanced/labels for more
  /// information.
  core.Map<core.String, core.String> labels;

  /// Optional. The models to use for translation. Map's key is target language
  /// code. Map's value is model name. Value can be a built-in general model,
  /// or an AutoML Translation model.
  ///
  /// The value format depends on model type:
  ///
  /// - AutoML Translation models:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}`
  ///
  /// - General (built-in) models:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`,
  /// `projects/{project-number-or-id}/locations/{location-id}/models/general/base`
  ///
  ///
  /// If the map is empty or a specific model is
  /// not requested for a language pair, then default google model (nmt) is
  /// used.
  core.Map<core.String, core.String> models;

  /// Required. Output configuration.
  /// If 2 input configs match to the same file (that is, same input path),
  /// we don't generate output for duplicate inputs.
  OutputConfig outputConfig;

  /// Required. Source language code.
  core.String sourceLanguageCode;

  /// Required. Specify up to 10 language codes here.
  core.List<core.String> targetLanguageCodes;

  BatchTranslateTextRequest();

  BatchTranslateTextRequest.fromJson(core.Map _json) {
    if (_json.containsKey("glossaries")) {
      glossaries = commons.mapMap<core.Map, TranslateTextGlossaryConfig>(
          _json["glossaries"].cast<core.String, core.Map>(),
          (core.Map item) => new TranslateTextGlossaryConfig.fromJson(item));
    }
    if (_json.containsKey("inputConfigs")) {
      inputConfigs = (_json["inputConfigs"] as core.List)
          .map<InputConfig>((value) => new InputConfig.fromJson(value))
          .toList();
    }
    if (_json.containsKey("labels")) {
      labels = (_json["labels"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("models")) {
      models = (_json["models"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("outputConfig")) {
      outputConfig = new OutputConfig.fromJson(_json["outputConfig"]);
    }
    if (_json.containsKey("sourceLanguageCode")) {
      sourceLanguageCode = _json["sourceLanguageCode"];
    }
    if (_json.containsKey("targetLanguageCodes")) {
      targetLanguageCodes =
          (_json["targetLanguageCodes"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (glossaries != null) {
      _json["glossaries"] = commons.mapMap<TranslateTextGlossaryConfig,
              core.Map<core.String, core.Object>>(
          glossaries, (TranslateTextGlossaryConfig item) => (item).toJson());
    }
    if (inputConfigs != null) {
      _json["inputConfigs"] =
          inputConfigs.map((value) => (value).toJson()).toList();
    }
    if (labels != null) {
      _json["labels"] = labels;
    }
    if (models != null) {
      _json["models"] = models;
    }
    if (outputConfig != null) {
      _json["outputConfig"] = (outputConfig).toJson();
    }
    if (sourceLanguageCode != null) {
      _json["sourceLanguageCode"] = sourceLanguageCode;
    }
    if (targetLanguageCodes != null) {
      _json["targetLanguageCodes"] = targetLanguageCodes;
    }
    return _json;
  }
}

/// The request message for Operations.CancelOperation.
class CancelOperationRequest {
  CancelOperationRequest();

  CancelOperationRequest.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// The request message for language detection.
class DetectLanguageRequest {
  /// The content of the input stored as a string.
  core.String content;

  /// Optional. The labels with user-defined metadata for the request.
  ///
  /// Label keys and values can be no longer than 63 characters
  /// (Unicode codepoints), can only contain lowercase letters, numeric
  /// characters, underscores and dashes. International characters are allowed.
  /// Label values are optional. Label keys must start with a letter.
  ///
  /// See https://cloud.google.com/translate/docs/advanced/labels for more
  /// information.
  core.Map<core.String, core.String> labels;

  /// Optional. The format of the source text, for example, "text/html",
  /// "text/plain". If left blank, the MIME type defaults to "text/html".
  core.String mimeType;

  /// Optional. The language detection model to be used.
  ///
  /// Format:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/language-detection/{model-id}`
  ///
  /// Only one language detection model is currently supported:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/language-detection/default`.
  ///
  /// If not specified, the default model is used.
  core.String model;

  DetectLanguageRequest();

  DetectLanguageRequest.fromJson(core.Map _json) {
    if (_json.containsKey("content")) {
      content = _json["content"];
    }
    if (_json.containsKey("labels")) {
      labels = (_json["labels"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("mimeType")) {
      mimeType = _json["mimeType"];
    }
    if (_json.containsKey("model")) {
      model = _json["model"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (content != null) {
      _json["content"] = content;
    }
    if (labels != null) {
      _json["labels"] = labels;
    }
    if (mimeType != null) {
      _json["mimeType"] = mimeType;
    }
    if (model != null) {
      _json["model"] = model;
    }
    return _json;
  }
}

/// The response message for language detection.
class DetectLanguageResponse {
  /// A list of detected languages sorted by detection confidence in descending
  /// order. The most probable language first.
  core.List<DetectedLanguage> languages;

  DetectLanguageResponse();

  DetectLanguageResponse.fromJson(core.Map _json) {
    if (_json.containsKey("languages")) {
      languages = (_json["languages"] as core.List)
          .map<DetectedLanguage>(
              (value) => new DetectedLanguage.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (languages != null) {
      _json["languages"] = languages.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// The response message for language detection.
class DetectedLanguage {
  /// The confidence of the detection result for this language.
  core.double confidence;

  /// The BCP-47 language code of source content in the request, detected
  /// automatically.
  core.String languageCode;

  DetectedLanguage();

  DetectedLanguage.fromJson(core.Map _json) {
    if (_json.containsKey("confidence")) {
      confidence = _json["confidence"].toDouble();
    }
    if (_json.containsKey("languageCode")) {
      languageCode = _json["languageCode"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (confidence != null) {
      _json["confidence"] = confidence;
    }
    if (languageCode != null) {
      _json["languageCode"] = languageCode;
    }
    return _json;
  }
}

/// A generic empty message that you can re-use to avoid defining duplicated
/// empty messages in your APIs. A typical example is to use it as the request
/// or the response type of an API method. For instance:
///
///     service Foo {
///       rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
///     }
///
/// The JSON representation for `Empty` is empty JSON object `{}`.
class Empty {
  Empty();

  Empty.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// The Google Cloud Storage location for the output content.
class GcsDestination {
  /// Required. The bucket used in 'output_uri_prefix' must exist and there must
  /// be no
  /// files under 'output_uri_prefix'. 'output_uri_prefix' must end with "/" and
  /// start with "gs://". One 'output_uri_prefix' can only be used by one batch
  /// translation job at a time. Otherwise an INVALID_ARGUMENT (400) error is
  ///  returned.
  core.String outputUriPrefix;

  GcsDestination();

  GcsDestination.fromJson(core.Map _json) {
    if (_json.containsKey("outputUriPrefix")) {
      outputUriPrefix = _json["outputUriPrefix"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (outputUriPrefix != null) {
      _json["outputUriPrefix"] = outputUriPrefix;
    }
    return _json;
  }
}

/// The Google Cloud Storage location for the input content.
class GcsSource {
  /// Required. Source data URI. For example, `gs://my_bucket/my_object`.
  core.String inputUri;

  GcsSource();

  GcsSource.fromJson(core.Map _json) {
    if (_json.containsKey("inputUri")) {
      inputUri = _json["inputUri"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (inputUri != null) {
      _json["inputUri"] = inputUri;
    }
    return _json;
  }
}

/// Represents a glossary built from user provided data.
class Glossary {
  /// Output only. When the glossary creation was finished.
  core.String endTime;

  /// Output only. The number of entries defined in the glossary.
  core.int entryCount;

  /// Required. Provides examples to build the glossary from.
  /// Total glossary must not exceed 10M Unicode codepoints.
  GlossaryInputConfig inputConfig;

  /// Used with equivalent term set glossaries.
  LanguageCodesSet languageCodesSet;

  /// Used with unidirectional glossaries.
  LanguageCodePair languagePair;

  /// Required. The resource name of the glossary. Glossary names have the form
  /// `projects/{project-number-or-id}/locations/{location-id}/glossaries/{glossary-id}`.
  core.String name;

  /// Output only. When CreateGlossary was called.
  core.String submitTime;

  Glossary();

  Glossary.fromJson(core.Map _json) {
    if (_json.containsKey("endTime")) {
      endTime = _json["endTime"];
    }
    if (_json.containsKey("entryCount")) {
      entryCount = _json["entryCount"];
    }
    if (_json.containsKey("inputConfig")) {
      inputConfig = new GlossaryInputConfig.fromJson(_json["inputConfig"]);
    }
    if (_json.containsKey("languageCodesSet")) {
      languageCodesSet =
          new LanguageCodesSet.fromJson(_json["languageCodesSet"]);
    }
    if (_json.containsKey("languagePair")) {
      languagePair = new LanguageCodePair.fromJson(_json["languagePair"]);
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("submitTime")) {
      submitTime = _json["submitTime"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (endTime != null) {
      _json["endTime"] = endTime;
    }
    if (entryCount != null) {
      _json["entryCount"] = entryCount;
    }
    if (inputConfig != null) {
      _json["inputConfig"] = (inputConfig).toJson();
    }
    if (languageCodesSet != null) {
      _json["languageCodesSet"] = (languageCodesSet).toJson();
    }
    if (languagePair != null) {
      _json["languagePair"] = (languagePair).toJson();
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (submitTime != null) {
      _json["submitTime"] = submitTime;
    }
    return _json;
  }
}

/// Input configuration for glossaries.
class GlossaryInputConfig {
  /// Required. Google Cloud Storage location of glossary data.
  /// File format is determined based on the filename extension. API returns
  /// [google.rpc.Code.INVALID_ARGUMENT] for unsupported URI-s and file
  /// formats. Wildcards are not allowed. This must be a single file in one of
  /// the following formats:
  ///
  /// For unidirectional glossaries:
  ///
  /// - TSV/CSV (`.tsv`/`.csv`): 2 column file, tab- or comma-separated.
  ///   The first column is source text. The second column is target text.
  ///   The file must not contain headers. That is, the first row is data, not
  ///   column names.
  ///
  /// - TMX (`.tmx`): TMX file with parallel data defining source/target term
  /// pairs.
  ///
  /// For equivalent term sets glossaries:
  ///
  /// - CSV (`.csv`): Multi-column CSV file defining equivalent glossary terms
  ///   in multiple languages. The format is defined for Google Translation
  ///   Toolkit and documented in [Use a
  /// glossary](https://support.google.com/translatortoolkit/answer/6306379?hl=en).
  GcsSource gcsSource;

  GlossaryInputConfig();

  GlossaryInputConfig.fromJson(core.Map _json) {
    if (_json.containsKey("gcsSource")) {
      gcsSource = new GcsSource.fromJson(_json["gcsSource"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (gcsSource != null) {
      _json["gcsSource"] = (gcsSource).toJson();
    }
    return _json;
  }
}

/// Input configuration for BatchTranslateText request.
class InputConfig {
  /// Required. Google Cloud Storage location for the source input.
  /// This can be a single file (for example,
  /// `gs://translation-test/input.tsv`) or a wildcard (for example,
  /// `gs://translation-test / * `). If a file extension is `.tsv`, it can
  /// contain either one or two columns. The first column (optional) is the id
  /// of the text request. If the first column is missing, we use the row
  /// number (0-based) from the input file as the ID in the output file. The
  /// second column is the actual text to be
  ///  translated. We recommend each row be <= 10K Unicode codepoints,
  /// otherwise an error might be returned.
  /// Note that the input tsv must be RFC 4180 compliant.
  ///
  /// You could use https://github.com/Clever/csvlint to check potential
  /// formatting errors in your tsv file.
  /// csvlint --delimiter='\t' your_input_file.tsv
  ///
  /// The other supported file extensions are `.txt` or `.html`, which is
  /// treated as a single large chunk of text.
  GcsSource gcsSource;

  /// Optional. Can be "text/plain" or "text/html".
  /// For `.tsv`, "text/html" is used if mime_type is missing.
  /// For `.html`, this field must be "text/html" or empty.
  /// For `.txt`, this field must be "text/plain" or empty.
  core.String mimeType;

  InputConfig();

  InputConfig.fromJson(core.Map _json) {
    if (_json.containsKey("gcsSource")) {
      gcsSource = new GcsSource.fromJson(_json["gcsSource"]);
    }
    if (_json.containsKey("mimeType")) {
      mimeType = _json["mimeType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (gcsSource != null) {
      _json["gcsSource"] = (gcsSource).toJson();
    }
    if (mimeType != null) {
      _json["mimeType"] = mimeType;
    }
    return _json;
  }
}

/// Used with unidirectional glossaries.
class LanguageCodePair {
  /// Required. The BCP-47 language code of the input text, for example,
  /// "en-US". Expected to be an exact match for GlossaryTerm.language_code.
  core.String sourceLanguageCode;

  /// Required. The BCP-47 language code for translation output, for example,
  /// "zh-CN". Expected to be an exact match for GlossaryTerm.language_code.
  core.String targetLanguageCode;

  LanguageCodePair();

  LanguageCodePair.fromJson(core.Map _json) {
    if (_json.containsKey("sourceLanguageCode")) {
      sourceLanguageCode = _json["sourceLanguageCode"];
    }
    if (_json.containsKey("targetLanguageCode")) {
      targetLanguageCode = _json["targetLanguageCode"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (sourceLanguageCode != null) {
      _json["sourceLanguageCode"] = sourceLanguageCode;
    }
    if (targetLanguageCode != null) {
      _json["targetLanguageCode"] = targetLanguageCode;
    }
    return _json;
  }
}

/// Used with equivalent term set glossaries.
class LanguageCodesSet {
  /// The BCP-47 language code(s) for terms defined in the glossary.
  /// All entries are unique. The list contains at least two entries.
  /// Expected to be an exact match for GlossaryTerm.language_code.
  core.List<core.String> languageCodes;

  LanguageCodesSet();

  LanguageCodesSet.fromJson(core.Map _json) {
    if (_json.containsKey("languageCodes")) {
      languageCodes = (_json["languageCodes"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (languageCodes != null) {
      _json["languageCodes"] = languageCodes;
    }
    return _json;
  }
}

/// Response message for ListGlossaries.
class ListGlossariesResponse {
  /// The list of glossaries for a project.
  core.List<Glossary> glossaries;

  /// A token to retrieve a page of results. Pass this value in the
  /// [ListGlossariesRequest.page_token] field in the subsequent call to
  /// `ListGlossaries` method to retrieve the next page of results.
  core.String nextPageToken;

  ListGlossariesResponse();

  ListGlossariesResponse.fromJson(core.Map _json) {
    if (_json.containsKey("glossaries")) {
      glossaries = (_json["glossaries"] as core.List)
          .map<Glossary>((value) => new Glossary.fromJson(value))
          .toList();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (glossaries != null) {
      _json["glossaries"] =
          glossaries.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// The response message for Locations.ListLocations.
class ListLocationsResponse {
  /// A list of locations that matches the specified filter in the request.
  core.List<Location> locations;

  /// The standard List next-page token.
  core.String nextPageToken;

  ListLocationsResponse();

  ListLocationsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("locations")) {
      locations = (_json["locations"] as core.List)
          .map<Location>((value) => new Location.fromJson(value))
          .toList();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (locations != null) {
      _json["locations"] = locations.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// The response message for Operations.ListOperations.
class ListOperationsResponse {
  /// The standard List next-page token.
  core.String nextPageToken;

  /// A list of operations that matches the specified filter in the request.
  core.List<Operation> operations;

  ListOperationsResponse();

  ListOperationsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("operations")) {
      operations = (_json["operations"] as core.List)
          .map<Operation>((value) => new Operation.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    if (operations != null) {
      _json["operations"] =
          operations.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// A resource that represents Google Cloud Platform location.
class Location {
  /// The friendly name for this location, typically a nearby city name.
  /// For example, "Tokyo".
  core.String displayName;

  /// Cross-service attributes for the location. For example
  ///
  ///     {"cloud.googleapis.com/region": "us-east1"}
  core.Map<core.String, core.String> labels;

  /// The canonical id for this location. For example: `"us-east1"`.
  core.String locationId;

  /// Service-specific metadata. For example the available capacity at the given
  /// location.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> metadata;

  /// Resource name for the location, which may vary between implementations.
  /// For example: `"projects/example-project/locations/us-east1"`
  core.String name;

  Location();

  Location.fromJson(core.Map _json) {
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("labels")) {
      labels = (_json["labels"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("locationId")) {
      locationId = _json["locationId"];
    }
    if (_json.containsKey("metadata")) {
      metadata =
          (_json["metadata"] as core.Map).cast<core.String, core.Object>();
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (labels != null) {
      _json["labels"] = labels;
    }
    if (locationId != null) {
      _json["locationId"] = locationId;
    }
    if (metadata != null) {
      _json["metadata"] = metadata;
    }
    if (name != null) {
      _json["name"] = name;
    }
    return _json;
  }
}

/// This resource represents a long-running operation that is the result of a
/// network API call.
class Operation {
  /// If the value is `false`, it means the operation is still in progress.
  /// If `true`, the operation is completed, and either `error` or `response` is
  /// available.
  core.bool done;

  /// The error result of the operation in case of failure or cancellation.
  Status error;

  /// Service-specific metadata associated with the operation.  It typically
  /// contains progress information and common metadata such as create time.
  /// Some services might not provide such metadata.  Any method that returns a
  /// long-running operation should document the metadata type, if any.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> metadata;

  /// The server-assigned name, which is only unique within the same service
  /// that
  /// originally returns it. If you use the default HTTP mapping, the
  /// `name` should be a resource name ending with `operations/{unique_id}`.
  core.String name;

  /// The normal response of the operation in case of success.  If the original
  /// method returns no data on success, such as `Delete`, the response is
  /// `google.protobuf.Empty`.  If the original method is standard
  /// `Get`/`Create`/`Update`, the response should be the resource.  For other
  /// methods, the response should have the type `XxxResponse`, where `Xxx`
  /// is the original method name.  For example, if the original method name
  /// is `TakeSnapshot()`, the inferred response type is
  /// `TakeSnapshotResponse`.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> response;

  Operation();

  Operation.fromJson(core.Map _json) {
    if (_json.containsKey("done")) {
      done = _json["done"];
    }
    if (_json.containsKey("error")) {
      error = new Status.fromJson(_json["error"]);
    }
    if (_json.containsKey("metadata")) {
      metadata =
          (_json["metadata"] as core.Map).cast<core.String, core.Object>();
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("response")) {
      response =
          (_json["response"] as core.Map).cast<core.String, core.Object>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (done != null) {
      _json["done"] = done;
    }
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    if (metadata != null) {
      _json["metadata"] = metadata;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (response != null) {
      _json["response"] = response;
    }
    return _json;
  }
}

/// Output configuration for BatchTranslateText request.
class OutputConfig {
  /// Google Cloud Storage destination for output content.
  /// For every single input file (for example, gs://a/b/c.[extension]), we
  /// generate at most 2 * n output files. (n is the # of target_language_codes
  /// in the BatchTranslateTextRequest).
  ///
  /// Output files (tsv) generated are compliant with RFC 4180 except that
  /// record delimiters are '\n' instead of '\r\n'. We don't provide any way to
  /// change record delimiters.
  ///
  /// While the input files are being processed, we write/update an index file
  /// 'index.csv'  under 'output_uri_prefix' (for example,
  /// gs://translation-test/index.csv) The index file is generated/updated as
  /// new files are being translated. The format is:
  ///
  /// input_file,target_language_code,translations_file,errors_file,
  /// glossary_translations_file,glossary_errors_file
  ///
  /// input_file is one file we matched using gcs_source.input_uri.
  /// target_language_code is provided in the request.
  /// translations_file contains the translations. (details provided below)
  /// errors_file contains the errors during processing of the file. (details
  /// below). Both translations_file and errors_file could be empty
  /// strings if we have no content to output.
  /// glossary_translations_file and glossary_errors_file are always empty
  /// strings if the input_file is tsv. They could also be empty if we have no
  /// content to output.
  ///
  /// Once a row is present in index.csv, the input/output matching never
  /// changes. Callers should also expect all the content in input_file are
  /// processed and ready to be consumed (that is, no partial output file is
  /// written).
  ///
  /// The format of translations_file (for target language code 'trg') is:
  /// gs://translation_test/a_b_c_'trg'_translations.[extension]
  ///
  /// If the input file extension is tsv, the output has the following
  /// columns:
  /// Column 1: ID of the request provided in the input, if it's not
  /// provided in the input, then the input row number is used (0-based).
  /// Column 2: source sentence.
  /// Column 3: translation without applying a glossary. Empty string if there
  /// is an error.
  /// Column 4 (only present if a glossary is provided in the request):
  /// translation after applying the glossary. Empty string if there is an
  /// error applying the glossary. Could be same string as column 3 if there is
  /// no glossary applied.
  ///
  /// If input file extension is a txt or html, the translation is directly
  /// written to the output file. If glossary is requested, a separate
  /// glossary_translations_file has format of
  /// gs://translation_test/a_b_c_'trg'_glossary_translations.[extension]
  ///
  /// The format of errors file (for target language code 'trg') is:
  /// gs://translation_test/a_b_c_'trg'_errors.[extension]
  ///
  /// If the input file extension is tsv, errors_file contains the following:
  /// Column 1: ID of the request provided in the input, if it's not
  /// provided in the input, then the input row number is used (0-based).
  /// Column 2: source sentence.
  /// Column 3: Error detail for the translation. Could be empty.
  /// Column 4 (only present if a glossary is provided in the request):
  /// Error when applying the glossary.
  ///
  /// If the input file extension is txt or html, glossary_error_file will be
  /// generated that contains error details. glossary_error_file has format of
  /// gs://translation_test/a_b_c_'trg'_glossary_errors.[extension]
  GcsDestination gcsDestination;

  OutputConfig();

  OutputConfig.fromJson(core.Map _json) {
    if (_json.containsKey("gcsDestination")) {
      gcsDestination = new GcsDestination.fromJson(_json["gcsDestination"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (gcsDestination != null) {
      _json["gcsDestination"] = (gcsDestination).toJson();
    }
    return _json;
  }
}

/// The `Status` type defines a logical error model that is suitable for
/// different programming environments, including REST APIs and RPC APIs. It is
/// used by [gRPC](https://github.com/grpc). Each `Status` message contains
/// three pieces of data: error code, error message, and error details.
///
/// You can find out more about this error model and how to work with it in the
/// [API Design Guide](https://cloud.google.com/apis/design/errors).
class Status {
  /// The status code, which should be an enum value of google.rpc.Code.
  core.int code;

  /// A list of messages that carry the error details.  There is a common set of
  /// message types for APIs to use.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.List<core.Map<core.String, core.Object>> details;

  /// A developer-facing error message, which should be in English. Any
  /// user-facing error message should be localized and sent in the
  /// google.rpc.Status.details field, or localized by the client.
  core.String message;

  Status();

  Status.fromJson(core.Map _json) {
    if (_json.containsKey("code")) {
      code = _json["code"];
    }
    if (_json.containsKey("details")) {
      details = (_json["details"] as core.List)
          .map<core.Map<core.String, core.Object>>(
              (value) => (value as core.Map).cast<core.String, core.Object>())
          .toList();
    }
    if (_json.containsKey("message")) {
      message = _json["message"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (code != null) {
      _json["code"] = code;
    }
    if (details != null) {
      _json["details"] = details;
    }
    if (message != null) {
      _json["message"] = message;
    }
    return _json;
  }
}

/// A single supported language response corresponds to information related
/// to one supported language.
class SupportedLanguage {
  /// Human readable name of the language localized in the display language
  /// specified in the request.
  core.String displayName;

  /// Supported language code, generally consisting of its ISO 639-1
  /// identifier, for example, 'en', 'ja'. In certain cases, BCP-47 codes
  /// including language and region identifiers are returned (for example,
  /// 'zh-TW' and 'zh-CN')
  core.String languageCode;

  /// Can be used as source language.
  core.bool supportSource;

  /// Can be used as target language.
  core.bool supportTarget;

  SupportedLanguage();

  SupportedLanguage.fromJson(core.Map _json) {
    if (_json.containsKey("displayName")) {
      displayName = _json["displayName"];
    }
    if (_json.containsKey("languageCode")) {
      languageCode = _json["languageCode"];
    }
    if (_json.containsKey("supportSource")) {
      supportSource = _json["supportSource"];
    }
    if (_json.containsKey("supportTarget")) {
      supportTarget = _json["supportTarget"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (displayName != null) {
      _json["displayName"] = displayName;
    }
    if (languageCode != null) {
      _json["languageCode"] = languageCode;
    }
    if (supportSource != null) {
      _json["supportSource"] = supportSource;
    }
    if (supportTarget != null) {
      _json["supportTarget"] = supportTarget;
    }
    return _json;
  }
}

/// The response message for discovering supported languages.
class SupportedLanguages {
  /// A list of supported language responses. This list contains an entry
  /// for each language the Translation API supports.
  core.List<SupportedLanguage> languages;

  SupportedLanguages();

  SupportedLanguages.fromJson(core.Map _json) {
    if (_json.containsKey("languages")) {
      languages = (_json["languages"] as core.List)
          .map<SupportedLanguage>(
              (value) => new SupportedLanguage.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (languages != null) {
      _json["languages"] = languages.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Configures which glossary should be used for a specific target language,
/// and defines options for applying that glossary.
class TranslateTextGlossaryConfig {
  /// Required. The `glossary` to be applied for this translation.
  ///
  /// The format depends on glossary:
  ///
  /// - User provided custom glossary:
  /// `projects/{project-number-or-id}/locations/{location-id}/glossaries/{glossary-id}`
  core.String glossary;

  /// Optional. Indicates match is case-insensitive.
  /// Default value is false if missing.
  core.bool ignoreCase;

  TranslateTextGlossaryConfig();

  TranslateTextGlossaryConfig.fromJson(core.Map _json) {
    if (_json.containsKey("glossary")) {
      glossary = _json["glossary"];
    }
    if (_json.containsKey("ignoreCase")) {
      ignoreCase = _json["ignoreCase"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (glossary != null) {
      _json["glossary"] = glossary;
    }
    if (ignoreCase != null) {
      _json["ignoreCase"] = ignoreCase;
    }
    return _json;
  }
}

/// The request message for synchronous translation.
class TranslateTextRequest {
  /// Required. The content of the input in string format.
  /// We recommend the total content be less than 30k codepoints.
  /// Use BatchTranslateText for larger text.
  core.List<core.String> contents;

  /// Optional. Glossary to be applied. The glossary must be
  /// within the same region (have the same location-id) as the model, otherwise
  /// an INVALID_ARGUMENT (400) error is returned.
  TranslateTextGlossaryConfig glossaryConfig;

  /// Optional. The labels with user-defined metadata for the request.
  ///
  /// Label keys and values can be no longer than 63 characters
  /// (Unicode codepoints), can only contain lowercase letters, numeric
  /// characters, underscores and dashes. International characters are allowed.
  /// Label values are optional. Label keys must start with a letter.
  ///
  /// See https://cloud.google.com/translate/docs/advanced/labels for more
  /// information.
  core.Map<core.String, core.String> labels;

  /// Optional. The format of the source text, for example, "text/html",
  ///  "text/plain". If left blank, the MIME type defaults to "text/html".
  core.String mimeType;

  /// Optional. The `model` type requested for this translation.
  ///
  /// The format depends on model type:
  ///
  /// - AutoML Translation models:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}`
  ///
  /// - General (built-in) models:
  /// `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`,
  /// `projects/{project-number-or-id}/locations/{location-id}/models/general/base`
  ///
  ///
  /// For global (non-regionalized) requests, use `location-id` `global`.
  /// For example,
  /// `projects/{project-number-or-id}/locations/global/models/general/nmt`.
  ///
  /// If missing, the system decides which google base model to use.
  core.String model;

  /// Optional. The BCP-47 language code of the input text if
  /// known, for example, "en-US" or "sr-Latn". Supported language codes are
  /// listed in Language Support. If the source language isn't specified, the
  /// API
  /// attempts to identify the source language automatically and returns the
  /// source language within the response.
  core.String sourceLanguageCode;

  /// Required. The BCP-47 language code to use for translation of the input
  /// text, set to one of the language codes listed in Language Support.
  core.String targetLanguageCode;

  TranslateTextRequest();

  TranslateTextRequest.fromJson(core.Map _json) {
    if (_json.containsKey("contents")) {
      contents = (_json["contents"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("glossaryConfig")) {
      glossaryConfig =
          new TranslateTextGlossaryConfig.fromJson(_json["glossaryConfig"]);
    }
    if (_json.containsKey("labels")) {
      labels = (_json["labels"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("mimeType")) {
      mimeType = _json["mimeType"];
    }
    if (_json.containsKey("model")) {
      model = _json["model"];
    }
    if (_json.containsKey("sourceLanguageCode")) {
      sourceLanguageCode = _json["sourceLanguageCode"];
    }
    if (_json.containsKey("targetLanguageCode")) {
      targetLanguageCode = _json["targetLanguageCode"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (contents != null) {
      _json["contents"] = contents;
    }
    if (glossaryConfig != null) {
      _json["glossaryConfig"] = (glossaryConfig).toJson();
    }
    if (labels != null) {
      _json["labels"] = labels;
    }
    if (mimeType != null) {
      _json["mimeType"] = mimeType;
    }
    if (model != null) {
      _json["model"] = model;
    }
    if (sourceLanguageCode != null) {
      _json["sourceLanguageCode"] = sourceLanguageCode;
    }
    if (targetLanguageCode != null) {
      _json["targetLanguageCode"] = targetLanguageCode;
    }
    return _json;
  }
}

class TranslateTextResponse {
  /// Text translation responses if a glossary is provided in the request.
  /// This can be the same as
  /// `translations` if no terms apply.
  /// This field has the same length as
  /// `contents`.
  core.List<Translation> glossaryTranslations;

  /// Text translation responses with no glossary applied.
  /// This field has the same length as
  /// `contents`.
  core.List<Translation> translations;

  TranslateTextResponse();

  TranslateTextResponse.fromJson(core.Map _json) {
    if (_json.containsKey("glossaryTranslations")) {
      glossaryTranslations = (_json["glossaryTranslations"] as core.List)
          .map<Translation>((value) => new Translation.fromJson(value))
          .toList();
    }
    if (_json.containsKey("translations")) {
      translations = (_json["translations"] as core.List)
          .map<Translation>((value) => new Translation.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (glossaryTranslations != null) {
      _json["glossaryTranslations"] =
          glossaryTranslations.map((value) => (value).toJson()).toList();
    }
    if (translations != null) {
      _json["translations"] =
          translations.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// A single translation response.
class Translation {
  /// The BCP-47 language code of source text in the initial request, detected
  /// automatically, if no source language was passed within the initial
  /// request. If the source language was passed, auto-detection of the language
  /// does not occur and this field is empty.
  core.String detectedLanguageCode;

  /// The `glossary_config` used for this translation.
  TranslateTextGlossaryConfig glossaryConfig;

  /// Only present when `model` is present in the request.
  /// `model` here is normalized to have project number.
  ///
  /// For example:
  /// If the `model` requested in TranslationTextRequest is
  /// `projects/{project-id}/locations/{location-id}/models/general/nmt` then
  /// `model` here would be normalized to
  /// `projects/{project-number}/locations/{location-id}/models/general/nmt`.
  core.String model;

  /// Text translated into the target language.
  core.String translatedText;

  Translation();

  Translation.fromJson(core.Map _json) {
    if (_json.containsKey("detectedLanguageCode")) {
      detectedLanguageCode = _json["detectedLanguageCode"];
    }
    if (_json.containsKey("glossaryConfig")) {
      glossaryConfig =
          new TranslateTextGlossaryConfig.fromJson(_json["glossaryConfig"]);
    }
    if (_json.containsKey("model")) {
      model = _json["model"];
    }
    if (_json.containsKey("translatedText")) {
      translatedText = _json["translatedText"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (detectedLanguageCode != null) {
      _json["detectedLanguageCode"] = detectedLanguageCode;
    }
    if (glossaryConfig != null) {
      _json["glossaryConfig"] = (glossaryConfig).toJson();
    }
    if (model != null) {
      _json["model"] = model;
    }
    if (translatedText != null) {
      _json["translatedText"] = translatedText;
    }
    return _json;
  }
}

/// The request message for Operations.WaitOperation.
class WaitOperationRequest {
  /// The maximum duration to wait before timing out. If left blank, the wait
  /// will be at most the time permitted by the underlying HTTP/RPC protocol.
  /// If RPC context deadline is also specified, the shorter one will be used.
  core.String timeout;

  WaitOperationRequest();

  WaitOperationRequest.fromJson(core.Map _json) {
    if (_json.containsKey("timeout")) {
      timeout = _json["timeout"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (timeout != null) {
      _json["timeout"] = timeout;
    }
    return _json;
  }
}
