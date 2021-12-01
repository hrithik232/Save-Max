// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: unused_import, unnecessary_cast

library googleapis.adexperiencereport.v1;

import 'dart:core' as core;
import 'dart:async' as async;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client adexperiencereport/v1';

/// Views Ad Experience Report data, and gets a list of sites that have a
/// significant number of annoying ads.
class AdexperiencereportApi {
  final commons.ApiRequester _requester;

  SitesResourceApi get sites => new SitesResourceApi(_requester);
  ViolatingSitesResourceApi get violatingSites =>
      new ViolatingSitesResourceApi(_requester);

  AdexperiencereportApi(http.Client client,
      {core.String rootUrl = "https://adexperiencereport.googleapis.com/",
      core.String servicePath = ""})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class SitesResourceApi {
  final commons.ApiRequester _requester;

  SitesResourceApi(commons.ApiRequester client) : _requester = client;

  /// Gets a site's Ad Experience Report summary.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the site whose summary to get, e.g.
  /// `sites/http%3A%2F%2Fwww.google.com%2F`.
  ///
  /// Format: `sites/{site}`
  /// Value must have pattern "^sites/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [SiteSummaryResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<SiteSummaryResponse> get(core.String name,
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
    return _response.then((data) => new SiteSummaryResponse.fromJson(data));
  }
}

class ViolatingSitesResourceApi {
  final commons.ApiRequester _requester;

  ViolatingSitesResourceApi(commons.ApiRequester client) : _requester = client;

  /// Lists sites that are failing in the Ad Experience Report on at least one
  /// platform.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ViolatingSitesResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ViolatingSitesResponse> list({core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/violatingSites';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ViolatingSitesResponse.fromJson(data));
  }
}

/// A site's Ad Experience Report summary on a single platform.
class PlatformSummary {
  /// The site's Ad Experience Report status on this platform.
  /// Possible string values are:
  /// - "UNKNOWN" : Not reviewed.
  /// - "PASSING" : Passing.
  /// - "WARNING" : Warning. No longer a possible status.
  /// - "FAILING" : Failing.
  core.String betterAdsStatus;

  /// The time at which
  /// [enforcement](https://support.google.com/webtools/answer/7308033) against
  /// the site began or will begin on this platform.
  ///
  /// Not set when the
  /// filter_status
  /// is OFF.
  core.String enforcementTime;

  /// The site's [enforcement
  /// status](https://support.google.com/webtools/answer/7308033) on this
  /// platform.
  /// Possible string values are:
  /// - "UNKNOWN" : N/A.
  /// - "ON" : Ad filtering is on.
  /// - "OFF" : Ad filtering is off.
  /// - "PAUSED" : Ad filtering is paused.
  /// - "PENDING" : Ad filtering is pending.
  core.String filterStatus;

  /// The time at which the site's status last changed on this platform.
  core.String lastChangeTime;

  /// The site's regions on this platform.
  ///
  /// No longer populated, because there is no longer any semantic difference
  /// between sites in different regions.
  core.List<core.String> region;

  /// A link to the full Ad Experience Report for the site on this platform..
  ///
  /// Not set in
  /// ViolatingSitesResponse.
  ///
  /// Note that you must complete the [Search Console verification
  /// process](https://support.google.com/webmasters/answer/9008080) for the
  /// site
  /// before you can access the full report.
  core.String reportUrl;

  /// Whether the site is currently under review on this platform.
  core.bool underReview;

  PlatformSummary();

  PlatformSummary.fromJson(core.Map _json) {
    if (_json.containsKey("betterAdsStatus")) {
      betterAdsStatus = _json["betterAdsStatus"];
    }
    if (_json.containsKey("enforcementTime")) {
      enforcementTime = _json["enforcementTime"];
    }
    if (_json.containsKey("filterStatus")) {
      filterStatus = _json["filterStatus"];
    }
    if (_json.containsKey("lastChangeTime")) {
      lastChangeTime = _json["lastChangeTime"];
    }
    if (_json.containsKey("region")) {
      region = (_json["region"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("reportUrl")) {
      reportUrl = _json["reportUrl"];
    }
    if (_json.containsKey("underReview")) {
      underReview = _json["underReview"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (betterAdsStatus != null) {
      _json["betterAdsStatus"] = betterAdsStatus;
    }
    if (enforcementTime != null) {
      _json["enforcementTime"] = enforcementTime;
    }
    if (filterStatus != null) {
      _json["filterStatus"] = filterStatus;
    }
    if (lastChangeTime != null) {
      _json["lastChangeTime"] = lastChangeTime;
    }
    if (region != null) {
      _json["region"] = region;
    }
    if (reportUrl != null) {
      _json["reportUrl"] = reportUrl;
    }
    if (underReview != null) {
      _json["underReview"] = underReview;
    }
    return _json;
  }
}

/// Response message for GetSiteSummary.
class SiteSummaryResponse {
  /// The site's Ad Experience Report summary on desktop.
  PlatformSummary desktopSummary;

  /// The site's Ad Experience Report summary on mobile.
  PlatformSummary mobileSummary;

  /// The name of the reviewed site, e.g. `google.com`.
  core.String reviewedSite;

  SiteSummaryResponse();

  SiteSummaryResponse.fromJson(core.Map _json) {
    if (_json.containsKey("desktopSummary")) {
      desktopSummary = new PlatformSummary.fromJson(_json["desktopSummary"]);
    }
    if (_json.containsKey("mobileSummary")) {
      mobileSummary = new PlatformSummary.fromJson(_json["mobileSummary"]);
    }
    if (_json.containsKey("reviewedSite")) {
      reviewedSite = _json["reviewedSite"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (desktopSummary != null) {
      _json["desktopSummary"] = (desktopSummary).toJson();
    }
    if (mobileSummary != null) {
      _json["mobileSummary"] = (mobileSummary).toJson();
    }
    if (reviewedSite != null) {
      _json["reviewedSite"] = reviewedSite;
    }
    return _json;
  }
}

/// Response message for ListViolatingSites.
class ViolatingSitesResponse {
  /// The list of violating sites.
  core.List<SiteSummaryResponse> violatingSites;

  ViolatingSitesResponse();

  ViolatingSitesResponse.fromJson(core.Map _json) {
    if (_json.containsKey("violatingSites")) {
      violatingSites = (_json["violatingSites"] as core.List)
          .map<SiteSummaryResponse>(
              (value) => new SiteSummaryResponse.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (violatingSites != null) {
      _json["violatingSites"] =
          violatingSites.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}
