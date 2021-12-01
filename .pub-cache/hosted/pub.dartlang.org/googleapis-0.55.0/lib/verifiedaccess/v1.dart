// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: unused_import, unnecessary_cast

library googleapis.verifiedaccess.v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client verifiedaccess/v1';

/// API for Verified Access chrome extension to provide credential verification
/// for chrome devices connecting to an enterprise network
class VerifiedaccessApi {
  /// Verify your enterprise credentials
  static const VerifiedaccessScope =
      "https://www.googleapis.com/auth/verifiedaccess";

  final commons.ApiRequester _requester;

  ChallengeResourceApi get challenge => new ChallengeResourceApi(_requester);

  VerifiedaccessApi(http.Client client,
      {core.String rootUrl = "https://verifiedaccess.googleapis.com/",
      core.String servicePath = ""})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class ChallengeResourceApi {
  final commons.ApiRequester _requester;

  ChallengeResourceApi(commons.ApiRequester client) : _requester = client;

  /// CreateChallenge API
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Challenge].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Challenge> create(Empty request, {core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/challenge';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Challenge.fromJson(data));
  }

  /// VerifyChallengeResponse API
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [VerifyChallengeResponseResult].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<VerifyChallengeResponseResult> verify(
      VerifyChallengeResponseRequest request,
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
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/challenge:verify';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new VerifyChallengeResponseResult.fromJson(data));
  }
}

/// Result message for VerifiedAccess.CreateChallenge.
class Challenge {
  /// Challenge generated with the old signing key
  /// (this will only be present during key rotation)
  SignedData alternativeChallenge;

  /// Generated challenge
  SignedData challenge;

  Challenge();

  Challenge.fromJson(core.Map _json) {
    if (_json.containsKey("alternativeChallenge")) {
      alternativeChallenge =
          new SignedData.fromJson(_json["alternativeChallenge"]);
    }
    if (_json.containsKey("challenge")) {
      challenge = new SignedData.fromJson(_json["challenge"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (alternativeChallenge != null) {
      _json["alternativeChallenge"] = (alternativeChallenge).toJson();
    }
    if (challenge != null) {
      _json["challenge"] = (challenge).toJson();
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

/// The wrapper message of any data and its signature.
class SignedData {
  /// The data to be signed.
  core.String data;
  core.List<core.int> get dataAsBytes {
    return convert.base64.decode(data);
  }

  set dataAsBytes(core.List<core.int> _bytes) {
    data =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  /// The signature of the data field.
  core.String signature;
  core.List<core.int> get signatureAsBytes {
    return convert.base64.decode(signature);
  }

  set signatureAsBytes(core.List<core.int> _bytes) {
    signature =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  SignedData();

  SignedData.fromJson(core.Map _json) {
    if (_json.containsKey("data")) {
      data = _json["data"];
    }
    if (_json.containsKey("signature")) {
      signature = _json["signature"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (data != null) {
      _json["data"] = data;
    }
    if (signature != null) {
      _json["signature"] = signature;
    }
    return _json;
  }
}

/// signed ChallengeResponse
class VerifyChallengeResponseRequest {
  /// The generated response to the challenge
  SignedData challengeResponse;

  /// Service can optionally provide identity information about the device
  /// or user associated with the key.
  /// For an EMK, this value is the enrolled domain.
  /// For an EUK, this value is the user's email address.
  /// If present, this value will be checked against contents
  /// of the response, and verification will fail if there is no match.
  core.String expectedIdentity;

  VerifyChallengeResponseRequest();

  VerifyChallengeResponseRequest.fromJson(core.Map _json) {
    if (_json.containsKey("challengeResponse")) {
      challengeResponse = new SignedData.fromJson(_json["challengeResponse"]);
    }
    if (_json.containsKey("expectedIdentity")) {
      expectedIdentity = _json["expectedIdentity"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (challengeResponse != null) {
      _json["challengeResponse"] = (challengeResponse).toJson();
    }
    if (expectedIdentity != null) {
      _json["expectedIdentity"] = expectedIdentity;
    }
    return _json;
  }
}

/// Result message for VerifiedAccess.VerifyChallengeResponse.
class VerifyChallengeResponseResult {
  /// Device enrollment id is returned in this field (for the machine response
  /// only).
  core.String deviceEnrollmentId;

  /// Device permanent id is returned in this field (for the machine response
  /// only).
  core.String devicePermanentId;

  /// Certificate Signing Request (in the SPKAC format, base64 encoded) is
  /// returned in this field. This field will be set only if device has included
  /// CSR in its challenge response.
  /// (the option to include CSR is now available for both user and machine
  /// responses)
  core.String signedPublicKeyAndChallenge;

  /// For EMCert check, device permanent id is returned here.
  /// For EUCert check, signed_public_key_and_challenge [base64 encoded]
  /// is returned if present, otherwise empty string is returned.
  /// This field is deprecated, please use device_permanent_id or
  /// signed_public_key_and_challenge fields.
  core.String verificationOutput;

  VerifyChallengeResponseResult();

  VerifyChallengeResponseResult.fromJson(core.Map _json) {
    if (_json.containsKey("deviceEnrollmentId")) {
      deviceEnrollmentId = _json["deviceEnrollmentId"];
    }
    if (_json.containsKey("devicePermanentId")) {
      devicePermanentId = _json["devicePermanentId"];
    }
    if (_json.containsKey("signedPublicKeyAndChallenge")) {
      signedPublicKeyAndChallenge = _json["signedPublicKeyAndChallenge"];
    }
    if (_json.containsKey("verificationOutput")) {
      verificationOutput = _json["verificationOutput"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (deviceEnrollmentId != null) {
      _json["deviceEnrollmentId"] = deviceEnrollmentId;
    }
    if (devicePermanentId != null) {
      _json["devicePermanentId"] = devicePermanentId;
    }
    if (signedPublicKeyAndChallenge != null) {
      _json["signedPublicKeyAndChallenge"] = signedPublicKeyAndChallenge;
    }
    if (verificationOutput != null) {
      _json["verificationOutput"] = verificationOutput;
    }
    return _json;
  }
}
