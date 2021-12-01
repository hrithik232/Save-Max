library googleapis.websecurityscanner.v1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/websecurityscanner/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request
          .finalize()
          .transform(convert.utf8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.json.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(core.int status,
    core.Map<core.String, core.String> headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.utf8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterAuthentication = 0;
buildAuthentication() {
  var o = new api.Authentication();
  buildCounterAuthentication++;
  if (buildCounterAuthentication < 3) {
    o.customAccount = buildCustomAccount();
    o.googleAccount = buildGoogleAccount();
    o.iapCredential = buildIapCredential();
  }
  buildCounterAuthentication--;
  return o;
}

checkAuthentication(api.Authentication o) {
  buildCounterAuthentication++;
  if (buildCounterAuthentication < 3) {
    checkCustomAccount(o.customAccount);
    checkGoogleAccount(o.googleAccount);
    checkIapCredential(o.iapCredential);
  }
  buildCounterAuthentication--;
}

core.int buildCounterCrawledUrl = 0;
buildCrawledUrl() {
  var o = new api.CrawledUrl();
  buildCounterCrawledUrl++;
  if (buildCounterCrawledUrl < 3) {
    o.body = "foo";
    o.httpMethod = "foo";
    o.url = "foo";
  }
  buildCounterCrawledUrl--;
  return o;
}

checkCrawledUrl(api.CrawledUrl o) {
  buildCounterCrawledUrl++;
  if (buildCounterCrawledUrl < 3) {
    unittest.expect(o.body, unittest.equals('foo'));
    unittest.expect(o.httpMethod, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterCrawledUrl--;
}

core.int buildCounterCustomAccount = 0;
buildCustomAccount() {
  var o = new api.CustomAccount();
  buildCounterCustomAccount++;
  if (buildCounterCustomAccount < 3) {
    o.loginUrl = "foo";
    o.password = "foo";
    o.username = "foo";
  }
  buildCounterCustomAccount--;
  return o;
}

checkCustomAccount(api.CustomAccount o) {
  buildCounterCustomAccount++;
  if (buildCounterCustomAccount < 3) {
    unittest.expect(o.loginUrl, unittest.equals('foo'));
    unittest.expect(o.password, unittest.equals('foo'));
    unittest.expect(o.username, unittest.equals('foo'));
  }
  buildCounterCustomAccount--;
}

core.int buildCounterEmpty = 0;
buildEmpty() {
  var o = new api.Empty();
  buildCounterEmpty++;
  if (buildCounterEmpty < 3) {}
  buildCounterEmpty--;
  return o;
}

checkEmpty(api.Empty o) {
  buildCounterEmpty++;
  if (buildCounterEmpty < 3) {}
  buildCounterEmpty--;
}

core.int buildCounterFinding = 0;
buildFinding() {
  var o = new api.Finding();
  buildCounterFinding++;
  if (buildCounterFinding < 3) {
    o.body = "foo";
    o.description = "foo";
    o.finalUrl = "foo";
    o.findingType = "foo";
    o.form = buildForm();
    o.frameUrl = "foo";
    o.fuzzedUrl = "foo";
    o.httpMethod = "foo";
    o.name = "foo";
    o.outdatedLibrary = buildOutdatedLibrary();
    o.reproductionUrl = "foo";
    o.severity = "foo";
    o.trackingId = "foo";
    o.violatingResource = buildViolatingResource();
    o.vulnerableHeaders = buildVulnerableHeaders();
    o.vulnerableParameters = buildVulnerableParameters();
    o.xss = buildXss();
  }
  buildCounterFinding--;
  return o;
}

checkFinding(api.Finding o) {
  buildCounterFinding++;
  if (buildCounterFinding < 3) {
    unittest.expect(o.body, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.finalUrl, unittest.equals('foo'));
    unittest.expect(o.findingType, unittest.equals('foo'));
    checkForm(o.form);
    unittest.expect(o.frameUrl, unittest.equals('foo'));
    unittest.expect(o.fuzzedUrl, unittest.equals('foo'));
    unittest.expect(o.httpMethod, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkOutdatedLibrary(o.outdatedLibrary);
    unittest.expect(o.reproductionUrl, unittest.equals('foo'));
    unittest.expect(o.severity, unittest.equals('foo'));
    unittest.expect(o.trackingId, unittest.equals('foo'));
    checkViolatingResource(o.violatingResource);
    checkVulnerableHeaders(o.vulnerableHeaders);
    checkVulnerableParameters(o.vulnerableParameters);
    checkXss(o.xss);
  }
  buildCounterFinding--;
}

core.int buildCounterFindingTypeStats = 0;
buildFindingTypeStats() {
  var o = new api.FindingTypeStats();
  buildCounterFindingTypeStats++;
  if (buildCounterFindingTypeStats < 3) {
    o.findingCount = 42;
    o.findingType = "foo";
  }
  buildCounterFindingTypeStats--;
  return o;
}

checkFindingTypeStats(api.FindingTypeStats o) {
  buildCounterFindingTypeStats++;
  if (buildCounterFindingTypeStats < 3) {
    unittest.expect(o.findingCount, unittest.equals(42));
    unittest.expect(o.findingType, unittest.equals('foo'));
  }
  buildCounterFindingTypeStats--;
}

buildUnnamed824() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed824(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterForm = 0;
buildForm() {
  var o = new api.Form();
  buildCounterForm++;
  if (buildCounterForm < 3) {
    o.actionUri = "foo";
    o.fields = buildUnnamed824();
  }
  buildCounterForm--;
  return o;
}

checkForm(api.Form o) {
  buildCounterForm++;
  if (buildCounterForm < 3) {
    unittest.expect(o.actionUri, unittest.equals('foo'));
    checkUnnamed824(o.fields);
  }
  buildCounterForm--;
}

core.int buildCounterGoogleAccount = 0;
buildGoogleAccount() {
  var o = new api.GoogleAccount();
  buildCounterGoogleAccount++;
  if (buildCounterGoogleAccount < 3) {
    o.password = "foo";
    o.username = "foo";
  }
  buildCounterGoogleAccount--;
  return o;
}

checkGoogleAccount(api.GoogleAccount o) {
  buildCounterGoogleAccount++;
  if (buildCounterGoogleAccount < 3) {
    unittest.expect(o.password, unittest.equals('foo'));
    unittest.expect(o.username, unittest.equals('foo'));
  }
  buildCounterGoogleAccount--;
}

core.int buildCounterHeader = 0;
buildHeader() {
  var o = new api.Header();
  buildCounterHeader++;
  if (buildCounterHeader < 3) {
    o.name = "foo";
    o.value = "foo";
  }
  buildCounterHeader--;
  return o;
}

checkHeader(api.Header o) {
  buildCounterHeader++;
  if (buildCounterHeader < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterHeader--;
}

core.int buildCounterIapCredential = 0;
buildIapCredential() {
  var o = new api.IapCredential();
  buildCounterIapCredential++;
  if (buildCounterIapCredential < 3) {
    o.iapTestServiceAccountInfo = buildIapTestServiceAccountInfo();
  }
  buildCounterIapCredential--;
  return o;
}

checkIapCredential(api.IapCredential o) {
  buildCounterIapCredential++;
  if (buildCounterIapCredential < 3) {
    checkIapTestServiceAccountInfo(o.iapTestServiceAccountInfo);
  }
  buildCounterIapCredential--;
}

core.int buildCounterIapTestServiceAccountInfo = 0;
buildIapTestServiceAccountInfo() {
  var o = new api.IapTestServiceAccountInfo();
  buildCounterIapTestServiceAccountInfo++;
  if (buildCounterIapTestServiceAccountInfo < 3) {
    o.targetAudienceClientId = "foo";
  }
  buildCounterIapTestServiceAccountInfo--;
  return o;
}

checkIapTestServiceAccountInfo(api.IapTestServiceAccountInfo o) {
  buildCounterIapTestServiceAccountInfo++;
  if (buildCounterIapTestServiceAccountInfo < 3) {
    unittest.expect(o.targetAudienceClientId, unittest.equals('foo'));
  }
  buildCounterIapTestServiceAccountInfo--;
}

buildUnnamed825() {
  var o = new core.List<api.CrawledUrl>();
  o.add(buildCrawledUrl());
  o.add(buildCrawledUrl());
  return o;
}

checkUnnamed825(core.List<api.CrawledUrl> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCrawledUrl(o[0]);
  checkCrawledUrl(o[1]);
}

core.int buildCounterListCrawledUrlsResponse = 0;
buildListCrawledUrlsResponse() {
  var o = new api.ListCrawledUrlsResponse();
  buildCounterListCrawledUrlsResponse++;
  if (buildCounterListCrawledUrlsResponse < 3) {
    o.crawledUrls = buildUnnamed825();
    o.nextPageToken = "foo";
  }
  buildCounterListCrawledUrlsResponse--;
  return o;
}

checkListCrawledUrlsResponse(api.ListCrawledUrlsResponse o) {
  buildCounterListCrawledUrlsResponse++;
  if (buildCounterListCrawledUrlsResponse < 3) {
    checkUnnamed825(o.crawledUrls);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListCrawledUrlsResponse--;
}

buildUnnamed826() {
  var o = new core.List<api.FindingTypeStats>();
  o.add(buildFindingTypeStats());
  o.add(buildFindingTypeStats());
  return o;
}

checkUnnamed826(core.List<api.FindingTypeStats> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFindingTypeStats(o[0]);
  checkFindingTypeStats(o[1]);
}

core.int buildCounterListFindingTypeStatsResponse = 0;
buildListFindingTypeStatsResponse() {
  var o = new api.ListFindingTypeStatsResponse();
  buildCounterListFindingTypeStatsResponse++;
  if (buildCounterListFindingTypeStatsResponse < 3) {
    o.findingTypeStats = buildUnnamed826();
  }
  buildCounterListFindingTypeStatsResponse--;
  return o;
}

checkListFindingTypeStatsResponse(api.ListFindingTypeStatsResponse o) {
  buildCounterListFindingTypeStatsResponse++;
  if (buildCounterListFindingTypeStatsResponse < 3) {
    checkUnnamed826(o.findingTypeStats);
  }
  buildCounterListFindingTypeStatsResponse--;
}

buildUnnamed827() {
  var o = new core.List<api.Finding>();
  o.add(buildFinding());
  o.add(buildFinding());
  return o;
}

checkUnnamed827(core.List<api.Finding> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFinding(o[0]);
  checkFinding(o[1]);
}

core.int buildCounterListFindingsResponse = 0;
buildListFindingsResponse() {
  var o = new api.ListFindingsResponse();
  buildCounterListFindingsResponse++;
  if (buildCounterListFindingsResponse < 3) {
    o.findings = buildUnnamed827();
    o.nextPageToken = "foo";
  }
  buildCounterListFindingsResponse--;
  return o;
}

checkListFindingsResponse(api.ListFindingsResponse o) {
  buildCounterListFindingsResponse++;
  if (buildCounterListFindingsResponse < 3) {
    checkUnnamed827(o.findings);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListFindingsResponse--;
}

buildUnnamed828() {
  var o = new core.List<api.ScanConfig>();
  o.add(buildScanConfig());
  o.add(buildScanConfig());
  return o;
}

checkUnnamed828(core.List<api.ScanConfig> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkScanConfig(o[0]);
  checkScanConfig(o[1]);
}

core.int buildCounterListScanConfigsResponse = 0;
buildListScanConfigsResponse() {
  var o = new api.ListScanConfigsResponse();
  buildCounterListScanConfigsResponse++;
  if (buildCounterListScanConfigsResponse < 3) {
    o.nextPageToken = "foo";
    o.scanConfigs = buildUnnamed828();
  }
  buildCounterListScanConfigsResponse--;
  return o;
}

checkListScanConfigsResponse(api.ListScanConfigsResponse o) {
  buildCounterListScanConfigsResponse++;
  if (buildCounterListScanConfigsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed828(o.scanConfigs);
  }
  buildCounterListScanConfigsResponse--;
}

buildUnnamed829() {
  var o = new core.List<api.ScanRun>();
  o.add(buildScanRun());
  o.add(buildScanRun());
  return o;
}

checkUnnamed829(core.List<api.ScanRun> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkScanRun(o[0]);
  checkScanRun(o[1]);
}

core.int buildCounterListScanRunsResponse = 0;
buildListScanRunsResponse() {
  var o = new api.ListScanRunsResponse();
  buildCounterListScanRunsResponse++;
  if (buildCounterListScanRunsResponse < 3) {
    o.nextPageToken = "foo";
    o.scanRuns = buildUnnamed829();
  }
  buildCounterListScanRunsResponse--;
  return o;
}

checkListScanRunsResponse(api.ListScanRunsResponse o) {
  buildCounterListScanRunsResponse++;
  if (buildCounterListScanRunsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed829(o.scanRuns);
  }
  buildCounterListScanRunsResponse--;
}

buildUnnamed830() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed830(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterOutdatedLibrary = 0;
buildOutdatedLibrary() {
  var o = new api.OutdatedLibrary();
  buildCounterOutdatedLibrary++;
  if (buildCounterOutdatedLibrary < 3) {
    o.learnMoreUrls = buildUnnamed830();
    o.libraryName = "foo";
    o.version = "foo";
  }
  buildCounterOutdatedLibrary--;
  return o;
}

checkOutdatedLibrary(api.OutdatedLibrary o) {
  buildCounterOutdatedLibrary++;
  if (buildCounterOutdatedLibrary < 3) {
    checkUnnamed830(o.learnMoreUrls);
    unittest.expect(o.libraryName, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals('foo'));
  }
  buildCounterOutdatedLibrary--;
}

buildUnnamed831() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed831(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed832() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed832(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterScanConfig = 0;
buildScanConfig() {
  var o = new api.ScanConfig();
  buildCounterScanConfig++;
  if (buildCounterScanConfig < 3) {
    o.authentication = buildAuthentication();
    o.blacklistPatterns = buildUnnamed831();
    o.displayName = "foo";
    o.exportToSecurityCommandCenter = "foo";
    o.managedScan = true;
    o.maxQps = 42;
    o.name = "foo";
    o.riskLevel = "foo";
    o.schedule = buildSchedule();
    o.startingUrls = buildUnnamed832();
    o.staticIpScan = true;
    o.userAgent = "foo";
  }
  buildCounterScanConfig--;
  return o;
}

checkScanConfig(api.ScanConfig o) {
  buildCounterScanConfig++;
  if (buildCounterScanConfig < 3) {
    checkAuthentication(o.authentication);
    checkUnnamed831(o.blacklistPatterns);
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.exportToSecurityCommandCenter, unittest.equals('foo'));
    unittest.expect(o.managedScan, unittest.isTrue);
    unittest.expect(o.maxQps, unittest.equals(42));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.riskLevel, unittest.equals('foo'));
    checkSchedule(o.schedule);
    checkUnnamed832(o.startingUrls);
    unittest.expect(o.staticIpScan, unittest.isTrue);
    unittest.expect(o.userAgent, unittest.equals('foo'));
  }
  buildCounterScanConfig--;
}

core.int buildCounterScanConfigError = 0;
buildScanConfigError() {
  var o = new api.ScanConfigError();
  buildCounterScanConfigError++;
  if (buildCounterScanConfigError < 3) {
    o.code = "foo";
    o.fieldName = "foo";
  }
  buildCounterScanConfigError--;
  return o;
}

checkScanConfigError(api.ScanConfigError o) {
  buildCounterScanConfigError++;
  if (buildCounterScanConfigError < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    unittest.expect(o.fieldName, unittest.equals('foo'));
  }
  buildCounterScanConfigError--;
}

buildUnnamed833() {
  var o = new core.List<api.ScanRunWarningTrace>();
  o.add(buildScanRunWarningTrace());
  o.add(buildScanRunWarningTrace());
  return o;
}

checkUnnamed833(core.List<api.ScanRunWarningTrace> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkScanRunWarningTrace(o[0]);
  checkScanRunWarningTrace(o[1]);
}

core.int buildCounterScanRun = 0;
buildScanRun() {
  var o = new api.ScanRun();
  buildCounterScanRun++;
  if (buildCounterScanRun < 3) {
    o.endTime = "foo";
    o.errorTrace = buildScanRunErrorTrace();
    o.executionState = "foo";
    o.hasVulnerabilities = true;
    o.name = "foo";
    o.progressPercent = 42;
    o.resultState = "foo";
    o.startTime = "foo";
    o.urlsCrawledCount = "foo";
    o.urlsTestedCount = "foo";
    o.warningTraces = buildUnnamed833();
  }
  buildCounterScanRun--;
  return o;
}

checkScanRun(api.ScanRun o) {
  buildCounterScanRun++;
  if (buildCounterScanRun < 3) {
    unittest.expect(o.endTime, unittest.equals('foo'));
    checkScanRunErrorTrace(o.errorTrace);
    unittest.expect(o.executionState, unittest.equals('foo'));
    unittest.expect(o.hasVulnerabilities, unittest.isTrue);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.progressPercent, unittest.equals(42));
    unittest.expect(o.resultState, unittest.equals('foo'));
    unittest.expect(o.startTime, unittest.equals('foo'));
    unittest.expect(o.urlsCrawledCount, unittest.equals('foo'));
    unittest.expect(o.urlsTestedCount, unittest.equals('foo'));
    checkUnnamed833(o.warningTraces);
  }
  buildCounterScanRun--;
}

core.int buildCounterScanRunErrorTrace = 0;
buildScanRunErrorTrace() {
  var o = new api.ScanRunErrorTrace();
  buildCounterScanRunErrorTrace++;
  if (buildCounterScanRunErrorTrace < 3) {
    o.code = "foo";
    o.mostCommonHttpErrorCode = 42;
    o.scanConfigError = buildScanConfigError();
  }
  buildCounterScanRunErrorTrace--;
  return o;
}

checkScanRunErrorTrace(api.ScanRunErrorTrace o) {
  buildCounterScanRunErrorTrace++;
  if (buildCounterScanRunErrorTrace < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    unittest.expect(o.mostCommonHttpErrorCode, unittest.equals(42));
    checkScanConfigError(o.scanConfigError);
  }
  buildCounterScanRunErrorTrace--;
}

core.int buildCounterScanRunWarningTrace = 0;
buildScanRunWarningTrace() {
  var o = new api.ScanRunWarningTrace();
  buildCounterScanRunWarningTrace++;
  if (buildCounterScanRunWarningTrace < 3) {
    o.code = "foo";
  }
  buildCounterScanRunWarningTrace--;
  return o;
}

checkScanRunWarningTrace(api.ScanRunWarningTrace o) {
  buildCounterScanRunWarningTrace++;
  if (buildCounterScanRunWarningTrace < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
  }
  buildCounterScanRunWarningTrace--;
}

core.int buildCounterSchedule = 0;
buildSchedule() {
  var o = new api.Schedule();
  buildCounterSchedule++;
  if (buildCounterSchedule < 3) {
    o.intervalDurationDays = 42;
    o.scheduleTime = "foo";
  }
  buildCounterSchedule--;
  return o;
}

checkSchedule(api.Schedule o) {
  buildCounterSchedule++;
  if (buildCounterSchedule < 3) {
    unittest.expect(o.intervalDurationDays, unittest.equals(42));
    unittest.expect(o.scheduleTime, unittest.equals('foo'));
  }
  buildCounterSchedule--;
}

core.int buildCounterStartScanRunRequest = 0;
buildStartScanRunRequest() {
  var o = new api.StartScanRunRequest();
  buildCounterStartScanRunRequest++;
  if (buildCounterStartScanRunRequest < 3) {}
  buildCounterStartScanRunRequest--;
  return o;
}

checkStartScanRunRequest(api.StartScanRunRequest o) {
  buildCounterStartScanRunRequest++;
  if (buildCounterStartScanRunRequest < 3) {}
  buildCounterStartScanRunRequest--;
}

core.int buildCounterStopScanRunRequest = 0;
buildStopScanRunRequest() {
  var o = new api.StopScanRunRequest();
  buildCounterStopScanRunRequest++;
  if (buildCounterStopScanRunRequest < 3) {}
  buildCounterStopScanRunRequest--;
  return o;
}

checkStopScanRunRequest(api.StopScanRunRequest o) {
  buildCounterStopScanRunRequest++;
  if (buildCounterStopScanRunRequest < 3) {}
  buildCounterStopScanRunRequest--;
}

core.int buildCounterViolatingResource = 0;
buildViolatingResource() {
  var o = new api.ViolatingResource();
  buildCounterViolatingResource++;
  if (buildCounterViolatingResource < 3) {
    o.contentType = "foo";
    o.resourceUrl = "foo";
  }
  buildCounterViolatingResource--;
  return o;
}

checkViolatingResource(api.ViolatingResource o) {
  buildCounterViolatingResource++;
  if (buildCounterViolatingResource < 3) {
    unittest.expect(o.contentType, unittest.equals('foo'));
    unittest.expect(o.resourceUrl, unittest.equals('foo'));
  }
  buildCounterViolatingResource--;
}

buildUnnamed834() {
  var o = new core.List<api.Header>();
  o.add(buildHeader());
  o.add(buildHeader());
  return o;
}

checkUnnamed834(core.List<api.Header> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHeader(o[0]);
  checkHeader(o[1]);
}

buildUnnamed835() {
  var o = new core.List<api.Header>();
  o.add(buildHeader());
  o.add(buildHeader());
  return o;
}

checkUnnamed835(core.List<api.Header> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHeader(o[0]);
  checkHeader(o[1]);
}

core.int buildCounterVulnerableHeaders = 0;
buildVulnerableHeaders() {
  var o = new api.VulnerableHeaders();
  buildCounterVulnerableHeaders++;
  if (buildCounterVulnerableHeaders < 3) {
    o.headers = buildUnnamed834();
    o.missingHeaders = buildUnnamed835();
  }
  buildCounterVulnerableHeaders--;
  return o;
}

checkVulnerableHeaders(api.VulnerableHeaders o) {
  buildCounterVulnerableHeaders++;
  if (buildCounterVulnerableHeaders < 3) {
    checkUnnamed834(o.headers);
    checkUnnamed835(o.missingHeaders);
  }
  buildCounterVulnerableHeaders--;
}

buildUnnamed836() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed836(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterVulnerableParameters = 0;
buildVulnerableParameters() {
  var o = new api.VulnerableParameters();
  buildCounterVulnerableParameters++;
  if (buildCounterVulnerableParameters < 3) {
    o.parameterNames = buildUnnamed836();
  }
  buildCounterVulnerableParameters--;
  return o;
}

checkVulnerableParameters(api.VulnerableParameters o) {
  buildCounterVulnerableParameters++;
  if (buildCounterVulnerableParameters < 3) {
    checkUnnamed836(o.parameterNames);
  }
  buildCounterVulnerableParameters--;
}

buildUnnamed837() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed837(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterXss = 0;
buildXss() {
  var o = new api.Xss();
  buildCounterXss++;
  if (buildCounterXss < 3) {
    o.attackVector = "foo";
    o.errorMessage = "foo";
    o.stackTraces = buildUnnamed837();
    o.storedXssSeedingUrl = "foo";
  }
  buildCounterXss--;
  return o;
}

checkXss(api.Xss o) {
  buildCounterXss++;
  if (buildCounterXss < 3) {
    unittest.expect(o.attackVector, unittest.equals('foo'));
    unittest.expect(o.errorMessage, unittest.equals('foo'));
    checkUnnamed837(o.stackTraces);
    unittest.expect(o.storedXssSeedingUrl, unittest.equals('foo'));
  }
  buildCounterXss--;
}

main() {
  unittest.group("obj-schema-Authentication", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuthentication();
      var od = new api.Authentication.fromJson(o.toJson());
      checkAuthentication(od);
    });
  });

  unittest.group("obj-schema-CrawledUrl", () {
    unittest.test("to-json--from-json", () {
      var o = buildCrawledUrl();
      var od = new api.CrawledUrl.fromJson(o.toJson());
      checkCrawledUrl(od);
    });
  });

  unittest.group("obj-schema-CustomAccount", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomAccount();
      var od = new api.CustomAccount.fromJson(o.toJson());
      checkCustomAccount(od);
    });
  });

  unittest.group("obj-schema-Empty", () {
    unittest.test("to-json--from-json", () {
      var o = buildEmpty();
      var od = new api.Empty.fromJson(o.toJson());
      checkEmpty(od);
    });
  });

  unittest.group("obj-schema-Finding", () {
    unittest.test("to-json--from-json", () {
      var o = buildFinding();
      var od = new api.Finding.fromJson(o.toJson());
      checkFinding(od);
    });
  });

  unittest.group("obj-schema-FindingTypeStats", () {
    unittest.test("to-json--from-json", () {
      var o = buildFindingTypeStats();
      var od = new api.FindingTypeStats.fromJson(o.toJson());
      checkFindingTypeStats(od);
    });
  });

  unittest.group("obj-schema-Form", () {
    unittest.test("to-json--from-json", () {
      var o = buildForm();
      var od = new api.Form.fromJson(o.toJson());
      checkForm(od);
    });
  });

  unittest.group("obj-schema-GoogleAccount", () {
    unittest.test("to-json--from-json", () {
      var o = buildGoogleAccount();
      var od = new api.GoogleAccount.fromJson(o.toJson());
      checkGoogleAccount(od);
    });
  });

  unittest.group("obj-schema-Header", () {
    unittest.test("to-json--from-json", () {
      var o = buildHeader();
      var od = new api.Header.fromJson(o.toJson());
      checkHeader(od);
    });
  });

  unittest.group("obj-schema-IapCredential", () {
    unittest.test("to-json--from-json", () {
      var o = buildIapCredential();
      var od = new api.IapCredential.fromJson(o.toJson());
      checkIapCredential(od);
    });
  });

  unittest.group("obj-schema-IapTestServiceAccountInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildIapTestServiceAccountInfo();
      var od = new api.IapTestServiceAccountInfo.fromJson(o.toJson());
      checkIapTestServiceAccountInfo(od);
    });
  });

  unittest.group("obj-schema-ListCrawledUrlsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListCrawledUrlsResponse();
      var od = new api.ListCrawledUrlsResponse.fromJson(o.toJson());
      checkListCrawledUrlsResponse(od);
    });
  });

  unittest.group("obj-schema-ListFindingTypeStatsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListFindingTypeStatsResponse();
      var od = new api.ListFindingTypeStatsResponse.fromJson(o.toJson());
      checkListFindingTypeStatsResponse(od);
    });
  });

  unittest.group("obj-schema-ListFindingsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListFindingsResponse();
      var od = new api.ListFindingsResponse.fromJson(o.toJson());
      checkListFindingsResponse(od);
    });
  });

  unittest.group("obj-schema-ListScanConfigsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListScanConfigsResponse();
      var od = new api.ListScanConfigsResponse.fromJson(o.toJson());
      checkListScanConfigsResponse(od);
    });
  });

  unittest.group("obj-schema-ListScanRunsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListScanRunsResponse();
      var od = new api.ListScanRunsResponse.fromJson(o.toJson());
      checkListScanRunsResponse(od);
    });
  });

  unittest.group("obj-schema-OutdatedLibrary", () {
    unittest.test("to-json--from-json", () {
      var o = buildOutdatedLibrary();
      var od = new api.OutdatedLibrary.fromJson(o.toJson());
      checkOutdatedLibrary(od);
    });
  });

  unittest.group("obj-schema-ScanConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildScanConfig();
      var od = new api.ScanConfig.fromJson(o.toJson());
      checkScanConfig(od);
    });
  });

  unittest.group("obj-schema-ScanConfigError", () {
    unittest.test("to-json--from-json", () {
      var o = buildScanConfigError();
      var od = new api.ScanConfigError.fromJson(o.toJson());
      checkScanConfigError(od);
    });
  });

  unittest.group("obj-schema-ScanRun", () {
    unittest.test("to-json--from-json", () {
      var o = buildScanRun();
      var od = new api.ScanRun.fromJson(o.toJson());
      checkScanRun(od);
    });
  });

  unittest.group("obj-schema-ScanRunErrorTrace", () {
    unittest.test("to-json--from-json", () {
      var o = buildScanRunErrorTrace();
      var od = new api.ScanRunErrorTrace.fromJson(o.toJson());
      checkScanRunErrorTrace(od);
    });
  });

  unittest.group("obj-schema-ScanRunWarningTrace", () {
    unittest.test("to-json--from-json", () {
      var o = buildScanRunWarningTrace();
      var od = new api.ScanRunWarningTrace.fromJson(o.toJson());
      checkScanRunWarningTrace(od);
    });
  });

  unittest.group("obj-schema-Schedule", () {
    unittest.test("to-json--from-json", () {
      var o = buildSchedule();
      var od = new api.Schedule.fromJson(o.toJson());
      checkSchedule(od);
    });
  });

  unittest.group("obj-schema-StartScanRunRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildStartScanRunRequest();
      var od = new api.StartScanRunRequest.fromJson(o.toJson());
      checkStartScanRunRequest(od);
    });
  });

  unittest.group("obj-schema-StopScanRunRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildStopScanRunRequest();
      var od = new api.StopScanRunRequest.fromJson(o.toJson());
      checkStopScanRunRequest(od);
    });
  });

  unittest.group("obj-schema-ViolatingResource", () {
    unittest.test("to-json--from-json", () {
      var o = buildViolatingResource();
      var od = new api.ViolatingResource.fromJson(o.toJson());
      checkViolatingResource(od);
    });
  });

  unittest.group("obj-schema-VulnerableHeaders", () {
    unittest.test("to-json--from-json", () {
      var o = buildVulnerableHeaders();
      var od = new api.VulnerableHeaders.fromJson(o.toJson());
      checkVulnerableHeaders(od);
    });
  });

  unittest.group("obj-schema-VulnerableParameters", () {
    unittest.test("to-json--from-json", () {
      var o = buildVulnerableParameters();
      var od = new api.VulnerableParameters.fromJson(o.toJson());
      checkVulnerableParameters(od);
    });
  });

  unittest.group("obj-schema-Xss", () {
    unittest.test("to-json--from-json", () {
      var o = buildXss();
      var od = new api.Xss.fromJson(o.toJson());
      checkXss(od);
    });
  });

  unittest.group("resource-ProjectsScanConfigsResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsResourceApi res =
          new api.WebsecurityscannerApi(mock).projects.scanConfigs;
      var arg_request = buildScanConfig();
      var arg_parent = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ScanConfig.fromJson(json);
        checkScanConfig(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildScanConfig());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_parent, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkScanConfig(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsResourceApi res =
          new api.WebsecurityscannerApi(mock).projects.scanConfigs;
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsResourceApi res =
          new api.WebsecurityscannerApi(mock).projects.scanConfigs;
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildScanConfig());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkScanConfig(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsResourceApi res =
          new api.WebsecurityscannerApi(mock).projects.scanConfigs;
      var arg_parent = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListScanConfigsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_parent,
              pageSize: arg_pageSize,
              pageToken: arg_pageToken,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListScanConfigsResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsResourceApi res =
          new api.WebsecurityscannerApi(mock).projects.scanConfigs;
      var arg_request = buildScanConfig();
      var arg_name = "foo";
      var arg_updateMask = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ScanConfig.fromJson(json);
        checkScanConfig(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(
            queryMap["updateMask"].first, unittest.equals(arg_updateMask));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildScanConfig());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_name,
              updateMask: arg_updateMask, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkScanConfig(response);
      })));
    });

    unittest.test("method--start", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsResourceApi res =
          new api.WebsecurityscannerApi(mock).projects.scanConfigs;
      var arg_request = buildStartScanRunRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.StartScanRunRequest.fromJson(json);
        checkStartScanRunRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildScanRun());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .start(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkScanRun(response);
      })));
    });
  });

  unittest.group("resource-ProjectsScanConfigsScanRunsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsScanRunsResourceApi res =
          new api.WebsecurityscannerApi(mock).projects.scanConfigs.scanRuns;
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildScanRun());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkScanRun(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsScanRunsResourceApi res =
          new api.WebsecurityscannerApi(mock).projects.scanConfigs.scanRuns;
      var arg_parent = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListScanRunsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_parent,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListScanRunsResponse(response);
      })));
    });

    unittest.test("method--stop", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsScanRunsResourceApi res =
          new api.WebsecurityscannerApi(mock).projects.scanConfigs.scanRuns;
      var arg_request = buildStopScanRunRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.StopScanRunRequest.fromJson(json);
        checkStopScanRunRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildScanRun());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .stop(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkScanRun(response);
      })));
    });
  });

  unittest.group("resource-ProjectsScanConfigsScanRunsCrawledUrlsResourceApi",
      () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsScanRunsCrawledUrlsResourceApi res =
          new api.WebsecurityscannerApi(mock)
              .projects
              .scanConfigs
              .scanRuns
              .crawledUrls;
      var arg_parent = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListCrawledUrlsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_parent,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListCrawledUrlsResponse(response);
      })));
    });
  });

  unittest.group(
      "resource-ProjectsScanConfigsScanRunsFindingTypeStatsResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsScanRunsFindingTypeStatsResourceApi res =
          new api.WebsecurityscannerApi(mock)
              .projects
              .scanConfigs
              .scanRuns
              .findingTypeStats;
      var arg_parent = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListFindingTypeStatsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_parent, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListFindingTypeStatsResponse(response);
      })));
    });
  });

  unittest.group("resource-ProjectsScanConfigsScanRunsFindingsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsScanRunsFindingsResourceApi res =
          new api.WebsecurityscannerApi(mock)
              .projects
              .scanConfigs
              .scanRuns
              .findings;
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFinding());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFinding(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ProjectsScanConfigsScanRunsFindingsResourceApi res =
          new api.WebsecurityscannerApi(mock)
              .projects
              .scanConfigs
              .scanRuns
              .findings;
      var arg_parent = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_filter = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }

        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListFindingsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_parent,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              filter: arg_filter,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListFindingsResponse(response);
      })));
    });
  });
}
