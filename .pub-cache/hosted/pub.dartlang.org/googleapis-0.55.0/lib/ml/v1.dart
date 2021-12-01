// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: unused_import, unnecessary_cast

library googleapis.ml.v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client ml/v1';

/// An API to enable creating and using machine learning models.
class MlApi {
  /// View and manage your data across Google Cloud Platform services
  static const CloudPlatformScope =
      "https://www.googleapis.com/auth/cloud-platform";

  /// View your data across Google Cloud Platform services
  static const CloudPlatformReadOnlyScope =
      "https://www.googleapis.com/auth/cloud-platform.read-only";

  final commons.ApiRequester _requester;

  ProjectsResourceApi get projects => new ProjectsResourceApi(_requester);

  MlApi(http.Client client,
      {core.String rootUrl = "https://ml.googleapis.com/",
      core.String servicePath = ""})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class ProjectsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsJobsResourceApi get jobs => new ProjectsJobsResourceApi(_requester);
  ProjectsLocationsResourceApi get locations =>
      new ProjectsLocationsResourceApi(_requester);
  ProjectsModelsResourceApi get models =>
      new ProjectsModelsResourceApi(_requester);
  ProjectsOperationsResourceApi get operations =>
      new ProjectsOperationsResourceApi(_requester);

  ProjectsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Performs explanation on the data in the request.
  /// AI Platform implements a custom `explain` verb on top of an HTTP POST
  /// method.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The resource name of a model or a version.
  ///
  /// Authorization: requires the `predict` permission on the specified
  /// resource.
  /// Value must have pattern "^projects/.*$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleApiHttpBody].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleApiHttpBody> explain(
      GoogleCloudMlV1ExplainRequest request, core.String name,
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':explain';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleApiHttpBody.fromJson(data));
  }

  /// Get the service account information associated with your project. You need
  /// this information in order to grant the service account permissions for
  /// the Google Cloud Storage location where you put your model training code
  /// for training the model with Google Cloud Machine Learning.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The project name.
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1GetConfigResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1GetConfigResponse> getConfig(core.String name,
      {core.String $fields}) {
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

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':getConfig';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudMlV1GetConfigResponse.fromJson(data));
  }

  /// Performs online prediction on the data in the request.
  ///
  /// <div>{% dynamic include "/ai-platform/includes/___predict-request"
  /// %}</div>
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The resource name of a model or a version.
  ///
  /// Authorization: requires the `predict` permission on the specified
  /// resource.
  /// Value must have pattern "^projects/.*$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleApiHttpBody].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleApiHttpBody> predict(
      GoogleCloudMlV1PredictRequest request, core.String name,
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':predict';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleApiHttpBody.fromJson(data));
  }
}

class ProjectsJobsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsJobsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Cancels a running job.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the job to cancel.
  /// Value must have pattern "^projects/[^/]+/jobs/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleProtobufEmpty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleProtobufEmpty> cancel(
      GoogleCloudMlV1CancelJobRequest request, core.String name,
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':cancel';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleProtobufEmpty.fromJson(data));
  }

  /// Creates a training or a batch prediction job.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The project name.
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Job].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Job> create(
      GoogleCloudMlV1Job request, core.String parent,
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/jobs';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Job.fromJson(data));
  }

  /// Describes a job.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the job to get the description of.
  /// Value must have pattern "^projects/[^/]+/jobs/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Job].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Job> get(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Job.fromJson(data));
  }

  /// Gets the access control policy for a resource.
  /// Returns an empty policy if the resource exists and does not have a policy
  /// set.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// requested.
  /// See the operation documentation for the appropriate value for this field.
  /// Value must have pattern "^projects/[^/]+/jobs/[^/]+$".
  ///
  /// [options_requestedPolicyVersion] - Optional. The policy format version to
  /// be returned.
  ///
  /// Valid values are 0, 1, and 3. Requests specifying an invalid value will be
  /// rejected.
  ///
  /// Requests for policies with any conditional bindings must specify version
  /// 3.
  /// Policies without any conditional bindings may specify any valid value or
  /// leave the field unset.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleIamV1Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleIamV1Policy> getIamPolicy(core.String resource,
      {core.int options_requestedPolicyVersion, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if (options_requestedPolicyVersion != null) {
      _queryParams["options.requestedPolicyVersion"] = [
        "${options_requestedPolicyVersion}"
      ];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':getIamPolicy';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleIamV1Policy.fromJson(data));
  }

  /// Lists the jobs in the project.
  ///
  /// If there are no jobs that match the request parameters, the list
  /// request returns an empty response body: {}.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the project for which to list jobs.
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [pageToken] - Optional. A page token to request the next page of results.
  ///
  /// You get the token from the `next_page_token` field of the response from
  /// the previous call.
  ///
  /// [pageSize] - Optional. The number of jobs to retrieve per "page" of
  /// results. If there
  /// are more remaining results than this number, the response message will
  /// contain a valid value in the `next_page_token` field.
  ///
  /// The default value is 20, and the maximum page size is 100.
  ///
  /// [filter] - Optional. Specifies the subset of jobs to retrieve.
  /// You can filter on the value of one or more attributes of the job object.
  /// For example, retrieve jobs with a job identifier that starts with
  /// 'census':
  /// <p><code>gcloud ai-platform jobs list --filter='jobId:census*'</code>
  /// <p>List all failed jobs with names that start with 'rnn':
  /// <p><code>gcloud ai-platform jobs list --filter='jobId:rnn*
  /// AND state:FAILED'</code>
  /// <p>For more examples, see the guide to
  /// <a href="/ml-engine/docs/tensorflow/monitor-training">monitoring jobs</a>.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1ListJobsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1ListJobsResponse> list(core.String parent,
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

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/jobs';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudMlV1ListJobsResponse.fromJson(data));
  }

  /// Updates a specific job resource.
  ///
  /// Currently the only supported fields to update are `labels`.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The job name.
  /// Value must have pattern "^projects/[^/]+/jobs/[^/]+$".
  ///
  /// [updateMask] - Required. Specifies the path, relative to `Job`, of the
  /// field to update.
  /// To adopt etag mechanism, include `etag` field in the mask, and include the
  /// `etag` value in your job resource.
  ///
  /// For example, to change the labels of a job, the `update_mask` parameter
  /// would be specified as `labels`, `etag`, and the
  /// `PATCH` request body would specify the new value, as follows:
  ///     {
  ///       "labels": {
  ///          "owner": "Google",
  ///          "color": "Blue"
  ///       }
  ///       "etag": "33a64df551425fcc55e4d42a148795d9f25f89d4"
  ///     }
  /// If `etag` matches the one on the server, the labels of the job will be
  /// replaced with the given ones, and the server end `etag` will be
  /// recalculated.
  ///
  /// Currently the only supported update masks are `labels` and `etag`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Job].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Job> patch(
      GoogleCloudMlV1Job request, core.String name,
      {core.String updateMask, core.String $fields}) {
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
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Job.fromJson(data));
  }

  /// Sets the access control policy on the specified resource. Replaces any
  /// existing policy.
  ///
  /// Can return Public Errors: NOT_FOUND, INVALID_ARGUMENT and
  /// PERMISSION_DENIED
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// specified.
  /// See the operation documentation for the appropriate value for this field.
  /// Value must have pattern "^projects/[^/]+/jobs/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleIamV1Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleIamV1Policy> setIamPolicy(
      GoogleIamV1SetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':setIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleIamV1Policy.fromJson(data));
  }

  /// Returns permissions that a caller has on the specified resource.
  /// If the resource does not exist, this will return an empty set of
  /// permissions, not a NOT_FOUND error.
  ///
  /// Note: This operation is designed to be used for building permission-aware
  /// UIs and command-line tools, not for authorization checking. This operation
  /// may "fail open" without warning.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy detail is being
  /// requested.
  /// See the operation documentation for the appropriate value for this field.
  /// Value must have pattern "^projects/[^/]+/jobs/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleIamV1TestIamPermissionsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleIamV1TestIamPermissionsResponse> testIamPermissions(
      GoogleIamV1TestIamPermissionsRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':testIamPermissions';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleIamV1TestIamPermissionsResponse.fromJson(data));
  }
}

class ProjectsLocationsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsOperationsResourceApi get operations =>
      new ProjectsLocationsOperationsResourceApi(_requester);
  ProjectsLocationsStudiesResourceApi get studies =>
      new ProjectsLocationsStudiesResourceApi(_requester);

  ProjectsLocationsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Get the complete list of CMLE capabilities in a location, along with their
  /// location-specific properties.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the location.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Location].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Location> get(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Location.fromJson(data));
  }

  /// List all locations that provides at least one type of CMLE capability.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the project for which available locations
  /// are to be
  /// listed (since some locations might be whitelisted for specific projects).
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [pageToken] - Optional. A page token to request the next page of results.
  ///
  /// You get the token from the `next_page_token` field of the response from
  /// the previous call.
  ///
  /// [pageSize] - Optional. The number of locations to retrieve per "page" of
  /// results. If
  /// there are more remaining results than this number, the response message
  /// will contain a valid value in the `next_page_token` field.
  ///
  /// The default value is 20, and the maximum page size is 100.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1ListLocationsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1ListLocationsResponse> list(core.String parent,
      {core.String pageToken, core.int pageSize, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
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

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/locations';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleCloudMlV1ListLocationsResponse.fromJson(data));
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
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource to be cancelled.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/operations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleProtobufEmpty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleProtobufEmpty> cancel(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':cancel';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleProtobufEmpty.fromJson(data));
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
  /// Completes with a [GoogleLongrunningOperation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningOperation> get(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleLongrunningOperation.fromJson(data));
  }
}

class ProjectsLocationsStudiesResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsStudiesTrialsResourceApi get trials =>
      new ProjectsLocationsStudiesTrialsResourceApi(_requester);

  ProjectsLocationsStudiesResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a study.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The project and location that the study belongs to.
  /// Format: projects/{project}/locations/{location}
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [studyId] - Required. The ID to use for the study, which will become the
  /// final component of
  /// the study's resource name.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Study].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Study> create(
      GoogleCloudMlV1Study request, core.String parent,
      {core.String studyId, core.String $fields}) {
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
    if (studyId != null) {
      _queryParams["studyId"] = [studyId];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/studies';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Study.fromJson(data));
  }

  /// Deletes a study.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The study name.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+/studies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleProtobufEmpty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleProtobufEmpty> delete(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleProtobufEmpty.fromJson(data));
  }

  /// Gets a study.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The study name.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+/studies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Study].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Study> get(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Study.fromJson(data));
  }

  /// Lists all the studies in a region for an associated project.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The project and location that the study belongs to.
  /// Format: projects/{project}/locations/{location}
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1ListStudiesResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1ListStudiesResponse> list(core.String parent,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/studies';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudMlV1ListStudiesResponse.fromJson(data));
  }
}

class ProjectsLocationsStudiesTrialsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsLocationsStudiesTrialsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Adds a measurement of the objective metrics to a trial. This measurement
  /// is assumed to have been taken before the trial is complete.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The trial name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/studies/[^/]+/trials/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Trial].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Trial> addMeasurement(
      GoogleCloudMlV1AddTrialMeasurementRequest request, core.String name,
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

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$name') +
        ':addMeasurement';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Trial.fromJson(data));
  }

  /// Checks  whether a trial should stop or not. Returns a
  /// long-running operation. When the operation is successful,
  /// it will contain a
  /// CheckTrialEarlyStoppingStateResponse.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The trial name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/studies/[^/]+/trials/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleLongrunningOperation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningOperation> checkEarlyStoppingState(
      GoogleCloudMlV1CheckTrialEarlyStoppingStateRequest request,
      core.String name,
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

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$name') +
        ':checkEarlyStoppingState';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleLongrunningOperation.fromJson(data));
  }

  /// Marks a trial as complete.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The trial name.metat
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/studies/[^/]+/trials/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Trial].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Trial> complete(
      GoogleCloudMlV1CompleteTrialRequest request, core.String name,
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':complete';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Trial.fromJson(data));
  }

  /// Adds a user provided trial to a study.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the study that the trial belongs to.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+/studies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Trial].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Trial> create(
      GoogleCloudMlV1Trial request, core.String parent,
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/trials';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Trial.fromJson(data));
  }

  /// Deletes a trial.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The trial name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/studies/[^/]+/trials/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleProtobufEmpty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleProtobufEmpty> delete(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleProtobufEmpty.fromJson(data));
  }

  /// Gets a trial.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The trial name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/studies/[^/]+/trials/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Trial].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Trial> get(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Trial.fromJson(data));
  }

  /// Lists the trials associated with a study.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the study that the trial belongs to.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+/studies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1ListTrialsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1ListTrialsResponse> list(core.String parent,
      {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/trials';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudMlV1ListTrialsResponse.fromJson(data));
  }

  /// Stops a trial.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The trial name.
  /// Value must have pattern
  /// "^projects/[^/]+/locations/[^/]+/studies/[^/]+/trials/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Trial].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Trial> stop(
      GoogleCloudMlV1StopTrialRequest request, core.String name,
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':stop';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Trial.fromJson(data));
  }

  /// Adds one or more trials to a study, with parameter values
  /// suggested by AI Platform Optimizer. Returns a long-running
  /// operation associated with the generation of trial suggestions.
  /// When this long-running operation succeeds, it will contain
  /// a SuggestTrialsResponse.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the study that the trial belongs to.
  /// Value must have pattern "^projects/[^/]+/locations/[^/]+/studies/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleLongrunningOperation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningOperation> suggest(
      GoogleCloudMlV1SuggestTrialsRequest request, core.String parent,
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

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/trials:suggest';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleLongrunningOperation.fromJson(data));
  }
}

class ProjectsModelsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsModelsVersionsResourceApi get versions =>
      new ProjectsModelsVersionsResourceApi(_requester);

  ProjectsModelsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Creates a model which will later contain one or more versions.
  ///
  /// You must add at least one version before you can request predictions from
  /// the model. Add versions by calling
  /// projects.models.versions.create.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The project name.
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Model].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Model> create(
      GoogleCloudMlV1Model request, core.String parent,
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/models';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Model.fromJson(data));
  }

  /// Deletes a model.
  ///
  /// You can only delete a model if there are no versions in it. You can delete
  /// versions by calling
  /// projects.models.versions.delete.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the model.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleLongrunningOperation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningOperation> delete(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleLongrunningOperation.fromJson(data));
  }

  /// Gets information about a model, including its name, the description (if
  /// set), and the default version (if at least one version of the model has
  /// been deployed).
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the model.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Model].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Model> get(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Model.fromJson(data));
  }

  /// Gets the access control policy for a resource.
  /// Returns an empty policy if the resource exists and does not have a policy
  /// set.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// requested.
  /// See the operation documentation for the appropriate value for this field.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+$".
  ///
  /// [options_requestedPolicyVersion] - Optional. The policy format version to
  /// be returned.
  ///
  /// Valid values are 0, 1, and 3. Requests specifying an invalid value will be
  /// rejected.
  ///
  /// Requests for policies with any conditional bindings must specify version
  /// 3.
  /// Policies without any conditional bindings may specify any valid value or
  /// leave the field unset.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleIamV1Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleIamV1Policy> getIamPolicy(core.String resource,
      {core.int options_requestedPolicyVersion, core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if (options_requestedPolicyVersion != null) {
      _queryParams["options.requestedPolicyVersion"] = [
        "${options_requestedPolicyVersion}"
      ];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':getIamPolicy';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleIamV1Policy.fromJson(data));
  }

  /// Lists the models in a project.
  ///
  /// Each project can contain multiple models, and each model can have multiple
  /// versions.
  ///
  /// If there are no models that match the request parameters, the list request
  /// returns an empty response body: {}.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the project whose models are to be
  /// listed.
  /// Value must have pattern "^projects/[^/]+$".
  ///
  /// [filter] - Optional. Specifies the subset of models to retrieve.
  ///
  /// [pageToken] - Optional. A page token to request the next page of results.
  ///
  /// You get the token from the `next_page_token` field of the response from
  /// the previous call.
  ///
  /// [pageSize] - Optional. The number of models to retrieve per "page" of
  /// results. If there
  /// are more remaining results than this number, the response message will
  /// contain a valid value in the `next_page_token` field.
  ///
  /// The default value is 20, and the maximum page size is 100.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1ListModelsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1ListModelsResponse> list(core.String parent,
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/models';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudMlV1ListModelsResponse.fromJson(data));
  }

  /// Updates a specific model resource.
  ///
  /// Currently the only supported fields to update are `description` and
  /// `default_version.name`.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The project name.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+$".
  ///
  /// [updateMask] - Required. Specifies the path, relative to `Model`, of the
  /// field to update.
  ///
  /// For example, to change the description of a model to "foo" and set its
  /// default version to "version_1", the `update_mask` parameter would be
  /// specified as `description`, `default_version.name`, and the `PATCH`
  /// request body would specify the new value, as follows:
  ///     {
  ///       "description": "foo",
  ///       "defaultVersion": {
  ///         "name":"version_1"
  ///       }
  ///     }
  ///
  /// Currently the supported update masks are `description` and
  /// `default_version.name`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleLongrunningOperation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningOperation> patch(
      GoogleCloudMlV1Model request, core.String name,
      {core.String updateMask, core.String $fields}) {
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
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleLongrunningOperation.fromJson(data));
  }

  /// Sets the access control policy on the specified resource. Replaces any
  /// existing policy.
  ///
  /// Can return Public Errors: NOT_FOUND, INVALID_ARGUMENT and
  /// PERMISSION_DENIED
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy is being
  /// specified.
  /// See the operation documentation for the appropriate value for this field.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleIamV1Policy].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleIamV1Policy> setIamPolicy(
      GoogleIamV1SetIamPolicyRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':setIamPolicy';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleIamV1Policy.fromJson(data));
  }

  /// Returns permissions that a caller has on the specified resource.
  /// If the resource does not exist, this will return an empty set of
  /// permissions, not a NOT_FOUND error.
  ///
  /// Note: This operation is designed to be used for building permission-aware
  /// UIs and command-line tools, not for authorization checking. This operation
  /// may "fail open" without warning.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [resource] - REQUIRED: The resource for which the policy detail is being
  /// requested.
  /// See the operation documentation for the appropriate value for this field.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleIamV1TestIamPermissionsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleIamV1TestIamPermissionsResponse> testIamPermissions(
      GoogleIamV1TestIamPermissionsRequest request, core.String resource,
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
    if (resource == null) {
      throw new core.ArgumentError("Parameter resource is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$resource') +
        ':testIamPermissions';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleIamV1TestIamPermissionsResponse.fromJson(data));
  }
}

class ProjectsModelsVersionsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsModelsVersionsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a new version of a model from a trained TensorFlow model.
  ///
  /// If the version created in the cloud by this call is the first deployed
  /// version of the specified model, it will be made the default version of the
  /// model. When you add a version to a model that already has one or more
  /// versions, the default version does not automatically change. If you want a
  /// new version to be the default, you must call
  /// projects.models.versions.setDefault.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the model.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleLongrunningOperation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningOperation> create(
      GoogleCloudMlV1Version request, core.String parent,
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

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/versions';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleLongrunningOperation.fromJson(data));
  }

  /// Deletes a model version.
  ///
  /// Each model can have multiple versions deployed and in use at any given
  /// time. Use this method to remove a single version.
  ///
  /// Note: You cannot delete the version that is set as the default version
  /// of the model unless it is the only remaining version.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the version. You can get the names of all
  /// the
  /// versions of a model by calling
  /// projects.models.versions.list.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+/versions/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleLongrunningOperation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningOperation> delete(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleLongrunningOperation.fromJson(data));
  }

  /// Gets information about a model version.
  ///
  /// Models can have multiple versions. You can call
  /// projects.models.versions.list
  /// to get the same information that this method returns for all of the
  /// versions of a model.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the version.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+/versions/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Version].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Version> get(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Version.fromJson(data));
  }

  /// Gets basic information about all the versions of a model.
  ///
  /// If you expect that a model has many versions, or if you need to handle
  /// only a limited number of results at a time, you can request that the list
  /// be retrieved in batches (called pages).
  ///
  /// If there are no versions that match the request parameters, the list
  /// request returns an empty response body: {}.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The name of the model for which to list the version.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+$".
  ///
  /// [pageToken] - Optional. A page token to request the next page of results.
  ///
  /// You get the token from the `next_page_token` field of the response from
  /// the previous call.
  ///
  /// [pageSize] - Optional. The number of versions to retrieve per "page" of
  /// results. If
  /// there are more remaining results than this number, the response message
  /// will contain a valid value in the `next_page_token` field.
  ///
  /// The default value is 20, and the maximum page size is 100.
  ///
  /// [filter] - Optional. Specifies the subset of versions to retrieve.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1ListVersionsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1ListVersionsResponse> list(core.String parent,
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

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
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
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/versions';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleCloudMlV1ListVersionsResponse.fromJson(data));
  }

  /// Updates the specified Version resource.
  ///
  /// Currently the only update-able fields are `description`,
  /// `requestLoggingConfig`, `autoScaling.minNodes`, and `manualScaling.nodes`.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the model.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+/versions/[^/]+$".
  ///
  /// [updateMask] - Required. Specifies the path, relative to `Version`, of the
  /// field to
  /// update. Must be present and non-empty.
  ///
  /// For example, to change the description of a version to "foo", the
  /// `update_mask` parameter would be specified as `description`, and the
  /// `PATCH` request body would specify the new value, as follows:
  ///
  /// ```
  /// {
  ///   "description": "foo"
  /// }
  /// ```
  ///
  /// Currently the only supported update mask fields are `description`,
  /// `requestLoggingConfig`, `autoScaling.minNodes`, and `manualScaling.nodes`.
  /// However, you can only update `manualScaling.nodes` if the version uses a
  /// [Compute Engine (N1)
  /// machine type](/ml-engine/docs/machine-types-online-prediction).
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleLongrunningOperation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningOperation> patch(
      GoogleCloudMlV1Version request, core.String name,
      {core.String updateMask, core.String $fields}) {
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
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleLongrunningOperation.fromJson(data));
  }

  /// Designates a version to be the default for the model.
  ///
  /// The default version is used for prediction requests made against the model
  /// that don't specify a version.
  ///
  /// The first version to be created for a model is automatically set as the
  /// default. You must make any subsequent changes to the default version
  /// setting manually using this method.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the version to make the default for the
  /// model. You
  /// can get the names of all the versions of a model by calling
  /// projects.models.versions.list.
  /// Value must have pattern "^projects/[^/]+/models/[^/]+/versions/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleCloudMlV1Version].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudMlV1Version> setDefault(
      GoogleCloudMlV1SetDefaultVersionRequest request, core.String name,
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

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':setDefault';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleCloudMlV1Version.fromJson(data));
  }
}

class ProjectsOperationsResourceApi {
  final commons.ApiRequester _requester;

  ProjectsOperationsResourceApi(commons.ApiRequester client)
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
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource to be cancelled.
  /// Value must have pattern "^projects/[^/]+/operations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleProtobufEmpty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleProtobufEmpty> cancel(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':cancel';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new GoogleProtobufEmpty.fromJson(data));
  }

  /// Gets the latest state of a long-running operation.  Clients can use this
  /// method to poll the operation result at intervals as recommended by the API
  /// service.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource.
  /// Value must have pattern "^projects/[^/]+/operations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleLongrunningOperation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningOperation> get(core.String name,
      {core.String $fields}) {
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

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new GoogleLongrunningOperation.fromJson(data));
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
  /// Completes with a [GoogleLongrunningListOperationsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleLongrunningListOperationsResponse> list(core.String name,
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
        'v1/' + commons.Escaper.ecapeVariableReserved('$name') + '/operations';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new GoogleLongrunningListOperationsResponse.fromJson(data));
  }
}

/// Message that represents an arbitrary HTTP body. It should only be used for
/// payload formats that can't be represented as JSON, such as raw binary or
/// an HTML page.
///
///
/// This message can be used both in streaming and non-streaming API methods in
/// the request as well as the response.
///
/// It can be used as a top-level request field, which is convenient if one
/// wants to extract parameters from either the URL or HTTP template into the
/// request fields and also want access to the raw HTTP body.
///
/// Example:
///
///     message GetResourceRequest {
///       // A unique request id.
///       string request_id = 1;
///
///       // The raw HTTP body is bound to this field.
///       google.api.HttpBody http_body = 2;
///     }
///
///     service ResourceService {
///       rpc GetResource(GetResourceRequest) returns (google.api.HttpBody);
///       rpc UpdateResource(google.api.HttpBody) returns
///       (google.protobuf.Empty);
///     }
///
/// Example with streaming methods:
///
///     service CaldavService {
///       rpc GetCalendar(stream google.api.HttpBody)
///         returns (stream google.api.HttpBody);
///       rpc UpdateCalendar(stream google.api.HttpBody)
///         returns (stream google.api.HttpBody);
///     }
///
/// Use of this type only changes how the request and response bodies are
/// handled, all other features will continue to work unchanged.
class GoogleApiHttpBody {
  /// The HTTP Content-Type header value specifying the content type of the
  /// body.
  core.String contentType;

  /// The HTTP request/response body as raw binary.
  core.String data;
  core.List<core.int> get dataAsBytes {
    return convert.base64.decode(data);
  }

  set dataAsBytes(core.List<core.int> _bytes) {
    data =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  /// Application specific response metadata. Must be set in the first response
  /// for streaming APIs.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.List<core.Map<core.String, core.Object>> extensions;

  GoogleApiHttpBody();

  GoogleApiHttpBody.fromJson(core.Map _json) {
    if (_json.containsKey("contentType")) {
      contentType = _json["contentType"];
    }
    if (_json.containsKey("data")) {
      data = _json["data"];
    }
    if (_json.containsKey("extensions")) {
      extensions = (_json["extensions"] as core.List)
          .map<core.Map<core.String, core.Object>>(
              (value) => (value as core.Map).cast<core.String, core.Object>())
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (contentType != null) {
      _json["contentType"] = contentType;
    }
    if (data != null) {
      _json["data"] = data;
    }
    if (extensions != null) {
      _json["extensions"] = extensions;
    }
    return _json;
  }
}

class GoogleCloudMlV1AutomatedStoppingConfigDecayCurveAutomatedStoppingConfig {
  /// If true, measurement.elapsed_time is used as the x-axis of each
  /// Trials Decay Curve. Otherwise, Measurement.steps will be used as the
  /// x-axis.
  core.bool useElapsedTime;

  GoogleCloudMlV1AutomatedStoppingConfigDecayCurveAutomatedStoppingConfig();

  GoogleCloudMlV1AutomatedStoppingConfigDecayCurveAutomatedStoppingConfig.fromJson(
      core.Map _json) {
    if (_json.containsKey("useElapsedTime")) {
      useElapsedTime = _json["useElapsedTime"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (useElapsedTime != null) {
      _json["useElapsedTime"] = useElapsedTime;
    }
    return _json;
  }
}

/// The median automated stopping rule stops a pending trial if the trial's
/// best objective_value is strictly below the median 'performance' of all
/// completed trials reported up to the trial's last measurement.
/// Currently, 'performance' refers to the running average of the objective
/// values reported by the trial in each measurement.
class GoogleCloudMlV1AutomatedStoppingConfigMedianAutomatedStoppingConfig {
  /// If true, the median automated stopping rule applies to
  /// measurement.use_elapsed_time, which means the elapsed_time field of
  /// the current trial's
  /// latest measurement is used to compute the median objective
  /// value for each completed trial.
  core.bool useElapsedTime;

  GoogleCloudMlV1AutomatedStoppingConfigMedianAutomatedStoppingConfig();

  GoogleCloudMlV1AutomatedStoppingConfigMedianAutomatedStoppingConfig.fromJson(
      core.Map _json) {
    if (_json.containsKey("useElapsedTime")) {
      useElapsedTime = _json["useElapsedTime"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (useElapsedTime != null) {
      _json["useElapsedTime"] = useElapsedTime;
    }
    return _json;
  }
}

/// An observed value of a metric.
class GoogleCloudMlV1HyperparameterOutputHyperparameterMetric {
  /// The objective value at this training step.
  core.double objectiveValue;

  /// The global training step for this metric.
  core.String trainingStep;

  GoogleCloudMlV1HyperparameterOutputHyperparameterMetric();

  GoogleCloudMlV1HyperparameterOutputHyperparameterMetric.fromJson(
      core.Map _json) {
    if (_json.containsKey("objectiveValue")) {
      objectiveValue = _json["objectiveValue"].toDouble();
    }
    if (_json.containsKey("trainingStep")) {
      trainingStep = _json["trainingStep"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (objectiveValue != null) {
      _json["objectiveValue"] = objectiveValue;
    }
    if (trainingStep != null) {
      _json["trainingStep"] = trainingStep;
    }
    return _json;
  }
}

/// A message representing a metric in the measurement.
class GoogleCloudMlV1MeasurementMetric {
  /// Required. Metric name.
  core.String metric;

  /// Required. The value for this metric.
  core.double value;

  GoogleCloudMlV1MeasurementMetric();

  GoogleCloudMlV1MeasurementMetric.fromJson(core.Map _json) {
    if (_json.containsKey("metric")) {
      metric = _json["metric"];
    }
    if (_json.containsKey("value")) {
      value = _json["value"].toDouble();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (metric != null) {
      _json["metric"] = metric;
    }
    if (value != null) {
      _json["value"] = value;
    }
    return _json;
  }
}

class GoogleCloudMlV1StudyConfigParameterSpecCategoricalValueSpec {
  /// Must be specified if type is `CATEGORICAL`.
  /// The list of possible categories.
  core.List<core.String> values;

  GoogleCloudMlV1StudyConfigParameterSpecCategoricalValueSpec();

  GoogleCloudMlV1StudyConfigParameterSpecCategoricalValueSpec.fromJson(
      core.Map _json) {
    if (_json.containsKey("values")) {
      values = (_json["values"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (values != null) {
      _json["values"] = values;
    }
    return _json;
  }
}

class GoogleCloudMlV1StudyConfigParameterSpecDiscreteValueSpec {
  /// Must be specified if type is `DISCRETE`.
  /// A list of feasible points.
  /// The list should be in strictly increasing order. For instance, this
  /// parameter might have possible settings of 1.5, 2.5, and 4.0. This list
  /// should not contain more than 1,000 values.
  core.List<core.double> values;

  GoogleCloudMlV1StudyConfigParameterSpecDiscreteValueSpec();

  GoogleCloudMlV1StudyConfigParameterSpecDiscreteValueSpec.fromJson(
      core.Map _json) {
    if (_json.containsKey("values")) {
      values = (_json["values"] as core.List)
          .map<core.double>((value) => value.toDouble())
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (values != null) {
      _json["values"] = values;
    }
    return _json;
  }
}

class GoogleCloudMlV1StudyConfigParameterSpecDoubleValueSpec {
  /// Must be specified if type is `DOUBLE`. Maximum value of the parameter.
  core.double maxValue;

  /// Must be specified if type is `DOUBLE`. Minimum value of the parameter.
  core.double minValue;

  GoogleCloudMlV1StudyConfigParameterSpecDoubleValueSpec();

  GoogleCloudMlV1StudyConfigParameterSpecDoubleValueSpec.fromJson(
      core.Map _json) {
    if (_json.containsKey("maxValue")) {
      maxValue = _json["maxValue"].toDouble();
    }
    if (_json.containsKey("minValue")) {
      minValue = _json["minValue"].toDouble();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (maxValue != null) {
      _json["maxValue"] = maxValue;
    }
    if (minValue != null) {
      _json["minValue"] = minValue;
    }
    return _json;
  }
}

class GoogleCloudMlV1StudyConfigParameterSpecIntegerValueSpec {
  /// Must be specified if type is `INTEGER`. Maximum value of the parameter.
  core.String maxValue;

  /// Must be specified if type is `INTEGER`. Minimum value of the parameter.
  core.String minValue;

  GoogleCloudMlV1StudyConfigParameterSpecIntegerValueSpec();

  GoogleCloudMlV1StudyConfigParameterSpecIntegerValueSpec.fromJson(
      core.Map _json) {
    if (_json.containsKey("maxValue")) {
      maxValue = _json["maxValue"];
    }
    if (_json.containsKey("minValue")) {
      minValue = _json["minValue"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (maxValue != null) {
      _json["maxValue"] = maxValue;
    }
    if (minValue != null) {
      _json["minValue"] = minValue;
    }
    return _json;
  }
}

/// Represents the spec to match categorical values from parent parameter.
class GoogleCloudMlV1StudyConfigParameterSpecMatchingParentCategoricalValueSpec {
  /// Matches values of the parent parameter with type 'CATEGORICAL'.
  /// All values must exist in `categorical_value_spec` of parent parameter.
  core.List<core.String> values;

  GoogleCloudMlV1StudyConfigParameterSpecMatchingParentCategoricalValueSpec();

  GoogleCloudMlV1StudyConfigParameterSpecMatchingParentCategoricalValueSpec.fromJson(
      core.Map _json) {
    if (_json.containsKey("values")) {
      values = (_json["values"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (values != null) {
      _json["values"] = values;
    }
    return _json;
  }
}

/// Represents the spec to match discrete values from parent parameter.
class GoogleCloudMlV1StudyConfigParameterSpecMatchingParentDiscreteValueSpec {
  /// Matches values of the parent parameter with type 'DISCRETE'.
  /// All values must exist in `discrete_value_spec` of parent parameter.
  core.List<core.double> values;

  GoogleCloudMlV1StudyConfigParameterSpecMatchingParentDiscreteValueSpec();

  GoogleCloudMlV1StudyConfigParameterSpecMatchingParentDiscreteValueSpec.fromJson(
      core.Map _json) {
    if (_json.containsKey("values")) {
      values = (_json["values"] as core.List)
          .map<core.double>((value) => value.toDouble())
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (values != null) {
      _json["values"] = values;
    }
    return _json;
  }
}

/// Represents the spec to match integer values from parent parameter.
class GoogleCloudMlV1StudyConfigParameterSpecMatchingParentIntValueSpec {
  /// Matches values of the parent parameter with type 'INTEGER'.
  /// All values must lie in `integer_value_spec` of parent parameter.
  core.List<core.String> values;

  GoogleCloudMlV1StudyConfigParameterSpecMatchingParentIntValueSpec();

  GoogleCloudMlV1StudyConfigParameterSpecMatchingParentIntValueSpec.fromJson(
      core.Map _json) {
    if (_json.containsKey("values")) {
      values = (_json["values"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (values != null) {
      _json["values"] = values;
    }
    return _json;
  }
}

/// Represents a metric to optimize.
class GoogleCloudMlV1StudyConfigMetricSpec {
  /// Required. The optimization goal of the metric.
  /// Possible string values are:
  /// - "GOAL_TYPE_UNSPECIFIED" : Goal Type will default to maximize.
  /// - "MAXIMIZE" : Maximize the goal metric.
  /// - "MINIMIZE" : Minimize the goal metric.
  core.String goal;

  /// Required. The name of the metric.
  core.String metric;

  GoogleCloudMlV1StudyConfigMetricSpec();

  GoogleCloudMlV1StudyConfigMetricSpec.fromJson(core.Map _json) {
    if (_json.containsKey("goal")) {
      goal = _json["goal"];
    }
    if (_json.containsKey("metric")) {
      metric = _json["metric"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (goal != null) {
      _json["goal"] = goal;
    }
    if (metric != null) {
      _json["metric"] = metric;
    }
    return _json;
  }
}

/// Represents a single parameter to optimize.
class GoogleCloudMlV1StudyConfigParameterSpec {
  /// The value spec for a 'CATEGORICAL' parameter.
  GoogleCloudMlV1StudyConfigParameterSpecCategoricalValueSpec
      categoricalValueSpec;

  /// A child node is active if the parameter's value matches the child node's
  /// matching_parent_values.
  ///
  /// If two items in child_parameter_specs have the same name, they must have
  /// disjoint matching_parent_values.
  core.List<GoogleCloudMlV1StudyConfigParameterSpec> childParameterSpecs;

  /// The value spec for a 'DISCRETE' parameter.
  GoogleCloudMlV1StudyConfigParameterSpecDiscreteValueSpec discreteValueSpec;

  /// The value spec for a 'DOUBLE' parameter.
  GoogleCloudMlV1StudyConfigParameterSpecDoubleValueSpec doubleValueSpec;

  /// The value spec for an 'INTEGER' parameter.
  GoogleCloudMlV1StudyConfigParameterSpecIntegerValueSpec integerValueSpec;

  /// Required. The parameter name must be unique amongst all ParameterSpecs.
  core.String parameter;
  GoogleCloudMlV1StudyConfigParameterSpecMatchingParentCategoricalValueSpec
      parentCategoricalValues;
  GoogleCloudMlV1StudyConfigParameterSpecMatchingParentDiscreteValueSpec
      parentDiscreteValues;
  GoogleCloudMlV1StudyConfigParameterSpecMatchingParentIntValueSpec
      parentIntValues;

  /// How the parameter should be scaled.
  /// Leave unset for categorical parameters.
  /// Possible string values are:
  /// - "SCALE_TYPE_UNSPECIFIED" : By default, no scaling is applied.
  /// - "UNIT_LINEAR_SCALE" : Scales the feasible space to (0, 1) linearly.
  /// - "UNIT_LOG_SCALE" : Scales the feasible space logarithmically to (0, 1).
  /// The entire
  /// feasible space must be strictly positive.
  /// - "UNIT_REVERSE_LOG_SCALE" : Scales the feasible space "reverse"
  /// logarithmically to (0, 1). The
  /// result is that values close to the top of the feasible space are spread
  /// out more than points near the bottom. The entire feasible space must be
  /// strictly positive.
  core.String scaleType;

  /// Required. The type of the parameter.
  /// Possible string values are:
  /// - "PARAMETER_TYPE_UNSPECIFIED" : You must specify a valid type. Using this
  /// unspecified type will result
  /// in an error.
  /// - "DOUBLE" : Type for real-valued parameters.
  /// - "INTEGER" : Type for integral parameters.
  /// - "CATEGORICAL" : The parameter is categorical, with a value chosen from
  /// the categories
  /// field.
  /// - "DISCRETE" : The parameter is real valued, with a fixed set of feasible
  /// points. If
  /// `type==DISCRETE`, feasible_points must be provided, and
  /// {`min_value`, `max_value`} will be ignored.
  core.String type;

  GoogleCloudMlV1StudyConfigParameterSpec();

  GoogleCloudMlV1StudyConfigParameterSpec.fromJson(core.Map _json) {
    if (_json.containsKey("categoricalValueSpec")) {
      categoricalValueSpec =
          new GoogleCloudMlV1StudyConfigParameterSpecCategoricalValueSpec
              .fromJson(_json["categoricalValueSpec"]);
    }
    if (_json.containsKey("childParameterSpecs")) {
      childParameterSpecs = (_json["childParameterSpecs"] as core.List)
          .map<GoogleCloudMlV1StudyConfigParameterSpec>((value) =>
              new GoogleCloudMlV1StudyConfigParameterSpec.fromJson(value))
          .toList();
    }
    if (_json.containsKey("discreteValueSpec")) {
      discreteValueSpec =
          new GoogleCloudMlV1StudyConfigParameterSpecDiscreteValueSpec.fromJson(
              _json["discreteValueSpec"]);
    }
    if (_json.containsKey("doubleValueSpec")) {
      doubleValueSpec =
          new GoogleCloudMlV1StudyConfigParameterSpecDoubleValueSpec.fromJson(
              _json["doubleValueSpec"]);
    }
    if (_json.containsKey("integerValueSpec")) {
      integerValueSpec =
          new GoogleCloudMlV1StudyConfigParameterSpecIntegerValueSpec.fromJson(
              _json["integerValueSpec"]);
    }
    if (_json.containsKey("parameter")) {
      parameter = _json["parameter"];
    }
    if (_json.containsKey("parentCategoricalValues")) {
      parentCategoricalValues =
          new GoogleCloudMlV1StudyConfigParameterSpecMatchingParentCategoricalValueSpec
              .fromJson(_json["parentCategoricalValues"]);
    }
    if (_json.containsKey("parentDiscreteValues")) {
      parentDiscreteValues =
          new GoogleCloudMlV1StudyConfigParameterSpecMatchingParentDiscreteValueSpec
              .fromJson(_json["parentDiscreteValues"]);
    }
    if (_json.containsKey("parentIntValues")) {
      parentIntValues =
          new GoogleCloudMlV1StudyConfigParameterSpecMatchingParentIntValueSpec
              .fromJson(_json["parentIntValues"]);
    }
    if (_json.containsKey("scaleType")) {
      scaleType = _json["scaleType"];
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (categoricalValueSpec != null) {
      _json["categoricalValueSpec"] = (categoricalValueSpec).toJson();
    }
    if (childParameterSpecs != null) {
      _json["childParameterSpecs"] =
          childParameterSpecs.map((value) => (value).toJson()).toList();
    }
    if (discreteValueSpec != null) {
      _json["discreteValueSpec"] = (discreteValueSpec).toJson();
    }
    if (doubleValueSpec != null) {
      _json["doubleValueSpec"] = (doubleValueSpec).toJson();
    }
    if (integerValueSpec != null) {
      _json["integerValueSpec"] = (integerValueSpec).toJson();
    }
    if (parameter != null) {
      _json["parameter"] = parameter;
    }
    if (parentCategoricalValues != null) {
      _json["parentCategoricalValues"] = (parentCategoricalValues).toJson();
    }
    if (parentDiscreteValues != null) {
      _json["parentDiscreteValues"] = (parentDiscreteValues).toJson();
    }
    if (parentIntValues != null) {
      _json["parentIntValues"] = (parentIntValues).toJson();
    }
    if (scaleType != null) {
      _json["scaleType"] = scaleType;
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

/// A message representing a parameter to be tuned. Contains the name of
/// the parameter and the suggested value to use for this trial.
class GoogleCloudMlV1TrialParameter {
  /// Must be set if ParameterType is DOUBLE or DISCRETE.
  core.double floatValue;

  /// Must be set if ParameterType is INTEGER
  core.String intValue;

  /// The name of the parameter.
  core.String parameter;

  /// Must be set if ParameterTypeis CATEGORICAL
  core.String stringValue;

  GoogleCloudMlV1TrialParameter();

  GoogleCloudMlV1TrialParameter.fromJson(core.Map _json) {
    if (_json.containsKey("floatValue")) {
      floatValue = _json["floatValue"].toDouble();
    }
    if (_json.containsKey("intValue")) {
      intValue = _json["intValue"];
    }
    if (_json.containsKey("parameter")) {
      parameter = _json["parameter"];
    }
    if (_json.containsKey("stringValue")) {
      stringValue = _json["stringValue"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (floatValue != null) {
      _json["floatValue"] = floatValue;
    }
    if (intValue != null) {
      _json["intValue"] = intValue;
    }
    if (parameter != null) {
      _json["parameter"] = parameter;
    }
    if (stringValue != null) {
      _json["stringValue"] = stringValue;
    }
    return _json;
  }
}

/// Represents a hardware accelerator request config.
/// Note that the AcceleratorConfig can be used in both Jobs and Versions.
/// Learn more about [accelerators for training](/ml-engine/docs/using-gpus) and
/// [accelerators for online
/// prediction](/ml-engine/docs/machine-types-online-prediction#gpus).
class GoogleCloudMlV1AcceleratorConfig {
  /// The number of accelerators to attach to each machine running the job.
  core.String count;

  /// The type of accelerator to use.
  /// Possible string values are:
  /// - "ACCELERATOR_TYPE_UNSPECIFIED" : Unspecified accelerator type. Default
  /// to no GPU.
  /// - "NVIDIA_TESLA_K80" : Nvidia Tesla K80 GPU.
  /// - "NVIDIA_TESLA_P100" : Nvidia Tesla P100 GPU.
  /// - "NVIDIA_TESLA_V100" : Nvidia Tesla V100 GPU.
  /// - "NVIDIA_TESLA_P4" : Nvidia Tesla P4 GPU.
  /// - "NVIDIA_TESLA_T4" : Nvidia Tesla T4 GPU.
  /// - "TPU_V2" : TPU v2.
  /// - "TPU_V3" : TPU v3.
  core.String type;

  GoogleCloudMlV1AcceleratorConfig();

  GoogleCloudMlV1AcceleratorConfig.fromJson(core.Map _json) {
    if (_json.containsKey("count")) {
      count = _json["count"];
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (count != null) {
      _json["count"] = count;
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

/// The request message for the AddTrialMeasurement service method.
class GoogleCloudMlV1AddTrialMeasurementRequest {
  /// Required. The measurement to be added to a trial.
  GoogleCloudMlV1Measurement measurement;

  GoogleCloudMlV1AddTrialMeasurementRequest();

  GoogleCloudMlV1AddTrialMeasurementRequest.fromJson(core.Map _json) {
    if (_json.containsKey("measurement")) {
      measurement =
          new GoogleCloudMlV1Measurement.fromJson(_json["measurement"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (measurement != null) {
      _json["measurement"] = (measurement).toJson();
    }
    return _json;
  }
}

/// Options for automatically scaling a model.
class GoogleCloudMlV1AutoScaling {
  /// Optional. The minimum number of nodes to allocate for this model. These
  /// nodes are always up, starting from the time the model is deployed.
  /// Therefore, the cost of operating this model will be at least
  /// `rate` * `min_nodes` * number of hours since last billing cycle,
  /// where `rate` is the cost per node-hour as documented in the
  /// [pricing guide](/ml-engine/docs/pricing),
  /// even if no predictions are performed. There is additional cost for each
  /// prediction performed.
  ///
  /// Unlike manual scaling, if the load gets too heavy for the nodes
  /// that are up, the service will automatically add nodes to handle the
  /// increased load as well as scale back as traffic drops, always maintaining
  /// at least `min_nodes`. You will be charged for the time in which additional
  /// nodes are used.
  ///
  /// If `min_nodes` is not specified and AutoScaling is used with a [legacy
  /// (MLS1) machine type](/ml-engine/docs/machine-types-online-prediction),
  /// `min_nodes` defaults to 0, in which case, when traffic to a model stops
  /// (and after a cool-down period), nodes will be shut down and no charges
  /// will
  /// be incurred until traffic to the model resumes.
  ///
  /// If `min_nodes` is not specified and AutoScaling is used with a [Compute
  /// Engine (N1) machine
  /// type](/ml-engine/docs/machine-types-online-prediction),
  /// `min_nodes` defaults to 1. `min_nodes` must be at least 1 for use with a
  /// Compute Engine machine type.
  ///
  /// Note that you cannot use AutoScaling if your version uses
  /// [GPUs](#Version.FIELDS.accelerator_config). Instead, you must use
  /// ManualScaling.
  ///
  /// You can set `min_nodes` when creating the model version, and you can also
  /// update `min_nodes` for an existing version:
  /// <pre>
  /// update_body.json:
  /// {
  ///   'autoScaling': {
  ///     'minNodes': 5
  ///   }
  /// }
  /// </pre>
  /// HTTP request:
  /// <pre style="max-width: 626px;">
  /// PATCH
  /// https://ml.googleapis.com/v1/{name=projects / * /models / * /versions / *
  /// }?update_mask=autoScaling.minNodes
  /// -d @./update_body.json
  /// </pre>
  core.int minNodes;

  GoogleCloudMlV1AutoScaling();

  GoogleCloudMlV1AutoScaling.fromJson(core.Map _json) {
    if (_json.containsKey("minNodes")) {
      minNodes = _json["minNodes"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (minNodes != null) {
      _json["minNodes"] = minNodes;
    }
    return _json;
  }
}

/// Configuration for Automated Early Stopping of Trials. If no
/// implementation_config is set, automated early stopping will not be run.
class GoogleCloudMlV1AutomatedStoppingConfig {
  GoogleCloudMlV1AutomatedStoppingConfigDecayCurveAutomatedStoppingConfig
      decayCurveStoppingConfig;
  GoogleCloudMlV1AutomatedStoppingConfigMedianAutomatedStoppingConfig
      medianAutomatedStoppingConfig;

  GoogleCloudMlV1AutomatedStoppingConfig();

  GoogleCloudMlV1AutomatedStoppingConfig.fromJson(core.Map _json) {
    if (_json.containsKey("decayCurveStoppingConfig")) {
      decayCurveStoppingConfig =
          new GoogleCloudMlV1AutomatedStoppingConfigDecayCurveAutomatedStoppingConfig
              .fromJson(_json["decayCurveStoppingConfig"]);
    }
    if (_json.containsKey("medianAutomatedStoppingConfig")) {
      medianAutomatedStoppingConfig =
          new GoogleCloudMlV1AutomatedStoppingConfigMedianAutomatedStoppingConfig
              .fromJson(_json["medianAutomatedStoppingConfig"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (decayCurveStoppingConfig != null) {
      _json["decayCurveStoppingConfig"] = (decayCurveStoppingConfig).toJson();
    }
    if (medianAutomatedStoppingConfig != null) {
      _json["medianAutomatedStoppingConfig"] =
          (medianAutomatedStoppingConfig).toJson();
    }
    return _json;
  }
}

/// Represents output related to a built-in algorithm Job.
class GoogleCloudMlV1BuiltInAlgorithmOutput {
  /// Framework on which the built-in algorithm was trained.
  core.String framework;

  /// The Cloud Storage path to the `model/` directory where the training job
  /// saves the trained model. Only set for successful jobs that don't use
  /// hyperparameter tuning.
  core.String modelPath;

  /// Python version on which the built-in algorithm was trained.
  core.String pythonVersion;

  /// AI Platform runtime version on which the built-in algorithm was
  /// trained.
  core.String runtimeVersion;

  GoogleCloudMlV1BuiltInAlgorithmOutput();

  GoogleCloudMlV1BuiltInAlgorithmOutput.fromJson(core.Map _json) {
    if (_json.containsKey("framework")) {
      framework = _json["framework"];
    }
    if (_json.containsKey("modelPath")) {
      modelPath = _json["modelPath"];
    }
    if (_json.containsKey("pythonVersion")) {
      pythonVersion = _json["pythonVersion"];
    }
    if (_json.containsKey("runtimeVersion")) {
      runtimeVersion = _json["runtimeVersion"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (framework != null) {
      _json["framework"] = framework;
    }
    if (modelPath != null) {
      _json["modelPath"] = modelPath;
    }
    if (pythonVersion != null) {
      _json["pythonVersion"] = pythonVersion;
    }
    if (runtimeVersion != null) {
      _json["runtimeVersion"] = runtimeVersion;
    }
    return _json;
  }
}

/// Request message for the CancelJob method.
class GoogleCloudMlV1CancelJobRequest {
  GoogleCloudMlV1CancelJobRequest();

  GoogleCloudMlV1CancelJobRequest.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

class GoogleCloudMlV1Capability {
  /// Available accelerators for the capability.
  core.List<core.String> availableAccelerators;

  ///
  /// Possible string values are:
  /// - "TYPE_UNSPECIFIED"
  /// - "TRAINING"
  /// - "BATCH_PREDICTION"
  /// - "ONLINE_PREDICTION"
  core.String type;

  GoogleCloudMlV1Capability();

  GoogleCloudMlV1Capability.fromJson(core.Map _json) {
    if (_json.containsKey("availableAccelerators")) {
      availableAccelerators =
          (_json["availableAccelerators"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (availableAccelerators != null) {
      _json["availableAccelerators"] = availableAccelerators;
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

/// This message will be placed in the metadata field of a
/// google.longrunning.Operation associated with a CheckTrialEarlyStoppingState
/// request.
class GoogleCloudMlV1CheckTrialEarlyStoppingStateMetatdata {
  /// The time at which the operation was submitted.
  core.String createTime;

  /// The name of the study that the trial belongs to.
  core.String study;

  /// The trial name.
  core.String trial;

  GoogleCloudMlV1CheckTrialEarlyStoppingStateMetatdata();

  GoogleCloudMlV1CheckTrialEarlyStoppingStateMetatdata.fromJson(
      core.Map _json) {
    if (_json.containsKey("createTime")) {
      createTime = _json["createTime"];
    }
    if (_json.containsKey("study")) {
      study = _json["study"];
    }
    if (_json.containsKey("trial")) {
      trial = _json["trial"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (createTime != null) {
      _json["createTime"] = createTime;
    }
    if (study != null) {
      _json["study"] = study;
    }
    if (trial != null) {
      _json["trial"] = trial;
    }
    return _json;
  }
}

/// The request message for the CheckTrialEarlyStoppingState service method.
class GoogleCloudMlV1CheckTrialEarlyStoppingStateRequest {
  GoogleCloudMlV1CheckTrialEarlyStoppingStateRequest();

  GoogleCloudMlV1CheckTrialEarlyStoppingStateRequest.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// The message will be placed in the response field of a completed
/// google.longrunning.Operation associated with a CheckTrialEarlyStoppingState
/// request.
class GoogleCloudMlV1CheckTrialEarlyStoppingStateResponse {
  /// The time at which operation processing completed.
  core.String endTime;

  /// True if the Trial should stop.
  core.bool shouldStop;

  /// The time at which the operation was started.
  core.String startTime;

  GoogleCloudMlV1CheckTrialEarlyStoppingStateResponse();

  GoogleCloudMlV1CheckTrialEarlyStoppingStateResponse.fromJson(core.Map _json) {
    if (_json.containsKey("endTime")) {
      endTime = _json["endTime"];
    }
    if (_json.containsKey("shouldStop")) {
      shouldStop = _json["shouldStop"];
    }
    if (_json.containsKey("startTime")) {
      startTime = _json["startTime"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (endTime != null) {
      _json["endTime"] = endTime;
    }
    if (shouldStop != null) {
      _json["shouldStop"] = shouldStop;
    }
    if (startTime != null) {
      _json["startTime"] = startTime;
    }
    return _json;
  }
}

/// The request message for the CompleteTrial service method.
class GoogleCloudMlV1CompleteTrialRequest {
  /// Optional. If provided, it will be used as the completed trial's
  /// final_measurement; Otherwise, the service will auto-select a
  /// previously reported measurement as the final-measurement
  GoogleCloudMlV1Measurement finalMeasurement;

  /// Optional. A human readable reason why the trial was infeasible. This
  /// should
  /// only be provided if `trial_infeasible` is true.
  core.String infeasibleReason;

  /// Optional. True if the trial cannot be run with the given Parameter, and
  /// final_measurement will be ignored.
  core.bool trialInfeasible;

  GoogleCloudMlV1CompleteTrialRequest();

  GoogleCloudMlV1CompleteTrialRequest.fromJson(core.Map _json) {
    if (_json.containsKey("finalMeasurement")) {
      finalMeasurement =
          new GoogleCloudMlV1Measurement.fromJson(_json["finalMeasurement"]);
    }
    if (_json.containsKey("infeasibleReason")) {
      infeasibleReason = _json["infeasibleReason"];
    }
    if (_json.containsKey("trialInfeasible")) {
      trialInfeasible = _json["trialInfeasible"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (finalMeasurement != null) {
      _json["finalMeasurement"] = (finalMeasurement).toJson();
    }
    if (infeasibleReason != null) {
      _json["infeasibleReason"] = infeasibleReason;
    }
    if (trialInfeasible != null) {
      _json["trialInfeasible"] = trialInfeasible;
    }
    return _json;
  }
}

class GoogleCloudMlV1Config {
  /// The service account Cloud ML uses to run on TPU node.
  core.String tpuServiceAccount;

  GoogleCloudMlV1Config();

  GoogleCloudMlV1Config.fromJson(core.Map _json) {
    if (_json.containsKey("tpuServiceAccount")) {
      tpuServiceAccount = _json["tpuServiceAccount"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (tpuServiceAccount != null) {
      _json["tpuServiceAccount"] = tpuServiceAccount;
    }
    return _json;
  }
}

/// Represents a custom encryption key configuration that can be applied to
/// a resource.
class GoogleCloudMlV1EncryptionConfig {
  /// The Cloud KMS resource identifier of the customer-managed encryption key
  /// used to protect a resource, such as a training job. It has the following
  /// format:
  /// `projects/{PROJECT_ID}/locations/{REGION}/keyRings/{KEY_RING_NAME}/cryptoKeys/{KEY_NAME}`
  core.String kmsKeyName;

  GoogleCloudMlV1EncryptionConfig();

  GoogleCloudMlV1EncryptionConfig.fromJson(core.Map _json) {
    if (_json.containsKey("kmsKeyName")) {
      kmsKeyName = _json["kmsKeyName"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (kmsKeyName != null) {
      _json["kmsKeyName"] = kmsKeyName;
    }
    return _json;
  }
}

/// Request for explanations to be issued against a trained model.
class GoogleCloudMlV1ExplainRequest {
  /// Required.
  /// The explanation request body.
  GoogleApiHttpBody httpBody;

  GoogleCloudMlV1ExplainRequest();

  GoogleCloudMlV1ExplainRequest.fromJson(core.Map _json) {
    if (_json.containsKey("httpBody")) {
      httpBody = new GoogleApiHttpBody.fromJson(_json["httpBody"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (httpBody != null) {
      _json["httpBody"] = (httpBody).toJson();
    }
    return _json;
  }
}

/// Message holding configuration options for explaining model predictions.
/// There are two feature attribution methods supported for TensorFlow models:
/// integrated gradients and sampled Shapley.
/// [Learn more about feature
/// attributions.](/ml-engine/docs/ai-explanations/overview)
class GoogleCloudMlV1ExplanationConfig {
  /// Attributes credit by computing the Aumann-Shapley value taking advantage
  /// of the model's fully differentiable structure. Refer to this paper for
  /// more details: http://proceedings.mlr.press/v70/sundararajan17a.html
  GoogleCloudMlV1IntegratedGradientsAttribution integratedGradientsAttribution;

  /// An attribution method that approximates Shapley values for features that
  /// contribute to the label being predicted. A sampling strategy is used to
  /// approximate the value rather than considering all subsets of features.
  GoogleCloudMlV1SampledShapleyAttribution sampledShapleyAttribution;

  /// Attributes credit by computing the XRAI taking advantage
  /// of the model's fully differentiable structure. Refer to this paper for
  /// more details: https://arxiv.org/abs/1906.02825
  /// Currently only implemented for models with natural image inputs.
  GoogleCloudMlV1XraiAttribution xraiAttribution;

  GoogleCloudMlV1ExplanationConfig();

  GoogleCloudMlV1ExplanationConfig.fromJson(core.Map _json) {
    if (_json.containsKey("integratedGradientsAttribution")) {
      integratedGradientsAttribution =
          new GoogleCloudMlV1IntegratedGradientsAttribution.fromJson(
              _json["integratedGradientsAttribution"]);
    }
    if (_json.containsKey("sampledShapleyAttribution")) {
      sampledShapleyAttribution =
          new GoogleCloudMlV1SampledShapleyAttribution.fromJson(
              _json["sampledShapleyAttribution"]);
    }
    if (_json.containsKey("xraiAttribution")) {
      xraiAttribution =
          new GoogleCloudMlV1XraiAttribution.fromJson(_json["xraiAttribution"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (integratedGradientsAttribution != null) {
      _json["integratedGradientsAttribution"] =
          (integratedGradientsAttribution).toJson();
    }
    if (sampledShapleyAttribution != null) {
      _json["sampledShapleyAttribution"] = (sampledShapleyAttribution).toJson();
    }
    if (xraiAttribution != null) {
      _json["xraiAttribution"] = (xraiAttribution).toJson();
    }
    return _json;
  }
}

/// Returns service account information associated with a project.
class GoogleCloudMlV1GetConfigResponse {
  GoogleCloudMlV1Config config;

  /// The service account Cloud ML uses to access resources in the project.
  core.String serviceAccount;

  /// The project number for `service_account`.
  core.String serviceAccountProject;

  GoogleCloudMlV1GetConfigResponse();

  GoogleCloudMlV1GetConfigResponse.fromJson(core.Map _json) {
    if (_json.containsKey("config")) {
      config = new GoogleCloudMlV1Config.fromJson(_json["config"]);
    }
    if (_json.containsKey("serviceAccount")) {
      serviceAccount = _json["serviceAccount"];
    }
    if (_json.containsKey("serviceAccountProject")) {
      serviceAccountProject = _json["serviceAccountProject"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (config != null) {
      _json["config"] = (config).toJson();
    }
    if (serviceAccount != null) {
      _json["serviceAccount"] = serviceAccount;
    }
    if (serviceAccountProject != null) {
      _json["serviceAccountProject"] = serviceAccountProject;
    }
    return _json;
  }
}

/// Represents the result of a single hyperparameter tuning trial from a
/// training job. The TrainingOutput object that is returned on successful
/// completion of a training job with hyperparameter tuning includes a list
/// of HyperparameterOutput objects, one for each successful trial.
class GoogleCloudMlV1HyperparameterOutput {
  /// All recorded object metrics for this trial. This field is not currently
  /// populated.
  core.List<GoogleCloudMlV1HyperparameterOutputHyperparameterMetric> allMetrics;

  /// Details related to built-in algorithms jobs.
  /// Only set for trials of built-in algorithms jobs that have succeeded.
  GoogleCloudMlV1BuiltInAlgorithmOutput builtInAlgorithmOutput;

  /// Output only. End time for the trial.
  core.String endTime;

  /// The final objective metric seen for this trial.
  GoogleCloudMlV1HyperparameterOutputHyperparameterMetric finalMetric;

  /// The hyperparameters given to this trial.
  core.Map<core.String, core.String> hyperparameters;

  /// True if the trial is stopped early.
  core.bool isTrialStoppedEarly;

  /// Output only. Start time for the trial.
  core.String startTime;

  /// Output only. The detailed state of the trial.
  /// Possible string values are:
  /// - "STATE_UNSPECIFIED" : The job state is unspecified.
  /// - "QUEUED" : The job has been just created and processing has not yet
  /// begun.
  /// - "PREPARING" : The service is preparing to run the job.
  /// - "RUNNING" : The job is in progress.
  /// - "SUCCEEDED" : The job completed successfully.
  /// - "FAILED" : The job failed.
  /// `error_message` should contain the details of the failure.
  /// - "CANCELLING" : The job is being cancelled.
  /// `error_message` should describe the reason for the cancellation.
  /// - "CANCELLED" : The job has been cancelled.
  /// `error_message` should describe the reason for the cancellation.
  core.String state;

  /// The trial id for these results.
  core.String trialId;

  GoogleCloudMlV1HyperparameterOutput();

  GoogleCloudMlV1HyperparameterOutput.fromJson(core.Map _json) {
    if (_json.containsKey("allMetrics")) {
      allMetrics = (_json["allMetrics"] as core.List)
          .map<GoogleCloudMlV1HyperparameterOutputHyperparameterMetric>(
              (value) =>
                  new GoogleCloudMlV1HyperparameterOutputHyperparameterMetric
                      .fromJson(value))
          .toList();
    }
    if (_json.containsKey("builtInAlgorithmOutput")) {
      builtInAlgorithmOutput =
          new GoogleCloudMlV1BuiltInAlgorithmOutput.fromJson(
              _json["builtInAlgorithmOutput"]);
    }
    if (_json.containsKey("endTime")) {
      endTime = _json["endTime"];
    }
    if (_json.containsKey("finalMetric")) {
      finalMetric =
          new GoogleCloudMlV1HyperparameterOutputHyperparameterMetric.fromJson(
              _json["finalMetric"]);
    }
    if (_json.containsKey("hyperparameters")) {
      hyperparameters = (_json["hyperparameters"] as core.Map)
          .cast<core.String, core.String>();
    }
    if (_json.containsKey("isTrialStoppedEarly")) {
      isTrialStoppedEarly = _json["isTrialStoppedEarly"];
    }
    if (_json.containsKey("startTime")) {
      startTime = _json["startTime"];
    }
    if (_json.containsKey("state")) {
      state = _json["state"];
    }
    if (_json.containsKey("trialId")) {
      trialId = _json["trialId"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (allMetrics != null) {
      _json["allMetrics"] =
          allMetrics.map((value) => (value).toJson()).toList();
    }
    if (builtInAlgorithmOutput != null) {
      _json["builtInAlgorithmOutput"] = (builtInAlgorithmOutput).toJson();
    }
    if (endTime != null) {
      _json["endTime"] = endTime;
    }
    if (finalMetric != null) {
      _json["finalMetric"] = (finalMetric).toJson();
    }
    if (hyperparameters != null) {
      _json["hyperparameters"] = hyperparameters;
    }
    if (isTrialStoppedEarly != null) {
      _json["isTrialStoppedEarly"] = isTrialStoppedEarly;
    }
    if (startTime != null) {
      _json["startTime"] = startTime;
    }
    if (state != null) {
      _json["state"] = state;
    }
    if (trialId != null) {
      _json["trialId"] = trialId;
    }
    return _json;
  }
}

/// Represents a set of hyperparameters to optimize.
class GoogleCloudMlV1HyperparameterSpec {
  /// Optional. The search algorithm specified for the hyperparameter
  /// tuning job.
  /// Uses the default AI Platform hyperparameter tuning
  /// algorithm if unspecified.
  /// Possible string values are:
  /// - "ALGORITHM_UNSPECIFIED" : The default algorithm used by the
  /// hyperparameter tuning service. This is
  /// a Bayesian optimization algorithm.
  /// - "GRID_SEARCH" : Simple grid search within the feasible space. To use
  /// grid search,
  /// all parameters must be `INTEGER`, `CATEGORICAL`, or `DISCRETE`.
  /// - "RANDOM_SEARCH" : Simple random search within the feasible space.
  core.String algorithm;

  /// Optional. Indicates if the hyperparameter tuning job enables auto trial
  /// early stopping.
  core.bool enableTrialEarlyStopping;

  /// Required. The type of goal to use for tuning. Available types are
  /// `MAXIMIZE` and `MINIMIZE`.
  ///
  /// Defaults to `MAXIMIZE`.
  /// Possible string values are:
  /// - "GOAL_TYPE_UNSPECIFIED" : Goal Type will default to maximize.
  /// - "MAXIMIZE" : Maximize the goal metric.
  /// - "MINIMIZE" : Minimize the goal metric.
  core.String goal;

  /// Optional. The TensorFlow summary tag name to use for optimizing trials.
  /// For
  /// current versions of TensorFlow, this tag name should exactly match what is
  /// shown in TensorBoard, including all scopes.  For versions of TensorFlow
  /// prior to 0.12, this should be only the tag passed to tf.Summary.
  /// By default, "training/hptuning/metric" will be used.
  core.String hyperparameterMetricTag;

  /// Optional. The number of failed trials that need to be seen before failing
  /// the hyperparameter tuning job. You can specify this field to override the
  /// default failing criteria for AI Platform hyperparameter tuning jobs.
  ///
  /// Defaults to zero, which means the service decides when a hyperparameter
  /// job should fail.
  core.int maxFailedTrials;

  /// Optional. The number of training trials to run concurrently.
  /// You can reduce the time it takes to perform hyperparameter tuning by
  /// adding
  /// trials in parallel. However, each trail only benefits from the information
  /// gained in completed trials. That means that a trial does not get access to
  /// the results of trials running at the same time, which could reduce the
  /// quality of the overall optimization.
  ///
  /// Each trial will use the same scale tier and machine types.
  ///
  /// Defaults to one.
  core.int maxParallelTrials;

  /// Optional. How many training trials should be attempted to optimize
  /// the specified hyperparameters.
  ///
  /// Defaults to one.
  core.int maxTrials;

  /// Required. The set of parameters to tune.
  core.List<GoogleCloudMlV1ParameterSpec> params;

  /// Optional. The prior hyperparameter tuning job id that users hope to
  /// continue with. The job id will be used to find the corresponding vizier
  /// study guid and resume the study.
  core.String resumePreviousJobId;

  GoogleCloudMlV1HyperparameterSpec();

  GoogleCloudMlV1HyperparameterSpec.fromJson(core.Map _json) {
    if (_json.containsKey("algorithm")) {
      algorithm = _json["algorithm"];
    }
    if (_json.containsKey("enableTrialEarlyStopping")) {
      enableTrialEarlyStopping = _json["enableTrialEarlyStopping"];
    }
    if (_json.containsKey("goal")) {
      goal = _json["goal"];
    }
    if (_json.containsKey("hyperparameterMetricTag")) {
      hyperparameterMetricTag = _json["hyperparameterMetricTag"];
    }
    if (_json.containsKey("maxFailedTrials")) {
      maxFailedTrials = _json["maxFailedTrials"];
    }
    if (_json.containsKey("maxParallelTrials")) {
      maxParallelTrials = _json["maxParallelTrials"];
    }
    if (_json.containsKey("maxTrials")) {
      maxTrials = _json["maxTrials"];
    }
    if (_json.containsKey("params")) {
      params = (_json["params"] as core.List)
          .map<GoogleCloudMlV1ParameterSpec>(
              (value) => new GoogleCloudMlV1ParameterSpec.fromJson(value))
          .toList();
    }
    if (_json.containsKey("resumePreviousJobId")) {
      resumePreviousJobId = _json["resumePreviousJobId"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (algorithm != null) {
      _json["algorithm"] = algorithm;
    }
    if (enableTrialEarlyStopping != null) {
      _json["enableTrialEarlyStopping"] = enableTrialEarlyStopping;
    }
    if (goal != null) {
      _json["goal"] = goal;
    }
    if (hyperparameterMetricTag != null) {
      _json["hyperparameterMetricTag"] = hyperparameterMetricTag;
    }
    if (maxFailedTrials != null) {
      _json["maxFailedTrials"] = maxFailedTrials;
    }
    if (maxParallelTrials != null) {
      _json["maxParallelTrials"] = maxParallelTrials;
    }
    if (maxTrials != null) {
      _json["maxTrials"] = maxTrials;
    }
    if (params != null) {
      _json["params"] = params.map((value) => (value).toJson()).toList();
    }
    if (resumePreviousJobId != null) {
      _json["resumePreviousJobId"] = resumePreviousJobId;
    }
    return _json;
  }
}

/// Attributes credit by computing the Aumann-Shapley value taking advantage
/// of the model's fully differentiable structure. Refer to this paper for
/// more details: http://proceedings.mlr.press/v70/sundararajan17a.html
class GoogleCloudMlV1IntegratedGradientsAttribution {
  /// Number of steps for approximating the path integral.
  /// A good value to start is 50 and gradually increase until the
  /// sum to diff property is met within the desired error range.
  core.int numIntegralSteps;

  GoogleCloudMlV1IntegratedGradientsAttribution();

  GoogleCloudMlV1IntegratedGradientsAttribution.fromJson(core.Map _json) {
    if (_json.containsKey("numIntegralSteps")) {
      numIntegralSteps = _json["numIntegralSteps"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (numIntegralSteps != null) {
      _json["numIntegralSteps"] = numIntegralSteps;
    }
    return _json;
  }
}

/// Represents a training or prediction job.
class GoogleCloudMlV1Job {
  /// Output only. When the job was created.
  core.String createTime;

  /// Output only. When the job processing was completed.
  core.String endTime;

  /// Output only. The details of a failure or a cancellation.
  core.String errorMessage;

  /// `etag` is used for optimistic concurrency control as a way to help
  /// prevent simultaneous updates of a job from overwriting each other.
  /// It is strongly suggested that systems make use of the `etag` in the
  /// read-modify-write cycle to perform job updates in order to avoid race
  /// conditions: An `etag` is returned in the response to `GetJob`, and
  /// systems are expected to put that etag in the request to `UpdateJob` to
  /// ensure that their change will be applied to the same version of the job.
  core.String etag;
  core.List<core.int> get etagAsBytes {
    return convert.base64.decode(etag);
  }

  set etagAsBytes(core.List<core.int> _bytes) {
    etag =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  /// Required. The user-specified id of the job.
  core.String jobId;

  /// Optional. One or more labels that you can add, to organize your jobs.
  /// Each label is a key-value pair, where both the key and the value are
  /// arbitrary strings that you supply.
  /// For more information, see the documentation on
  /// <a href="/ml-engine/docs/tensorflow/resource-labels">using labels</a>.
  core.Map<core.String, core.String> labels;

  /// Input parameters to create a prediction job.
  GoogleCloudMlV1PredictionInput predictionInput;

  /// The current prediction job result.
  GoogleCloudMlV1PredictionOutput predictionOutput;

  /// Output only. When the job processing was started.
  core.String startTime;

  /// Output only. The detailed state of a job.
  /// Possible string values are:
  /// - "STATE_UNSPECIFIED" : The job state is unspecified.
  /// - "QUEUED" : The job has been just created and processing has not yet
  /// begun.
  /// - "PREPARING" : The service is preparing to run the job.
  /// - "RUNNING" : The job is in progress.
  /// - "SUCCEEDED" : The job completed successfully.
  /// - "FAILED" : The job failed.
  /// `error_message` should contain the details of the failure.
  /// - "CANCELLING" : The job is being cancelled.
  /// `error_message` should describe the reason for the cancellation.
  /// - "CANCELLED" : The job has been cancelled.
  /// `error_message` should describe the reason for the cancellation.
  core.String state;

  /// Input parameters to create a training job.
  GoogleCloudMlV1TrainingInput trainingInput;

  /// The current training job result.
  GoogleCloudMlV1TrainingOutput trainingOutput;

  GoogleCloudMlV1Job();

  GoogleCloudMlV1Job.fromJson(core.Map _json) {
    if (_json.containsKey("createTime")) {
      createTime = _json["createTime"];
    }
    if (_json.containsKey("endTime")) {
      endTime = _json["endTime"];
    }
    if (_json.containsKey("errorMessage")) {
      errorMessage = _json["errorMessage"];
    }
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("jobId")) {
      jobId = _json["jobId"];
    }
    if (_json.containsKey("labels")) {
      labels = (_json["labels"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("predictionInput")) {
      predictionInput =
          new GoogleCloudMlV1PredictionInput.fromJson(_json["predictionInput"]);
    }
    if (_json.containsKey("predictionOutput")) {
      predictionOutput = new GoogleCloudMlV1PredictionOutput.fromJson(
          _json["predictionOutput"]);
    }
    if (_json.containsKey("startTime")) {
      startTime = _json["startTime"];
    }
    if (_json.containsKey("state")) {
      state = _json["state"];
    }
    if (_json.containsKey("trainingInput")) {
      trainingInput =
          new GoogleCloudMlV1TrainingInput.fromJson(_json["trainingInput"]);
    }
    if (_json.containsKey("trainingOutput")) {
      trainingOutput =
          new GoogleCloudMlV1TrainingOutput.fromJson(_json["trainingOutput"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (createTime != null) {
      _json["createTime"] = createTime;
    }
    if (endTime != null) {
      _json["endTime"] = endTime;
    }
    if (errorMessage != null) {
      _json["errorMessage"] = errorMessage;
    }
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (jobId != null) {
      _json["jobId"] = jobId;
    }
    if (labels != null) {
      _json["labels"] = labels;
    }
    if (predictionInput != null) {
      _json["predictionInput"] = (predictionInput).toJson();
    }
    if (predictionOutput != null) {
      _json["predictionOutput"] = (predictionOutput).toJson();
    }
    if (startTime != null) {
      _json["startTime"] = startTime;
    }
    if (state != null) {
      _json["state"] = state;
    }
    if (trainingInput != null) {
      _json["trainingInput"] = (trainingInput).toJson();
    }
    if (trainingOutput != null) {
      _json["trainingOutput"] = (trainingOutput).toJson();
    }
    return _json;
  }
}

/// Response message for the ListJobs method.
class GoogleCloudMlV1ListJobsResponse {
  /// The list of jobs.
  core.List<GoogleCloudMlV1Job> jobs;

  /// Optional. Pass this token as the `page_token` field of the request for a
  /// subsequent call.
  core.String nextPageToken;

  GoogleCloudMlV1ListJobsResponse();

  GoogleCloudMlV1ListJobsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("jobs")) {
      jobs = (_json["jobs"] as core.List)
          .map<GoogleCloudMlV1Job>(
              (value) => new GoogleCloudMlV1Job.fromJson(value))
          .toList();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (jobs != null) {
      _json["jobs"] = jobs.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

class GoogleCloudMlV1ListLocationsResponse {
  /// Locations where at least one type of CMLE capability is available.
  core.List<GoogleCloudMlV1Location> locations;

  /// Optional. Pass this token as the `page_token` field of the request for a
  /// subsequent call.
  core.String nextPageToken;

  GoogleCloudMlV1ListLocationsResponse();

  GoogleCloudMlV1ListLocationsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("locations")) {
      locations = (_json["locations"] as core.List)
          .map<GoogleCloudMlV1Location>(
              (value) => new GoogleCloudMlV1Location.fromJson(value))
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

/// Response message for the ListModels method.
class GoogleCloudMlV1ListModelsResponse {
  /// The list of models.
  core.List<GoogleCloudMlV1Model> models;

  /// Optional. Pass this token as the `page_token` field of the request for a
  /// subsequent call.
  core.String nextPageToken;

  GoogleCloudMlV1ListModelsResponse();

  GoogleCloudMlV1ListModelsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("models")) {
      models = (_json["models"] as core.List)
          .map<GoogleCloudMlV1Model>(
              (value) => new GoogleCloudMlV1Model.fromJson(value))
          .toList();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (models != null) {
      _json["models"] = models.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

class GoogleCloudMlV1ListStudiesResponse {
  /// The studies associated with the project.
  core.List<GoogleCloudMlV1Study> studies;

  GoogleCloudMlV1ListStudiesResponse();

  GoogleCloudMlV1ListStudiesResponse.fromJson(core.Map _json) {
    if (_json.containsKey("studies")) {
      studies = (_json["studies"] as core.List)
          .map<GoogleCloudMlV1Study>(
              (value) => new GoogleCloudMlV1Study.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (studies != null) {
      _json["studies"] = studies.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// The response message for the ListTrials method.
class GoogleCloudMlV1ListTrialsResponse {
  /// The trials associated with the study.
  core.List<GoogleCloudMlV1Trial> trials;

  GoogleCloudMlV1ListTrialsResponse();

  GoogleCloudMlV1ListTrialsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("trials")) {
      trials = (_json["trials"] as core.List)
          .map<GoogleCloudMlV1Trial>(
              (value) => new GoogleCloudMlV1Trial.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (trials != null) {
      _json["trials"] = trials.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Response message for the ListVersions method.
class GoogleCloudMlV1ListVersionsResponse {
  /// Optional. Pass this token as the `page_token` field of the request for a
  /// subsequent call.
  core.String nextPageToken;

  /// The list of versions.
  core.List<GoogleCloudMlV1Version> versions;

  GoogleCloudMlV1ListVersionsResponse();

  GoogleCloudMlV1ListVersionsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("versions")) {
      versions = (_json["versions"] as core.List)
          .map<GoogleCloudMlV1Version>(
              (value) => new GoogleCloudMlV1Version.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    if (versions != null) {
      _json["versions"] = versions.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class GoogleCloudMlV1Location {
  /// Capabilities available in the location.
  core.List<GoogleCloudMlV1Capability> capabilities;
  core.String name;

  GoogleCloudMlV1Location();

  GoogleCloudMlV1Location.fromJson(core.Map _json) {
    if (_json.containsKey("capabilities")) {
      capabilities = (_json["capabilities"] as core.List)
          .map<GoogleCloudMlV1Capability>(
              (value) => new GoogleCloudMlV1Capability.fromJson(value))
          .toList();
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (capabilities != null) {
      _json["capabilities"] =
          capabilities.map((value) => (value).toJson()).toList();
    }
    if (name != null) {
      _json["name"] = name;
    }
    return _json;
  }
}

/// Options for manually scaling a model.
class GoogleCloudMlV1ManualScaling {
  /// The number of nodes to allocate for this model. These nodes are always up,
  /// starting from the time the model is deployed, so the cost of operating
  /// this model will be proportional to `nodes` * number of hours since
  /// last billing cycle plus the cost for each prediction performed.
  core.int nodes;

  GoogleCloudMlV1ManualScaling();

  GoogleCloudMlV1ManualScaling.fromJson(core.Map _json) {
    if (_json.containsKey("nodes")) {
      nodes = _json["nodes"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (nodes != null) {
      _json["nodes"] = nodes;
    }
    return _json;
  }
}

/// A message representing a measurement.
class GoogleCloudMlV1Measurement {
  /// Output only. Time that the trial has been running at the point of
  /// this measurement.
  core.String elapsedTime;

  /// Provides a list of metrics that act as inputs into the objective
  /// function.
  core.List<GoogleCloudMlV1MeasurementMetric> metrics;

  /// The number of steps a machine learning model has been trained for.
  /// Must be non-negative.
  core.String stepCount;

  GoogleCloudMlV1Measurement();

  GoogleCloudMlV1Measurement.fromJson(core.Map _json) {
    if (_json.containsKey("elapsedTime")) {
      elapsedTime = _json["elapsedTime"];
    }
    if (_json.containsKey("metrics")) {
      metrics = (_json["metrics"] as core.List)
          .map<GoogleCloudMlV1MeasurementMetric>(
              (value) => new GoogleCloudMlV1MeasurementMetric.fromJson(value))
          .toList();
    }
    if (_json.containsKey("stepCount")) {
      stepCount = _json["stepCount"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (elapsedTime != null) {
      _json["elapsedTime"] = elapsedTime;
    }
    if (metrics != null) {
      _json["metrics"] = metrics.map((value) => (value).toJson()).toList();
    }
    if (stepCount != null) {
      _json["stepCount"] = stepCount;
    }
    return _json;
  }
}

/// Represents a machine learning solution.
///
/// A model can have multiple versions, each of which is a deployed, trained
/// model ready to receive prediction requests. The model itself is just a
/// container.
class GoogleCloudMlV1Model {
  /// Output only. The default version of the model. This version will be used
  /// to
  /// handle prediction requests that do not specify a version.
  ///
  /// You can change the default version by calling
  /// projects.models.versions.setDefault.
  GoogleCloudMlV1Version defaultVersion;

  /// Optional. The description specified for the model when it was created.
  core.String description;

  /// `etag` is used for optimistic concurrency control as a way to help
  /// prevent simultaneous updates of a model from overwriting each other.
  /// It is strongly suggested that systems make use of the `etag` in the
  /// read-modify-write cycle to perform model updates in order to avoid race
  /// conditions: An `etag` is returned in the response to `GetModel`, and
  /// systems are expected to put that etag in the request to `UpdateModel` to
  /// ensure that their change will be applied to the model as intended.
  core.String etag;
  core.List<core.int> get etagAsBytes {
    return convert.base64.decode(etag);
  }

  set etagAsBytes(core.List<core.int> _bytes) {
    etag =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  /// Optional. One or more labels that you can add, to organize your models.
  /// Each label is a key-value pair, where both the key and the value are
  /// arbitrary strings that you supply.
  /// For more information, see the documentation on
  /// <a href="/ml-engine/docs/tensorflow/resource-labels">using labels</a>.
  core.Map<core.String, core.String> labels;

  /// Required. The name specified for the model when it was created.
  ///
  /// The model name must be unique within the project it is created in.
  core.String name;

  /// Optional. If true, online prediction nodes send `stderr` and `stdout`
  /// streams to Stackdriver Logging. These can be more verbose than the
  /// standard
  /// access logs (see `onlinePredictionLogging`) and can incur higher cost.
  /// However, they are helpful for debugging. Note that
  /// [Stackdriver logs may incur a cost](/stackdriver/pricing), especially if
  /// your project receives prediction requests at a high QPS. Estimate your
  /// costs before enabling this option.
  ///
  /// Default is false.
  core.bool onlinePredictionConsoleLogging;

  /// Optional. If true, online prediction access logs are sent to StackDriver
  /// Logging. These logs are like standard server access logs, containing
  /// information like timestamp and latency for each request. Note that
  /// [Stackdriver logs may incur a cost](/stackdriver/pricing), especially if
  /// your project receives prediction requests at a high queries per second
  /// rate
  /// (QPS). Estimate your costs before enabling this option.
  ///
  /// Default is false.
  core.bool onlinePredictionLogging;

  /// Optional. The list of regions where the model is going to be deployed.
  /// Only one region per model is supported.
  /// Defaults to 'us-central1' if nothing is set.
  /// See the <a href="/ml-engine/docs/tensorflow/regions">available regions</a>
  /// for AI Platform services.
  /// Note:
  /// *   No matter where a model is deployed, it can always be accessed by
  ///     users from anywhere, both for online and batch prediction.
  /// *   The region for a batch prediction job is set by the region field when
  ///     submitting the batch prediction job and does not take its value from
  ///     this field.
  core.List<core.String> regions;

  GoogleCloudMlV1Model();

  GoogleCloudMlV1Model.fromJson(core.Map _json) {
    if (_json.containsKey("defaultVersion")) {
      defaultVersion =
          new GoogleCloudMlV1Version.fromJson(_json["defaultVersion"]);
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("labels")) {
      labels = (_json["labels"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("onlinePredictionConsoleLogging")) {
      onlinePredictionConsoleLogging = _json["onlinePredictionConsoleLogging"];
    }
    if (_json.containsKey("onlinePredictionLogging")) {
      onlinePredictionLogging = _json["onlinePredictionLogging"];
    }
    if (_json.containsKey("regions")) {
      regions = (_json["regions"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (defaultVersion != null) {
      _json["defaultVersion"] = (defaultVersion).toJson();
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (labels != null) {
      _json["labels"] = labels;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (onlinePredictionConsoleLogging != null) {
      _json["onlinePredictionConsoleLogging"] = onlinePredictionConsoleLogging;
    }
    if (onlinePredictionLogging != null) {
      _json["onlinePredictionLogging"] = onlinePredictionLogging;
    }
    if (regions != null) {
      _json["regions"] = regions;
    }
    return _json;
  }
}

/// Represents the metadata of the long-running operation.
class GoogleCloudMlV1OperationMetadata {
  /// The time the operation was submitted.
  core.String createTime;

  /// The time operation processing completed.
  core.String endTime;

  /// Indicates whether a request to cancel this operation has been made.
  core.bool isCancellationRequested;

  /// The user labels, inherited from the model or the model version being
  /// operated on.
  core.Map<core.String, core.String> labels;

  /// Contains the name of the model associated with the operation.
  core.String modelName;

  /// The operation type.
  /// Possible string values are:
  /// - "OPERATION_TYPE_UNSPECIFIED" : Unspecified operation type.
  /// - "CREATE_VERSION" : An operation to create a new version.
  /// - "DELETE_VERSION" : An operation to delete an existing version.
  /// - "DELETE_MODEL" : An operation to delete an existing model.
  /// - "UPDATE_MODEL" : An operation to update an existing model.
  /// - "UPDATE_VERSION" : An operation to update an existing version.
  /// - "UPDATE_CONFIG" : An operation to update project configuration.
  core.String operationType;

  /// Contains the project number associated with the operation.
  core.String projectNumber;

  /// The time operation processing started.
  core.String startTime;

  /// Contains the version associated with the operation.
  GoogleCloudMlV1Version version;

  GoogleCloudMlV1OperationMetadata();

  GoogleCloudMlV1OperationMetadata.fromJson(core.Map _json) {
    if (_json.containsKey("createTime")) {
      createTime = _json["createTime"];
    }
    if (_json.containsKey("endTime")) {
      endTime = _json["endTime"];
    }
    if (_json.containsKey("isCancellationRequested")) {
      isCancellationRequested = _json["isCancellationRequested"];
    }
    if (_json.containsKey("labels")) {
      labels = (_json["labels"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("modelName")) {
      modelName = _json["modelName"];
    }
    if (_json.containsKey("operationType")) {
      operationType = _json["operationType"];
    }
    if (_json.containsKey("projectNumber")) {
      projectNumber = _json["projectNumber"];
    }
    if (_json.containsKey("startTime")) {
      startTime = _json["startTime"];
    }
    if (_json.containsKey("version")) {
      version = new GoogleCloudMlV1Version.fromJson(_json["version"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (createTime != null) {
      _json["createTime"] = createTime;
    }
    if (endTime != null) {
      _json["endTime"] = endTime;
    }
    if (isCancellationRequested != null) {
      _json["isCancellationRequested"] = isCancellationRequested;
    }
    if (labels != null) {
      _json["labels"] = labels;
    }
    if (modelName != null) {
      _json["modelName"] = modelName;
    }
    if (operationType != null) {
      _json["operationType"] = operationType;
    }
    if (projectNumber != null) {
      _json["projectNumber"] = projectNumber;
    }
    if (startTime != null) {
      _json["startTime"] = startTime;
    }
    if (version != null) {
      _json["version"] = (version).toJson();
    }
    return _json;
  }
}

/// Represents a single hyperparameter to optimize.
class GoogleCloudMlV1ParameterSpec {
  /// Required if type is `CATEGORICAL`. The list of possible categories.
  core.List<core.String> categoricalValues;

  /// Required if type is `DISCRETE`.
  /// A list of feasible points.
  /// The list should be in strictly increasing order. For instance, this
  /// parameter might have possible settings of 1.5, 2.5, and 4.0. This list
  /// should not contain more than 1,000 values.
  core.List<core.double> discreteValues;

  /// Required if type is `DOUBLE` or `INTEGER`. This field
  /// should be unset if type is `CATEGORICAL`. This value should be integers if
  /// type is `INTEGER`.
  core.double maxValue;

  /// Required if type is `DOUBLE` or `INTEGER`. This field
  /// should be unset if type is `CATEGORICAL`. This value should be integers if
  /// type is INTEGER.
  core.double minValue;

  /// Required. The parameter name must be unique amongst all ParameterConfigs
  /// in
  /// a HyperparameterSpec message. E.g., "learning_rate".
  core.String parameterName;

  /// Optional. How the parameter should be scaled to the hypercube.
  /// Leave unset for categorical parameters.
  /// Some kind of scaling is strongly recommended for real or integral
  /// parameters (e.g., `UNIT_LINEAR_SCALE`).
  /// Possible string values are:
  /// - "NONE" : By default, no scaling is applied.
  /// - "UNIT_LINEAR_SCALE" : Scales the feasible space to (0, 1) linearly.
  /// - "UNIT_LOG_SCALE" : Scales the feasible space logarithmically to (0, 1).
  /// The entire feasible
  /// space must be strictly positive.
  /// - "UNIT_REVERSE_LOG_SCALE" : Scales the feasible space "reverse"
  /// logarithmically to (0, 1). The result
  /// is that values close to the top of the feasible space are spread out more
  /// than points near the bottom. The entire feasible space must be strictly
  /// positive.
  core.String scaleType;

  /// Required. The type of the parameter.
  /// Possible string values are:
  /// - "PARAMETER_TYPE_UNSPECIFIED" : You must specify a valid type. Using this
  /// unspecified type will result in
  /// an error.
  /// - "DOUBLE" : Type for real-valued parameters.
  /// - "INTEGER" : Type for integral parameters.
  /// - "CATEGORICAL" : The parameter is categorical, with a value chosen from
  /// the categories
  /// field.
  /// - "DISCRETE" : The parameter is real valued, with a fixed set of feasible
  /// points. If
  /// `type==DISCRETE`, feasible_points must be provided, and
  /// {`min_value`, `max_value`} will be ignored.
  core.String type;

  GoogleCloudMlV1ParameterSpec();

  GoogleCloudMlV1ParameterSpec.fromJson(core.Map _json) {
    if (_json.containsKey("categoricalValues")) {
      categoricalValues =
          (_json["categoricalValues"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("discreteValues")) {
      discreteValues = (_json["discreteValues"] as core.List)
          .map<core.double>((value) => value.toDouble())
          .toList();
    }
    if (_json.containsKey("maxValue")) {
      maxValue = _json["maxValue"].toDouble();
    }
    if (_json.containsKey("minValue")) {
      minValue = _json["minValue"].toDouble();
    }
    if (_json.containsKey("parameterName")) {
      parameterName = _json["parameterName"];
    }
    if (_json.containsKey("scaleType")) {
      scaleType = _json["scaleType"];
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (categoricalValues != null) {
      _json["categoricalValues"] = categoricalValues;
    }
    if (discreteValues != null) {
      _json["discreteValues"] = discreteValues;
    }
    if (maxValue != null) {
      _json["maxValue"] = maxValue;
    }
    if (minValue != null) {
      _json["minValue"] = minValue;
    }
    if (parameterName != null) {
      _json["parameterName"] = parameterName;
    }
    if (scaleType != null) {
      _json["scaleType"] = scaleType;
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

/// Request for predictions to be issued against a trained model.
class GoogleCloudMlV1PredictRequest {
  ///
  /// Required. The prediction request body. Refer to the [request body details
  /// section](#request-body-details) for more information on how to structure
  /// your request.
  GoogleApiHttpBody httpBody;

  GoogleCloudMlV1PredictRequest();

  GoogleCloudMlV1PredictRequest.fromJson(core.Map _json) {
    if (_json.containsKey("httpBody")) {
      httpBody = new GoogleApiHttpBody.fromJson(_json["httpBody"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (httpBody != null) {
      _json["httpBody"] = (httpBody).toJson();
    }
    return _json;
  }
}

/// Represents input parameters for a prediction job.
class GoogleCloudMlV1PredictionInput {
  /// Optional. Number of records per batch, defaults to 64.
  /// The service will buffer batch_size number of records in memory before
  /// invoking one Tensorflow prediction call internally. So take the record
  /// size and memory available into consideration when setting this parameter.
  core.String batchSize;

  /// Required. The format of the input data files.
  /// Possible string values are:
  /// - "DATA_FORMAT_UNSPECIFIED" : Unspecified format.
  /// - "JSON" : Each line of the file is a JSON dictionary representing one
  /// record.
  /// - "TEXT" : Deprecated. Use JSON instead.
  /// - "TF_RECORD" : The source file is a TFRecord file.
  /// Currently available only for input data.
  /// - "TF_RECORD_GZIP" : The source file is a GZIP-compressed TFRecord file.
  /// Currently available only for input data.
  /// - "CSV" : Values are comma-separated rows, with keys in a separate file.
  /// Currently available only for output data.
  core.String dataFormat;

  /// Required. The Cloud Storage location of the input data files. May contain
  /// <a href="/storage/docs/gsutil/addlhelp/WildcardNames">wildcards</a>.
  core.List<core.String> inputPaths;

  /// Optional. The maximum number of workers to be used for parallel
  /// processing.
  /// Defaults to 10 if not specified.
  core.String maxWorkerCount;

  /// Use this field if you want to use the default version for the specified
  /// model. The string must use the following format:
  ///
  /// `"projects/YOUR_PROJECT/models/YOUR_MODEL"`
  core.String modelName;

  /// Optional. Format of the output data files, defaults to JSON.
  /// Possible string values are:
  /// - "DATA_FORMAT_UNSPECIFIED" : Unspecified format.
  /// - "JSON" : Each line of the file is a JSON dictionary representing one
  /// record.
  /// - "TEXT" : Deprecated. Use JSON instead.
  /// - "TF_RECORD" : The source file is a TFRecord file.
  /// Currently available only for input data.
  /// - "TF_RECORD_GZIP" : The source file is a GZIP-compressed TFRecord file.
  /// Currently available only for input data.
  /// - "CSV" : Values are comma-separated rows, with keys in a separate file.
  /// Currently available only for output data.
  core.String outputDataFormat;

  /// Required. The output Google Cloud Storage location.
  core.String outputPath;

  /// Required. The Google Compute Engine region to run the prediction job in.
  /// See the <a href="/ml-engine/docs/tensorflow/regions">available regions</a>
  /// for AI Platform services.
  core.String region;

  /// Optional. The AI Platform runtime version to use for this batch
  /// prediction. If not set, AI Platform will pick the runtime version used
  /// during the CreateVersion request for this model version, or choose the
  /// latest stable version when model version information is not available
  /// such as when the model is specified by uri.
  core.String runtimeVersion;

  /// Optional. The name of the signature defined in the SavedModel to use for
  /// this job. Please refer to
  /// [SavedModel](https://tensorflow.github.io/serving/serving_basic.html)
  /// for information about how to use signatures.
  ///
  /// Defaults to
  /// [DEFAULT_SERVING_SIGNATURE_DEF_KEY](https://www.tensorflow.org/api_docs/python/tf/saved_model/signature_constants)
  /// , which is "serving_default".
  core.String signatureName;

  /// Use this field if you want to specify a Google Cloud Storage path for
  /// the model to use.
  core.String uri;

  /// Use this field if you want to specify a version of the model to use. The
  /// string is formatted the same way as `model_version`, with the addition
  /// of the version information:
  ///
  /// `"projects/YOUR_PROJECT/models/YOUR_MODEL/versions/YOUR_VERSION"`
  core.String versionName;

  GoogleCloudMlV1PredictionInput();

  GoogleCloudMlV1PredictionInput.fromJson(core.Map _json) {
    if (_json.containsKey("batchSize")) {
      batchSize = _json["batchSize"];
    }
    if (_json.containsKey("dataFormat")) {
      dataFormat = _json["dataFormat"];
    }
    if (_json.containsKey("inputPaths")) {
      inputPaths = (_json["inputPaths"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("maxWorkerCount")) {
      maxWorkerCount = _json["maxWorkerCount"];
    }
    if (_json.containsKey("modelName")) {
      modelName = _json["modelName"];
    }
    if (_json.containsKey("outputDataFormat")) {
      outputDataFormat = _json["outputDataFormat"];
    }
    if (_json.containsKey("outputPath")) {
      outputPath = _json["outputPath"];
    }
    if (_json.containsKey("region")) {
      region = _json["region"];
    }
    if (_json.containsKey("runtimeVersion")) {
      runtimeVersion = _json["runtimeVersion"];
    }
    if (_json.containsKey("signatureName")) {
      signatureName = _json["signatureName"];
    }
    if (_json.containsKey("uri")) {
      uri = _json["uri"];
    }
    if (_json.containsKey("versionName")) {
      versionName = _json["versionName"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (batchSize != null) {
      _json["batchSize"] = batchSize;
    }
    if (dataFormat != null) {
      _json["dataFormat"] = dataFormat;
    }
    if (inputPaths != null) {
      _json["inputPaths"] = inputPaths;
    }
    if (maxWorkerCount != null) {
      _json["maxWorkerCount"] = maxWorkerCount;
    }
    if (modelName != null) {
      _json["modelName"] = modelName;
    }
    if (outputDataFormat != null) {
      _json["outputDataFormat"] = outputDataFormat;
    }
    if (outputPath != null) {
      _json["outputPath"] = outputPath;
    }
    if (region != null) {
      _json["region"] = region;
    }
    if (runtimeVersion != null) {
      _json["runtimeVersion"] = runtimeVersion;
    }
    if (signatureName != null) {
      _json["signatureName"] = signatureName;
    }
    if (uri != null) {
      _json["uri"] = uri;
    }
    if (versionName != null) {
      _json["versionName"] = versionName;
    }
    return _json;
  }
}

/// Represents results of a prediction job.
class GoogleCloudMlV1PredictionOutput {
  /// The number of data instances which resulted in errors.
  core.String errorCount;

  /// Node hours used by the batch prediction job.
  core.double nodeHours;

  /// The output Google Cloud Storage location provided at the job creation
  /// time.
  core.String outputPath;

  /// The number of generated predictions.
  core.String predictionCount;

  GoogleCloudMlV1PredictionOutput();

  GoogleCloudMlV1PredictionOutput.fromJson(core.Map _json) {
    if (_json.containsKey("errorCount")) {
      errorCount = _json["errorCount"];
    }
    if (_json.containsKey("nodeHours")) {
      nodeHours = _json["nodeHours"].toDouble();
    }
    if (_json.containsKey("outputPath")) {
      outputPath = _json["outputPath"];
    }
    if (_json.containsKey("predictionCount")) {
      predictionCount = _json["predictionCount"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (errorCount != null) {
      _json["errorCount"] = errorCount;
    }
    if (nodeHours != null) {
      _json["nodeHours"] = nodeHours;
    }
    if (outputPath != null) {
      _json["outputPath"] = outputPath;
    }
    if (predictionCount != null) {
      _json["predictionCount"] = predictionCount;
    }
    return _json;
  }
}

/// Represents the configuration for a replica in a cluster.
class GoogleCloudMlV1ReplicaConfig {
  /// Represents the type and number of accelerators used by the replica.
  /// [Learn about restrictions on accelerator configurations for
  /// training.](/ai-platform/training/docs/using-gpus#compute-engine-machine-types-with-gpu)
  GoogleCloudMlV1AcceleratorConfig acceleratorConfig;

  /// The Docker image to run on the replica. This image must be in Container
  /// Registry. Learn more about [configuring custom
  /// containers](/ai-platform/training/docs/distributed-training-containers).
  core.String imageUri;

  /// The AI Platform runtime version that includes a TensorFlow version
  /// matching
  /// the one used in the custom container. This field is required if the
  /// replica
  /// is a TPU worker that uses a custom container. Otherwise, do not specify
  /// this field. This must be a [runtime version that currently supports
  /// training with
  /// TPUs](/ml-engine/docs/tensorflow/runtime-version-list#tpu-support).
  ///
  /// Note that the version of TensorFlow included in a runtime version may
  /// differ from the numbering of the runtime version itself, because it may
  /// have a different [patch
  /// version](https://www.tensorflow.org/guide/version_compat#semantic_versioning_20).
  /// In this field, you must specify the runtime version (TensorFlow minor
  /// version). For example, if your custom container runs TensorFlow `1.x.y`,
  /// specify `1.x`.
  core.String tpuTfVersion;

  GoogleCloudMlV1ReplicaConfig();

  GoogleCloudMlV1ReplicaConfig.fromJson(core.Map _json) {
    if (_json.containsKey("acceleratorConfig")) {
      acceleratorConfig = new GoogleCloudMlV1AcceleratorConfig.fromJson(
          _json["acceleratorConfig"]);
    }
    if (_json.containsKey("imageUri")) {
      imageUri = _json["imageUri"];
    }
    if (_json.containsKey("tpuTfVersion")) {
      tpuTfVersion = _json["tpuTfVersion"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (acceleratorConfig != null) {
      _json["acceleratorConfig"] = (acceleratorConfig).toJson();
    }
    if (imageUri != null) {
      _json["imageUri"] = imageUri;
    }
    if (tpuTfVersion != null) {
      _json["tpuTfVersion"] = tpuTfVersion;
    }
    return _json;
  }
}

/// Configuration for logging request-response pairs to a BigQuery table.
/// Online prediction requests to a model version and the responses to these
/// requests are converted to raw strings and saved to the specified BigQuery
/// table. Logging is constrained by [BigQuery quotas and
/// limits](/bigquery/quotas). If your project exceeds BigQuery quotas or
/// limits,
/// AI Platform Prediction does not log request-response pairs, but it continues
/// to serve predictions.
///
/// If you are using [continuous
/// evaluation](/ml-engine/docs/continuous-evaluation/), you do not need to
/// specify this configuration manually. Setting up continuous evaluation
/// automatically enables logging of request-response pairs.
class GoogleCloudMlV1RequestLoggingConfig {
  /// Required. Fully qualified BigQuery table name in the following format:
  /// "<var>project_id</var>.<var>dataset_name</var>.<var>table_name</var>"
  ///
  /// The specified table must already exist, and the "Cloud ML Service Agent"
  /// for your project must have permission to write to it. The table must have
  /// the following [schema](/bigquery/docs/schemas):
  ///
  /// <table>
  ///   <tr><th>Field name</th><th style="display: table-cell">Type</th>
  ///     <th style="display: table-cell">Mode</th></tr>
  ///   <tr><td>model</td><td>STRING</td><td>REQUIRED</td></tr>
  ///   <tr><td>model_version</td><td>STRING</td><td>REQUIRED</td></tr>
  ///   <tr><td>time</td><td>TIMESTAMP</td><td>REQUIRED</td></tr>
  ///   <tr><td>raw_data</td><td>STRING</td><td>REQUIRED</td></tr>
  ///   <tr><td>raw_prediction</td><td>STRING</td><td>NULLABLE</td></tr>
  ///   <tr><td>groundtruth</td><td>STRING</td><td>NULLABLE</td></tr>
  /// </table>
  core.String bigqueryTableName;

  /// Percentage of requests to be logged, expressed as a fraction from 0 to 1.
  /// For example, if you want to log 10% of requests, enter `0.1`. The sampling
  /// window is the lifetime of the model version. Defaults to 0.
  core.double samplingPercentage;

  GoogleCloudMlV1RequestLoggingConfig();

  GoogleCloudMlV1RequestLoggingConfig.fromJson(core.Map _json) {
    if (_json.containsKey("bigqueryTableName")) {
      bigqueryTableName = _json["bigqueryTableName"];
    }
    if (_json.containsKey("samplingPercentage")) {
      samplingPercentage = _json["samplingPercentage"].toDouble();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (bigqueryTableName != null) {
      _json["bigqueryTableName"] = bigqueryTableName;
    }
    if (samplingPercentage != null) {
      _json["samplingPercentage"] = samplingPercentage;
    }
    return _json;
  }
}

/// An attribution method that approximates Shapley values for features that
/// contribute to the label being predicted. A sampling strategy is used to
/// approximate the value rather than considering all subsets of features.
class GoogleCloudMlV1SampledShapleyAttribution {
  /// The number of feature permutations to consider when approximating the
  /// Shapley values.
  core.int numPaths;

  GoogleCloudMlV1SampledShapleyAttribution();

  GoogleCloudMlV1SampledShapleyAttribution.fromJson(core.Map _json) {
    if (_json.containsKey("numPaths")) {
      numPaths = _json["numPaths"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (numPaths != null) {
      _json["numPaths"] = numPaths;
    }
    return _json;
  }
}

/// All parameters related to scheduling of training jobs.
class GoogleCloudMlV1Scheduling {
  /// Optional. The maximum job running time, expressed in seconds. The field
  /// can
  /// contain up to nine fractional digits, terminated by `s`. By default there
  /// is no limit to the running time.
  ///
  /// If the training job is still running after this duration, AI Platform
  /// Training cancels it.
  ///
  /// For example, if you want to ensure your job runs for no more than 2 hours,
  /// set this field to `7200s` (2 hours * 60 minutes / hour * 60 seconds /
  /// minute).
  ///
  /// If you submit your training job using the `gcloud` tool, you can [provide
  /// this field in a `config.yaml`
  /// file](/ai-platform/training/docs/training-jobs#formatting_your_configuration_parameters).
  /// For example:
  ///
  /// ```yaml
  /// trainingInput:
  ///   ...
  ///   scheduling:
  ///     maxRunningTime: 7200s
  ///   ...
  /// ```
  core.String maxRunningTime;

  GoogleCloudMlV1Scheduling();

  GoogleCloudMlV1Scheduling.fromJson(core.Map _json) {
    if (_json.containsKey("maxRunningTime")) {
      maxRunningTime = _json["maxRunningTime"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (maxRunningTime != null) {
      _json["maxRunningTime"] = maxRunningTime;
    }
    return _json;
  }
}

/// Request message for the SetDefaultVersion request.
class GoogleCloudMlV1SetDefaultVersionRequest {
  GoogleCloudMlV1SetDefaultVersionRequest();

  GoogleCloudMlV1SetDefaultVersionRequest.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

class GoogleCloudMlV1StopTrialRequest {
  GoogleCloudMlV1StopTrialRequest();

  GoogleCloudMlV1StopTrialRequest.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// A message representing a Study.
class GoogleCloudMlV1Study {
  /// Output only. Time at which the study was created.
  core.String createTime;

  /// Output only. A human readable reason why the Study is inactive.
  /// This should be empty if a study is ACTIVE or COMPLETED.
  core.String inactiveReason;

  /// Output only. The name of a study.
  core.String name;

  /// Output only. The detailed state of a study.
  /// Possible string values are:
  /// - "STATE_UNSPECIFIED" : The study state is unspecified.
  /// - "ACTIVE" : The study is active.
  /// - "INACTIVE" : The study is stopped due to an internal error.
  /// - "COMPLETED" : The study is done when the service exhausts the parameter
  /// search space
  /// or max_trial_count is reached.
  core.String state;

  /// Required. Configuration of the study.
  GoogleCloudMlV1StudyConfig studyConfig;

  GoogleCloudMlV1Study();

  GoogleCloudMlV1Study.fromJson(core.Map _json) {
    if (_json.containsKey("createTime")) {
      createTime = _json["createTime"];
    }
    if (_json.containsKey("inactiveReason")) {
      inactiveReason = _json["inactiveReason"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("state")) {
      state = _json["state"];
    }
    if (_json.containsKey("studyConfig")) {
      studyConfig =
          new GoogleCloudMlV1StudyConfig.fromJson(_json["studyConfig"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (createTime != null) {
      _json["createTime"] = createTime;
    }
    if (inactiveReason != null) {
      _json["inactiveReason"] = inactiveReason;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (state != null) {
      _json["state"] = state;
    }
    if (studyConfig != null) {
      _json["studyConfig"] = (studyConfig).toJson();
    }
    return _json;
  }
}

/// Represents configuration of a study.
class GoogleCloudMlV1StudyConfig {
  /// The search algorithm specified for the study.
  /// Possible string values are:
  /// - "ALGORITHM_UNSPECIFIED" : The default algorithm used by the Cloud AI
  /// Platform Optimization service.
  /// - "GAUSSIAN_PROCESS_BANDIT" : Gaussian Process Bandit.
  /// - "GRID_SEARCH" : Simple grid search within the feasible space. To use
  /// grid search,
  /// all parameters must be `INTEGER`, `CATEGORICAL`, or `DISCRETE`.
  /// - "RANDOM_SEARCH" : Simple random search within the feasible space.
  core.String algorithm;

  /// Configuration for automated stopping of unpromising Trials.
  GoogleCloudMlV1AutomatedStoppingConfig automatedStoppingConfig;

  /// Metric specs for the study.
  core.List<GoogleCloudMlV1StudyConfigMetricSpec> metrics;

  /// Required. The set of parameters to tune.
  core.List<GoogleCloudMlV1StudyConfigParameterSpec> parameters;

  GoogleCloudMlV1StudyConfig();

  GoogleCloudMlV1StudyConfig.fromJson(core.Map _json) {
    if (_json.containsKey("algorithm")) {
      algorithm = _json["algorithm"];
    }
    if (_json.containsKey("automatedStoppingConfig")) {
      automatedStoppingConfig =
          new GoogleCloudMlV1AutomatedStoppingConfig.fromJson(
              _json["automatedStoppingConfig"]);
    }
    if (_json.containsKey("metrics")) {
      metrics = (_json["metrics"] as core.List)
          .map<GoogleCloudMlV1StudyConfigMetricSpec>((value) =>
              new GoogleCloudMlV1StudyConfigMetricSpec.fromJson(value))
          .toList();
    }
    if (_json.containsKey("parameters")) {
      parameters = (_json["parameters"] as core.List)
          .map<GoogleCloudMlV1StudyConfigParameterSpec>((value) =>
              new GoogleCloudMlV1StudyConfigParameterSpec.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (algorithm != null) {
      _json["algorithm"] = algorithm;
    }
    if (automatedStoppingConfig != null) {
      _json["automatedStoppingConfig"] = (automatedStoppingConfig).toJson();
    }
    if (metrics != null) {
      _json["metrics"] = metrics.map((value) => (value).toJson()).toList();
    }
    if (parameters != null) {
      _json["parameters"] =
          parameters.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Metadata field of a google.longrunning.Operation associated
/// with a SuggestTrialsRequest.
class GoogleCloudMlV1SuggestTrialsMetadata {
  /// The identifier of the client that is requesting the suggestion.
  core.String clientId;

  /// The time operation was submitted.
  core.String createTime;

  /// The name of the study that the trial belongs to.
  core.String study;

  /// The number of suggestions requested.
  core.int suggestionCount;

  GoogleCloudMlV1SuggestTrialsMetadata();

  GoogleCloudMlV1SuggestTrialsMetadata.fromJson(core.Map _json) {
    if (_json.containsKey("clientId")) {
      clientId = _json["clientId"];
    }
    if (_json.containsKey("createTime")) {
      createTime = _json["createTime"];
    }
    if (_json.containsKey("study")) {
      study = _json["study"];
    }
    if (_json.containsKey("suggestionCount")) {
      suggestionCount = _json["suggestionCount"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (clientId != null) {
      _json["clientId"] = clientId;
    }
    if (createTime != null) {
      _json["createTime"] = createTime;
    }
    if (study != null) {
      _json["study"] = study;
    }
    if (suggestionCount != null) {
      _json["suggestionCount"] = suggestionCount;
    }
    return _json;
  }
}

/// The request message for the SuggestTrial service method.
class GoogleCloudMlV1SuggestTrialsRequest {
  /// Required. The identifier of the client that is requesting the suggestion.
  ///
  /// If multiple SuggestTrialsRequests have the same `client_id`,
  /// the service will return the identical suggested trial if the trial is
  /// pending, and provide a new trial if the last suggested trial was
  /// completed.
  core.String clientId;

  /// Required. The number of suggestions requested.
  core.int suggestionCount;

  GoogleCloudMlV1SuggestTrialsRequest();

  GoogleCloudMlV1SuggestTrialsRequest.fromJson(core.Map _json) {
    if (_json.containsKey("clientId")) {
      clientId = _json["clientId"];
    }
    if (_json.containsKey("suggestionCount")) {
      suggestionCount = _json["suggestionCount"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (clientId != null) {
      _json["clientId"] = clientId;
    }
    if (suggestionCount != null) {
      _json["suggestionCount"] = suggestionCount;
    }
    return _json;
  }
}

/// This message will be placed in the response field of a completed
/// google.longrunning.Operation associated with a SuggestTrials request.
class GoogleCloudMlV1SuggestTrialsResponse {
  /// The time at which operation processing completed.
  core.String endTime;

  /// The time at which the operation was started.
  core.String startTime;

  /// The state of the study.
  /// Possible string values are:
  /// - "STATE_UNSPECIFIED" : The study state is unspecified.
  /// - "ACTIVE" : The study is active.
  /// - "INACTIVE" : The study is stopped due to an internal error.
  /// - "COMPLETED" : The study is done when the service exhausts the parameter
  /// search space
  /// or max_trial_count is reached.
  core.String studyState;

  /// A list of trials.
  core.List<GoogleCloudMlV1Trial> trials;

  GoogleCloudMlV1SuggestTrialsResponse();

  GoogleCloudMlV1SuggestTrialsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("endTime")) {
      endTime = _json["endTime"];
    }
    if (_json.containsKey("startTime")) {
      startTime = _json["startTime"];
    }
    if (_json.containsKey("studyState")) {
      studyState = _json["studyState"];
    }
    if (_json.containsKey("trials")) {
      trials = (_json["trials"] as core.List)
          .map<GoogleCloudMlV1Trial>(
              (value) => new GoogleCloudMlV1Trial.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (endTime != null) {
      _json["endTime"] = endTime;
    }
    if (startTime != null) {
      _json["startTime"] = startTime;
    }
    if (studyState != null) {
      _json["studyState"] = studyState;
    }
    if (trials != null) {
      _json["trials"] = trials.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Represents input parameters for a training job. When using the gcloud
/// command
/// to submit your training job, you can specify the input parameters as
/// command-line arguments and/or in a YAML configuration file referenced from
/// the --config command-line argument. For details, see the guide to
/// [submitting
/// a training job](/ai-platform/training/docs/training-jobs).
class GoogleCloudMlV1TrainingInput {
  /// Optional. Command-line arguments passed to the training application when
  /// it
  /// starts. If your job uses a custom container, then the arguments are passed
  /// to the container's <a class="external" target="_blank"
  /// href="https://docs.docker.com/engine/reference/builder/#entrypoint">
  /// `ENTRYPOINT`</a> command.
  core.List<core.String> args;

  /// Optional. Options for using customer-managed encryption keys (CMEK) to
  /// protect resources created by a training job, instead of using Google's
  /// default encryption. If this is set, then all resources created by the
  /// training job will be encrypted with the customer-managed encryption key
  /// that you specify.
  ///
  /// [Learn how and when to use CMEK with AI Platform
  /// Training](/ai-platform/training/docs/cmek).
  GoogleCloudMlV1EncryptionConfig encryptionConfig;

  /// Optional. The configuration for evaluators.
  ///
  /// You should only set `evaluatorConfig.acceleratorConfig` if
  /// `evaluatorType` is set to a Compute Engine machine type. [Learn
  /// about restrictions on accelerator configurations for
  /// training.](/ai-platform/training/docs/using-gpus#compute-engine-machine-types-with-gpu)
  ///
  /// Set `evaluatorConfig.imageUri` only if you build a custom image for
  /// your evaluator. If `evaluatorConfig.imageUri` has not been
  /// set, AI Platform uses the value of `masterConfig.imageUri`. Learn more
  /// about [configuring custom
  /// containers](/ai-platform/training/docs/distributed-training-containers).
  GoogleCloudMlV1ReplicaConfig evaluatorConfig;

  /// Optional. The number of evaluator replicas to use for the training job.
  /// Each replica in the cluster will be of the type specified in
  /// `evaluator_type`.
  ///
  /// This value can only be used when `scale_tier` is set to `CUSTOM`. If you
  /// set this value, you must also set `evaluator_type`.
  ///
  /// The default value is zero.
  core.String evaluatorCount;

  /// Optional. Specifies the type of virtual machine to use for your training
  /// job's evaluator nodes.
  ///
  /// The supported values are the same as those described in the entry for
  /// `masterType`.
  ///
  /// This value must be consistent with the category of machine type that
  /// `masterType` uses. In other words, both must be Compute Engine machine
  /// types or both must be legacy machine types.
  ///
  /// This value must be present when `scaleTier` is set to `CUSTOM` and
  /// `evaluatorCount` is greater than zero.
  core.String evaluatorType;

  /// Optional. The set of Hyperparameters to tune.
  GoogleCloudMlV1HyperparameterSpec hyperparameters;

  /// Optional. A Google Cloud Storage path in which to store training outputs
  /// and other data needed for training. This path is passed to your TensorFlow
  /// program as the '--job-dir' command-line argument. The benefit of
  /// specifying
  /// this field is that Cloud ML validates the path for use in training.
  core.String jobDir;

  /// Optional. The configuration for your master worker.
  ///
  /// You should only set `masterConfig.acceleratorConfig` if `masterType` is
  /// set
  /// to a Compute Engine machine type. Learn about [restrictions on accelerator
  /// configurations for
  /// training.](/ai-platform/training/docs/using-gpus#compute-engine-machine-types-with-gpu)
  ///
  /// Set `masterConfig.imageUri` only if you build a custom image. Only one of
  /// `masterConfig.imageUri` and `runtimeVersion` should be set. Learn more
  /// about [configuring custom
  /// containers](/ai-platform/training/docs/distributed-training-containers).
  GoogleCloudMlV1ReplicaConfig masterConfig;

  /// Optional. Specifies the type of virtual machine to use for your training
  /// job's master worker. You must specify this field when `scaleTier` is set
  /// to
  /// `CUSTOM`.
  ///
  /// You can use certain Compute Engine machine types directly in this field.
  /// The following types are supported:
  ///
  /// - `n1-standard-4`
  /// - `n1-standard-8`
  /// - `n1-standard-16`
  /// - `n1-standard-32`
  /// - `n1-standard-64`
  /// - `n1-standard-96`
  /// - `n1-highmem-2`
  /// - `n1-highmem-4`
  /// - `n1-highmem-8`
  /// - `n1-highmem-16`
  /// - `n1-highmem-32`
  /// - `n1-highmem-64`
  /// - `n1-highmem-96`
  /// - `n1-highcpu-16`
  /// - `n1-highcpu-32`
  /// - `n1-highcpu-64`
  /// - `n1-highcpu-96`
  ///
  /// Learn more about [using Compute Engine machine
  /// types](/ml-engine/docs/machine-types#compute-engine-machine-types).
  ///
  /// Alternatively, you can use the following legacy machine types:
  ///
  /// - `standard`
  /// - `large_model`
  /// - `complex_model_s`
  /// - `complex_model_m`
  /// - `complex_model_l`
  /// - `standard_gpu`
  /// - `complex_model_m_gpu`
  /// - `complex_model_l_gpu`
  /// - `standard_p100`
  /// - `complex_model_m_p100`
  /// - `standard_v100`
  /// - `large_model_v100`
  /// - `complex_model_m_v100`
  /// - `complex_model_l_v100`
  ///
  /// Learn more about [using legacy machine
  /// types](/ml-engine/docs/machine-types#legacy-machine-types).
  ///
  /// Finally, if you want to use a TPU for training, specify `cloud_tpu` in
  /// this
  /// field. Learn more about the [special configuration options for training
  /// with
  /// TPUs](/ml-engine/docs/tensorflow/using-tpus#configuring_a_custom_tpu_machine).
  core.String masterType;

  /// Required. The Google Cloud Storage location of the packages with
  /// the training program and any additional dependencies.
  /// The maximum number of package URIs is 100.
  core.List<core.String> packageUris;

  /// Optional. The configuration for parameter servers.
  ///
  /// You should only set `parameterServerConfig.acceleratorConfig` if
  /// `parameterServerType` is set to a Compute Engine machine type. [Learn
  /// about restrictions on accelerator configurations for
  /// training.](/ai-platform/training/docs/using-gpus#compute-engine-machine-types-with-gpu)
  ///
  /// Set `parameterServerConfig.imageUri` only if you build a custom image for
  /// your parameter server. If `parameterServerConfig.imageUri` has not been
  /// set, AI Platform uses the value of `masterConfig.imageUri`. Learn more
  /// about [configuring custom
  /// containers](/ai-platform/training/docs/distributed-training-containers).
  GoogleCloudMlV1ReplicaConfig parameterServerConfig;

  /// Optional. The number of parameter server replicas to use for the training
  /// job. Each replica in the cluster will be of the type specified in
  /// `parameter_server_type`.
  ///
  /// This value can only be used when `scale_tier` is set to `CUSTOM`. If you
  /// set this value, you must also set `parameter_server_type`.
  ///
  /// The default value is zero.
  core.String parameterServerCount;

  /// Optional. Specifies the type of virtual machine to use for your training
  /// job's parameter server.
  ///
  /// The supported values are the same as those described in the entry for
  /// `master_type`.
  ///
  /// This value must be consistent with the category of machine type that
  /// `masterType` uses. In other words, both must be Compute Engine machine
  /// types or both must be legacy machine types.
  ///
  /// This value must be present when `scaleTier` is set to `CUSTOM` and
  /// `parameter_server_count` is greater than zero.
  core.String parameterServerType;

  /// Required. The Python module name to run after installing the packages.
  core.String pythonModule;

  /// Optional. The version of Python used in training. You must either specify
  /// this field or specify `masterConfig.imageUri`.
  ///
  /// The following Python versions are available:
  ///
  /// * Python '3.7' is available when `runtime_version` is set to '1.15' or
  ///   later.
  /// * Python '3.5' is available when `runtime_version` is set to a version
  ///   from '1.4' to '1.14'.
  /// * Python '2.7' is available when `runtime_version` is set to '1.15' or
  ///   earlier.
  ///
  /// Read more about the Python versions available for [each runtime
  /// version](/ml-engine/docs/runtime-version-list).
  core.String pythonVersion;

  /// Required. The region to run the training job in. See the [available
  /// regions](/ai-platform/training/docs/regions) for AI Platform Training.
  core.String region;

  /// Optional. The AI Platform runtime version to use for training. You must
  /// either specify this field or specify `masterConfig.imageUri`.
  ///
  /// For more information, see the [runtime version
  /// list](/ai-platform/training/docs/runtime-version-list) and learn [how to
  /// manage runtime versions](/ai-platform/training/docs/versioning).
  core.String runtimeVersion;

  /// Required. Specifies the machine types, the number of replicas for workers
  /// and parameter servers.
  /// Possible string values are:
  /// - "BASIC" : A single worker instance. This tier is suitable for learning
  /// how to use
  /// Cloud ML, and for experimenting with new models using small datasets.
  /// - "STANDARD_1" : Many workers and a few parameter servers.
  /// - "PREMIUM_1" : A large number of workers with many parameter servers.
  /// - "BASIC_GPU" : A single worker instance [with a
  /// GPU](/ai-platform/training/docs/using-gpus).
  /// - "BASIC_TPU" : A single worker instance with a
  /// [Cloud TPU](/ml-engine/docs/tensorflow/using-tpus).
  /// - "CUSTOM" : The CUSTOM tier is not a set tier, but rather enables you to
  /// use your
  /// own cluster specification. When you use this tier, set values to
  /// configure your processing cluster according to these guidelines:
  ///
  /// *   You _must_ set `TrainingInput.masterType` to specify the type
  ///     of machine to use for your master node. This is the only required
  ///     setting.
  ///
  /// *   You _may_ set `TrainingInput.workerCount` to specify the number of
  ///     workers to use. If you specify one or more workers, you _must_ also
  ///     set `TrainingInput.workerType` to specify the type of machine to use
  ///     for your worker nodes.
  ///
  /// *   You _may_ set `TrainingInput.parameterServerCount` to specify the
  ///     number of parameter servers to use. If you specify one or more
  ///     parameter servers, you _must_ also set
  ///     `TrainingInput.parameterServerType` to specify the type of machine to
  ///     use for your parameter servers.
  ///
  /// Note that all of your workers must use the same machine type, which can
  /// be different from your parameter server type and master type. Your
  /// parameter servers must likewise use the same machine type, which can be
  /// different from your worker type and master type.
  core.String scaleTier;

  /// Optional. Scheduling options for a training job.
  GoogleCloudMlV1Scheduling scheduling;

  /// Optional. Use `chief` instead of `master` in the `TF_CONFIG` environment
  /// variable when training with a custom container. Defaults to `false`.
  /// [Learn
  /// more about this
  /// field.](/ai-platform/training/docs/distributed-training-details#chief-versus-master)
  ///
  /// This field has no effect for training jobs that don't use a custom
  /// container.
  core.bool useChiefInTfConfig;

  /// Optional. The configuration for workers.
  ///
  /// You should only set `workerConfig.acceleratorConfig` if `workerType` is
  /// set
  /// to a Compute Engine machine type. [Learn about restrictions on accelerator
  /// configurations for
  /// training.](/ai-platform/training/docs/using-gpus#compute-engine-machine-types-with-gpu)
  ///
  /// Set `workerConfig.imageUri` only if you build a custom image for your
  /// worker. If `workerConfig.imageUri` has not been set, AI Platform uses
  /// the value of `masterConfig.imageUri`. Learn more about [configuring custom
  /// containers](/ai-platform/training/docs/distributed-training-containers).
  GoogleCloudMlV1ReplicaConfig workerConfig;

  /// Optional. The number of worker replicas to use for the training job. Each
  /// replica in the cluster will be of the type specified in `worker_type`.
  ///
  /// This value can only be used when `scale_tier` is set to `CUSTOM`. If you
  /// set this value, you must also set `worker_type`.
  ///
  /// The default value is zero.
  core.String workerCount;

  /// Optional. Specifies the type of virtual machine to use for your training
  /// job's worker nodes.
  ///
  /// The supported values are the same as those described in the entry for
  /// `masterType`.
  ///
  /// This value must be consistent with the category of machine type that
  /// `masterType` uses. In other words, both must be Compute Engine machine
  /// types or both must be legacy machine types.
  ///
  /// If you use `cloud_tpu` for this value, see special instructions for
  /// [configuring a custom TPU
  /// machine](/ml-engine/docs/tensorflow/using-tpus#configuring_a_custom_tpu_machine).
  ///
  /// This value must be present when `scaleTier` is set to `CUSTOM` and
  /// `workerCount` is greater than zero.
  core.String workerType;

  GoogleCloudMlV1TrainingInput();

  GoogleCloudMlV1TrainingInput.fromJson(core.Map _json) {
    if (_json.containsKey("args")) {
      args = (_json["args"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("encryptionConfig")) {
      encryptionConfig = new GoogleCloudMlV1EncryptionConfig.fromJson(
          _json["encryptionConfig"]);
    }
    if (_json.containsKey("evaluatorConfig")) {
      evaluatorConfig =
          new GoogleCloudMlV1ReplicaConfig.fromJson(_json["evaluatorConfig"]);
    }
    if (_json.containsKey("evaluatorCount")) {
      evaluatorCount = _json["evaluatorCount"];
    }
    if (_json.containsKey("evaluatorType")) {
      evaluatorType = _json["evaluatorType"];
    }
    if (_json.containsKey("hyperparameters")) {
      hyperparameters = new GoogleCloudMlV1HyperparameterSpec.fromJson(
          _json["hyperparameters"]);
    }
    if (_json.containsKey("jobDir")) {
      jobDir = _json["jobDir"];
    }
    if (_json.containsKey("masterConfig")) {
      masterConfig =
          new GoogleCloudMlV1ReplicaConfig.fromJson(_json["masterConfig"]);
    }
    if (_json.containsKey("masterType")) {
      masterType = _json["masterType"];
    }
    if (_json.containsKey("packageUris")) {
      packageUris = (_json["packageUris"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("parameterServerConfig")) {
      parameterServerConfig = new GoogleCloudMlV1ReplicaConfig.fromJson(
          _json["parameterServerConfig"]);
    }
    if (_json.containsKey("parameterServerCount")) {
      parameterServerCount = _json["parameterServerCount"];
    }
    if (_json.containsKey("parameterServerType")) {
      parameterServerType = _json["parameterServerType"];
    }
    if (_json.containsKey("pythonModule")) {
      pythonModule = _json["pythonModule"];
    }
    if (_json.containsKey("pythonVersion")) {
      pythonVersion = _json["pythonVersion"];
    }
    if (_json.containsKey("region")) {
      region = _json["region"];
    }
    if (_json.containsKey("runtimeVersion")) {
      runtimeVersion = _json["runtimeVersion"];
    }
    if (_json.containsKey("scaleTier")) {
      scaleTier = _json["scaleTier"];
    }
    if (_json.containsKey("scheduling")) {
      scheduling = new GoogleCloudMlV1Scheduling.fromJson(_json["scheduling"]);
    }
    if (_json.containsKey("useChiefInTfConfig")) {
      useChiefInTfConfig = _json["useChiefInTfConfig"];
    }
    if (_json.containsKey("workerConfig")) {
      workerConfig =
          new GoogleCloudMlV1ReplicaConfig.fromJson(_json["workerConfig"]);
    }
    if (_json.containsKey("workerCount")) {
      workerCount = _json["workerCount"];
    }
    if (_json.containsKey("workerType")) {
      workerType = _json["workerType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (args != null) {
      _json["args"] = args;
    }
    if (encryptionConfig != null) {
      _json["encryptionConfig"] = (encryptionConfig).toJson();
    }
    if (evaluatorConfig != null) {
      _json["evaluatorConfig"] = (evaluatorConfig).toJson();
    }
    if (evaluatorCount != null) {
      _json["evaluatorCount"] = evaluatorCount;
    }
    if (evaluatorType != null) {
      _json["evaluatorType"] = evaluatorType;
    }
    if (hyperparameters != null) {
      _json["hyperparameters"] = (hyperparameters).toJson();
    }
    if (jobDir != null) {
      _json["jobDir"] = jobDir;
    }
    if (masterConfig != null) {
      _json["masterConfig"] = (masterConfig).toJson();
    }
    if (masterType != null) {
      _json["masterType"] = masterType;
    }
    if (packageUris != null) {
      _json["packageUris"] = packageUris;
    }
    if (parameterServerConfig != null) {
      _json["parameterServerConfig"] = (parameterServerConfig).toJson();
    }
    if (parameterServerCount != null) {
      _json["parameterServerCount"] = parameterServerCount;
    }
    if (parameterServerType != null) {
      _json["parameterServerType"] = parameterServerType;
    }
    if (pythonModule != null) {
      _json["pythonModule"] = pythonModule;
    }
    if (pythonVersion != null) {
      _json["pythonVersion"] = pythonVersion;
    }
    if (region != null) {
      _json["region"] = region;
    }
    if (runtimeVersion != null) {
      _json["runtimeVersion"] = runtimeVersion;
    }
    if (scaleTier != null) {
      _json["scaleTier"] = scaleTier;
    }
    if (scheduling != null) {
      _json["scheduling"] = (scheduling).toJson();
    }
    if (useChiefInTfConfig != null) {
      _json["useChiefInTfConfig"] = useChiefInTfConfig;
    }
    if (workerConfig != null) {
      _json["workerConfig"] = (workerConfig).toJson();
    }
    if (workerCount != null) {
      _json["workerCount"] = workerCount;
    }
    if (workerType != null) {
      _json["workerType"] = workerType;
    }
    return _json;
  }
}

/// Represents results of a training job. Output only.
class GoogleCloudMlV1TrainingOutput {
  /// Details related to built-in algorithms jobs.
  /// Only set for built-in algorithms jobs.
  GoogleCloudMlV1BuiltInAlgorithmOutput builtInAlgorithmOutput;

  /// The number of hyperparameter tuning trials that completed successfully.
  /// Only set for hyperparameter tuning jobs.
  core.String completedTrialCount;

  /// The amount of ML units consumed by the job.
  core.double consumedMLUnits;

  /// The TensorFlow summary tag name used for optimizing hyperparameter tuning
  /// trials. See
  /// [`HyperparameterSpec.hyperparameterMetricTag`](#HyperparameterSpec.FIELDS.hyperparameter_metric_tag)
  /// for more information. Only set for hyperparameter tuning jobs.
  core.String hyperparameterMetricTag;

  /// Whether this job is a built-in Algorithm job.
  core.bool isBuiltInAlgorithmJob;

  /// Whether this job is a hyperparameter tuning job.
  core.bool isHyperparameterTuningJob;

  /// Results for individual Hyperparameter trials.
  /// Only set for hyperparameter tuning jobs.
  core.List<GoogleCloudMlV1HyperparameterOutput> trials;

  GoogleCloudMlV1TrainingOutput();

  GoogleCloudMlV1TrainingOutput.fromJson(core.Map _json) {
    if (_json.containsKey("builtInAlgorithmOutput")) {
      builtInAlgorithmOutput =
          new GoogleCloudMlV1BuiltInAlgorithmOutput.fromJson(
              _json["builtInAlgorithmOutput"]);
    }
    if (_json.containsKey("completedTrialCount")) {
      completedTrialCount = _json["completedTrialCount"];
    }
    if (_json.containsKey("consumedMLUnits")) {
      consumedMLUnits = _json["consumedMLUnits"].toDouble();
    }
    if (_json.containsKey("hyperparameterMetricTag")) {
      hyperparameterMetricTag = _json["hyperparameterMetricTag"];
    }
    if (_json.containsKey("isBuiltInAlgorithmJob")) {
      isBuiltInAlgorithmJob = _json["isBuiltInAlgorithmJob"];
    }
    if (_json.containsKey("isHyperparameterTuningJob")) {
      isHyperparameterTuningJob = _json["isHyperparameterTuningJob"];
    }
    if (_json.containsKey("trials")) {
      trials = (_json["trials"] as core.List)
          .map<GoogleCloudMlV1HyperparameterOutput>((value) =>
              new GoogleCloudMlV1HyperparameterOutput.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (builtInAlgorithmOutput != null) {
      _json["builtInAlgorithmOutput"] = (builtInAlgorithmOutput).toJson();
    }
    if (completedTrialCount != null) {
      _json["completedTrialCount"] = completedTrialCount;
    }
    if (consumedMLUnits != null) {
      _json["consumedMLUnits"] = consumedMLUnits;
    }
    if (hyperparameterMetricTag != null) {
      _json["hyperparameterMetricTag"] = hyperparameterMetricTag;
    }
    if (isBuiltInAlgorithmJob != null) {
      _json["isBuiltInAlgorithmJob"] = isBuiltInAlgorithmJob;
    }
    if (isHyperparameterTuningJob != null) {
      _json["isHyperparameterTuningJob"] = isHyperparameterTuningJob;
    }
    if (trials != null) {
      _json["trials"] = trials.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// A message representing a trial.
class GoogleCloudMlV1Trial {
  /// Output only. The identifier of the client that originally requested this
  /// trial.
  core.String clientId;

  /// Output only. Time at which the trial's status changed to COMPLETED.
  core.String endTime;

  /// The final measurement containing the objective value.
  GoogleCloudMlV1Measurement finalMeasurement;

  /// Output only. A human readable string describing why the trial is
  /// infeasible. This should only be set if trial_infeasible is true.
  core.String infeasibleReason;

  /// A list of measurements that are strictly lexicographically
  /// ordered by their induced tuples (steps, elapsed_time).
  /// These are used for early stopping computations.
  core.List<GoogleCloudMlV1Measurement> measurements;

  /// Output only. Name of the trial assigned by the service.
  core.String name;

  /// The parameters of the trial.
  core.List<GoogleCloudMlV1TrialParameter> parameters;

  /// Output only. Time at which the trial was started.
  core.String startTime;

  /// The detailed state of a trial.
  /// Possible string values are:
  /// - "STATE_UNSPECIFIED" : The trial state is unspecified.
  /// - "REQUESTED" : Indicates that a specific trial has been requested, but it
  /// has not yet
  /// been suggested by the service.
  /// - "ACTIVE" : Indicates that the trial has been suggested.
  /// - "COMPLETED" : Indicates that the trial is done, and either has a
  /// final_measurement
  /// set, or is marked as trial_infeasible.
  /// - "STOPPING" : Indicates that the trial should stop according to the
  /// service.
  core.String state;

  /// Output only. If true, the parameters in this trial are not attempted
  /// again.
  core.bool trialInfeasible;

  GoogleCloudMlV1Trial();

  GoogleCloudMlV1Trial.fromJson(core.Map _json) {
    if (_json.containsKey("clientId")) {
      clientId = _json["clientId"];
    }
    if (_json.containsKey("endTime")) {
      endTime = _json["endTime"];
    }
    if (_json.containsKey("finalMeasurement")) {
      finalMeasurement =
          new GoogleCloudMlV1Measurement.fromJson(_json["finalMeasurement"]);
    }
    if (_json.containsKey("infeasibleReason")) {
      infeasibleReason = _json["infeasibleReason"];
    }
    if (_json.containsKey("measurements")) {
      measurements = (_json["measurements"] as core.List)
          .map<GoogleCloudMlV1Measurement>(
              (value) => new GoogleCloudMlV1Measurement.fromJson(value))
          .toList();
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("parameters")) {
      parameters = (_json["parameters"] as core.List)
          .map<GoogleCloudMlV1TrialParameter>(
              (value) => new GoogleCloudMlV1TrialParameter.fromJson(value))
          .toList();
    }
    if (_json.containsKey("startTime")) {
      startTime = _json["startTime"];
    }
    if (_json.containsKey("state")) {
      state = _json["state"];
    }
    if (_json.containsKey("trialInfeasible")) {
      trialInfeasible = _json["trialInfeasible"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (clientId != null) {
      _json["clientId"] = clientId;
    }
    if (endTime != null) {
      _json["endTime"] = endTime;
    }
    if (finalMeasurement != null) {
      _json["finalMeasurement"] = (finalMeasurement).toJson();
    }
    if (infeasibleReason != null) {
      _json["infeasibleReason"] = infeasibleReason;
    }
    if (measurements != null) {
      _json["measurements"] =
          measurements.map((value) => (value).toJson()).toList();
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (parameters != null) {
      _json["parameters"] =
          parameters.map((value) => (value).toJson()).toList();
    }
    if (startTime != null) {
      _json["startTime"] = startTime;
    }
    if (state != null) {
      _json["state"] = state;
    }
    if (trialInfeasible != null) {
      _json["trialInfeasible"] = trialInfeasible;
    }
    return _json;
  }
}

/// Represents a version of the model.
///
/// Each version is a trained model deployed in the cloud, ready to handle
/// prediction requests. A model can have multiple versions. You can get
/// information about all of the versions of a given model by calling
/// projects.models.versions.list.
class GoogleCloudMlV1Version {
  /// Optional. Accelerator config for using GPUs for online prediction (beta).
  /// Only specify this field if you have specified a Compute Engine (N1)
  /// machine
  /// type in the `machineType` field. Learn more about [using GPUs for online
  /// prediction](/ml-engine/docs/machine-types-online-prediction#gpus).
  GoogleCloudMlV1AcceleratorConfig acceleratorConfig;

  /// Automatically scale the number of nodes used to serve the model in
  /// response to increases and decreases in traffic. Care should be
  /// taken to ramp up traffic according to the model's ability to scale
  /// or you will start seeing increases in latency and 429 response codes.
  ///
  /// Note that you cannot use AutoScaling if your version uses
  /// [GPUs](#Version.FIELDS.accelerator_config). Instead, you must use specify
  /// `manual_scaling`.
  GoogleCloudMlV1AutoScaling autoScaling;

  /// Output only. The time the version was created.
  core.String createTime;

  /// Required. The Cloud Storage location of the trained model used to
  /// create the version. See the
  /// [guide to model
  /// deployment](/ml-engine/docs/tensorflow/deploying-models) for more
  /// information.
  ///
  /// When passing Version to
  /// projects.models.versions.create
  /// the model service uses the specified location as the source of the model.
  /// Once deployed, the model version is hosted by the prediction service, so
  /// this location is useful only as a historical record.
  /// The total number of model files can't exceed 1000.
  core.String deploymentUri;

  /// Optional. The description specified for the version when it was created.
  core.String description;

  /// Output only. The details of a failure or a cancellation.
  core.String errorMessage;

  /// `etag` is used for optimistic concurrency control as a way to help
  /// prevent simultaneous updates of a model from overwriting each other.
  /// It is strongly suggested that systems make use of the `etag` in the
  /// read-modify-write cycle to perform model updates in order to avoid race
  /// conditions: An `etag` is returned in the response to `GetVersion`, and
  /// systems are expected to put that etag in the request to `UpdateVersion` to
  /// ensure that their change will be applied to the model as intended.
  core.String etag;
  core.List<core.int> get etagAsBytes {
    return convert.base64.decode(etag);
  }

  set etagAsBytes(core.List<core.int> _bytes) {
    etag =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  /// Optional. Configures explainability features on the model's version.
  /// Some explanation features require additional metadata to be loaded
  /// as part of the model payload.
  GoogleCloudMlV1ExplanationConfig explanationConfig;

  /// Optional. The machine learning framework AI Platform uses to train
  /// this version of the model. Valid values are `TENSORFLOW`, `SCIKIT_LEARN`,
  /// `XGBOOST`. If you do not specify a framework, AI Platform
  /// will analyze files in the deployment_uri to determine a framework. If you
  /// choose `SCIKIT_LEARN` or `XGBOOST`, you must also set the runtime version
  /// of the model to 1.4 or greater.
  ///
  /// Do **not** specify a framework if you're deploying a [custom
  /// prediction
  /// routine](/ml-engine/docs/tensorflow/custom-prediction-routines).
  ///
  /// If you specify a [Compute Engine (N1) machine
  /// type](/ml-engine/docs/machine-types-online-prediction) in the
  /// `machineType` field, you must specify `TENSORFLOW`
  /// for the framework.
  /// Possible string values are:
  /// - "FRAMEWORK_UNSPECIFIED" : Unspecified framework. Assigns a value based
  /// on the file suffix.
  /// - "TENSORFLOW" : Tensorflow framework.
  /// - "SCIKIT_LEARN" : Scikit-learn framework.
  /// - "XGBOOST" : XGBoost framework.
  core.String framework;

  /// Output only. If true, this version will be used to handle prediction
  /// requests that do not specify a version.
  ///
  /// You can change the default version by calling
  /// projects.methods.versions.setDefault.
  core.bool isDefault;

  /// Optional. One or more labels that you can add, to organize your model
  /// versions. Each label is a key-value pair, where both the key and the value
  /// are arbitrary strings that you supply.
  /// For more information, see the documentation on
  /// <a href="/ml-engine/docs/tensorflow/resource-labels">using labels</a>.
  core.Map<core.String, core.String> labels;

  /// Output only. The time the version was last used for prediction.
  core.String lastUseTime;

  /// Optional. The type of machine on which to serve the model. Currently only
  /// applies to online prediction service. If this field is not specified, it
  /// defaults to `mls1-c1-m2`.
  ///
  /// Online prediction supports the following machine types:
  ///
  /// * `mls1-c1-m2`
  /// * `mls1-c4-m2`
  /// * `n1-standard-2`
  /// * `n1-standard-4`
  /// * `n1-standard-8`
  /// * `n1-standard-16`
  /// * `n1-standard-32`
  /// * `n1-highmem-2`
  /// * `n1-highmem-4`
  /// * `n1-highmem-8`
  /// * `n1-highmem-16`
  /// * `n1-highmem-32`
  /// * `n1-highcpu-2`
  /// * `n1-highcpu-4`
  /// * `n1-highcpu-8`
  /// * `n1-highcpu-16`
  /// * `n1-highcpu-32`
  ///
  /// `mls1-c1-m2` is generally available. All other machine types are available
  /// in beta. Learn more about the [differences between machine
  /// types](/ml-engine/docs/machine-types-online-prediction).
  core.String machineType;

  /// Manually select the number of nodes to use for serving the
  /// model. You should generally use `auto_scaling` with an appropriate
  /// `min_nodes` instead, but this option is available if you want more
  /// predictable billing. Beware that latency and error rates will increase
  /// if the traffic exceeds that capability of the system to serve it based
  /// on the selected number of nodes.
  GoogleCloudMlV1ManualScaling manualScaling;

  /// Required. The name specified for the version when it was created.
  ///
  /// The version name must be unique within the model it is created in.
  core.String name;

  /// Optional. Cloud Storage paths (`gs://…`) of packages for [custom
  /// prediction
  /// routines](/ml-engine/docs/tensorflow/custom-prediction-routines)
  /// or [scikit-learn pipelines with custom
  /// code](/ml-engine/docs/scikit/exporting-for-prediction#custom-pipeline-code).
  ///
  /// For a custom prediction routine, one of these packages must contain your
  /// Predictor class (see
  /// [`predictionClass`](#Version.FIELDS.prediction_class)). Additionally,
  /// include any dependencies used by your Predictor or scikit-learn pipeline
  /// uses that are not already included in your selected [runtime
  /// version](/ml-engine/docs/tensorflow/runtime-version-list).
  ///
  /// If you specify this field, you must also set
  /// [`runtimeVersion`](#Version.FIELDS.runtime_version) to 1.4 or greater.
  core.List<core.String> packageUris;

  /// Optional. The fully qualified name
  /// (<var>module_name</var>.<var>class_name</var>) of a class that implements
  /// the Predictor interface described in this reference field. The module
  /// containing this class should be included in a package provided to the
  /// [`packageUris` field](#Version.FIELDS.package_uris).
  ///
  /// Specify this field if and only if you are deploying a [custom prediction
  /// routine (beta)](/ml-engine/docs/tensorflow/custom-prediction-routines).
  /// If you specify this field, you must set
  /// [`runtimeVersion`](#Version.FIELDS.runtime_version) to 1.4 or greater and
  /// you must set `machineType` to a [legacy (MLS1)
  /// machine type](/ml-engine/docs/machine-types-online-prediction).
  ///
  /// The following code sample provides the Predictor interface:
  ///
  /// <pre style="max-width: 626px;">
  /// class Predictor(object):
  /// """Interface for constructing custom predictors."""
  ///
  /// def predict(self, instances, **kwargs):
  ///     """Performs custom prediction.
  ///
  ///     Instances are the decoded values from the request. They have already
  ///     been deserialized from JSON.
  ///
  ///     Args:
  ///         instances: A list of prediction input instances.
  ///         **kwargs: A dictionary of keyword args provided as additional
  ///             fields on the predict request body.
  ///
  ///     Returns:
  /// A list of outputs containing the prediction results. This list must
  ///         be JSON serializable.
  ///     """
  ///     raise NotImplementedError()
  ///
  /// @classmethod
  /// def from_path(cls, model_dir):
  ///     """Creates an instance of Predictor using the given path.
  ///
  ///     Loading of the predictor should be done in this method.
  ///
  ///     Args:
  ///         model_dir: The local directory that contains the exported model
  /// file along with any additional files uploaded when creating the
  ///             version resource.
  ///
  ///     Returns:
  ///         An instance implementing this Predictor class.
  ///     """
  ///     raise NotImplementedError()
  /// </pre>
  ///
  /// Learn more about [the Predictor interface and custom prediction
  /// routines](/ml-engine/docs/tensorflow/custom-prediction-routines).
  core.String predictionClass;

  /// Required. The version of Python used in prediction.
  ///
  /// The following Python versions are available:
  ///
  /// * Python '3.7' is available when `runtime_version` is set to '1.15' or
  ///   later.
  /// * Python '3.5' is available when `runtime_version` is set to a version
  ///   from '1.4' to '1.14'.
  /// * Python '2.7' is available when `runtime_version` is set to '1.15' or
  ///   earlier.
  ///
  /// Read more about the Python versions available for [each runtime
  /// version](/ml-engine/docs/runtime-version-list).
  core.String pythonVersion;

  /// Optional. *Only* specify this field in a
  /// projects.models.versions.patch
  /// request. Specifying it in a
  /// projects.models.versions.create
  /// request has no effect.
  ///
  /// Configures the request-response pair logging on predictions from this
  /// Version.
  GoogleCloudMlV1RequestLoggingConfig requestLoggingConfig;

  /// Required. The AI Platform runtime version to use for this deployment.
  ///
  /// For more information, see the
  /// [runtime version list](/ml-engine/docs/runtime-version-list) and
  /// [how to manage runtime versions](/ml-engine/docs/versioning).
  core.String runtimeVersion;

  /// Optional. Specifies the service account for resource access control.
  core.String serviceAccount;

  /// Output only. The state of a version.
  /// Possible string values are:
  /// - "UNKNOWN" : The version state is unspecified.
  /// - "READY" : The version is ready for prediction.
  /// - "CREATING" : The version is being created. New UpdateVersion and
  /// DeleteVersion
  /// requests will fail if a version is in the CREATING state.
  /// - "FAILED" : The version failed to be created, possibly cancelled.
  /// `error_message` should contain the details of the failure.
  /// - "DELETING" : The version is being deleted. New UpdateVersion and
  /// DeleteVersion
  /// requests will fail if a version is in the DELETING state.
  /// - "UPDATING" : The version is being updated. New UpdateVersion and
  /// DeleteVersion
  /// requests will fail if a version is in the UPDATING state.
  core.String state;

  GoogleCloudMlV1Version();

  GoogleCloudMlV1Version.fromJson(core.Map _json) {
    if (_json.containsKey("acceleratorConfig")) {
      acceleratorConfig = new GoogleCloudMlV1AcceleratorConfig.fromJson(
          _json["acceleratorConfig"]);
    }
    if (_json.containsKey("autoScaling")) {
      autoScaling =
          new GoogleCloudMlV1AutoScaling.fromJson(_json["autoScaling"]);
    }
    if (_json.containsKey("createTime")) {
      createTime = _json["createTime"];
    }
    if (_json.containsKey("deploymentUri")) {
      deploymentUri = _json["deploymentUri"];
    }
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("errorMessage")) {
      errorMessage = _json["errorMessage"];
    }
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("explanationConfig")) {
      explanationConfig = new GoogleCloudMlV1ExplanationConfig.fromJson(
          _json["explanationConfig"]);
    }
    if (_json.containsKey("framework")) {
      framework = _json["framework"];
    }
    if (_json.containsKey("isDefault")) {
      isDefault = _json["isDefault"];
    }
    if (_json.containsKey("labels")) {
      labels = (_json["labels"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("lastUseTime")) {
      lastUseTime = _json["lastUseTime"];
    }
    if (_json.containsKey("machineType")) {
      machineType = _json["machineType"];
    }
    if (_json.containsKey("manualScaling")) {
      manualScaling =
          new GoogleCloudMlV1ManualScaling.fromJson(_json["manualScaling"]);
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("packageUris")) {
      packageUris = (_json["packageUris"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("predictionClass")) {
      predictionClass = _json["predictionClass"];
    }
    if (_json.containsKey("pythonVersion")) {
      pythonVersion = _json["pythonVersion"];
    }
    if (_json.containsKey("requestLoggingConfig")) {
      requestLoggingConfig = new GoogleCloudMlV1RequestLoggingConfig.fromJson(
          _json["requestLoggingConfig"]);
    }
    if (_json.containsKey("runtimeVersion")) {
      runtimeVersion = _json["runtimeVersion"];
    }
    if (_json.containsKey("serviceAccount")) {
      serviceAccount = _json["serviceAccount"];
    }
    if (_json.containsKey("state")) {
      state = _json["state"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (acceleratorConfig != null) {
      _json["acceleratorConfig"] = (acceleratorConfig).toJson();
    }
    if (autoScaling != null) {
      _json["autoScaling"] = (autoScaling).toJson();
    }
    if (createTime != null) {
      _json["createTime"] = createTime;
    }
    if (deploymentUri != null) {
      _json["deploymentUri"] = deploymentUri;
    }
    if (description != null) {
      _json["description"] = description;
    }
    if (errorMessage != null) {
      _json["errorMessage"] = errorMessage;
    }
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (explanationConfig != null) {
      _json["explanationConfig"] = (explanationConfig).toJson();
    }
    if (framework != null) {
      _json["framework"] = framework;
    }
    if (isDefault != null) {
      _json["isDefault"] = isDefault;
    }
    if (labels != null) {
      _json["labels"] = labels;
    }
    if (lastUseTime != null) {
      _json["lastUseTime"] = lastUseTime;
    }
    if (machineType != null) {
      _json["machineType"] = machineType;
    }
    if (manualScaling != null) {
      _json["manualScaling"] = (manualScaling).toJson();
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (packageUris != null) {
      _json["packageUris"] = packageUris;
    }
    if (predictionClass != null) {
      _json["predictionClass"] = predictionClass;
    }
    if (pythonVersion != null) {
      _json["pythonVersion"] = pythonVersion;
    }
    if (requestLoggingConfig != null) {
      _json["requestLoggingConfig"] = (requestLoggingConfig).toJson();
    }
    if (runtimeVersion != null) {
      _json["runtimeVersion"] = runtimeVersion;
    }
    if (serviceAccount != null) {
      _json["serviceAccount"] = serviceAccount;
    }
    if (state != null) {
      _json["state"] = state;
    }
    return _json;
  }
}

/// Attributes credit by computing the XRAI taking advantage
/// of the model's fully differentiable structure. Refer to this paper for
/// more details: https://arxiv.org/abs/1906.02825
/// Currently only implemented for models with natural image inputs.
class GoogleCloudMlV1XraiAttribution {
  /// Number of steps for approximating the path integral.
  /// A good value to start is 50 and gradually increase until the
  /// sum to diff property is met within the desired error range.
  core.int numIntegralSteps;

  GoogleCloudMlV1XraiAttribution();

  GoogleCloudMlV1XraiAttribution.fromJson(core.Map _json) {
    if (_json.containsKey("numIntegralSteps")) {
      numIntegralSteps = _json["numIntegralSteps"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (numIntegralSteps != null) {
      _json["numIntegralSteps"] = numIntegralSteps;
    }
    return _json;
  }
}

/// Specifies the audit configuration for a service.
/// The configuration determines which permission types are logged, and what
/// identities, if any, are exempted from logging.
/// An AuditConfig must have one or more AuditLogConfigs.
///
/// If there are AuditConfigs for both `allServices` and a specific service,
/// the union of the two AuditConfigs is used for that service: the log_types
/// specified in each AuditConfig are enabled, and the exempted_members in each
/// AuditLogConfig are exempted.
///
/// Example Policy with multiple AuditConfigs:
///
///     {
///       "audit_configs": [
///         {
///           "service": "allServices"
///           "audit_log_configs": [
///             {
///               "log_type": "DATA_READ",
///               "exempted_members": [
///                 "user:jose@example.com"
///               ]
///             },
///             {
///               "log_type": "DATA_WRITE",
///             },
///             {
///               "log_type": "ADMIN_READ",
///             }
///           ]
///         },
///         {
///           "service": "sampleservice.googleapis.com"
///           "audit_log_configs": [
///             {
///               "log_type": "DATA_READ",
///             },
///             {
///               "log_type": "DATA_WRITE",
///               "exempted_members": [
///                 "user:aliya@example.com"
///               ]
///             }
///           ]
///         }
///       ]
///     }
///
/// For sampleservice, this policy enables DATA_READ, DATA_WRITE and ADMIN_READ
/// logging. It also exempts jose@example.com from DATA_READ logging, and
/// aliya@example.com from DATA_WRITE logging.
class GoogleIamV1AuditConfig {
  /// The configuration for logging of each type of permission.
  core.List<GoogleIamV1AuditLogConfig> auditLogConfigs;

  /// Specifies a service that will be enabled for audit logging.
  /// For example, `storage.googleapis.com`, `cloudsql.googleapis.com`.
  /// `allServices` is a special value that covers all services.
  core.String service;

  GoogleIamV1AuditConfig();

  GoogleIamV1AuditConfig.fromJson(core.Map _json) {
    if (_json.containsKey("auditLogConfigs")) {
      auditLogConfigs = (_json["auditLogConfigs"] as core.List)
          .map<GoogleIamV1AuditLogConfig>(
              (value) => new GoogleIamV1AuditLogConfig.fromJson(value))
          .toList();
    }
    if (_json.containsKey("service")) {
      service = _json["service"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (auditLogConfigs != null) {
      _json["auditLogConfigs"] =
          auditLogConfigs.map((value) => (value).toJson()).toList();
    }
    if (service != null) {
      _json["service"] = service;
    }
    return _json;
  }
}

/// Provides the configuration for logging a type of permissions.
/// Example:
///
///     {
///       "audit_log_configs": [
///         {
///           "log_type": "DATA_READ",
///           "exempted_members": [
///             "user:jose@example.com"
///           ]
///         },
///         {
///           "log_type": "DATA_WRITE",
///         }
///       ]
///     }
///
/// This enables 'DATA_READ' and 'DATA_WRITE' logging, while exempting
/// jose@example.com from DATA_READ logging.
class GoogleIamV1AuditLogConfig {
  /// Specifies the identities that do not cause logging for this type of
  /// permission.
  /// Follows the same format of Binding.members.
  core.List<core.String> exemptedMembers;

  /// The log type that this config enables.
  /// Possible string values are:
  /// - "LOG_TYPE_UNSPECIFIED" : Default case. Should never be this.
  /// - "ADMIN_READ" : Admin reads. Example: CloudIAM getIamPolicy
  /// - "DATA_WRITE" : Data writes. Example: CloudSQL Users create
  /// - "DATA_READ" : Data reads. Example: CloudSQL Users list
  core.String logType;

  GoogleIamV1AuditLogConfig();

  GoogleIamV1AuditLogConfig.fromJson(core.Map _json) {
    if (_json.containsKey("exemptedMembers")) {
      exemptedMembers =
          (_json["exemptedMembers"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("logType")) {
      logType = _json["logType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (exemptedMembers != null) {
      _json["exemptedMembers"] = exemptedMembers;
    }
    if (logType != null) {
      _json["logType"] = logType;
    }
    return _json;
  }
}

/// Associates `members` with a `role`.
class GoogleIamV1Binding {
  /// The condition that is associated with this binding.
  /// NOTE: An unsatisfied condition will not allow user access via current
  /// binding. Different bindings, including their conditions, are examined
  /// independently.
  GoogleTypeExpr condition;

  /// Specifies the identities requesting access for a Cloud Platform resource.
  /// `members` can have the following values:
  ///
  /// * `allUsers`: A special identifier that represents anyone who is
  ///    on the internet; with or without a Google account.
  ///
  /// * `allAuthenticatedUsers`: A special identifier that represents anyone
  ///    who is authenticated with a Google account or a service account.
  ///
  /// * `user:{emailid}`: An email address that represents a specific Google
  ///    account. For example, `alice@example.com` .
  ///
  ///
  /// * `serviceAccount:{emailid}`: An email address that represents a service
  ///    account. For example, `my-other-app@appspot.gserviceaccount.com`.
  ///
  /// * `group:{emailid}`: An email address that represents a Google group.
  ///    For example, `admins@example.com`.
  ///
  /// * `deleted:user:{emailid}?uid={uniqueid}`: An email address (plus unique
  ///    identifier) representing a user that has been recently deleted. For
  ///    example, `alice@example.com?uid=123456789012345678901`. If the user is
  /// recovered, this value reverts to `user:{emailid}` and the recovered user
  ///    retains the role in the binding.
  ///
  /// * `deleted:serviceAccount:{emailid}?uid={uniqueid}`: An email address
  /// (plus
  /// unique identifier) representing a service account that has been recently
  ///    deleted. For example,
  ///    `my-other-app@appspot.gserviceaccount.com?uid=123456789012345678901`.
  ///    If the service account is undeleted, this value reverts to
  /// `serviceAccount:{emailid}` and the undeleted service account retains the
  ///    role in the binding.
  ///
  /// * `deleted:group:{emailid}?uid={uniqueid}`: An email address (plus unique
  ///    identifier) representing a Google group that has been recently
  /// deleted. For example, `admins@example.com?uid=123456789012345678901`. If
  /// the group is recovered, this value reverts to `group:{emailid}` and the
  ///    recovered group retains the role in the binding.
  ///
  ///
  /// * `domain:{domain}`: The G Suite domain (primary) that represents all the
  ///    users of that domain. For example, `google.com` or `example.com`.
  core.List<core.String> members;

  /// Role that is assigned to `members`.
  /// For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
  core.String role;

  GoogleIamV1Binding();

  GoogleIamV1Binding.fromJson(core.Map _json) {
    if (_json.containsKey("condition")) {
      condition = new GoogleTypeExpr.fromJson(_json["condition"]);
    }
    if (_json.containsKey("members")) {
      members = (_json["members"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("role")) {
      role = _json["role"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (condition != null) {
      _json["condition"] = (condition).toJson();
    }
    if (members != null) {
      _json["members"] = members;
    }
    if (role != null) {
      _json["role"] = role;
    }
    return _json;
  }
}

/// An Identity and Access Management (IAM) policy, which specifies access
/// controls for Google Cloud resources.
///
///
/// A `Policy` is a collection of `bindings`. A `binding` binds one or more
/// `members` to a single `role`. Members can be user accounts, service
/// accounts,
/// Google groups, and domains (such as G Suite). A `role` is a named list of
/// permissions; each `role` can be an IAM predefined role or a user-created
/// custom role.
///
/// Optionally, a `binding` can specify a `condition`, which is a logical
/// expression that allows access to a resource only if the expression evaluates
/// to `true`. A condition can add constraints based on attributes of the
/// request, the resource, or both.
///
/// **JSON example:**
///
///     {
///       "bindings": [
///         {
///           "role": "roles/resourcemanager.organizationAdmin",
///           "members": [
///             "user:mike@example.com",
///             "group:admins@example.com",
///             "domain:google.com",
///             "serviceAccount:my-project-id@appspot.gserviceaccount.com"
///           ]
///         },
///         {
///           "role": "roles/resourcemanager.organizationViewer",
///           "members": ["user:eve@example.com"],
///           "condition": {
///             "title": "expirable access",
///             "description": "Does not grant access after Sep 2020",
/// "expression": "request.time < timestamp('2020-10-01T00:00:00.000Z')",
///           }
///         }
///       ],
///       "etag": "BwWWja0YfJA=",
///       "version": 3
///     }
///
/// **YAML example:**
///
///     bindings:
///     - members:
///       - user:mike@example.com
///       - group:admins@example.com
///       - domain:google.com
///       - serviceAccount:my-project-id@appspot.gserviceaccount.com
///       role: roles/resourcemanager.organizationAdmin
///     - members:
///       - user:eve@example.com
///       role: roles/resourcemanager.organizationViewer
///       condition:
///         title: expirable access
///         description: Does not grant access after Sep 2020
///         expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
///     - etag: BwWWja0YfJA=
///     - version: 3
///
/// For a description of IAM and its features, see the
/// [IAM documentation](https://cloud.google.com/iam/docs/).
class GoogleIamV1Policy {
  /// Specifies cloud audit logging configuration for this policy.
  core.List<GoogleIamV1AuditConfig> auditConfigs;

  /// Associates a list of `members` to a `role`. Optionally, may specify a
  /// `condition` that determines how and when the `bindings` are applied. Each
  /// of the `bindings` must contain at least one member.
  core.List<GoogleIamV1Binding> bindings;

  /// `etag` is used for optimistic concurrency control as a way to help
  /// prevent simultaneous updates of a policy from overwriting each other.
  /// It is strongly suggested that systems make use of the `etag` in the
  /// read-modify-write cycle to perform policy updates in order to avoid race
  /// conditions: An `etag` is returned in the response to `getIamPolicy`, and
  /// systems are expected to put that etag in the request to `setIamPolicy` to
  /// ensure that their change will be applied to the same version of the
  /// policy.
  ///
  /// **Important:** If you use IAM Conditions, you must include the `etag`
  /// field
  /// whenever you call `setIamPolicy`. If you omit this field, then IAM allows
  /// you to overwrite a version `3` policy with a version `1` policy, and all
  /// of
  /// the conditions in the version `3` policy are lost.
  core.String etag;
  core.List<core.int> get etagAsBytes {
    return convert.base64.decode(etag);
  }

  set etagAsBytes(core.List<core.int> _bytes) {
    etag =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  /// Specifies the format of the policy.
  ///
  /// Valid values are `0`, `1`, and `3`. Requests that specify an invalid value
  /// are rejected.
  ///
  /// Any operation that affects conditional role bindings must specify version
  /// `3`. This requirement applies to the following operations:
  ///
  /// * Getting a policy that includes a conditional role binding
  /// * Adding a conditional role binding to a policy
  /// * Changing a conditional role binding in a policy
  /// * Removing any role binding, with or without a condition, from a policy
  ///   that includes conditions
  ///
  /// **Important:** If you use IAM Conditions, you must include the `etag`
  /// field
  /// whenever you call `setIamPolicy`. If you omit this field, then IAM allows
  /// you to overwrite a version `3` policy with a version `1` policy, and all
  /// of
  /// the conditions in the version `3` policy are lost.
  ///
  /// If a policy does not include any conditions, operations on that policy may
  /// specify any valid version or leave the field unset.
  core.int version;

  GoogleIamV1Policy();

  GoogleIamV1Policy.fromJson(core.Map _json) {
    if (_json.containsKey("auditConfigs")) {
      auditConfigs = (_json["auditConfigs"] as core.List)
          .map<GoogleIamV1AuditConfig>(
              (value) => new GoogleIamV1AuditConfig.fromJson(value))
          .toList();
    }
    if (_json.containsKey("bindings")) {
      bindings = (_json["bindings"] as core.List)
          .map<GoogleIamV1Binding>(
              (value) => new GoogleIamV1Binding.fromJson(value))
          .toList();
    }
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("version")) {
      version = _json["version"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (auditConfigs != null) {
      _json["auditConfigs"] =
          auditConfigs.map((value) => (value).toJson()).toList();
    }
    if (bindings != null) {
      _json["bindings"] = bindings.map((value) => (value).toJson()).toList();
    }
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (version != null) {
      _json["version"] = version;
    }
    return _json;
  }
}

/// Request message for `SetIamPolicy` method.
class GoogleIamV1SetIamPolicyRequest {
  /// REQUIRED: The complete policy to be applied to the `resource`. The size of
  /// the policy is limited to a few 10s of KB. An empty policy is a
  /// valid policy but certain Cloud Platform services (such as Projects)
  /// might reject them.
  GoogleIamV1Policy policy;

  /// OPTIONAL: A FieldMask specifying which fields of the policy to modify.
  /// Only
  /// the fields in the mask will be modified. If no mask is provided, the
  /// following default mask is used:
  /// paths: "bindings, etag"
  /// This field is only used by Cloud IAM.
  core.String updateMask;

  GoogleIamV1SetIamPolicyRequest();

  GoogleIamV1SetIamPolicyRequest.fromJson(core.Map _json) {
    if (_json.containsKey("policy")) {
      policy = new GoogleIamV1Policy.fromJson(_json["policy"]);
    }
    if (_json.containsKey("updateMask")) {
      updateMask = _json["updateMask"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (policy != null) {
      _json["policy"] = (policy).toJson();
    }
    if (updateMask != null) {
      _json["updateMask"] = updateMask;
    }
    return _json;
  }
}

/// Request message for `TestIamPermissions` method.
class GoogleIamV1TestIamPermissionsRequest {
  /// The set of permissions to check for the `resource`. Permissions with
  /// wildcards (such as '*' or 'storage.*') are not allowed. For more
  /// information see
  /// [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
  core.List<core.String> permissions;

  GoogleIamV1TestIamPermissionsRequest();

  GoogleIamV1TestIamPermissionsRequest.fromJson(core.Map _json) {
    if (_json.containsKey("permissions")) {
      permissions = (_json["permissions"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (permissions != null) {
      _json["permissions"] = permissions;
    }
    return _json;
  }
}

/// Response message for `TestIamPermissions` method.
class GoogleIamV1TestIamPermissionsResponse {
  /// A subset of `TestPermissionsRequest.permissions` that the caller is
  /// allowed.
  core.List<core.String> permissions;

  GoogleIamV1TestIamPermissionsResponse();

  GoogleIamV1TestIamPermissionsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("permissions")) {
      permissions = (_json["permissions"] as core.List).cast<core.String>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (permissions != null) {
      _json["permissions"] = permissions;
    }
    return _json;
  }
}

/// The response message for Operations.ListOperations.
class GoogleLongrunningListOperationsResponse {
  /// The standard List next-page token.
  core.String nextPageToken;

  /// A list of operations that matches the specified filter in the request.
  core.List<GoogleLongrunningOperation> operations;

  GoogleLongrunningListOperationsResponse();

  GoogleLongrunningListOperationsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("operations")) {
      operations = (_json["operations"] as core.List)
          .map<GoogleLongrunningOperation>(
              (value) => new GoogleLongrunningOperation.fromJson(value))
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

/// This resource represents a long-running operation that is the result of a
/// network API call.
class GoogleLongrunningOperation {
  /// If the value is `false`, it means the operation is still in progress.
  /// If `true`, the operation is completed, and either `error` or `response` is
  /// available.
  core.bool done;

  /// The error result of the operation in case of failure or cancellation.
  GoogleRpcStatus error;

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

  GoogleLongrunningOperation();

  GoogleLongrunningOperation.fromJson(core.Map _json) {
    if (_json.containsKey("done")) {
      done = _json["done"];
    }
    if (_json.containsKey("error")) {
      error = new GoogleRpcStatus.fromJson(_json["error"]);
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

/// A generic empty message that you can re-use to avoid defining duplicated
/// empty messages in your APIs. A typical example is to use it as the request
/// or the response type of an API method. For instance:
///
///     service Foo {
///       rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
///     }
///
/// The JSON representation for `Empty` is empty JSON object `{}`.
class GoogleProtobufEmpty {
  GoogleProtobufEmpty();

  GoogleProtobufEmpty.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
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
class GoogleRpcStatus {
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

  GoogleRpcStatus();

  GoogleRpcStatus.fromJson(core.Map _json) {
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

/// Represents a textual expression in the Common Expression Language (CEL)
/// syntax. CEL is a C-like expression language. The syntax and semantics of CEL
/// are documented at https://github.com/google/cel-spec.
///
/// Example (Comparison):
///
///     title: "Summary size limit"
///     description: "Determines if a summary is less than 100 chars"
///     expression: "document.summary.size() < 100"
///
/// Example (Equality):
///
///     title: "Requestor is owner"
///     description: "Determines if requestor is the document owner"
///     expression: "document.owner == request.auth.claims.email"
///
/// Example (Logic):
///
///     title: "Public documents"
/// description: "Determine whether the document should be publicly visible"
///     expression: "document.type != 'private' && document.type != 'internal'"
///
/// Example (Data Manipulation):
///
///     title: "Notification string"
///     description: "Create a notification string with a timestamp."
///     expression: "'New message received at ' + string(document.create_time)"
///
/// The exact variables and functions that may be referenced within an
/// expression
/// are determined by the service that evaluates it. See the service
/// documentation for additional information.
class GoogleTypeExpr {
  /// Optional. Description of the expression. This is a longer text which
  /// describes the expression, e.g. when hovered over it in a UI.
  core.String description;

  /// Textual representation of an expression in Common Expression Language
  /// syntax.
  core.String expression;

  /// Optional. String indicating the location of the expression for error
  /// reporting, e.g. a file name and a position in the file.
  core.String location;

  /// Optional. Title for the expression, i.e. a short string describing
  /// its purpose. This can be used e.g. in UIs which allow to enter the
  /// expression.
  core.String title;

  GoogleTypeExpr();

  GoogleTypeExpr.fromJson(core.Map _json) {
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("expression")) {
      expression = _json["expression"];
    }
    if (_json.containsKey("location")) {
      location = _json["location"];
    }
    if (_json.containsKey("title")) {
      title = _json["title"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (description != null) {
      _json["description"] = description;
    }
    if (expression != null) {
      _json["expression"] = expression;
    }
    if (location != null) {
      _json["location"] = location;
    }
    if (title != null) {
      _json["title"] = title;
    }
    return _json;
  }
}
