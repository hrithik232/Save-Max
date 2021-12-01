library googleapis.cloudsearch.v1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/cloudsearch/v1.dart' as api;

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

core.int buildCounterBooleanOperatorOptions = 0;
buildBooleanOperatorOptions() {
  var o = new api.BooleanOperatorOptions();
  buildCounterBooleanOperatorOptions++;
  if (buildCounterBooleanOperatorOptions < 3) {
    o.operatorName = "foo";
  }
  buildCounterBooleanOperatorOptions--;
  return o;
}

checkBooleanOperatorOptions(api.BooleanOperatorOptions o) {
  buildCounterBooleanOperatorOptions++;
  if (buildCounterBooleanOperatorOptions < 3) {
    unittest.expect(o.operatorName, unittest.equals('foo'));
  }
  buildCounterBooleanOperatorOptions--;
}

core.int buildCounterBooleanPropertyOptions = 0;
buildBooleanPropertyOptions() {
  var o = new api.BooleanPropertyOptions();
  buildCounterBooleanPropertyOptions++;
  if (buildCounterBooleanPropertyOptions < 3) {
    o.operatorOptions = buildBooleanOperatorOptions();
  }
  buildCounterBooleanPropertyOptions--;
  return o;
}

checkBooleanPropertyOptions(api.BooleanPropertyOptions o) {
  buildCounterBooleanPropertyOptions++;
  if (buildCounterBooleanPropertyOptions < 3) {
    checkBooleanOperatorOptions(o.operatorOptions);
  }
  buildCounterBooleanPropertyOptions--;
}

core.int buildCounterCheckAccessResponse = 0;
buildCheckAccessResponse() {
  var o = new api.CheckAccessResponse();
  buildCounterCheckAccessResponse++;
  if (buildCounterCheckAccessResponse < 3) {
    o.hasAccess = true;
  }
  buildCounterCheckAccessResponse--;
  return o;
}

checkCheckAccessResponse(api.CheckAccessResponse o) {
  buildCounterCheckAccessResponse++;
  if (buildCounterCheckAccessResponse < 3) {
    unittest.expect(o.hasAccess, unittest.isTrue);
  }
  buildCounterCheckAccessResponse--;
}

buildUnnamed4268() {
  var o = new core.List<api.Filter>();
  o.add(buildFilter());
  o.add(buildFilter());
  return o;
}

checkUnnamed4268(core.List<api.Filter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFilter(o[0]);
  checkFilter(o[1]);
}

core.int buildCounterCompositeFilter = 0;
buildCompositeFilter() {
  var o = new api.CompositeFilter();
  buildCounterCompositeFilter++;
  if (buildCounterCompositeFilter < 3) {
    o.logicOperator = "foo";
    o.subFilters = buildUnnamed4268();
  }
  buildCounterCompositeFilter--;
  return o;
}

checkCompositeFilter(api.CompositeFilter o) {
  buildCounterCompositeFilter++;
  if (buildCounterCompositeFilter < 3) {
    unittest.expect(o.logicOperator, unittest.equals('foo'));
    checkUnnamed4268(o.subFilters);
  }
  buildCounterCompositeFilter--;
}

buildUnnamed4269() {
  var o = new core.List<api.ItemCountByStatus>();
  o.add(buildItemCountByStatus());
  o.add(buildItemCountByStatus());
  return o;
}

checkUnnamed4269(core.List<api.ItemCountByStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkItemCountByStatus(o[0]);
  checkItemCountByStatus(o[1]);
}

core.int buildCounterCustomerIndexStats = 0;
buildCustomerIndexStats() {
  var o = new api.CustomerIndexStats();
  buildCounterCustomerIndexStats++;
  if (buildCounterCustomerIndexStats < 3) {
    o.date = buildDate();
    o.itemCountByStatus = buildUnnamed4269();
  }
  buildCounterCustomerIndexStats--;
  return o;
}

checkCustomerIndexStats(api.CustomerIndexStats o) {
  buildCounterCustomerIndexStats++;
  if (buildCounterCustomerIndexStats < 3) {
    checkDate(o.date);
    checkUnnamed4269(o.itemCountByStatus);
  }
  buildCounterCustomerIndexStats--;
}

buildUnnamed4270() {
  var o = new core.List<api.QueryCountByStatus>();
  o.add(buildQueryCountByStatus());
  o.add(buildQueryCountByStatus());
  return o;
}

checkUnnamed4270(core.List<api.QueryCountByStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQueryCountByStatus(o[0]);
  checkQueryCountByStatus(o[1]);
}

core.int buildCounterCustomerQueryStats = 0;
buildCustomerQueryStats() {
  var o = new api.CustomerQueryStats();
  buildCounterCustomerQueryStats++;
  if (buildCounterCustomerQueryStats < 3) {
    o.date = buildDate();
    o.queryCountByStatus = buildUnnamed4270();
  }
  buildCounterCustomerQueryStats--;
  return o;
}

checkCustomerQueryStats(api.CustomerQueryStats o) {
  buildCounterCustomerQueryStats++;
  if (buildCounterCustomerQueryStats < 3) {
    checkDate(o.date);
    checkUnnamed4270(o.queryCountByStatus);
  }
  buildCounterCustomerQueryStats--;
}

core.int buildCounterCustomerSessionStats = 0;
buildCustomerSessionStats() {
  var o = new api.CustomerSessionStats();
  buildCounterCustomerSessionStats++;
  if (buildCounterCustomerSessionStats < 3) {
    o.date = buildDate();
    o.searchSessionsCount = "foo";
  }
  buildCounterCustomerSessionStats--;
  return o;
}

checkCustomerSessionStats(api.CustomerSessionStats o) {
  buildCounterCustomerSessionStats++;
  if (buildCounterCustomerSessionStats < 3) {
    checkDate(o.date);
    unittest.expect(o.searchSessionsCount, unittest.equals('foo'));
  }
  buildCounterCustomerSessionStats--;
}

core.int buildCounterCustomerUserStats = 0;
buildCustomerUserStats() {
  var o = new api.CustomerUserStats();
  buildCounterCustomerUserStats++;
  if (buildCounterCustomerUserStats < 3) {
    o.date = buildDate();
    o.oneDayActiveUsersCount = "foo";
    o.sevenDaysActiveUsersCount = "foo";
    o.thirtyDaysActiveUsersCount = "foo";
  }
  buildCounterCustomerUserStats--;
  return o;
}

checkCustomerUserStats(api.CustomerUserStats o) {
  buildCounterCustomerUserStats++;
  if (buildCounterCustomerUserStats < 3) {
    checkDate(o.date);
    unittest.expect(o.oneDayActiveUsersCount, unittest.equals('foo'));
    unittest.expect(o.sevenDaysActiveUsersCount, unittest.equals('foo'));
    unittest.expect(o.thirtyDaysActiveUsersCount, unittest.equals('foo'));
  }
  buildCounterCustomerUserStats--;
}

buildUnnamed4271() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4271(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4272() {
  var o = new core.List<api.GSuitePrincipal>();
  o.add(buildGSuitePrincipal());
  o.add(buildGSuitePrincipal());
  return o;
}

checkUnnamed4272(core.List<api.GSuitePrincipal> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkGSuitePrincipal(o[0]);
  checkGSuitePrincipal(o[1]);
}

buildUnnamed4273() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4273(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDataSource = 0;
buildDataSource() {
  var o = new api.DataSource();
  buildCounterDataSource++;
  if (buildCounterDataSource < 3) {
    o.disableModifications = true;
    o.disableServing = true;
    o.displayName = "foo";
    o.indexingServiceAccounts = buildUnnamed4271();
    o.itemsVisibility = buildUnnamed4272();
    o.name = "foo";
    o.operationIds = buildUnnamed4273();
    o.shortName = "foo";
  }
  buildCounterDataSource--;
  return o;
}

checkDataSource(api.DataSource o) {
  buildCounterDataSource++;
  if (buildCounterDataSource < 3) {
    unittest.expect(o.disableModifications, unittest.isTrue);
    unittest.expect(o.disableServing, unittest.isTrue);
    unittest.expect(o.displayName, unittest.equals('foo'));
    checkUnnamed4271(o.indexingServiceAccounts);
    checkUnnamed4272(o.itemsVisibility);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed4273(o.operationIds);
    unittest.expect(o.shortName, unittest.equals('foo'));
  }
  buildCounterDataSource--;
}

buildUnnamed4274() {
  var o = new core.List<api.ItemCountByStatus>();
  o.add(buildItemCountByStatus());
  o.add(buildItemCountByStatus());
  return o;
}

checkUnnamed4274(core.List<api.ItemCountByStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkItemCountByStatus(o[0]);
  checkItemCountByStatus(o[1]);
}

core.int buildCounterDataSourceIndexStats = 0;
buildDataSourceIndexStats() {
  var o = new api.DataSourceIndexStats();
  buildCounterDataSourceIndexStats++;
  if (buildCounterDataSourceIndexStats < 3) {
    o.date = buildDate();
    o.itemCountByStatus = buildUnnamed4274();
  }
  buildCounterDataSourceIndexStats--;
  return o;
}

checkDataSourceIndexStats(api.DataSourceIndexStats o) {
  buildCounterDataSourceIndexStats++;
  if (buildCounterDataSourceIndexStats < 3) {
    checkDate(o.date);
    checkUnnamed4274(o.itemCountByStatus);
  }
  buildCounterDataSourceIndexStats--;
}

buildUnnamed4275() {
  var o = new core.List<api.FilterOptions>();
  o.add(buildFilterOptions());
  o.add(buildFilterOptions());
  return o;
}

checkUnnamed4275(core.List<api.FilterOptions> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFilterOptions(o[0]);
  checkFilterOptions(o[1]);
}

core.int buildCounterDataSourceRestriction = 0;
buildDataSourceRestriction() {
  var o = new api.DataSourceRestriction();
  buildCounterDataSourceRestriction++;
  if (buildCounterDataSourceRestriction < 3) {
    o.filterOptions = buildUnnamed4275();
    o.source = buildSource();
  }
  buildCounterDataSourceRestriction--;
  return o;
}

checkDataSourceRestriction(api.DataSourceRestriction o) {
  buildCounterDataSourceRestriction++;
  if (buildCounterDataSourceRestriction < 3) {
    checkUnnamed4275(o.filterOptions);
    checkSource(o.source);
  }
  buildCounterDataSourceRestriction--;
}

core.int buildCounterDate = 0;
buildDate() {
  var o = new api.Date();
  buildCounterDate++;
  if (buildCounterDate < 3) {
    o.day = 42;
    o.month = 42;
    o.year = 42;
  }
  buildCounterDate--;
  return o;
}

checkDate(api.Date o) {
  buildCounterDate++;
  if (buildCounterDate < 3) {
    unittest.expect(o.day, unittest.equals(42));
    unittest.expect(o.month, unittest.equals(42));
    unittest.expect(o.year, unittest.equals(42));
  }
  buildCounterDate--;
}

core.int buildCounterDateOperatorOptions = 0;
buildDateOperatorOptions() {
  var o = new api.DateOperatorOptions();
  buildCounterDateOperatorOptions++;
  if (buildCounterDateOperatorOptions < 3) {
    o.greaterThanOperatorName = "foo";
    o.lessThanOperatorName = "foo";
    o.operatorName = "foo";
  }
  buildCounterDateOperatorOptions--;
  return o;
}

checkDateOperatorOptions(api.DateOperatorOptions o) {
  buildCounterDateOperatorOptions++;
  if (buildCounterDateOperatorOptions < 3) {
    unittest.expect(o.greaterThanOperatorName, unittest.equals('foo'));
    unittest.expect(o.lessThanOperatorName, unittest.equals('foo'));
    unittest.expect(o.operatorName, unittest.equals('foo'));
  }
  buildCounterDateOperatorOptions--;
}

core.int buildCounterDatePropertyOptions = 0;
buildDatePropertyOptions() {
  var o = new api.DatePropertyOptions();
  buildCounterDatePropertyOptions++;
  if (buildCounterDatePropertyOptions < 3) {
    o.operatorOptions = buildDateOperatorOptions();
  }
  buildCounterDatePropertyOptions--;
  return o;
}

checkDatePropertyOptions(api.DatePropertyOptions o) {
  buildCounterDatePropertyOptions++;
  if (buildCounterDatePropertyOptions < 3) {
    checkDateOperatorOptions(o.operatorOptions);
  }
  buildCounterDatePropertyOptions--;
}

buildUnnamed4276() {
  var o = new core.List<api.Date>();
  o.add(buildDate());
  o.add(buildDate());
  return o;
}

checkUnnamed4276(core.List<api.Date> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDate(o[0]);
  checkDate(o[1]);
}

core.int buildCounterDateValues = 0;
buildDateValues() {
  var o = new api.DateValues();
  buildCounterDateValues++;
  if (buildCounterDateValues < 3) {
    o.values = buildUnnamed4276();
  }
  buildCounterDateValues--;
  return o;
}

checkDateValues(api.DateValues o) {
  buildCounterDateValues++;
  if (buildCounterDateValues < 3) {
    checkUnnamed4276(o.values);
  }
  buildCounterDateValues--;
}

core.int buildCounterDebugOptions = 0;
buildDebugOptions() {
  var o = new api.DebugOptions();
  buildCounterDebugOptions++;
  if (buildCounterDebugOptions < 3) {
    o.enableDebugging = true;
  }
  buildCounterDebugOptions--;
  return o;
}

checkDebugOptions(api.DebugOptions o) {
  buildCounterDebugOptions++;
  if (buildCounterDebugOptions < 3) {
    unittest.expect(o.enableDebugging, unittest.isTrue);
  }
  buildCounterDebugOptions--;
}

core.int buildCounterDeleteQueueItemsRequest = 0;
buildDeleteQueueItemsRequest() {
  var o = new api.DeleteQueueItemsRequest();
  buildCounterDeleteQueueItemsRequest++;
  if (buildCounterDeleteQueueItemsRequest < 3) {
    o.connectorName = "foo";
    o.debugOptions = buildDebugOptions();
    o.queue = "foo";
  }
  buildCounterDeleteQueueItemsRequest--;
  return o;
}

checkDeleteQueueItemsRequest(api.DeleteQueueItemsRequest o) {
  buildCounterDeleteQueueItemsRequest++;
  if (buildCounterDeleteQueueItemsRequest < 3) {
    unittest.expect(o.connectorName, unittest.equals('foo'));
    checkDebugOptions(o.debugOptions);
    unittest.expect(o.queue, unittest.equals('foo'));
  }
  buildCounterDeleteQueueItemsRequest--;
}

core.int buildCounterDisplayedProperty = 0;
buildDisplayedProperty() {
  var o = new api.DisplayedProperty();
  buildCounterDisplayedProperty++;
  if (buildCounterDisplayedProperty < 3) {
    o.propertyName = "foo";
  }
  buildCounterDisplayedProperty--;
  return o;
}

checkDisplayedProperty(api.DisplayedProperty o) {
  buildCounterDisplayedProperty++;
  if (buildCounterDisplayedProperty < 3) {
    unittest.expect(o.propertyName, unittest.equals('foo'));
  }
  buildCounterDisplayedProperty--;
}

core.int buildCounterDoubleOperatorOptions = 0;
buildDoubleOperatorOptions() {
  var o = new api.DoubleOperatorOptions();
  buildCounterDoubleOperatorOptions++;
  if (buildCounterDoubleOperatorOptions < 3) {
    o.operatorName = "foo";
  }
  buildCounterDoubleOperatorOptions--;
  return o;
}

checkDoubleOperatorOptions(api.DoubleOperatorOptions o) {
  buildCounterDoubleOperatorOptions++;
  if (buildCounterDoubleOperatorOptions < 3) {
    unittest.expect(o.operatorName, unittest.equals('foo'));
  }
  buildCounterDoubleOperatorOptions--;
}

core.int buildCounterDoublePropertyOptions = 0;
buildDoublePropertyOptions() {
  var o = new api.DoublePropertyOptions();
  buildCounterDoublePropertyOptions++;
  if (buildCounterDoublePropertyOptions < 3) {
    o.operatorOptions = buildDoubleOperatorOptions();
  }
  buildCounterDoublePropertyOptions--;
  return o;
}

checkDoublePropertyOptions(api.DoublePropertyOptions o) {
  buildCounterDoublePropertyOptions++;
  if (buildCounterDoublePropertyOptions < 3) {
    checkDoubleOperatorOptions(o.operatorOptions);
  }
  buildCounterDoublePropertyOptions--;
}

buildUnnamed4277() {
  var o = new core.List<core.double>();
  o.add(42.0);
  o.add(42.0);
  return o;
}

checkUnnamed4277(core.List<core.double> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals(42.0));
  unittest.expect(o[1], unittest.equals(42.0));
}

core.int buildCounterDoubleValues = 0;
buildDoubleValues() {
  var o = new api.DoubleValues();
  buildCounterDoubleValues++;
  if (buildCounterDoubleValues < 3) {
    o.values = buildUnnamed4277();
  }
  buildCounterDoubleValues--;
  return o;
}

checkDoubleValues(api.DoubleValues o) {
  buildCounterDoubleValues++;
  if (buildCounterDoubleValues < 3) {
    checkUnnamed4277(o.values);
  }
  buildCounterDoubleValues--;
}

core.int buildCounterDriveFollowUpRestrict = 0;
buildDriveFollowUpRestrict() {
  var o = new api.DriveFollowUpRestrict();
  buildCounterDriveFollowUpRestrict++;
  if (buildCounterDriveFollowUpRestrict < 3) {
    o.type = "foo";
  }
  buildCounterDriveFollowUpRestrict--;
  return o;
}

checkDriveFollowUpRestrict(api.DriveFollowUpRestrict o) {
  buildCounterDriveFollowUpRestrict++;
  if (buildCounterDriveFollowUpRestrict < 3) {
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterDriveFollowUpRestrict--;
}

core.int buildCounterDriveLocationRestrict = 0;
buildDriveLocationRestrict() {
  var o = new api.DriveLocationRestrict();
  buildCounterDriveLocationRestrict++;
  if (buildCounterDriveLocationRestrict < 3) {
    o.type = "foo";
  }
  buildCounterDriveLocationRestrict--;
  return o;
}

checkDriveLocationRestrict(api.DriveLocationRestrict o) {
  buildCounterDriveLocationRestrict++;
  if (buildCounterDriveLocationRestrict < 3) {
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterDriveLocationRestrict--;
}

core.int buildCounterDriveMimeTypeRestrict = 0;
buildDriveMimeTypeRestrict() {
  var o = new api.DriveMimeTypeRestrict();
  buildCounterDriveMimeTypeRestrict++;
  if (buildCounterDriveMimeTypeRestrict < 3) {
    o.type = "foo";
  }
  buildCounterDriveMimeTypeRestrict--;
  return o;
}

checkDriveMimeTypeRestrict(api.DriveMimeTypeRestrict o) {
  buildCounterDriveMimeTypeRestrict++;
  if (buildCounterDriveMimeTypeRestrict < 3) {
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterDriveMimeTypeRestrict--;
}

core.int buildCounterDriveTimeSpanRestrict = 0;
buildDriveTimeSpanRestrict() {
  var o = new api.DriveTimeSpanRestrict();
  buildCounterDriveTimeSpanRestrict++;
  if (buildCounterDriveTimeSpanRestrict < 3) {
    o.type = "foo";
  }
  buildCounterDriveTimeSpanRestrict--;
  return o;
}

checkDriveTimeSpanRestrict(api.DriveTimeSpanRestrict o) {
  buildCounterDriveTimeSpanRestrict++;
  if (buildCounterDriveTimeSpanRestrict < 3) {
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterDriveTimeSpanRestrict--;
}

core.int buildCounterEmailAddress = 0;
buildEmailAddress() {
  var o = new api.EmailAddress();
  buildCounterEmailAddress++;
  if (buildCounterEmailAddress < 3) {
    o.emailAddress = "foo";
  }
  buildCounterEmailAddress--;
  return o;
}

checkEmailAddress(api.EmailAddress o) {
  buildCounterEmailAddress++;
  if (buildCounterEmailAddress < 3) {
    unittest.expect(o.emailAddress, unittest.equals('foo'));
  }
  buildCounterEmailAddress--;
}

core.int buildCounterEnumOperatorOptions = 0;
buildEnumOperatorOptions() {
  var o = new api.EnumOperatorOptions();
  buildCounterEnumOperatorOptions++;
  if (buildCounterEnumOperatorOptions < 3) {
    o.operatorName = "foo";
  }
  buildCounterEnumOperatorOptions--;
  return o;
}

checkEnumOperatorOptions(api.EnumOperatorOptions o) {
  buildCounterEnumOperatorOptions++;
  if (buildCounterEnumOperatorOptions < 3) {
    unittest.expect(o.operatorName, unittest.equals('foo'));
  }
  buildCounterEnumOperatorOptions--;
}

buildUnnamed4278() {
  var o = new core.List<api.EnumValuePair>();
  o.add(buildEnumValuePair());
  o.add(buildEnumValuePair());
  return o;
}

checkUnnamed4278(core.List<api.EnumValuePair> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEnumValuePair(o[0]);
  checkEnumValuePair(o[1]);
}

core.int buildCounterEnumPropertyOptions = 0;
buildEnumPropertyOptions() {
  var o = new api.EnumPropertyOptions();
  buildCounterEnumPropertyOptions++;
  if (buildCounterEnumPropertyOptions < 3) {
    o.operatorOptions = buildEnumOperatorOptions();
    o.orderedRanking = "foo";
    o.possibleValues = buildUnnamed4278();
  }
  buildCounterEnumPropertyOptions--;
  return o;
}

checkEnumPropertyOptions(api.EnumPropertyOptions o) {
  buildCounterEnumPropertyOptions++;
  if (buildCounterEnumPropertyOptions < 3) {
    checkEnumOperatorOptions(o.operatorOptions);
    unittest.expect(o.orderedRanking, unittest.equals('foo'));
    checkUnnamed4278(o.possibleValues);
  }
  buildCounterEnumPropertyOptions--;
}

core.int buildCounterEnumValuePair = 0;
buildEnumValuePair() {
  var o = new api.EnumValuePair();
  buildCounterEnumValuePair++;
  if (buildCounterEnumValuePair < 3) {
    o.integerValue = 42;
    o.stringValue = "foo";
  }
  buildCounterEnumValuePair--;
  return o;
}

checkEnumValuePair(api.EnumValuePair o) {
  buildCounterEnumValuePair++;
  if (buildCounterEnumValuePair < 3) {
    unittest.expect(o.integerValue, unittest.equals(42));
    unittest.expect(o.stringValue, unittest.equals('foo'));
  }
  buildCounterEnumValuePair--;
}

buildUnnamed4279() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4279(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterEnumValues = 0;
buildEnumValues() {
  var o = new api.EnumValues();
  buildCounterEnumValues++;
  if (buildCounterEnumValues < 3) {
    o.values = buildUnnamed4279();
  }
  buildCounterEnumValues--;
  return o;
}

checkEnumValues(api.EnumValues o) {
  buildCounterEnumValues++;
  if (buildCounterEnumValues < 3) {
    checkUnnamed4279(o.values);
  }
  buildCounterEnumValues--;
}

buildUnnamed4280() {
  var o = new core.List<api.ErrorMessage>();
  o.add(buildErrorMessage());
  o.add(buildErrorMessage());
  return o;
}

checkUnnamed4280(core.List<api.ErrorMessage> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkErrorMessage(o[0]);
  checkErrorMessage(o[1]);
}

core.int buildCounterErrorInfo = 0;
buildErrorInfo() {
  var o = new api.ErrorInfo();
  buildCounterErrorInfo++;
  if (buildCounterErrorInfo < 3) {
    o.errorMessages = buildUnnamed4280();
  }
  buildCounterErrorInfo--;
  return o;
}

checkErrorInfo(api.ErrorInfo o) {
  buildCounterErrorInfo++;
  if (buildCounterErrorInfo < 3) {
    checkUnnamed4280(o.errorMessages);
  }
  buildCounterErrorInfo--;
}

core.int buildCounterErrorMessage = 0;
buildErrorMessage() {
  var o = new api.ErrorMessage();
  buildCounterErrorMessage++;
  if (buildCounterErrorMessage < 3) {
    o.errorMessage = "foo";
    o.source = buildSource();
  }
  buildCounterErrorMessage--;
  return o;
}

checkErrorMessage(api.ErrorMessage o) {
  buildCounterErrorMessage++;
  if (buildCounterErrorMessage < 3) {
    unittest.expect(o.errorMessage, unittest.equals('foo'));
    checkSource(o.source);
  }
  buildCounterErrorMessage--;
}

core.int buildCounterFacetBucket = 0;
buildFacetBucket() {
  var o = new api.FacetBucket();
  buildCounterFacetBucket++;
  if (buildCounterFacetBucket < 3) {
    o.count = 42;
    o.percentage = 42;
    o.value = buildValue();
  }
  buildCounterFacetBucket--;
  return o;
}

checkFacetBucket(api.FacetBucket o) {
  buildCounterFacetBucket++;
  if (buildCounterFacetBucket < 3) {
    unittest.expect(o.count, unittest.equals(42));
    unittest.expect(o.percentage, unittest.equals(42));
    checkValue(o.value);
  }
  buildCounterFacetBucket--;
}

core.int buildCounterFacetOptions = 0;
buildFacetOptions() {
  var o = new api.FacetOptions();
  buildCounterFacetOptions++;
  if (buildCounterFacetOptions < 3) {
    o.numFacetBuckets = 42;
    o.objectType = "foo";
    o.operatorName = "foo";
    o.sourceName = "foo";
  }
  buildCounterFacetOptions--;
  return o;
}

checkFacetOptions(api.FacetOptions o) {
  buildCounterFacetOptions++;
  if (buildCounterFacetOptions < 3) {
    unittest.expect(o.numFacetBuckets, unittest.equals(42));
    unittest.expect(o.objectType, unittest.equals('foo'));
    unittest.expect(o.operatorName, unittest.equals('foo'));
    unittest.expect(o.sourceName, unittest.equals('foo'));
  }
  buildCounterFacetOptions--;
}

buildUnnamed4281() {
  var o = new core.List<api.FacetBucket>();
  o.add(buildFacetBucket());
  o.add(buildFacetBucket());
  return o;
}

checkUnnamed4281(core.List<api.FacetBucket> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFacetBucket(o[0]);
  checkFacetBucket(o[1]);
}

core.int buildCounterFacetResult = 0;
buildFacetResult() {
  var o = new api.FacetResult();
  buildCounterFacetResult++;
  if (buildCounterFacetResult < 3) {
    o.buckets = buildUnnamed4281();
    o.objectType = "foo";
    o.operatorName = "foo";
    o.sourceName = "foo";
  }
  buildCounterFacetResult--;
  return o;
}

checkFacetResult(api.FacetResult o) {
  buildCounterFacetResult++;
  if (buildCounterFacetResult < 3) {
    checkUnnamed4281(o.buckets);
    unittest.expect(o.objectType, unittest.equals('foo'));
    unittest.expect(o.operatorName, unittest.equals('foo'));
    unittest.expect(o.sourceName, unittest.equals('foo'));
  }
  buildCounterFacetResult--;
}

core.int buildCounterFieldViolation = 0;
buildFieldViolation() {
  var o = new api.FieldViolation();
  buildCounterFieldViolation++;
  if (buildCounterFieldViolation < 3) {
    o.description = "foo";
    o.field = "foo";
  }
  buildCounterFieldViolation--;
  return o;
}

checkFieldViolation(api.FieldViolation o) {
  buildCounterFieldViolation++;
  if (buildCounterFieldViolation < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.field, unittest.equals('foo'));
  }
  buildCounterFieldViolation--;
}

core.int buildCounterFilter = 0;
buildFilter() {
  var o = new api.Filter();
  buildCounterFilter++;
  if (buildCounterFilter < 3) {
    o.compositeFilter = buildCompositeFilter();
    o.valueFilter = buildValueFilter();
  }
  buildCounterFilter--;
  return o;
}

checkFilter(api.Filter o) {
  buildCounterFilter++;
  if (buildCounterFilter < 3) {
    checkCompositeFilter(o.compositeFilter);
    checkValueFilter(o.valueFilter);
  }
  buildCounterFilter--;
}

core.int buildCounterFilterOptions = 0;
buildFilterOptions() {
  var o = new api.FilterOptions();
  buildCounterFilterOptions++;
  if (buildCounterFilterOptions < 3) {
    o.filter = buildFilter();
    o.objectType = "foo";
  }
  buildCounterFilterOptions--;
  return o;
}

checkFilterOptions(api.FilterOptions o) {
  buildCounterFilterOptions++;
  if (buildCounterFilterOptions < 3) {
    checkFilter(o.filter);
    unittest.expect(o.objectType, unittest.equals('foo'));
  }
  buildCounterFilterOptions--;
}

core.int buildCounterFreshnessOptions = 0;
buildFreshnessOptions() {
  var o = new api.FreshnessOptions();
  buildCounterFreshnessOptions++;
  if (buildCounterFreshnessOptions < 3) {
    o.freshnessDuration = "foo";
    o.freshnessProperty = "foo";
  }
  buildCounterFreshnessOptions--;
  return o;
}

checkFreshnessOptions(api.FreshnessOptions o) {
  buildCounterFreshnessOptions++;
  if (buildCounterFreshnessOptions < 3) {
    unittest.expect(o.freshnessDuration, unittest.equals('foo'));
    unittest.expect(o.freshnessProperty, unittest.equals('foo'));
  }
  buildCounterFreshnessOptions--;
}

core.int buildCounterGSuitePrincipal = 0;
buildGSuitePrincipal() {
  var o = new api.GSuitePrincipal();
  buildCounterGSuitePrincipal++;
  if (buildCounterGSuitePrincipal < 3) {
    o.gsuiteDomain = true;
    o.gsuiteGroupEmail = "foo";
    o.gsuiteUserEmail = "foo";
  }
  buildCounterGSuitePrincipal--;
  return o;
}

checkGSuitePrincipal(api.GSuitePrincipal o) {
  buildCounterGSuitePrincipal++;
  if (buildCounterGSuitePrincipal < 3) {
    unittest.expect(o.gsuiteDomain, unittest.isTrue);
    unittest.expect(o.gsuiteGroupEmail, unittest.equals('foo'));
    unittest.expect(o.gsuiteUserEmail, unittest.equals('foo'));
  }
  buildCounterGSuitePrincipal--;
}

buildUnnamed4282() {
  var o = new core.List<api.CustomerIndexStats>();
  o.add(buildCustomerIndexStats());
  o.add(buildCustomerIndexStats());
  return o;
}

checkUnnamed4282(core.List<api.CustomerIndexStats> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomerIndexStats(o[0]);
  checkCustomerIndexStats(o[1]);
}

core.int buildCounterGetCustomerIndexStatsResponse = 0;
buildGetCustomerIndexStatsResponse() {
  var o = new api.GetCustomerIndexStatsResponse();
  buildCounterGetCustomerIndexStatsResponse++;
  if (buildCounterGetCustomerIndexStatsResponse < 3) {
    o.stats = buildUnnamed4282();
  }
  buildCounterGetCustomerIndexStatsResponse--;
  return o;
}

checkGetCustomerIndexStatsResponse(api.GetCustomerIndexStatsResponse o) {
  buildCounterGetCustomerIndexStatsResponse++;
  if (buildCounterGetCustomerIndexStatsResponse < 3) {
    checkUnnamed4282(o.stats);
  }
  buildCounterGetCustomerIndexStatsResponse--;
}

buildUnnamed4283() {
  var o = new core.List<api.CustomerQueryStats>();
  o.add(buildCustomerQueryStats());
  o.add(buildCustomerQueryStats());
  return o;
}

checkUnnamed4283(core.List<api.CustomerQueryStats> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomerQueryStats(o[0]);
  checkCustomerQueryStats(o[1]);
}

core.int buildCounterGetCustomerQueryStatsResponse = 0;
buildGetCustomerQueryStatsResponse() {
  var o = new api.GetCustomerQueryStatsResponse();
  buildCounterGetCustomerQueryStatsResponse++;
  if (buildCounterGetCustomerQueryStatsResponse < 3) {
    o.stats = buildUnnamed4283();
  }
  buildCounterGetCustomerQueryStatsResponse--;
  return o;
}

checkGetCustomerQueryStatsResponse(api.GetCustomerQueryStatsResponse o) {
  buildCounterGetCustomerQueryStatsResponse++;
  if (buildCounterGetCustomerQueryStatsResponse < 3) {
    checkUnnamed4283(o.stats);
  }
  buildCounterGetCustomerQueryStatsResponse--;
}

buildUnnamed4284() {
  var o = new core.List<api.CustomerSessionStats>();
  o.add(buildCustomerSessionStats());
  o.add(buildCustomerSessionStats());
  return o;
}

checkUnnamed4284(core.List<api.CustomerSessionStats> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomerSessionStats(o[0]);
  checkCustomerSessionStats(o[1]);
}

core.int buildCounterGetCustomerSessionStatsResponse = 0;
buildGetCustomerSessionStatsResponse() {
  var o = new api.GetCustomerSessionStatsResponse();
  buildCounterGetCustomerSessionStatsResponse++;
  if (buildCounterGetCustomerSessionStatsResponse < 3) {
    o.stats = buildUnnamed4284();
  }
  buildCounterGetCustomerSessionStatsResponse--;
  return o;
}

checkGetCustomerSessionStatsResponse(api.GetCustomerSessionStatsResponse o) {
  buildCounterGetCustomerSessionStatsResponse++;
  if (buildCounterGetCustomerSessionStatsResponse < 3) {
    checkUnnamed4284(o.stats);
  }
  buildCounterGetCustomerSessionStatsResponse--;
}

buildUnnamed4285() {
  var o = new core.List<api.CustomerUserStats>();
  o.add(buildCustomerUserStats());
  o.add(buildCustomerUserStats());
  return o;
}

checkUnnamed4285(core.List<api.CustomerUserStats> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomerUserStats(o[0]);
  checkCustomerUserStats(o[1]);
}

core.int buildCounterGetCustomerUserStatsResponse = 0;
buildGetCustomerUserStatsResponse() {
  var o = new api.GetCustomerUserStatsResponse();
  buildCounterGetCustomerUserStatsResponse++;
  if (buildCounterGetCustomerUserStatsResponse < 3) {
    o.stats = buildUnnamed4285();
  }
  buildCounterGetCustomerUserStatsResponse--;
  return o;
}

checkGetCustomerUserStatsResponse(api.GetCustomerUserStatsResponse o) {
  buildCounterGetCustomerUserStatsResponse++;
  if (buildCounterGetCustomerUserStatsResponse < 3) {
    checkUnnamed4285(o.stats);
  }
  buildCounterGetCustomerUserStatsResponse--;
}

buildUnnamed4286() {
  var o = new core.List<api.DataSourceIndexStats>();
  o.add(buildDataSourceIndexStats());
  o.add(buildDataSourceIndexStats());
  return o;
}

checkUnnamed4286(core.List<api.DataSourceIndexStats> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDataSourceIndexStats(o[0]);
  checkDataSourceIndexStats(o[1]);
}

core.int buildCounterGetDataSourceIndexStatsResponse = 0;
buildGetDataSourceIndexStatsResponse() {
  var o = new api.GetDataSourceIndexStatsResponse();
  buildCounterGetDataSourceIndexStatsResponse++;
  if (buildCounterGetDataSourceIndexStatsResponse < 3) {
    o.stats = buildUnnamed4286();
  }
  buildCounterGetDataSourceIndexStatsResponse--;
  return o;
}

checkGetDataSourceIndexStatsResponse(api.GetDataSourceIndexStatsResponse o) {
  buildCounterGetDataSourceIndexStatsResponse++;
  if (buildCounterGetDataSourceIndexStatsResponse < 3) {
    checkUnnamed4286(o.stats);
  }
  buildCounterGetDataSourceIndexStatsResponse--;
}

buildUnnamed4287() {
  var o = new core.List<api.SearchApplicationQueryStats>();
  o.add(buildSearchApplicationQueryStats());
  o.add(buildSearchApplicationQueryStats());
  return o;
}

checkUnnamed4287(core.List<api.SearchApplicationQueryStats> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSearchApplicationQueryStats(o[0]);
  checkSearchApplicationQueryStats(o[1]);
}

core.int buildCounterGetSearchApplicationQueryStatsResponse = 0;
buildGetSearchApplicationQueryStatsResponse() {
  var o = new api.GetSearchApplicationQueryStatsResponse();
  buildCounterGetSearchApplicationQueryStatsResponse++;
  if (buildCounterGetSearchApplicationQueryStatsResponse < 3) {
    o.stats = buildUnnamed4287();
  }
  buildCounterGetSearchApplicationQueryStatsResponse--;
  return o;
}

checkGetSearchApplicationQueryStatsResponse(
    api.GetSearchApplicationQueryStatsResponse o) {
  buildCounterGetSearchApplicationQueryStatsResponse++;
  if (buildCounterGetSearchApplicationQueryStatsResponse < 3) {
    checkUnnamed4287(o.stats);
  }
  buildCounterGetSearchApplicationQueryStatsResponse--;
}

buildUnnamed4288() {
  var o = new core.List<api.SearchApplicationSessionStats>();
  o.add(buildSearchApplicationSessionStats());
  o.add(buildSearchApplicationSessionStats());
  return o;
}

checkUnnamed4288(core.List<api.SearchApplicationSessionStats> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSearchApplicationSessionStats(o[0]);
  checkSearchApplicationSessionStats(o[1]);
}

core.int buildCounterGetSearchApplicationSessionStatsResponse = 0;
buildGetSearchApplicationSessionStatsResponse() {
  var o = new api.GetSearchApplicationSessionStatsResponse();
  buildCounterGetSearchApplicationSessionStatsResponse++;
  if (buildCounterGetSearchApplicationSessionStatsResponse < 3) {
    o.stats = buildUnnamed4288();
  }
  buildCounterGetSearchApplicationSessionStatsResponse--;
  return o;
}

checkGetSearchApplicationSessionStatsResponse(
    api.GetSearchApplicationSessionStatsResponse o) {
  buildCounterGetSearchApplicationSessionStatsResponse++;
  if (buildCounterGetSearchApplicationSessionStatsResponse < 3) {
    checkUnnamed4288(o.stats);
  }
  buildCounterGetSearchApplicationSessionStatsResponse--;
}

buildUnnamed4289() {
  var o = new core.List<api.SearchApplicationUserStats>();
  o.add(buildSearchApplicationUserStats());
  o.add(buildSearchApplicationUserStats());
  return o;
}

checkUnnamed4289(core.List<api.SearchApplicationUserStats> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSearchApplicationUserStats(o[0]);
  checkSearchApplicationUserStats(o[1]);
}

core.int buildCounterGetSearchApplicationUserStatsResponse = 0;
buildGetSearchApplicationUserStatsResponse() {
  var o = new api.GetSearchApplicationUserStatsResponse();
  buildCounterGetSearchApplicationUserStatsResponse++;
  if (buildCounterGetSearchApplicationUserStatsResponse < 3) {
    o.stats = buildUnnamed4289();
  }
  buildCounterGetSearchApplicationUserStatsResponse--;
  return o;
}

checkGetSearchApplicationUserStatsResponse(
    api.GetSearchApplicationUserStatsResponse o) {
  buildCounterGetSearchApplicationUserStatsResponse++;
  if (buildCounterGetSearchApplicationUserStatsResponse < 3) {
    checkUnnamed4289(o.stats);
  }
  buildCounterGetSearchApplicationUserStatsResponse--;
}

core.int buildCounterHtmlOperatorOptions = 0;
buildHtmlOperatorOptions() {
  var o = new api.HtmlOperatorOptions();
  buildCounterHtmlOperatorOptions++;
  if (buildCounterHtmlOperatorOptions < 3) {
    o.operatorName = "foo";
  }
  buildCounterHtmlOperatorOptions--;
  return o;
}

checkHtmlOperatorOptions(api.HtmlOperatorOptions o) {
  buildCounterHtmlOperatorOptions++;
  if (buildCounterHtmlOperatorOptions < 3) {
    unittest.expect(o.operatorName, unittest.equals('foo'));
  }
  buildCounterHtmlOperatorOptions--;
}

core.int buildCounterHtmlPropertyOptions = 0;
buildHtmlPropertyOptions() {
  var o = new api.HtmlPropertyOptions();
  buildCounterHtmlPropertyOptions++;
  if (buildCounterHtmlPropertyOptions < 3) {
    o.operatorOptions = buildHtmlOperatorOptions();
    o.retrievalImportance = buildRetrievalImportance();
  }
  buildCounterHtmlPropertyOptions--;
  return o;
}

checkHtmlPropertyOptions(api.HtmlPropertyOptions o) {
  buildCounterHtmlPropertyOptions++;
  if (buildCounterHtmlPropertyOptions < 3) {
    checkHtmlOperatorOptions(o.operatorOptions);
    checkRetrievalImportance(o.retrievalImportance);
  }
  buildCounterHtmlPropertyOptions--;
}

buildUnnamed4290() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4290(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterHtmlValues = 0;
buildHtmlValues() {
  var o = new api.HtmlValues();
  buildCounterHtmlValues++;
  if (buildCounterHtmlValues < 3) {
    o.values = buildUnnamed4290();
  }
  buildCounterHtmlValues--;
  return o;
}

checkHtmlValues(api.HtmlValues o) {
  buildCounterHtmlValues++;
  if (buildCounterHtmlValues < 3) {
    checkUnnamed4290(o.values);
  }
  buildCounterHtmlValues--;
}

core.int buildCounterIndexItemOptions = 0;
buildIndexItemOptions() {
  var o = new api.IndexItemOptions();
  buildCounterIndexItemOptions++;
  if (buildCounterIndexItemOptions < 3) {
    o.allowUnknownGsuitePrincipals = true;
  }
  buildCounterIndexItemOptions--;
  return o;
}

checkIndexItemOptions(api.IndexItemOptions o) {
  buildCounterIndexItemOptions++;
  if (buildCounterIndexItemOptions < 3) {
    unittest.expect(o.allowUnknownGsuitePrincipals, unittest.isTrue);
  }
  buildCounterIndexItemOptions--;
}

core.int buildCounterIndexItemRequest = 0;
buildIndexItemRequest() {
  var o = new api.IndexItemRequest();
  buildCounterIndexItemRequest++;
  if (buildCounterIndexItemRequest < 3) {
    o.connectorName = "foo";
    o.debugOptions = buildDebugOptions();
    o.indexItemOptions = buildIndexItemOptions();
    o.item = buildItem();
    o.mode = "foo";
  }
  buildCounterIndexItemRequest--;
  return o;
}

checkIndexItemRequest(api.IndexItemRequest o) {
  buildCounterIndexItemRequest++;
  if (buildCounterIndexItemRequest < 3) {
    unittest.expect(o.connectorName, unittest.equals('foo'));
    checkDebugOptions(o.debugOptions);
    checkIndexItemOptions(o.indexItemOptions);
    checkItem(o.item);
    unittest.expect(o.mode, unittest.equals('foo'));
  }
  buildCounterIndexItemRequest--;
}

core.int buildCounterIntegerOperatorOptions = 0;
buildIntegerOperatorOptions() {
  var o = new api.IntegerOperatorOptions();
  buildCounterIntegerOperatorOptions++;
  if (buildCounterIntegerOperatorOptions < 3) {
    o.greaterThanOperatorName = "foo";
    o.lessThanOperatorName = "foo";
    o.operatorName = "foo";
  }
  buildCounterIntegerOperatorOptions--;
  return o;
}

checkIntegerOperatorOptions(api.IntegerOperatorOptions o) {
  buildCounterIntegerOperatorOptions++;
  if (buildCounterIntegerOperatorOptions < 3) {
    unittest.expect(o.greaterThanOperatorName, unittest.equals('foo'));
    unittest.expect(o.lessThanOperatorName, unittest.equals('foo'));
    unittest.expect(o.operatorName, unittest.equals('foo'));
  }
  buildCounterIntegerOperatorOptions--;
}

core.int buildCounterIntegerPropertyOptions = 0;
buildIntegerPropertyOptions() {
  var o = new api.IntegerPropertyOptions();
  buildCounterIntegerPropertyOptions++;
  if (buildCounterIntegerPropertyOptions < 3) {
    o.maximumValue = "foo";
    o.minimumValue = "foo";
    o.operatorOptions = buildIntegerOperatorOptions();
    o.orderedRanking = "foo";
  }
  buildCounterIntegerPropertyOptions--;
  return o;
}

checkIntegerPropertyOptions(api.IntegerPropertyOptions o) {
  buildCounterIntegerPropertyOptions++;
  if (buildCounterIntegerPropertyOptions < 3) {
    unittest.expect(o.maximumValue, unittest.equals('foo'));
    unittest.expect(o.minimumValue, unittest.equals('foo'));
    checkIntegerOperatorOptions(o.operatorOptions);
    unittest.expect(o.orderedRanking, unittest.equals('foo'));
  }
  buildCounterIntegerPropertyOptions--;
}

buildUnnamed4291() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4291(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterIntegerValues = 0;
buildIntegerValues() {
  var o = new api.IntegerValues();
  buildCounterIntegerValues++;
  if (buildCounterIntegerValues < 3) {
    o.values = buildUnnamed4291();
  }
  buildCounterIntegerValues--;
  return o;
}

checkIntegerValues(api.IntegerValues o) {
  buildCounterIntegerValues++;
  if (buildCounterIntegerValues < 3) {
    checkUnnamed4291(o.values);
  }
  buildCounterIntegerValues--;
}

core.int buildCounterInteraction = 0;
buildInteraction() {
  var o = new api.Interaction();
  buildCounterInteraction++;
  if (buildCounterInteraction < 3) {
    o.interactionTime = "foo";
    o.principal = buildPrincipal();
    o.type = "foo";
  }
  buildCounterInteraction--;
  return o;
}

checkInteraction(api.Interaction o) {
  buildCounterInteraction++;
  if (buildCounterInteraction < 3) {
    unittest.expect(o.interactionTime, unittest.equals('foo'));
    checkPrincipal(o.principal);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterInteraction--;
}

core.int buildCounterItem = 0;
buildItem() {
  var o = new api.Item();
  buildCounterItem++;
  if (buildCounterItem < 3) {
    o.acl = buildItemAcl();
    o.content = buildItemContent();
    o.itemType = "foo";
    o.metadata = buildItemMetadata();
    o.name = "foo";
    o.payload = "foo";
    o.queue = "foo";
    o.status = buildItemStatus();
    o.structuredData = buildItemStructuredData();
    o.version = "foo";
  }
  buildCounterItem--;
  return o;
}

checkItem(api.Item o) {
  buildCounterItem++;
  if (buildCounterItem < 3) {
    checkItemAcl(o.acl);
    checkItemContent(o.content);
    unittest.expect(o.itemType, unittest.equals('foo'));
    checkItemMetadata(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.payload, unittest.equals('foo'));
    unittest.expect(o.queue, unittest.equals('foo'));
    checkItemStatus(o.status);
    checkItemStructuredData(o.structuredData);
    unittest.expect(o.version, unittest.equals('foo'));
  }
  buildCounterItem--;
}

buildUnnamed4292() {
  var o = new core.List<api.Principal>();
  o.add(buildPrincipal());
  o.add(buildPrincipal());
  return o;
}

checkUnnamed4292(core.List<api.Principal> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPrincipal(o[0]);
  checkPrincipal(o[1]);
}

buildUnnamed4293() {
  var o = new core.List<api.Principal>();
  o.add(buildPrincipal());
  o.add(buildPrincipal());
  return o;
}

checkUnnamed4293(core.List<api.Principal> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPrincipal(o[0]);
  checkPrincipal(o[1]);
}

buildUnnamed4294() {
  var o = new core.List<api.Principal>();
  o.add(buildPrincipal());
  o.add(buildPrincipal());
  return o;
}

checkUnnamed4294(core.List<api.Principal> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPrincipal(o[0]);
  checkPrincipal(o[1]);
}

core.int buildCounterItemAcl = 0;
buildItemAcl() {
  var o = new api.ItemAcl();
  buildCounterItemAcl++;
  if (buildCounterItemAcl < 3) {
    o.aclInheritanceType = "foo";
    o.deniedReaders = buildUnnamed4292();
    o.inheritAclFrom = "foo";
    o.owners = buildUnnamed4293();
    o.readers = buildUnnamed4294();
  }
  buildCounterItemAcl--;
  return o;
}

checkItemAcl(api.ItemAcl o) {
  buildCounterItemAcl++;
  if (buildCounterItemAcl < 3) {
    unittest.expect(o.aclInheritanceType, unittest.equals('foo'));
    checkUnnamed4292(o.deniedReaders);
    unittest.expect(o.inheritAclFrom, unittest.equals('foo'));
    checkUnnamed4293(o.owners);
    checkUnnamed4294(o.readers);
  }
  buildCounterItemAcl--;
}

core.int buildCounterItemContent = 0;
buildItemContent() {
  var o = new api.ItemContent();
  buildCounterItemContent++;
  if (buildCounterItemContent < 3) {
    o.contentDataRef = buildUploadItemRef();
    o.contentFormat = "foo";
    o.hash = "foo";
    o.inlineContent = "foo";
  }
  buildCounterItemContent--;
  return o;
}

checkItemContent(api.ItemContent o) {
  buildCounterItemContent++;
  if (buildCounterItemContent < 3) {
    checkUploadItemRef(o.contentDataRef);
    unittest.expect(o.contentFormat, unittest.equals('foo'));
    unittest.expect(o.hash, unittest.equals('foo'));
    unittest.expect(o.inlineContent, unittest.equals('foo'));
  }
  buildCounterItemContent--;
}

core.int buildCounterItemCountByStatus = 0;
buildItemCountByStatus() {
  var o = new api.ItemCountByStatus();
  buildCounterItemCountByStatus++;
  if (buildCounterItemCountByStatus < 3) {
    o.count = "foo";
    o.statusCode = "foo";
  }
  buildCounterItemCountByStatus--;
  return o;
}

checkItemCountByStatus(api.ItemCountByStatus o) {
  buildCounterItemCountByStatus++;
  if (buildCounterItemCountByStatus < 3) {
    unittest.expect(o.count, unittest.equals('foo'));
    unittest.expect(o.statusCode, unittest.equals('foo'));
  }
  buildCounterItemCountByStatus--;
}

buildUnnamed4295() {
  var o = new core.List<api.Interaction>();
  o.add(buildInteraction());
  o.add(buildInteraction());
  return o;
}

checkUnnamed4295(core.List<api.Interaction> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInteraction(o[0]);
  checkInteraction(o[1]);
}

buildUnnamed4296() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4296(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterItemMetadata = 0;
buildItemMetadata() {
  var o = new api.ItemMetadata();
  buildCounterItemMetadata++;
  if (buildCounterItemMetadata < 3) {
    o.containerName = "foo";
    o.contentLanguage = "foo";
    o.createTime = "foo";
    o.hash = "foo";
    o.interactions = buildUnnamed4295();
    o.keywords = buildUnnamed4296();
    o.mimeType = "foo";
    o.objectType = "foo";
    o.searchQualityMetadata = buildSearchQualityMetadata();
    o.sourceRepositoryUrl = "foo";
    o.title = "foo";
    o.updateTime = "foo";
  }
  buildCounterItemMetadata--;
  return o;
}

checkItemMetadata(api.ItemMetadata o) {
  buildCounterItemMetadata++;
  if (buildCounterItemMetadata < 3) {
    unittest.expect(o.containerName, unittest.equals('foo'));
    unittest.expect(o.contentLanguage, unittest.equals('foo'));
    unittest.expect(o.createTime, unittest.equals('foo'));
    unittest.expect(o.hash, unittest.equals('foo'));
    checkUnnamed4295(o.interactions);
    checkUnnamed4296(o.keywords);
    unittest.expect(o.mimeType, unittest.equals('foo'));
    unittest.expect(o.objectType, unittest.equals('foo'));
    checkSearchQualityMetadata(o.searchQualityMetadata);
    unittest.expect(o.sourceRepositoryUrl, unittest.equals('foo'));
    unittest.expect(o.title, unittest.equals('foo'));
    unittest.expect(o.updateTime, unittest.equals('foo'));
  }
  buildCounterItemMetadata--;
}

buildUnnamed4297() {
  var o = new core.List<api.ProcessingError>();
  o.add(buildProcessingError());
  o.add(buildProcessingError());
  return o;
}

checkUnnamed4297(core.List<api.ProcessingError> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkProcessingError(o[0]);
  checkProcessingError(o[1]);
}

buildUnnamed4298() {
  var o = new core.List<api.RepositoryError>();
  o.add(buildRepositoryError());
  o.add(buildRepositoryError());
  return o;
}

checkUnnamed4298(core.List<api.RepositoryError> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRepositoryError(o[0]);
  checkRepositoryError(o[1]);
}

core.int buildCounterItemStatus = 0;
buildItemStatus() {
  var o = new api.ItemStatus();
  buildCounterItemStatus++;
  if (buildCounterItemStatus < 3) {
    o.code = "foo";
    o.processingErrors = buildUnnamed4297();
    o.repositoryErrors = buildUnnamed4298();
  }
  buildCounterItemStatus--;
  return o;
}

checkItemStatus(api.ItemStatus o) {
  buildCounterItemStatus++;
  if (buildCounterItemStatus < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed4297(o.processingErrors);
    checkUnnamed4298(o.repositoryErrors);
  }
  buildCounterItemStatus--;
}

core.int buildCounterItemStructuredData = 0;
buildItemStructuredData() {
  var o = new api.ItemStructuredData();
  buildCounterItemStructuredData++;
  if (buildCounterItemStructuredData < 3) {
    o.hash = "foo";
    o.object = buildStructuredDataObject();
  }
  buildCounterItemStructuredData--;
  return o;
}

checkItemStructuredData(api.ItemStructuredData o) {
  buildCounterItemStructuredData++;
  if (buildCounterItemStructuredData < 3) {
    unittest.expect(o.hash, unittest.equals('foo'));
    checkStructuredDataObject(o.object);
  }
  buildCounterItemStructuredData--;
}

buildUnnamed4299() {
  var o = new core.List<api.DataSource>();
  o.add(buildDataSource());
  o.add(buildDataSource());
  return o;
}

checkUnnamed4299(core.List<api.DataSource> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDataSource(o[0]);
  checkDataSource(o[1]);
}

core.int buildCounterListDataSourceResponse = 0;
buildListDataSourceResponse() {
  var o = new api.ListDataSourceResponse();
  buildCounterListDataSourceResponse++;
  if (buildCounterListDataSourceResponse < 3) {
    o.nextPageToken = "foo";
    o.sources = buildUnnamed4299();
  }
  buildCounterListDataSourceResponse--;
  return o;
}

checkListDataSourceResponse(api.ListDataSourceResponse o) {
  buildCounterListDataSourceResponse++;
  if (buildCounterListDataSourceResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed4299(o.sources);
  }
  buildCounterListDataSourceResponse--;
}

buildUnnamed4300() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4300(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterListItemNamesForUnmappedIdentityResponse = 0;
buildListItemNamesForUnmappedIdentityResponse() {
  var o = new api.ListItemNamesForUnmappedIdentityResponse();
  buildCounterListItemNamesForUnmappedIdentityResponse++;
  if (buildCounterListItemNamesForUnmappedIdentityResponse < 3) {
    o.itemNames = buildUnnamed4300();
    o.nextPageToken = "foo";
  }
  buildCounterListItemNamesForUnmappedIdentityResponse--;
  return o;
}

checkListItemNamesForUnmappedIdentityResponse(
    api.ListItemNamesForUnmappedIdentityResponse o) {
  buildCounterListItemNamesForUnmappedIdentityResponse++;
  if (buildCounterListItemNamesForUnmappedIdentityResponse < 3) {
    checkUnnamed4300(o.itemNames);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListItemNamesForUnmappedIdentityResponse--;
}

buildUnnamed4301() {
  var o = new core.List<api.Item>();
  o.add(buildItem());
  o.add(buildItem());
  return o;
}

checkUnnamed4301(core.List<api.Item> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkItem(o[0]);
  checkItem(o[1]);
}

core.int buildCounterListItemsResponse = 0;
buildListItemsResponse() {
  var o = new api.ListItemsResponse();
  buildCounterListItemsResponse++;
  if (buildCounterListItemsResponse < 3) {
    o.items = buildUnnamed4301();
    o.nextPageToken = "foo";
  }
  buildCounterListItemsResponse--;
  return o;
}

checkListItemsResponse(api.ListItemsResponse o) {
  buildCounterListItemsResponse++;
  if (buildCounterListItemsResponse < 3) {
    checkUnnamed4301(o.items);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListItemsResponse--;
}

buildUnnamed4302() {
  var o = new core.List<api.QuerySource>();
  o.add(buildQuerySource());
  o.add(buildQuerySource());
  return o;
}

checkUnnamed4302(core.List<api.QuerySource> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQuerySource(o[0]);
  checkQuerySource(o[1]);
}

core.int buildCounterListQuerySourcesResponse = 0;
buildListQuerySourcesResponse() {
  var o = new api.ListQuerySourcesResponse();
  buildCounterListQuerySourcesResponse++;
  if (buildCounterListQuerySourcesResponse < 3) {
    o.nextPageToken = "foo";
    o.sources = buildUnnamed4302();
  }
  buildCounterListQuerySourcesResponse--;
  return o;
}

checkListQuerySourcesResponse(api.ListQuerySourcesResponse o) {
  buildCounterListQuerySourcesResponse++;
  if (buildCounterListQuerySourcesResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed4302(o.sources);
  }
  buildCounterListQuerySourcesResponse--;
}

buildUnnamed4303() {
  var o = new core.List<api.SearchApplication>();
  o.add(buildSearchApplication());
  o.add(buildSearchApplication());
  return o;
}

checkUnnamed4303(core.List<api.SearchApplication> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSearchApplication(o[0]);
  checkSearchApplication(o[1]);
}

core.int buildCounterListSearchApplicationsResponse = 0;
buildListSearchApplicationsResponse() {
  var o = new api.ListSearchApplicationsResponse();
  buildCounterListSearchApplicationsResponse++;
  if (buildCounterListSearchApplicationsResponse < 3) {
    o.nextPageToken = "foo";
    o.searchApplications = buildUnnamed4303();
  }
  buildCounterListSearchApplicationsResponse--;
  return o;
}

checkListSearchApplicationsResponse(api.ListSearchApplicationsResponse o) {
  buildCounterListSearchApplicationsResponse++;
  if (buildCounterListSearchApplicationsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed4303(o.searchApplications);
  }
  buildCounterListSearchApplicationsResponse--;
}

buildUnnamed4304() {
  var o = new core.List<api.UnmappedIdentity>();
  o.add(buildUnmappedIdentity());
  o.add(buildUnmappedIdentity());
  return o;
}

checkUnnamed4304(core.List<api.UnmappedIdentity> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnmappedIdentity(o[0]);
  checkUnmappedIdentity(o[1]);
}

core.int buildCounterListUnmappedIdentitiesResponse = 0;
buildListUnmappedIdentitiesResponse() {
  var o = new api.ListUnmappedIdentitiesResponse();
  buildCounterListUnmappedIdentitiesResponse++;
  if (buildCounterListUnmappedIdentitiesResponse < 3) {
    o.nextPageToken = "foo";
    o.unmappedIdentities = buildUnnamed4304();
  }
  buildCounterListUnmappedIdentitiesResponse--;
  return o;
}

checkListUnmappedIdentitiesResponse(api.ListUnmappedIdentitiesResponse o) {
  buildCounterListUnmappedIdentitiesResponse++;
  if (buildCounterListUnmappedIdentitiesResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed4304(o.unmappedIdentities);
  }
  buildCounterListUnmappedIdentitiesResponse--;
}

core.int buildCounterMatchRange = 0;
buildMatchRange() {
  var o = new api.MatchRange();
  buildCounterMatchRange++;
  if (buildCounterMatchRange < 3) {
    o.end = 42;
    o.start = 42;
  }
  buildCounterMatchRange--;
  return o;
}

checkMatchRange(api.MatchRange o) {
  buildCounterMatchRange++;
  if (buildCounterMatchRange < 3) {
    unittest.expect(o.end, unittest.equals(42));
    unittest.expect(o.start, unittest.equals(42));
  }
  buildCounterMatchRange--;
}

core.int buildCounterMedia = 0;
buildMedia() {
  var o = new api.Media();
  buildCounterMedia++;
  if (buildCounterMedia < 3) {
    o.resourceName = "foo";
  }
  buildCounterMedia--;
  return o;
}

checkMedia(api.Media o) {
  buildCounterMedia++;
  if (buildCounterMedia < 3) {
    unittest.expect(o.resourceName, unittest.equals('foo'));
  }
  buildCounterMedia--;
}

buildUnnamed4305() {
  var o = new core.List<api.NamedProperty>();
  o.add(buildNamedProperty());
  o.add(buildNamedProperty());
  return o;
}

checkUnnamed4305(core.List<api.NamedProperty> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNamedProperty(o[0]);
  checkNamedProperty(o[1]);
}

core.int buildCounterMetadata = 0;
buildMetadata() {
  var o = new api.Metadata();
  buildCounterMetadata++;
  if (buildCounterMetadata < 3) {
    o.createTime = "foo";
    o.displayOptions = buildResultDisplayMetadata();
    o.fields = buildUnnamed4305();
    o.mimeType = "foo";
    o.objectType = "foo";
    o.owner = buildPerson();
    o.source = buildSource();
    o.updateTime = "foo";
  }
  buildCounterMetadata--;
  return o;
}

checkMetadata(api.Metadata o) {
  buildCounterMetadata++;
  if (buildCounterMetadata < 3) {
    unittest.expect(o.createTime, unittest.equals('foo'));
    checkResultDisplayMetadata(o.displayOptions);
    checkUnnamed4305(o.fields);
    unittest.expect(o.mimeType, unittest.equals('foo'));
    unittest.expect(o.objectType, unittest.equals('foo'));
    checkPerson(o.owner);
    checkSource(o.source);
    unittest.expect(o.updateTime, unittest.equals('foo'));
  }
  buildCounterMetadata--;
}

buildUnnamed4306() {
  var o = new core.List<api.DisplayedProperty>();
  o.add(buildDisplayedProperty());
  o.add(buildDisplayedProperty());
  return o;
}

checkUnnamed4306(core.List<api.DisplayedProperty> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDisplayedProperty(o[0]);
  checkDisplayedProperty(o[1]);
}

core.int buildCounterMetaline = 0;
buildMetaline() {
  var o = new api.Metaline();
  buildCounterMetaline++;
  if (buildCounterMetaline < 3) {
    o.properties = buildUnnamed4306();
  }
  buildCounterMetaline--;
  return o;
}

checkMetaline(api.Metaline o) {
  buildCounterMetaline++;
  if (buildCounterMetaline < 3) {
    checkUnnamed4306(o.properties);
  }
  buildCounterMetaline--;
}

core.int buildCounterName = 0;
buildName() {
  var o = new api.Name();
  buildCounterName++;
  if (buildCounterName < 3) {
    o.displayName = "foo";
  }
  buildCounterName--;
  return o;
}

checkName(api.Name o) {
  buildCounterName++;
  if (buildCounterName < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
  }
  buildCounterName--;
}

core.int buildCounterNamedProperty = 0;
buildNamedProperty() {
  var o = new api.NamedProperty();
  buildCounterNamedProperty++;
  if (buildCounterNamedProperty < 3) {
    o.booleanValue = true;
    o.dateValues = buildDateValues();
    o.doubleValues = buildDoubleValues();
    o.enumValues = buildEnumValues();
    o.htmlValues = buildHtmlValues();
    o.integerValues = buildIntegerValues();
    o.name = "foo";
    o.objectValues = buildObjectValues();
    o.textValues = buildTextValues();
    o.timestampValues = buildTimestampValues();
  }
  buildCounterNamedProperty--;
  return o;
}

checkNamedProperty(api.NamedProperty o) {
  buildCounterNamedProperty++;
  if (buildCounterNamedProperty < 3) {
    unittest.expect(o.booleanValue, unittest.isTrue);
    checkDateValues(o.dateValues);
    checkDoubleValues(o.doubleValues);
    checkEnumValues(o.enumValues);
    checkHtmlValues(o.htmlValues);
    checkIntegerValues(o.integerValues);
    unittest.expect(o.name, unittest.equals('foo'));
    checkObjectValues(o.objectValues);
    checkTextValues(o.textValues);
    checkTimestampValues(o.timestampValues);
  }
  buildCounterNamedProperty--;
}

buildUnnamed4307() {
  var o = new core.List<api.PropertyDefinition>();
  o.add(buildPropertyDefinition());
  o.add(buildPropertyDefinition());
  return o;
}

checkUnnamed4307(core.List<api.PropertyDefinition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPropertyDefinition(o[0]);
  checkPropertyDefinition(o[1]);
}

core.int buildCounterObjectDefinition = 0;
buildObjectDefinition() {
  var o = new api.ObjectDefinition();
  buildCounterObjectDefinition++;
  if (buildCounterObjectDefinition < 3) {
    o.name = "foo";
    o.options = buildObjectOptions();
    o.propertyDefinitions = buildUnnamed4307();
  }
  buildCounterObjectDefinition--;
  return o;
}

checkObjectDefinition(api.ObjectDefinition o) {
  buildCounterObjectDefinition++;
  if (buildCounterObjectDefinition < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    checkObjectOptions(o.options);
    checkUnnamed4307(o.propertyDefinitions);
  }
  buildCounterObjectDefinition--;
}

buildUnnamed4308() {
  var o = new core.List<api.Metaline>();
  o.add(buildMetaline());
  o.add(buildMetaline());
  return o;
}

checkUnnamed4308(core.List<api.Metaline> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetaline(o[0]);
  checkMetaline(o[1]);
}

core.int buildCounterObjectDisplayOptions = 0;
buildObjectDisplayOptions() {
  var o = new api.ObjectDisplayOptions();
  buildCounterObjectDisplayOptions++;
  if (buildCounterObjectDisplayOptions < 3) {
    o.metalines = buildUnnamed4308();
    o.objectDisplayLabel = "foo";
  }
  buildCounterObjectDisplayOptions--;
  return o;
}

checkObjectDisplayOptions(api.ObjectDisplayOptions o) {
  buildCounterObjectDisplayOptions++;
  if (buildCounterObjectDisplayOptions < 3) {
    checkUnnamed4308(o.metalines);
    unittest.expect(o.objectDisplayLabel, unittest.equals('foo'));
  }
  buildCounterObjectDisplayOptions--;
}

core.int buildCounterObjectOptions = 0;
buildObjectOptions() {
  var o = new api.ObjectOptions();
  buildCounterObjectOptions++;
  if (buildCounterObjectOptions < 3) {
    o.displayOptions = buildObjectDisplayOptions();
    o.freshnessOptions = buildFreshnessOptions();
  }
  buildCounterObjectOptions--;
  return o;
}

checkObjectOptions(api.ObjectOptions o) {
  buildCounterObjectOptions++;
  if (buildCounterObjectOptions < 3) {
    checkObjectDisplayOptions(o.displayOptions);
    checkFreshnessOptions(o.freshnessOptions);
  }
  buildCounterObjectOptions--;
}

buildUnnamed4309() {
  var o = new core.List<api.PropertyDefinition>();
  o.add(buildPropertyDefinition());
  o.add(buildPropertyDefinition());
  return o;
}

checkUnnamed4309(core.List<api.PropertyDefinition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPropertyDefinition(o[0]);
  checkPropertyDefinition(o[1]);
}

core.int buildCounterObjectPropertyOptions = 0;
buildObjectPropertyOptions() {
  var o = new api.ObjectPropertyOptions();
  buildCounterObjectPropertyOptions++;
  if (buildCounterObjectPropertyOptions < 3) {
    o.subobjectProperties = buildUnnamed4309();
  }
  buildCounterObjectPropertyOptions--;
  return o;
}

checkObjectPropertyOptions(api.ObjectPropertyOptions o) {
  buildCounterObjectPropertyOptions++;
  if (buildCounterObjectPropertyOptions < 3) {
    checkUnnamed4309(o.subobjectProperties);
  }
  buildCounterObjectPropertyOptions--;
}

buildUnnamed4310() {
  var o = new core.List<api.StructuredDataObject>();
  o.add(buildStructuredDataObject());
  o.add(buildStructuredDataObject());
  return o;
}

checkUnnamed4310(core.List<api.StructuredDataObject> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStructuredDataObject(o[0]);
  checkStructuredDataObject(o[1]);
}

core.int buildCounterObjectValues = 0;
buildObjectValues() {
  var o = new api.ObjectValues();
  buildCounterObjectValues++;
  if (buildCounterObjectValues < 3) {
    o.values = buildUnnamed4310();
  }
  buildCounterObjectValues--;
  return o;
}

checkObjectValues(api.ObjectValues o) {
  buildCounterObjectValues++;
  if (buildCounterObjectValues < 3) {
    checkUnnamed4310(o.values);
  }
  buildCounterObjectValues--;
}

buildUnnamed4311() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed4311(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted1 = (o["x"]) as core.Map;
  unittest.expect(casted1, unittest.hasLength(3));
  unittest.expect(casted1["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted1["bool"], unittest.equals(true));
  unittest.expect(casted1["string"], unittest.equals('foo'));
  var casted2 = (o["y"]) as core.Map;
  unittest.expect(casted2, unittest.hasLength(3));
  unittest.expect(casted2["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted2["bool"], unittest.equals(true));
  unittest.expect(casted2["string"], unittest.equals('foo'));
}

buildUnnamed4312() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed4312(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted3 = (o["x"]) as core.Map;
  unittest.expect(casted3, unittest.hasLength(3));
  unittest.expect(casted3["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted3["bool"], unittest.equals(true));
  unittest.expect(casted3["string"], unittest.equals('foo'));
  var casted4 = (o["y"]) as core.Map;
  unittest.expect(casted4, unittest.hasLength(3));
  unittest.expect(casted4["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted4["bool"], unittest.equals(true));
  unittest.expect(casted4["string"], unittest.equals('foo'));
}

core.int buildCounterOperation = 0;
buildOperation() {
  var o = new api.Operation();
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    o.done = true;
    o.error = buildStatus();
    o.metadata = buildUnnamed4311();
    o.name = "foo";
    o.response = buildUnnamed4312();
  }
  buildCounterOperation--;
  return o;
}

checkOperation(api.Operation o) {
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    unittest.expect(o.done, unittest.isTrue);
    checkStatus(o.error);
    checkUnnamed4311(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed4312(o.response);
  }
  buildCounterOperation--;
}

core.int buildCounterPeopleSuggestion = 0;
buildPeopleSuggestion() {
  var o = new api.PeopleSuggestion();
  buildCounterPeopleSuggestion++;
  if (buildCounterPeopleSuggestion < 3) {
    o.person = buildPerson();
  }
  buildCounterPeopleSuggestion--;
  return o;
}

checkPeopleSuggestion(api.PeopleSuggestion o) {
  buildCounterPeopleSuggestion++;
  if (buildCounterPeopleSuggestion < 3) {
    checkPerson(o.person);
  }
  buildCounterPeopleSuggestion--;
}

buildUnnamed4313() {
  var o = new core.List<api.EmailAddress>();
  o.add(buildEmailAddress());
  o.add(buildEmailAddress());
  return o;
}

checkUnnamed4313(core.List<api.EmailAddress> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEmailAddress(o[0]);
  checkEmailAddress(o[1]);
}

buildUnnamed4314() {
  var o = new core.List<api.Name>();
  o.add(buildName());
  o.add(buildName());
  return o;
}

checkUnnamed4314(core.List<api.Name> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkName(o[0]);
  checkName(o[1]);
}

buildUnnamed4315() {
  var o = new core.List<api.Photo>();
  o.add(buildPhoto());
  o.add(buildPhoto());
  return o;
}

checkUnnamed4315(core.List<api.Photo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPhoto(o[0]);
  checkPhoto(o[1]);
}

core.int buildCounterPerson = 0;
buildPerson() {
  var o = new api.Person();
  buildCounterPerson++;
  if (buildCounterPerson < 3) {
    o.emailAddresses = buildUnnamed4313();
    o.name = "foo";
    o.obfuscatedId = "foo";
    o.personNames = buildUnnamed4314();
    o.photos = buildUnnamed4315();
  }
  buildCounterPerson--;
  return o;
}

checkPerson(api.Person o) {
  buildCounterPerson++;
  if (buildCounterPerson < 3) {
    checkUnnamed4313(o.emailAddresses);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.obfuscatedId, unittest.equals('foo'));
    checkUnnamed4314(o.personNames);
    checkUnnamed4315(o.photos);
  }
  buildCounterPerson--;
}

core.int buildCounterPhoto = 0;
buildPhoto() {
  var o = new api.Photo();
  buildCounterPhoto++;
  if (buildCounterPhoto < 3) {
    o.url = "foo";
  }
  buildCounterPhoto--;
  return o;
}

checkPhoto(api.Photo o) {
  buildCounterPhoto++;
  if (buildCounterPhoto < 3) {
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterPhoto--;
}

buildUnnamed4316() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4316(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterPollItemsRequest = 0;
buildPollItemsRequest() {
  var o = new api.PollItemsRequest();
  buildCounterPollItemsRequest++;
  if (buildCounterPollItemsRequest < 3) {
    o.connectorName = "foo";
    o.debugOptions = buildDebugOptions();
    o.limit = 42;
    o.queue = "foo";
    o.statusCodes = buildUnnamed4316();
  }
  buildCounterPollItemsRequest--;
  return o;
}

checkPollItemsRequest(api.PollItemsRequest o) {
  buildCounterPollItemsRequest++;
  if (buildCounterPollItemsRequest < 3) {
    unittest.expect(o.connectorName, unittest.equals('foo'));
    checkDebugOptions(o.debugOptions);
    unittest.expect(o.limit, unittest.equals(42));
    unittest.expect(o.queue, unittest.equals('foo'));
    checkUnnamed4316(o.statusCodes);
  }
  buildCounterPollItemsRequest--;
}

buildUnnamed4317() {
  var o = new core.List<api.Item>();
  o.add(buildItem());
  o.add(buildItem());
  return o;
}

checkUnnamed4317(core.List<api.Item> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkItem(o[0]);
  checkItem(o[1]);
}

core.int buildCounterPollItemsResponse = 0;
buildPollItemsResponse() {
  var o = new api.PollItemsResponse();
  buildCounterPollItemsResponse++;
  if (buildCounterPollItemsResponse < 3) {
    o.items = buildUnnamed4317();
  }
  buildCounterPollItemsResponse--;
  return o;
}

checkPollItemsResponse(api.PollItemsResponse o) {
  buildCounterPollItemsResponse++;
  if (buildCounterPollItemsResponse < 3) {
    checkUnnamed4317(o.items);
  }
  buildCounterPollItemsResponse--;
}

core.int buildCounterPrincipal = 0;
buildPrincipal() {
  var o = new api.Principal();
  buildCounterPrincipal++;
  if (buildCounterPrincipal < 3) {
    o.groupResourceName = "foo";
    o.gsuitePrincipal = buildGSuitePrincipal();
    o.userResourceName = "foo";
  }
  buildCounterPrincipal--;
  return o;
}

checkPrincipal(api.Principal o) {
  buildCounterPrincipal++;
  if (buildCounterPrincipal < 3) {
    unittest.expect(o.groupResourceName, unittest.equals('foo'));
    checkGSuitePrincipal(o.gsuitePrincipal);
    unittest.expect(o.userResourceName, unittest.equals('foo'));
  }
  buildCounterPrincipal--;
}

buildUnnamed4318() {
  var o = new core.List<api.FieldViolation>();
  o.add(buildFieldViolation());
  o.add(buildFieldViolation());
  return o;
}

checkUnnamed4318(core.List<api.FieldViolation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFieldViolation(o[0]);
  checkFieldViolation(o[1]);
}

core.int buildCounterProcessingError = 0;
buildProcessingError() {
  var o = new api.ProcessingError();
  buildCounterProcessingError++;
  if (buildCounterProcessingError < 3) {
    o.code = "foo";
    o.errorMessage = "foo";
    o.fieldViolations = buildUnnamed4318();
  }
  buildCounterProcessingError--;
  return o;
}

checkProcessingError(api.ProcessingError o) {
  buildCounterProcessingError++;
  if (buildCounterProcessingError < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    unittest.expect(o.errorMessage, unittest.equals('foo'));
    checkUnnamed4318(o.fieldViolations);
  }
  buildCounterProcessingError--;
}

core.int buildCounterPropertyDefinition = 0;
buildPropertyDefinition() {
  var o = new api.PropertyDefinition();
  buildCounterPropertyDefinition++;
  if (buildCounterPropertyDefinition < 3) {
    o.booleanPropertyOptions = buildBooleanPropertyOptions();
    o.datePropertyOptions = buildDatePropertyOptions();
    o.displayOptions = buildPropertyDisplayOptions();
    o.doublePropertyOptions = buildDoublePropertyOptions();
    o.enumPropertyOptions = buildEnumPropertyOptions();
    o.htmlPropertyOptions = buildHtmlPropertyOptions();
    o.integerPropertyOptions = buildIntegerPropertyOptions();
    o.isFacetable = true;
    o.isRepeatable = true;
    o.isReturnable = true;
    o.isSortable = true;
    o.isSuggestable = true;
    o.isWildcardSearchable = true;
    o.name = "foo";
    o.objectPropertyOptions = buildObjectPropertyOptions();
    o.textPropertyOptions = buildTextPropertyOptions();
    o.timestampPropertyOptions = buildTimestampPropertyOptions();
  }
  buildCounterPropertyDefinition--;
  return o;
}

checkPropertyDefinition(api.PropertyDefinition o) {
  buildCounterPropertyDefinition++;
  if (buildCounterPropertyDefinition < 3) {
    checkBooleanPropertyOptions(o.booleanPropertyOptions);
    checkDatePropertyOptions(o.datePropertyOptions);
    checkPropertyDisplayOptions(o.displayOptions);
    checkDoublePropertyOptions(o.doublePropertyOptions);
    checkEnumPropertyOptions(o.enumPropertyOptions);
    checkHtmlPropertyOptions(o.htmlPropertyOptions);
    checkIntegerPropertyOptions(o.integerPropertyOptions);
    unittest.expect(o.isFacetable, unittest.isTrue);
    unittest.expect(o.isRepeatable, unittest.isTrue);
    unittest.expect(o.isReturnable, unittest.isTrue);
    unittest.expect(o.isSortable, unittest.isTrue);
    unittest.expect(o.isSuggestable, unittest.isTrue);
    unittest.expect(o.isWildcardSearchable, unittest.isTrue);
    unittest.expect(o.name, unittest.equals('foo'));
    checkObjectPropertyOptions(o.objectPropertyOptions);
    checkTextPropertyOptions(o.textPropertyOptions);
    checkTimestampPropertyOptions(o.timestampPropertyOptions);
  }
  buildCounterPropertyDefinition--;
}

core.int buildCounterPropertyDisplayOptions = 0;
buildPropertyDisplayOptions() {
  var o = new api.PropertyDisplayOptions();
  buildCounterPropertyDisplayOptions++;
  if (buildCounterPropertyDisplayOptions < 3) {
    o.displayLabel = "foo";
  }
  buildCounterPropertyDisplayOptions--;
  return o;
}

checkPropertyDisplayOptions(api.PropertyDisplayOptions o) {
  buildCounterPropertyDisplayOptions++;
  if (buildCounterPropertyDisplayOptions < 3) {
    unittest.expect(o.displayLabel, unittest.equals('foo'));
  }
  buildCounterPropertyDisplayOptions--;
}

core.int buildCounterPushItem = 0;
buildPushItem() {
  var o = new api.PushItem();
  buildCounterPushItem++;
  if (buildCounterPushItem < 3) {
    o.contentHash = "foo";
    o.metadataHash = "foo";
    o.payload = "foo";
    o.queue = "foo";
    o.repositoryError = buildRepositoryError();
    o.structuredDataHash = "foo";
    o.type = "foo";
  }
  buildCounterPushItem--;
  return o;
}

checkPushItem(api.PushItem o) {
  buildCounterPushItem++;
  if (buildCounterPushItem < 3) {
    unittest.expect(o.contentHash, unittest.equals('foo'));
    unittest.expect(o.metadataHash, unittest.equals('foo'));
    unittest.expect(o.payload, unittest.equals('foo'));
    unittest.expect(o.queue, unittest.equals('foo'));
    checkRepositoryError(o.repositoryError);
    unittest.expect(o.structuredDataHash, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterPushItem--;
}

core.int buildCounterPushItemRequest = 0;
buildPushItemRequest() {
  var o = new api.PushItemRequest();
  buildCounterPushItemRequest++;
  if (buildCounterPushItemRequest < 3) {
    o.connectorName = "foo";
    o.debugOptions = buildDebugOptions();
    o.item = buildPushItem();
  }
  buildCounterPushItemRequest--;
  return o;
}

checkPushItemRequest(api.PushItemRequest o) {
  buildCounterPushItemRequest++;
  if (buildCounterPushItemRequest < 3) {
    unittest.expect(o.connectorName, unittest.equals('foo'));
    checkDebugOptions(o.debugOptions);
    checkPushItem(o.item);
  }
  buildCounterPushItemRequest--;
}

core.int buildCounterQueryCountByStatus = 0;
buildQueryCountByStatus() {
  var o = new api.QueryCountByStatus();
  buildCounterQueryCountByStatus++;
  if (buildCounterQueryCountByStatus < 3) {
    o.count = "foo";
    o.statusCode = 42;
  }
  buildCounterQueryCountByStatus--;
  return o;
}

checkQueryCountByStatus(api.QueryCountByStatus o) {
  buildCounterQueryCountByStatus++;
  if (buildCounterQueryCountByStatus < 3) {
    unittest.expect(o.count, unittest.equals('foo'));
    unittest.expect(o.statusCode, unittest.equals(42));
  }
  buildCounterQueryCountByStatus--;
}

core.int buildCounterQueryInterpretation = 0;
buildQueryInterpretation() {
  var o = new api.QueryInterpretation();
  buildCounterQueryInterpretation++;
  if (buildCounterQueryInterpretation < 3) {
    o.interpretationType = "foo";
    o.interpretedQuery = "foo";
    o.reason = "foo";
  }
  buildCounterQueryInterpretation--;
  return o;
}

checkQueryInterpretation(api.QueryInterpretation o) {
  buildCounterQueryInterpretation++;
  if (buildCounterQueryInterpretation < 3) {
    unittest.expect(o.interpretationType, unittest.equals('foo'));
    unittest.expect(o.interpretedQuery, unittest.equals('foo'));
    unittest.expect(o.reason, unittest.equals('foo'));
  }
  buildCounterQueryInterpretation--;
}

core.int buildCounterQueryInterpretationOptions = 0;
buildQueryInterpretationOptions() {
  var o = new api.QueryInterpretationOptions();
  buildCounterQueryInterpretationOptions++;
  if (buildCounterQueryInterpretationOptions < 3) {
    o.disableNlInterpretation = true;
    o.enableVerbatimMode = true;
  }
  buildCounterQueryInterpretationOptions--;
  return o;
}

checkQueryInterpretationOptions(api.QueryInterpretationOptions o) {
  buildCounterQueryInterpretationOptions++;
  if (buildCounterQueryInterpretationOptions < 3) {
    unittest.expect(o.disableNlInterpretation, unittest.isTrue);
    unittest.expect(o.enableVerbatimMode, unittest.isTrue);
  }
  buildCounterQueryInterpretationOptions--;
}

core.int buildCounterQueryItem = 0;
buildQueryItem() {
  var o = new api.QueryItem();
  buildCounterQueryItem++;
  if (buildCounterQueryItem < 3) {
    o.isSynthetic = true;
  }
  buildCounterQueryItem--;
  return o;
}

checkQueryItem(api.QueryItem o) {
  buildCounterQueryItem++;
  if (buildCounterQueryItem < 3) {
    unittest.expect(o.isSynthetic, unittest.isTrue);
  }
  buildCounterQueryItem--;
}

buildUnnamed4319() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4319(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterQueryOperator = 0;
buildQueryOperator() {
  var o = new api.QueryOperator();
  buildCounterQueryOperator++;
  if (buildCounterQueryOperator < 3) {
    o.displayName = "foo";
    o.enumValues = buildUnnamed4319();
    o.greaterThanOperatorName = "foo";
    o.isFacetable = true;
    o.isRepeatable = true;
    o.isReturnable = true;
    o.isSortable = true;
    o.isSuggestable = true;
    o.lessThanOperatorName = "foo";
    o.objectType = "foo";
    o.operatorName = "foo";
    o.type = "foo";
  }
  buildCounterQueryOperator--;
  return o;
}

checkQueryOperator(api.QueryOperator o) {
  buildCounterQueryOperator++;
  if (buildCounterQueryOperator < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    checkUnnamed4319(o.enumValues);
    unittest.expect(o.greaterThanOperatorName, unittest.equals('foo'));
    unittest.expect(o.isFacetable, unittest.isTrue);
    unittest.expect(o.isRepeatable, unittest.isTrue);
    unittest.expect(o.isReturnable, unittest.isTrue);
    unittest.expect(o.isSortable, unittest.isTrue);
    unittest.expect(o.isSuggestable, unittest.isTrue);
    unittest.expect(o.lessThanOperatorName, unittest.equals('foo'));
    unittest.expect(o.objectType, unittest.equals('foo'));
    unittest.expect(o.operatorName, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterQueryOperator--;
}

buildUnnamed4320() {
  var o = new core.List<api.QueryOperator>();
  o.add(buildQueryOperator());
  o.add(buildQueryOperator());
  return o;
}

checkUnnamed4320(core.List<api.QueryOperator> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQueryOperator(o[0]);
  checkQueryOperator(o[1]);
}

core.int buildCounterQuerySource = 0;
buildQuerySource() {
  var o = new api.QuerySource();
  buildCounterQuerySource++;
  if (buildCounterQuerySource < 3) {
    o.displayName = "foo";
    o.operators = buildUnnamed4320();
    o.shortName = "foo";
    o.source = buildSource();
  }
  buildCounterQuerySource--;
  return o;
}

checkQuerySource(api.QuerySource o) {
  buildCounterQuerySource++;
  if (buildCounterQuerySource < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    checkUnnamed4320(o.operators);
    unittest.expect(o.shortName, unittest.equals('foo'));
    checkSource(o.source);
  }
  buildCounterQuerySource--;
}

core.int buildCounterQuerySuggestion = 0;
buildQuerySuggestion() {
  var o = new api.QuerySuggestion();
  buildCounterQuerySuggestion++;
  if (buildCounterQuerySuggestion < 3) {}
  buildCounterQuerySuggestion--;
  return o;
}

checkQuerySuggestion(api.QuerySuggestion o) {
  buildCounterQuerySuggestion++;
  if (buildCounterQuerySuggestion < 3) {}
  buildCounterQuerySuggestion--;
}

core.int buildCounterRepositoryError = 0;
buildRepositoryError() {
  var o = new api.RepositoryError();
  buildCounterRepositoryError++;
  if (buildCounterRepositoryError < 3) {
    o.errorMessage = "foo";
    o.httpStatusCode = 42;
    o.type = "foo";
  }
  buildCounterRepositoryError--;
  return o;
}

checkRepositoryError(api.RepositoryError o) {
  buildCounterRepositoryError++;
  if (buildCounterRepositoryError < 3) {
    unittest.expect(o.errorMessage, unittest.equals('foo'));
    unittest.expect(o.httpStatusCode, unittest.equals(42));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterRepositoryError--;
}

core.int buildCounterRequestOptions = 0;
buildRequestOptions() {
  var o = new api.RequestOptions();
  buildCounterRequestOptions++;
  if (buildCounterRequestOptions < 3) {
    o.debugOptions = buildDebugOptions();
    o.languageCode = "foo";
    o.searchApplicationId = "foo";
    o.timeZone = "foo";
  }
  buildCounterRequestOptions--;
  return o;
}

checkRequestOptions(api.RequestOptions o) {
  buildCounterRequestOptions++;
  if (buildCounterRequestOptions < 3) {
    checkDebugOptions(o.debugOptions);
    unittest.expect(o.languageCode, unittest.equals('foo'));
    unittest.expect(o.searchApplicationId, unittest.equals('foo'));
    unittest.expect(o.timeZone, unittest.equals('foo'));
  }
  buildCounterRequestOptions--;
}

core.int buildCounterResetSearchApplicationRequest = 0;
buildResetSearchApplicationRequest() {
  var o = new api.ResetSearchApplicationRequest();
  buildCounterResetSearchApplicationRequest++;
  if (buildCounterResetSearchApplicationRequest < 3) {
    o.debugOptions = buildDebugOptions();
  }
  buildCounterResetSearchApplicationRequest--;
  return o;
}

checkResetSearchApplicationRequest(api.ResetSearchApplicationRequest o) {
  buildCounterResetSearchApplicationRequest++;
  if (buildCounterResetSearchApplicationRequest < 3) {
    checkDebugOptions(o.debugOptions);
  }
  buildCounterResetSearchApplicationRequest--;
}

core.int buildCounterResponseDebugInfo = 0;
buildResponseDebugInfo() {
  var o = new api.ResponseDebugInfo();
  buildCounterResponseDebugInfo++;
  if (buildCounterResponseDebugInfo < 3) {
    o.formattedDebugInfo = "foo";
  }
  buildCounterResponseDebugInfo--;
  return o;
}

checkResponseDebugInfo(api.ResponseDebugInfo o) {
  buildCounterResponseDebugInfo++;
  if (buildCounterResponseDebugInfo < 3) {
    unittest.expect(o.formattedDebugInfo, unittest.equals('foo'));
  }
  buildCounterResponseDebugInfo--;
}

core.int buildCounterRestrictItem = 0;
buildRestrictItem() {
  var o = new api.RestrictItem();
  buildCounterRestrictItem++;
  if (buildCounterRestrictItem < 3) {
    o.driveFollowUpRestrict = buildDriveFollowUpRestrict();
    o.driveLocationRestrict = buildDriveLocationRestrict();
    o.driveMimeTypeRestrict = buildDriveMimeTypeRestrict();
    o.driveTimeSpanRestrict = buildDriveTimeSpanRestrict();
    o.searchOperator = "foo";
  }
  buildCounterRestrictItem--;
  return o;
}

checkRestrictItem(api.RestrictItem o) {
  buildCounterRestrictItem++;
  if (buildCounterRestrictItem < 3) {
    checkDriveFollowUpRestrict(o.driveFollowUpRestrict);
    checkDriveLocationRestrict(o.driveLocationRestrict);
    checkDriveMimeTypeRestrict(o.driveMimeTypeRestrict);
    checkDriveTimeSpanRestrict(o.driveTimeSpanRestrict);
    unittest.expect(o.searchOperator, unittest.equals('foo'));
  }
  buildCounterRestrictItem--;
}

buildUnnamed4321() {
  var o = new core.List<api.SourceResultCount>();
  o.add(buildSourceResultCount());
  o.add(buildSourceResultCount());
  return o;
}

checkUnnamed4321(core.List<api.SourceResultCount> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSourceResultCount(o[0]);
  checkSourceResultCount(o[1]);
}

core.int buildCounterResultCounts = 0;
buildResultCounts() {
  var o = new api.ResultCounts();
  buildCounterResultCounts++;
  if (buildCounterResultCounts < 3) {
    o.sourceResultCounts = buildUnnamed4321();
  }
  buildCounterResultCounts--;
  return o;
}

checkResultCounts(api.ResultCounts o) {
  buildCounterResultCounts++;
  if (buildCounterResultCounts < 3) {
    checkUnnamed4321(o.sourceResultCounts);
  }
  buildCounterResultCounts--;
}

core.int buildCounterResultDebugInfo = 0;
buildResultDebugInfo() {
  var o = new api.ResultDebugInfo();
  buildCounterResultDebugInfo++;
  if (buildCounterResultDebugInfo < 3) {
    o.formattedDebugInfo = "foo";
  }
  buildCounterResultDebugInfo--;
  return o;
}

checkResultDebugInfo(api.ResultDebugInfo o) {
  buildCounterResultDebugInfo++;
  if (buildCounterResultDebugInfo < 3) {
    unittest.expect(o.formattedDebugInfo, unittest.equals('foo'));
  }
  buildCounterResultDebugInfo--;
}

core.int buildCounterResultDisplayField = 0;
buildResultDisplayField() {
  var o = new api.ResultDisplayField();
  buildCounterResultDisplayField++;
  if (buildCounterResultDisplayField < 3) {
    o.label = "foo";
    o.operatorName = "foo";
    o.property = buildNamedProperty();
  }
  buildCounterResultDisplayField--;
  return o;
}

checkResultDisplayField(api.ResultDisplayField o) {
  buildCounterResultDisplayField++;
  if (buildCounterResultDisplayField < 3) {
    unittest.expect(o.label, unittest.equals('foo'));
    unittest.expect(o.operatorName, unittest.equals('foo'));
    checkNamedProperty(o.property);
  }
  buildCounterResultDisplayField--;
}

buildUnnamed4322() {
  var o = new core.List<api.ResultDisplayField>();
  o.add(buildResultDisplayField());
  o.add(buildResultDisplayField());
  return o;
}

checkUnnamed4322(core.List<api.ResultDisplayField> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkResultDisplayField(o[0]);
  checkResultDisplayField(o[1]);
}

core.int buildCounterResultDisplayLine = 0;
buildResultDisplayLine() {
  var o = new api.ResultDisplayLine();
  buildCounterResultDisplayLine++;
  if (buildCounterResultDisplayLine < 3) {
    o.fields = buildUnnamed4322();
  }
  buildCounterResultDisplayLine--;
  return o;
}

checkResultDisplayLine(api.ResultDisplayLine o) {
  buildCounterResultDisplayLine++;
  if (buildCounterResultDisplayLine < 3) {
    checkUnnamed4322(o.fields);
  }
  buildCounterResultDisplayLine--;
}

buildUnnamed4323() {
  var o = new core.List<api.ResultDisplayLine>();
  o.add(buildResultDisplayLine());
  o.add(buildResultDisplayLine());
  return o;
}

checkUnnamed4323(core.List<api.ResultDisplayLine> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkResultDisplayLine(o[0]);
  checkResultDisplayLine(o[1]);
}

core.int buildCounterResultDisplayMetadata = 0;
buildResultDisplayMetadata() {
  var o = new api.ResultDisplayMetadata();
  buildCounterResultDisplayMetadata++;
  if (buildCounterResultDisplayMetadata < 3) {
    o.metalines = buildUnnamed4323();
    o.objectTypeLabel = "foo";
  }
  buildCounterResultDisplayMetadata--;
  return o;
}

checkResultDisplayMetadata(api.ResultDisplayMetadata o) {
  buildCounterResultDisplayMetadata++;
  if (buildCounterResultDisplayMetadata < 3) {
    checkUnnamed4323(o.metalines);
    unittest.expect(o.objectTypeLabel, unittest.equals('foo'));
  }
  buildCounterResultDisplayMetadata--;
}

core.int buildCounterRetrievalImportance = 0;
buildRetrievalImportance() {
  var o = new api.RetrievalImportance();
  buildCounterRetrievalImportance++;
  if (buildCounterRetrievalImportance < 3) {
    o.importance = "foo";
  }
  buildCounterRetrievalImportance--;
  return o;
}

checkRetrievalImportance(api.RetrievalImportance o) {
  buildCounterRetrievalImportance++;
  if (buildCounterRetrievalImportance < 3) {
    unittest.expect(o.importance, unittest.equals('foo'));
  }
  buildCounterRetrievalImportance--;
}

buildUnnamed4324() {
  var o = new core.List<api.ObjectDefinition>();
  o.add(buildObjectDefinition());
  o.add(buildObjectDefinition());
  return o;
}

checkUnnamed4324(core.List<api.ObjectDefinition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkObjectDefinition(o[0]);
  checkObjectDefinition(o[1]);
}

buildUnnamed4325() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4325(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSchema = 0;
buildSchema() {
  var o = new api.Schema();
  buildCounterSchema++;
  if (buildCounterSchema < 3) {
    o.objectDefinitions = buildUnnamed4324();
    o.operationIds = buildUnnamed4325();
  }
  buildCounterSchema--;
  return o;
}

checkSchema(api.Schema o) {
  buildCounterSchema++;
  if (buildCounterSchema < 3) {
    checkUnnamed4324(o.objectDefinitions);
    checkUnnamed4325(o.operationIds);
  }
  buildCounterSchema--;
}

core.int buildCounterScoringConfig = 0;
buildScoringConfig() {
  var o = new api.ScoringConfig();
  buildCounterScoringConfig++;
  if (buildCounterScoringConfig < 3) {
    o.disableFreshness = true;
    o.disablePersonalization = true;
  }
  buildCounterScoringConfig--;
  return o;
}

checkScoringConfig(api.ScoringConfig o) {
  buildCounterScoringConfig++;
  if (buildCounterScoringConfig < 3) {
    unittest.expect(o.disableFreshness, unittest.isTrue);
    unittest.expect(o.disablePersonalization, unittest.isTrue);
  }
  buildCounterScoringConfig--;
}

buildUnnamed4326() {
  var o = new core.List<api.DataSourceRestriction>();
  o.add(buildDataSourceRestriction());
  o.add(buildDataSourceRestriction());
  return o;
}

checkUnnamed4326(core.List<api.DataSourceRestriction> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDataSourceRestriction(o[0]);
  checkDataSourceRestriction(o[1]);
}

buildUnnamed4327() {
  var o = new core.List<api.FacetOptions>();
  o.add(buildFacetOptions());
  o.add(buildFacetOptions());
  return o;
}

checkUnnamed4327(core.List<api.FacetOptions> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFacetOptions(o[0]);
  checkFacetOptions(o[1]);
}

buildUnnamed4328() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4328(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4329() {
  var o = new core.List<api.SourceConfig>();
  o.add(buildSourceConfig());
  o.add(buildSourceConfig());
  return o;
}

checkUnnamed4329(core.List<api.SourceConfig> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSourceConfig(o[0]);
  checkSourceConfig(o[1]);
}

core.int buildCounterSearchApplication = 0;
buildSearchApplication() {
  var o = new api.SearchApplication();
  buildCounterSearchApplication++;
  if (buildCounterSearchApplication < 3) {
    o.dataSourceRestrictions = buildUnnamed4326();
    o.defaultFacetOptions = buildUnnamed4327();
    o.defaultSortOptions = buildSortOptions();
    o.displayName = "foo";
    o.name = "foo";
    o.operationIds = buildUnnamed4328();
    o.scoringConfig = buildScoringConfig();
    o.sourceConfig = buildUnnamed4329();
  }
  buildCounterSearchApplication--;
  return o;
}

checkSearchApplication(api.SearchApplication o) {
  buildCounterSearchApplication++;
  if (buildCounterSearchApplication < 3) {
    checkUnnamed4326(o.dataSourceRestrictions);
    checkUnnamed4327(o.defaultFacetOptions);
    checkSortOptions(o.defaultSortOptions);
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed4328(o.operationIds);
    checkScoringConfig(o.scoringConfig);
    checkUnnamed4329(o.sourceConfig);
  }
  buildCounterSearchApplication--;
}

buildUnnamed4330() {
  var o = new core.List<api.QueryCountByStatus>();
  o.add(buildQueryCountByStatus());
  o.add(buildQueryCountByStatus());
  return o;
}

checkUnnamed4330(core.List<api.QueryCountByStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQueryCountByStatus(o[0]);
  checkQueryCountByStatus(o[1]);
}

core.int buildCounterSearchApplicationQueryStats = 0;
buildSearchApplicationQueryStats() {
  var o = new api.SearchApplicationQueryStats();
  buildCounterSearchApplicationQueryStats++;
  if (buildCounterSearchApplicationQueryStats < 3) {
    o.date = buildDate();
    o.queryCountByStatus = buildUnnamed4330();
  }
  buildCounterSearchApplicationQueryStats--;
  return o;
}

checkSearchApplicationQueryStats(api.SearchApplicationQueryStats o) {
  buildCounterSearchApplicationQueryStats++;
  if (buildCounterSearchApplicationQueryStats < 3) {
    checkDate(o.date);
    checkUnnamed4330(o.queryCountByStatus);
  }
  buildCounterSearchApplicationQueryStats--;
}

core.int buildCounterSearchApplicationSessionStats = 0;
buildSearchApplicationSessionStats() {
  var o = new api.SearchApplicationSessionStats();
  buildCounterSearchApplicationSessionStats++;
  if (buildCounterSearchApplicationSessionStats < 3) {
    o.date = buildDate();
    o.searchSessionsCount = "foo";
  }
  buildCounterSearchApplicationSessionStats--;
  return o;
}

checkSearchApplicationSessionStats(api.SearchApplicationSessionStats o) {
  buildCounterSearchApplicationSessionStats++;
  if (buildCounterSearchApplicationSessionStats < 3) {
    checkDate(o.date);
    unittest.expect(o.searchSessionsCount, unittest.equals('foo'));
  }
  buildCounterSearchApplicationSessionStats--;
}

core.int buildCounterSearchApplicationUserStats = 0;
buildSearchApplicationUserStats() {
  var o = new api.SearchApplicationUserStats();
  buildCounterSearchApplicationUserStats++;
  if (buildCounterSearchApplicationUserStats < 3) {
    o.date = buildDate();
    o.oneDayActiveUsersCount = "foo";
    o.sevenDaysActiveUsersCount = "foo";
    o.thirtyDaysActiveUsersCount = "foo";
  }
  buildCounterSearchApplicationUserStats--;
  return o;
}

checkSearchApplicationUserStats(api.SearchApplicationUserStats o) {
  buildCounterSearchApplicationUserStats++;
  if (buildCounterSearchApplicationUserStats < 3) {
    checkDate(o.date);
    unittest.expect(o.oneDayActiveUsersCount, unittest.equals('foo'));
    unittest.expect(o.sevenDaysActiveUsersCount, unittest.equals('foo'));
    unittest.expect(o.thirtyDaysActiveUsersCount, unittest.equals('foo'));
  }
  buildCounterSearchApplicationUserStats--;
}

core.int buildCounterSearchItemsByViewUrlRequest = 0;
buildSearchItemsByViewUrlRequest() {
  var o = new api.SearchItemsByViewUrlRequest();
  buildCounterSearchItemsByViewUrlRequest++;
  if (buildCounterSearchItemsByViewUrlRequest < 3) {
    o.debugOptions = buildDebugOptions();
    o.pageToken = "foo";
    o.viewUrl = "foo";
  }
  buildCounterSearchItemsByViewUrlRequest--;
  return o;
}

checkSearchItemsByViewUrlRequest(api.SearchItemsByViewUrlRequest o) {
  buildCounterSearchItemsByViewUrlRequest++;
  if (buildCounterSearchItemsByViewUrlRequest < 3) {
    checkDebugOptions(o.debugOptions);
    unittest.expect(o.pageToken, unittest.equals('foo'));
    unittest.expect(o.viewUrl, unittest.equals('foo'));
  }
  buildCounterSearchItemsByViewUrlRequest--;
}

buildUnnamed4331() {
  var o = new core.List<api.Item>();
  o.add(buildItem());
  o.add(buildItem());
  return o;
}

checkUnnamed4331(core.List<api.Item> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkItem(o[0]);
  checkItem(o[1]);
}

core.int buildCounterSearchItemsByViewUrlResponse = 0;
buildSearchItemsByViewUrlResponse() {
  var o = new api.SearchItemsByViewUrlResponse();
  buildCounterSearchItemsByViewUrlResponse++;
  if (buildCounterSearchItemsByViewUrlResponse < 3) {
    o.items = buildUnnamed4331();
    o.nextPageToken = "foo";
  }
  buildCounterSearchItemsByViewUrlResponse--;
  return o;
}

checkSearchItemsByViewUrlResponse(api.SearchItemsByViewUrlResponse o) {
  buildCounterSearchItemsByViewUrlResponse++;
  if (buildCounterSearchItemsByViewUrlResponse < 3) {
    checkUnnamed4331(o.items);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterSearchItemsByViewUrlResponse--;
}

core.int buildCounterSearchQualityMetadata = 0;
buildSearchQualityMetadata() {
  var o = new api.SearchQualityMetadata();
  buildCounterSearchQualityMetadata++;
  if (buildCounterSearchQualityMetadata < 3) {
    o.quality = 42.0;
  }
  buildCounterSearchQualityMetadata--;
  return o;
}

checkSearchQualityMetadata(api.SearchQualityMetadata o) {
  buildCounterSearchQualityMetadata++;
  if (buildCounterSearchQualityMetadata < 3) {
    unittest.expect(o.quality, unittest.equals(42.0));
  }
  buildCounterSearchQualityMetadata--;
}

buildUnnamed4332() {
  var o = new core.List<api.DataSourceRestriction>();
  o.add(buildDataSourceRestriction());
  o.add(buildDataSourceRestriction());
  return o;
}

checkUnnamed4332(core.List<api.DataSourceRestriction> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDataSourceRestriction(o[0]);
  checkDataSourceRestriction(o[1]);
}

buildUnnamed4333() {
  var o = new core.List<api.FacetOptions>();
  o.add(buildFacetOptions());
  o.add(buildFacetOptions());
  return o;
}

checkUnnamed4333(core.List<api.FacetOptions> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFacetOptions(o[0]);
  checkFacetOptions(o[1]);
}

core.int buildCounterSearchRequest = 0;
buildSearchRequest() {
  var o = new api.SearchRequest();
  buildCounterSearchRequest++;
  if (buildCounterSearchRequest < 3) {
    o.dataSourceRestrictions = buildUnnamed4332();
    o.facetOptions = buildUnnamed4333();
    o.pageSize = 42;
    o.query = "foo";
    o.queryInterpretationOptions = buildQueryInterpretationOptions();
    o.requestOptions = buildRequestOptions();
    o.sortOptions = buildSortOptions();
    o.start = 42;
  }
  buildCounterSearchRequest--;
  return o;
}

checkSearchRequest(api.SearchRequest o) {
  buildCounterSearchRequest++;
  if (buildCounterSearchRequest < 3) {
    checkUnnamed4332(o.dataSourceRestrictions);
    checkUnnamed4333(o.facetOptions);
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.query, unittest.equals('foo'));
    checkQueryInterpretationOptions(o.queryInterpretationOptions);
    checkRequestOptions(o.requestOptions);
    checkSortOptions(o.sortOptions);
    unittest.expect(o.start, unittest.equals(42));
  }
  buildCounterSearchRequest--;
}

buildUnnamed4334() {
  var o = new core.List<api.FacetResult>();
  o.add(buildFacetResult());
  o.add(buildFacetResult());
  return o;
}

checkUnnamed4334(core.List<api.FacetResult> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFacetResult(o[0]);
  checkFacetResult(o[1]);
}

buildUnnamed4335() {
  var o = new core.List<api.SearchResult>();
  o.add(buildSearchResult());
  o.add(buildSearchResult());
  return o;
}

checkUnnamed4335(core.List<api.SearchResult> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSearchResult(o[0]);
  checkSearchResult(o[1]);
}

buildUnnamed4336() {
  var o = new core.List<api.SpellResult>();
  o.add(buildSpellResult());
  o.add(buildSpellResult());
  return o;
}

checkUnnamed4336(core.List<api.SpellResult> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSpellResult(o[0]);
  checkSpellResult(o[1]);
}

buildUnnamed4337() {
  var o = new core.List<api.StructuredResult>();
  o.add(buildStructuredResult());
  o.add(buildStructuredResult());
  return o;
}

checkUnnamed4337(core.List<api.StructuredResult> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStructuredResult(o[0]);
  checkStructuredResult(o[1]);
}

core.int buildCounterSearchResponse = 0;
buildSearchResponse() {
  var o = new api.SearchResponse();
  buildCounterSearchResponse++;
  if (buildCounterSearchResponse < 3) {
    o.debugInfo = buildResponseDebugInfo();
    o.errorInfo = buildErrorInfo();
    o.facetResults = buildUnnamed4334();
    o.hasMoreResults = true;
    o.queryInterpretation = buildQueryInterpretation();
    o.resultCountEstimate = "foo";
    o.resultCountExact = "foo";
    o.resultCounts = buildResultCounts();
    o.results = buildUnnamed4335();
    o.spellResults = buildUnnamed4336();
    o.structuredResults = buildUnnamed4337();
  }
  buildCounterSearchResponse--;
  return o;
}

checkSearchResponse(api.SearchResponse o) {
  buildCounterSearchResponse++;
  if (buildCounterSearchResponse < 3) {
    checkResponseDebugInfo(o.debugInfo);
    checkErrorInfo(o.errorInfo);
    checkUnnamed4334(o.facetResults);
    unittest.expect(o.hasMoreResults, unittest.isTrue);
    checkQueryInterpretation(o.queryInterpretation);
    unittest.expect(o.resultCountEstimate, unittest.equals('foo'));
    unittest.expect(o.resultCountExact, unittest.equals('foo'));
    checkResultCounts(o.resultCounts);
    checkUnnamed4335(o.results);
    checkUnnamed4336(o.spellResults);
    checkUnnamed4337(o.structuredResults);
  }
  buildCounterSearchResponse--;
}

buildUnnamed4338() {
  var o = new core.List<api.SearchResult>();
  o.add(buildSearchResult());
  o.add(buildSearchResult());
  return o;
}

checkUnnamed4338(core.List<api.SearchResult> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSearchResult(o[0]);
  checkSearchResult(o[1]);
}

core.int buildCounterSearchResult = 0;
buildSearchResult() {
  var o = new api.SearchResult();
  buildCounterSearchResult++;
  if (buildCounterSearchResult < 3) {
    o.clusteredResults = buildUnnamed4338();
    o.debugInfo = buildResultDebugInfo();
    o.metadata = buildMetadata();
    o.snippet = buildSnippet();
    o.title = "foo";
    o.url = "foo";
  }
  buildCounterSearchResult--;
  return o;
}

checkSearchResult(api.SearchResult o) {
  buildCounterSearchResult++;
  if (buildCounterSearchResult < 3) {
    checkUnnamed4338(o.clusteredResults);
    checkResultDebugInfo(o.debugInfo);
    checkMetadata(o.metadata);
    checkSnippet(o.snippet);
    unittest.expect(o.title, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterSearchResult--;
}

buildUnnamed4339() {
  var o = new core.List<api.MatchRange>();
  o.add(buildMatchRange());
  o.add(buildMatchRange());
  return o;
}

checkUnnamed4339(core.List<api.MatchRange> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMatchRange(o[0]);
  checkMatchRange(o[1]);
}

core.int buildCounterSnippet = 0;
buildSnippet() {
  var o = new api.Snippet();
  buildCounterSnippet++;
  if (buildCounterSnippet < 3) {
    o.matchRanges = buildUnnamed4339();
    o.snippet = "foo";
  }
  buildCounterSnippet--;
  return o;
}

checkSnippet(api.Snippet o) {
  buildCounterSnippet++;
  if (buildCounterSnippet < 3) {
    checkUnnamed4339(o.matchRanges);
    unittest.expect(o.snippet, unittest.equals('foo'));
  }
  buildCounterSnippet--;
}

core.int buildCounterSortOptions = 0;
buildSortOptions() {
  var o = new api.SortOptions();
  buildCounterSortOptions++;
  if (buildCounterSortOptions < 3) {
    o.operatorName = "foo";
    o.sortOrder = "foo";
  }
  buildCounterSortOptions--;
  return o;
}

checkSortOptions(api.SortOptions o) {
  buildCounterSortOptions++;
  if (buildCounterSortOptions < 3) {
    unittest.expect(o.operatorName, unittest.equals('foo'));
    unittest.expect(o.sortOrder, unittest.equals('foo'));
  }
  buildCounterSortOptions--;
}

core.int buildCounterSource = 0;
buildSource() {
  var o = new api.Source();
  buildCounterSource++;
  if (buildCounterSource < 3) {
    o.name = "foo";
    o.predefinedSource = "foo";
  }
  buildCounterSource--;
  return o;
}

checkSource(api.Source o) {
  buildCounterSource++;
  if (buildCounterSource < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.predefinedSource, unittest.equals('foo'));
  }
  buildCounterSource--;
}

core.int buildCounterSourceConfig = 0;
buildSourceConfig() {
  var o = new api.SourceConfig();
  buildCounterSourceConfig++;
  if (buildCounterSourceConfig < 3) {
    o.crowdingConfig = buildSourceCrowdingConfig();
    o.scoringConfig = buildSourceScoringConfig();
    o.source = buildSource();
  }
  buildCounterSourceConfig--;
  return o;
}

checkSourceConfig(api.SourceConfig o) {
  buildCounterSourceConfig++;
  if (buildCounterSourceConfig < 3) {
    checkSourceCrowdingConfig(o.crowdingConfig);
    checkSourceScoringConfig(o.scoringConfig);
    checkSource(o.source);
  }
  buildCounterSourceConfig--;
}

core.int buildCounterSourceCrowdingConfig = 0;
buildSourceCrowdingConfig() {
  var o = new api.SourceCrowdingConfig();
  buildCounterSourceCrowdingConfig++;
  if (buildCounterSourceCrowdingConfig < 3) {
    o.numResults = 42;
    o.numSuggestions = 42;
  }
  buildCounterSourceCrowdingConfig--;
  return o;
}

checkSourceCrowdingConfig(api.SourceCrowdingConfig o) {
  buildCounterSourceCrowdingConfig++;
  if (buildCounterSourceCrowdingConfig < 3) {
    unittest.expect(o.numResults, unittest.equals(42));
    unittest.expect(o.numSuggestions, unittest.equals(42));
  }
  buildCounterSourceCrowdingConfig--;
}

core.int buildCounterSourceResultCount = 0;
buildSourceResultCount() {
  var o = new api.SourceResultCount();
  buildCounterSourceResultCount++;
  if (buildCounterSourceResultCount < 3) {
    o.hasMoreResults = true;
    o.resultCountEstimate = "foo";
    o.resultCountExact = "foo";
    o.source = buildSource();
  }
  buildCounterSourceResultCount--;
  return o;
}

checkSourceResultCount(api.SourceResultCount o) {
  buildCounterSourceResultCount++;
  if (buildCounterSourceResultCount < 3) {
    unittest.expect(o.hasMoreResults, unittest.isTrue);
    unittest.expect(o.resultCountEstimate, unittest.equals('foo'));
    unittest.expect(o.resultCountExact, unittest.equals('foo'));
    checkSource(o.source);
  }
  buildCounterSourceResultCount--;
}

core.int buildCounterSourceScoringConfig = 0;
buildSourceScoringConfig() {
  var o = new api.SourceScoringConfig();
  buildCounterSourceScoringConfig++;
  if (buildCounterSourceScoringConfig < 3) {
    o.sourceImportance = "foo";
  }
  buildCounterSourceScoringConfig--;
  return o;
}

checkSourceScoringConfig(api.SourceScoringConfig o) {
  buildCounterSourceScoringConfig++;
  if (buildCounterSourceScoringConfig < 3) {
    unittest.expect(o.sourceImportance, unittest.equals('foo'));
  }
  buildCounterSourceScoringConfig--;
}

core.int buildCounterSpellResult = 0;
buildSpellResult() {
  var o = new api.SpellResult();
  buildCounterSpellResult++;
  if (buildCounterSpellResult < 3) {
    o.suggestedQuery = "foo";
  }
  buildCounterSpellResult--;
  return o;
}

checkSpellResult(api.SpellResult o) {
  buildCounterSpellResult++;
  if (buildCounterSpellResult < 3) {
    unittest.expect(o.suggestedQuery, unittest.equals('foo'));
  }
  buildCounterSpellResult--;
}

core.int buildCounterStartUploadItemRequest = 0;
buildStartUploadItemRequest() {
  var o = new api.StartUploadItemRequest();
  buildCounterStartUploadItemRequest++;
  if (buildCounterStartUploadItemRequest < 3) {
    o.connectorName = "foo";
    o.debugOptions = buildDebugOptions();
  }
  buildCounterStartUploadItemRequest--;
  return o;
}

checkStartUploadItemRequest(api.StartUploadItemRequest o) {
  buildCounterStartUploadItemRequest++;
  if (buildCounterStartUploadItemRequest < 3) {
    unittest.expect(o.connectorName, unittest.equals('foo'));
    checkDebugOptions(o.debugOptions);
  }
  buildCounterStartUploadItemRequest--;
}

buildUnnamed4340() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  o["y"] = {
    'list': [1, 2, 3],
    'bool': true,
    'string': 'foo'
  };
  return o;
}

checkUnnamed4340(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted5 = (o["x"]) as core.Map;
  unittest.expect(casted5, unittest.hasLength(3));
  unittest.expect(casted5["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted5["bool"], unittest.equals(true));
  unittest.expect(casted5["string"], unittest.equals('foo'));
  var casted6 = (o["y"]) as core.Map;
  unittest.expect(casted6, unittest.hasLength(3));
  unittest.expect(casted6["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted6["bool"], unittest.equals(true));
  unittest.expect(casted6["string"], unittest.equals('foo'));
}

buildUnnamed4341() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed4340());
  o.add(buildUnnamed4340());
  return o;
}

checkUnnamed4341(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed4340(o[0]);
  checkUnnamed4340(o[1]);
}

core.int buildCounterStatus = 0;
buildStatus() {
  var o = new api.Status();
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    o.code = 42;
    o.details = buildUnnamed4341();
    o.message = "foo";
  }
  buildCounterStatus--;
  return o;
}

checkStatus(api.Status o) {
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    unittest.expect(o.code, unittest.equals(42));
    checkUnnamed4341(o.details);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterStatus--;
}

buildUnnamed4342() {
  var o = new core.List<api.NamedProperty>();
  o.add(buildNamedProperty());
  o.add(buildNamedProperty());
  return o;
}

checkUnnamed4342(core.List<api.NamedProperty> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNamedProperty(o[0]);
  checkNamedProperty(o[1]);
}

core.int buildCounterStructuredDataObject = 0;
buildStructuredDataObject() {
  var o = new api.StructuredDataObject();
  buildCounterStructuredDataObject++;
  if (buildCounterStructuredDataObject < 3) {
    o.properties = buildUnnamed4342();
  }
  buildCounterStructuredDataObject--;
  return o;
}

checkStructuredDataObject(api.StructuredDataObject o) {
  buildCounterStructuredDataObject++;
  if (buildCounterStructuredDataObject < 3) {
    checkUnnamed4342(o.properties);
  }
  buildCounterStructuredDataObject--;
}

core.int buildCounterStructuredResult = 0;
buildStructuredResult() {
  var o = new api.StructuredResult();
  buildCounterStructuredResult++;
  if (buildCounterStructuredResult < 3) {
    o.person = buildPerson();
  }
  buildCounterStructuredResult--;
  return o;
}

checkStructuredResult(api.StructuredResult o) {
  buildCounterStructuredResult++;
  if (buildCounterStructuredResult < 3) {
    checkPerson(o.person);
  }
  buildCounterStructuredResult--;
}

buildUnnamed4343() {
  var o = new core.List<api.DataSourceRestriction>();
  o.add(buildDataSourceRestriction());
  o.add(buildDataSourceRestriction());
  return o;
}

checkUnnamed4343(core.List<api.DataSourceRestriction> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDataSourceRestriction(o[0]);
  checkDataSourceRestriction(o[1]);
}

core.int buildCounterSuggestRequest = 0;
buildSuggestRequest() {
  var o = new api.SuggestRequest();
  buildCounterSuggestRequest++;
  if (buildCounterSuggestRequest < 3) {
    o.dataSourceRestrictions = buildUnnamed4343();
    o.query = "foo";
    o.requestOptions = buildRequestOptions();
  }
  buildCounterSuggestRequest--;
  return o;
}

checkSuggestRequest(api.SuggestRequest o) {
  buildCounterSuggestRequest++;
  if (buildCounterSuggestRequest < 3) {
    checkUnnamed4343(o.dataSourceRestrictions);
    unittest.expect(o.query, unittest.equals('foo'));
    checkRequestOptions(o.requestOptions);
  }
  buildCounterSuggestRequest--;
}

buildUnnamed4344() {
  var o = new core.List<api.SuggestResult>();
  o.add(buildSuggestResult());
  o.add(buildSuggestResult());
  return o;
}

checkUnnamed4344(core.List<api.SuggestResult> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSuggestResult(o[0]);
  checkSuggestResult(o[1]);
}

core.int buildCounterSuggestResponse = 0;
buildSuggestResponse() {
  var o = new api.SuggestResponse();
  buildCounterSuggestResponse++;
  if (buildCounterSuggestResponse < 3) {
    o.suggestResults = buildUnnamed4344();
  }
  buildCounterSuggestResponse--;
  return o;
}

checkSuggestResponse(api.SuggestResponse o) {
  buildCounterSuggestResponse++;
  if (buildCounterSuggestResponse < 3) {
    checkUnnamed4344(o.suggestResults);
  }
  buildCounterSuggestResponse--;
}

core.int buildCounterSuggestResult = 0;
buildSuggestResult() {
  var o = new api.SuggestResult();
  buildCounterSuggestResult++;
  if (buildCounterSuggestResult < 3) {
    o.peopleSuggestion = buildPeopleSuggestion();
    o.querySuggestion = buildQuerySuggestion();
    o.source = buildSource();
    o.suggestedQuery = "foo";
  }
  buildCounterSuggestResult--;
  return o;
}

checkSuggestResult(api.SuggestResult o) {
  buildCounterSuggestResult++;
  if (buildCounterSuggestResult < 3) {
    checkPeopleSuggestion(o.peopleSuggestion);
    checkQuerySuggestion(o.querySuggestion);
    checkSource(o.source);
    unittest.expect(o.suggestedQuery, unittest.equals('foo'));
  }
  buildCounterSuggestResult--;
}

core.int buildCounterTextOperatorOptions = 0;
buildTextOperatorOptions() {
  var o = new api.TextOperatorOptions();
  buildCounterTextOperatorOptions++;
  if (buildCounterTextOperatorOptions < 3) {
    o.exactMatchWithOperator = true;
    o.operatorName = "foo";
  }
  buildCounterTextOperatorOptions--;
  return o;
}

checkTextOperatorOptions(api.TextOperatorOptions o) {
  buildCounterTextOperatorOptions++;
  if (buildCounterTextOperatorOptions < 3) {
    unittest.expect(o.exactMatchWithOperator, unittest.isTrue);
    unittest.expect(o.operatorName, unittest.equals('foo'));
  }
  buildCounterTextOperatorOptions--;
}

core.int buildCounterTextPropertyOptions = 0;
buildTextPropertyOptions() {
  var o = new api.TextPropertyOptions();
  buildCounterTextPropertyOptions++;
  if (buildCounterTextPropertyOptions < 3) {
    o.operatorOptions = buildTextOperatorOptions();
    o.retrievalImportance = buildRetrievalImportance();
  }
  buildCounterTextPropertyOptions--;
  return o;
}

checkTextPropertyOptions(api.TextPropertyOptions o) {
  buildCounterTextPropertyOptions++;
  if (buildCounterTextPropertyOptions < 3) {
    checkTextOperatorOptions(o.operatorOptions);
    checkRetrievalImportance(o.retrievalImportance);
  }
  buildCounterTextPropertyOptions--;
}

buildUnnamed4345() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4345(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTextValues = 0;
buildTextValues() {
  var o = new api.TextValues();
  buildCounterTextValues++;
  if (buildCounterTextValues < 3) {
    o.values = buildUnnamed4345();
  }
  buildCounterTextValues--;
  return o;
}

checkTextValues(api.TextValues o) {
  buildCounterTextValues++;
  if (buildCounterTextValues < 3) {
    checkUnnamed4345(o.values);
  }
  buildCounterTextValues--;
}

core.int buildCounterTimestampOperatorOptions = 0;
buildTimestampOperatorOptions() {
  var o = new api.TimestampOperatorOptions();
  buildCounterTimestampOperatorOptions++;
  if (buildCounterTimestampOperatorOptions < 3) {
    o.greaterThanOperatorName = "foo";
    o.lessThanOperatorName = "foo";
    o.operatorName = "foo";
  }
  buildCounterTimestampOperatorOptions--;
  return o;
}

checkTimestampOperatorOptions(api.TimestampOperatorOptions o) {
  buildCounterTimestampOperatorOptions++;
  if (buildCounterTimestampOperatorOptions < 3) {
    unittest.expect(o.greaterThanOperatorName, unittest.equals('foo'));
    unittest.expect(o.lessThanOperatorName, unittest.equals('foo'));
    unittest.expect(o.operatorName, unittest.equals('foo'));
  }
  buildCounterTimestampOperatorOptions--;
}

core.int buildCounterTimestampPropertyOptions = 0;
buildTimestampPropertyOptions() {
  var o = new api.TimestampPropertyOptions();
  buildCounterTimestampPropertyOptions++;
  if (buildCounterTimestampPropertyOptions < 3) {
    o.operatorOptions = buildTimestampOperatorOptions();
  }
  buildCounterTimestampPropertyOptions--;
  return o;
}

checkTimestampPropertyOptions(api.TimestampPropertyOptions o) {
  buildCounterTimestampPropertyOptions++;
  if (buildCounterTimestampPropertyOptions < 3) {
    checkTimestampOperatorOptions(o.operatorOptions);
  }
  buildCounterTimestampPropertyOptions--;
}

buildUnnamed4346() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4346(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTimestampValues = 0;
buildTimestampValues() {
  var o = new api.TimestampValues();
  buildCounterTimestampValues++;
  if (buildCounterTimestampValues < 3) {
    o.values = buildUnnamed4346();
  }
  buildCounterTimestampValues--;
  return o;
}

checkTimestampValues(api.TimestampValues o) {
  buildCounterTimestampValues++;
  if (buildCounterTimestampValues < 3) {
    checkUnnamed4346(o.values);
  }
  buildCounterTimestampValues--;
}

core.int buildCounterUnmappedIdentity = 0;
buildUnmappedIdentity() {
  var o = new api.UnmappedIdentity();
  buildCounterUnmappedIdentity++;
  if (buildCounterUnmappedIdentity < 3) {
    o.externalIdentity = buildPrincipal();
    o.resolutionStatusCode = "foo";
  }
  buildCounterUnmappedIdentity--;
  return o;
}

checkUnmappedIdentity(api.UnmappedIdentity o) {
  buildCounterUnmappedIdentity++;
  if (buildCounterUnmappedIdentity < 3) {
    checkPrincipal(o.externalIdentity);
    unittest.expect(o.resolutionStatusCode, unittest.equals('foo'));
  }
  buildCounterUnmappedIdentity--;
}

core.int buildCounterUnreserveItemsRequest = 0;
buildUnreserveItemsRequest() {
  var o = new api.UnreserveItemsRequest();
  buildCounterUnreserveItemsRequest++;
  if (buildCounterUnreserveItemsRequest < 3) {
    o.connectorName = "foo";
    o.debugOptions = buildDebugOptions();
    o.queue = "foo";
  }
  buildCounterUnreserveItemsRequest--;
  return o;
}

checkUnreserveItemsRequest(api.UnreserveItemsRequest o) {
  buildCounterUnreserveItemsRequest++;
  if (buildCounterUnreserveItemsRequest < 3) {
    unittest.expect(o.connectorName, unittest.equals('foo'));
    checkDebugOptions(o.debugOptions);
    unittest.expect(o.queue, unittest.equals('foo'));
  }
  buildCounterUnreserveItemsRequest--;
}

core.int buildCounterUpdateDataSourceRequest = 0;
buildUpdateDataSourceRequest() {
  var o = new api.UpdateDataSourceRequest();
  buildCounterUpdateDataSourceRequest++;
  if (buildCounterUpdateDataSourceRequest < 3) {
    o.debugOptions = buildDebugOptions();
    o.source = buildDataSource();
  }
  buildCounterUpdateDataSourceRequest--;
  return o;
}

checkUpdateDataSourceRequest(api.UpdateDataSourceRequest o) {
  buildCounterUpdateDataSourceRequest++;
  if (buildCounterUpdateDataSourceRequest < 3) {
    checkDebugOptions(o.debugOptions);
    checkDataSource(o.source);
  }
  buildCounterUpdateDataSourceRequest--;
}

core.int buildCounterUpdateSchemaRequest = 0;
buildUpdateSchemaRequest() {
  var o = new api.UpdateSchemaRequest();
  buildCounterUpdateSchemaRequest++;
  if (buildCounterUpdateSchemaRequest < 3) {
    o.debugOptions = buildDebugOptions();
    o.schema = buildSchema();
    o.validateOnly = true;
  }
  buildCounterUpdateSchemaRequest--;
  return o;
}

checkUpdateSchemaRequest(api.UpdateSchemaRequest o) {
  buildCounterUpdateSchemaRequest++;
  if (buildCounterUpdateSchemaRequest < 3) {
    checkDebugOptions(o.debugOptions);
    checkSchema(o.schema);
    unittest.expect(o.validateOnly, unittest.isTrue);
  }
  buildCounterUpdateSchemaRequest--;
}

core.int buildCounterUploadItemRef = 0;
buildUploadItemRef() {
  var o = new api.UploadItemRef();
  buildCounterUploadItemRef++;
  if (buildCounterUploadItemRef < 3) {
    o.name = "foo";
  }
  buildCounterUploadItemRef--;
  return o;
}

checkUploadItemRef(api.UploadItemRef o) {
  buildCounterUploadItemRef++;
  if (buildCounterUploadItemRef < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterUploadItemRef--;
}

core.int buildCounterValue = 0;
buildValue() {
  var o = new api.Value();
  buildCounterValue++;
  if (buildCounterValue < 3) {
    o.booleanValue = true;
    o.dateValue = buildDate();
    o.doubleValue = 42.0;
    o.integerValue = "foo";
    o.stringValue = "foo";
    o.timestampValue = "foo";
  }
  buildCounterValue--;
  return o;
}

checkValue(api.Value o) {
  buildCounterValue++;
  if (buildCounterValue < 3) {
    unittest.expect(o.booleanValue, unittest.isTrue);
    checkDate(o.dateValue);
    unittest.expect(o.doubleValue, unittest.equals(42.0));
    unittest.expect(o.integerValue, unittest.equals('foo'));
    unittest.expect(o.stringValue, unittest.equals('foo'));
    unittest.expect(o.timestampValue, unittest.equals('foo'));
  }
  buildCounterValue--;
}

core.int buildCounterValueFilter = 0;
buildValueFilter() {
  var o = new api.ValueFilter();
  buildCounterValueFilter++;
  if (buildCounterValueFilter < 3) {
    o.operatorName = "foo";
    o.value = buildValue();
  }
  buildCounterValueFilter--;
  return o;
}

checkValueFilter(api.ValueFilter o) {
  buildCounterValueFilter++;
  if (buildCounterValueFilter < 3) {
    unittest.expect(o.operatorName, unittest.equals('foo'));
    checkValue(o.value);
  }
  buildCounterValueFilter--;
}

main() {
  unittest.group("obj-schema-BooleanOperatorOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildBooleanOperatorOptions();
      var od = new api.BooleanOperatorOptions.fromJson(o.toJson());
      checkBooleanOperatorOptions(od);
    });
  });

  unittest.group("obj-schema-BooleanPropertyOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildBooleanPropertyOptions();
      var od = new api.BooleanPropertyOptions.fromJson(o.toJson());
      checkBooleanPropertyOptions(od);
    });
  });

  unittest.group("obj-schema-CheckAccessResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCheckAccessResponse();
      var od = new api.CheckAccessResponse.fromJson(o.toJson());
      checkCheckAccessResponse(od);
    });
  });

  unittest.group("obj-schema-CompositeFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildCompositeFilter();
      var od = new api.CompositeFilter.fromJson(o.toJson());
      checkCompositeFilter(od);
    });
  });

  unittest.group("obj-schema-CustomerIndexStats", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomerIndexStats();
      var od = new api.CustomerIndexStats.fromJson(o.toJson());
      checkCustomerIndexStats(od);
    });
  });

  unittest.group("obj-schema-CustomerQueryStats", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomerQueryStats();
      var od = new api.CustomerQueryStats.fromJson(o.toJson());
      checkCustomerQueryStats(od);
    });
  });

  unittest.group("obj-schema-CustomerSessionStats", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomerSessionStats();
      var od = new api.CustomerSessionStats.fromJson(o.toJson());
      checkCustomerSessionStats(od);
    });
  });

  unittest.group("obj-schema-CustomerUserStats", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomerUserStats();
      var od = new api.CustomerUserStats.fromJson(o.toJson());
      checkCustomerUserStats(od);
    });
  });

  unittest.group("obj-schema-DataSource", () {
    unittest.test("to-json--from-json", () {
      var o = buildDataSource();
      var od = new api.DataSource.fromJson(o.toJson());
      checkDataSource(od);
    });
  });

  unittest.group("obj-schema-DataSourceIndexStats", () {
    unittest.test("to-json--from-json", () {
      var o = buildDataSourceIndexStats();
      var od = new api.DataSourceIndexStats.fromJson(o.toJson());
      checkDataSourceIndexStats(od);
    });
  });

  unittest.group("obj-schema-DataSourceRestriction", () {
    unittest.test("to-json--from-json", () {
      var o = buildDataSourceRestriction();
      var od = new api.DataSourceRestriction.fromJson(o.toJson());
      checkDataSourceRestriction(od);
    });
  });

  unittest.group("obj-schema-Date", () {
    unittest.test("to-json--from-json", () {
      var o = buildDate();
      var od = new api.Date.fromJson(o.toJson());
      checkDate(od);
    });
  });

  unittest.group("obj-schema-DateOperatorOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildDateOperatorOptions();
      var od = new api.DateOperatorOptions.fromJson(o.toJson());
      checkDateOperatorOptions(od);
    });
  });

  unittest.group("obj-schema-DatePropertyOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildDatePropertyOptions();
      var od = new api.DatePropertyOptions.fromJson(o.toJson());
      checkDatePropertyOptions(od);
    });
  });

  unittest.group("obj-schema-DateValues", () {
    unittest.test("to-json--from-json", () {
      var o = buildDateValues();
      var od = new api.DateValues.fromJson(o.toJson());
      checkDateValues(od);
    });
  });

  unittest.group("obj-schema-DebugOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildDebugOptions();
      var od = new api.DebugOptions.fromJson(o.toJson());
      checkDebugOptions(od);
    });
  });

  unittest.group("obj-schema-DeleteQueueItemsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeleteQueueItemsRequest();
      var od = new api.DeleteQueueItemsRequest.fromJson(o.toJson());
      checkDeleteQueueItemsRequest(od);
    });
  });

  unittest.group("obj-schema-DisplayedProperty", () {
    unittest.test("to-json--from-json", () {
      var o = buildDisplayedProperty();
      var od = new api.DisplayedProperty.fromJson(o.toJson());
      checkDisplayedProperty(od);
    });
  });

  unittest.group("obj-schema-DoubleOperatorOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildDoubleOperatorOptions();
      var od = new api.DoubleOperatorOptions.fromJson(o.toJson());
      checkDoubleOperatorOptions(od);
    });
  });

  unittest.group("obj-schema-DoublePropertyOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildDoublePropertyOptions();
      var od = new api.DoublePropertyOptions.fromJson(o.toJson());
      checkDoublePropertyOptions(od);
    });
  });

  unittest.group("obj-schema-DoubleValues", () {
    unittest.test("to-json--from-json", () {
      var o = buildDoubleValues();
      var od = new api.DoubleValues.fromJson(o.toJson());
      checkDoubleValues(od);
    });
  });

  unittest.group("obj-schema-DriveFollowUpRestrict", () {
    unittest.test("to-json--from-json", () {
      var o = buildDriveFollowUpRestrict();
      var od = new api.DriveFollowUpRestrict.fromJson(o.toJson());
      checkDriveFollowUpRestrict(od);
    });
  });

  unittest.group("obj-schema-DriveLocationRestrict", () {
    unittest.test("to-json--from-json", () {
      var o = buildDriveLocationRestrict();
      var od = new api.DriveLocationRestrict.fromJson(o.toJson());
      checkDriveLocationRestrict(od);
    });
  });

  unittest.group("obj-schema-DriveMimeTypeRestrict", () {
    unittest.test("to-json--from-json", () {
      var o = buildDriveMimeTypeRestrict();
      var od = new api.DriveMimeTypeRestrict.fromJson(o.toJson());
      checkDriveMimeTypeRestrict(od);
    });
  });

  unittest.group("obj-schema-DriveTimeSpanRestrict", () {
    unittest.test("to-json--from-json", () {
      var o = buildDriveTimeSpanRestrict();
      var od = new api.DriveTimeSpanRestrict.fromJson(o.toJson());
      checkDriveTimeSpanRestrict(od);
    });
  });

  unittest.group("obj-schema-EmailAddress", () {
    unittest.test("to-json--from-json", () {
      var o = buildEmailAddress();
      var od = new api.EmailAddress.fromJson(o.toJson());
      checkEmailAddress(od);
    });
  });

  unittest.group("obj-schema-EnumOperatorOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnumOperatorOptions();
      var od = new api.EnumOperatorOptions.fromJson(o.toJson());
      checkEnumOperatorOptions(od);
    });
  });

  unittest.group("obj-schema-EnumPropertyOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnumPropertyOptions();
      var od = new api.EnumPropertyOptions.fromJson(o.toJson());
      checkEnumPropertyOptions(od);
    });
  });

  unittest.group("obj-schema-EnumValuePair", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnumValuePair();
      var od = new api.EnumValuePair.fromJson(o.toJson());
      checkEnumValuePair(od);
    });
  });

  unittest.group("obj-schema-EnumValues", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnumValues();
      var od = new api.EnumValues.fromJson(o.toJson());
      checkEnumValues(od);
    });
  });

  unittest.group("obj-schema-ErrorInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildErrorInfo();
      var od = new api.ErrorInfo.fromJson(o.toJson());
      checkErrorInfo(od);
    });
  });

  unittest.group("obj-schema-ErrorMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildErrorMessage();
      var od = new api.ErrorMessage.fromJson(o.toJson());
      checkErrorMessage(od);
    });
  });

  unittest.group("obj-schema-FacetBucket", () {
    unittest.test("to-json--from-json", () {
      var o = buildFacetBucket();
      var od = new api.FacetBucket.fromJson(o.toJson());
      checkFacetBucket(od);
    });
  });

  unittest.group("obj-schema-FacetOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildFacetOptions();
      var od = new api.FacetOptions.fromJson(o.toJson());
      checkFacetOptions(od);
    });
  });

  unittest.group("obj-schema-FacetResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildFacetResult();
      var od = new api.FacetResult.fromJson(o.toJson());
      checkFacetResult(od);
    });
  });

  unittest.group("obj-schema-FieldViolation", () {
    unittest.test("to-json--from-json", () {
      var o = buildFieldViolation();
      var od = new api.FieldViolation.fromJson(o.toJson());
      checkFieldViolation(od);
    });
  });

  unittest.group("obj-schema-Filter", () {
    unittest.test("to-json--from-json", () {
      var o = buildFilter();
      var od = new api.Filter.fromJson(o.toJson());
      checkFilter(od);
    });
  });

  unittest.group("obj-schema-FilterOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildFilterOptions();
      var od = new api.FilterOptions.fromJson(o.toJson());
      checkFilterOptions(od);
    });
  });

  unittest.group("obj-schema-FreshnessOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildFreshnessOptions();
      var od = new api.FreshnessOptions.fromJson(o.toJson());
      checkFreshnessOptions(od);
    });
  });

  unittest.group("obj-schema-GSuitePrincipal", () {
    unittest.test("to-json--from-json", () {
      var o = buildGSuitePrincipal();
      var od = new api.GSuitePrincipal.fromJson(o.toJson());
      checkGSuitePrincipal(od);
    });
  });

  unittest.group("obj-schema-GetCustomerIndexStatsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetCustomerIndexStatsResponse();
      var od = new api.GetCustomerIndexStatsResponse.fromJson(o.toJson());
      checkGetCustomerIndexStatsResponse(od);
    });
  });

  unittest.group("obj-schema-GetCustomerQueryStatsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetCustomerQueryStatsResponse();
      var od = new api.GetCustomerQueryStatsResponse.fromJson(o.toJson());
      checkGetCustomerQueryStatsResponse(od);
    });
  });

  unittest.group("obj-schema-GetCustomerSessionStatsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetCustomerSessionStatsResponse();
      var od = new api.GetCustomerSessionStatsResponse.fromJson(o.toJson());
      checkGetCustomerSessionStatsResponse(od);
    });
  });

  unittest.group("obj-schema-GetCustomerUserStatsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetCustomerUserStatsResponse();
      var od = new api.GetCustomerUserStatsResponse.fromJson(o.toJson());
      checkGetCustomerUserStatsResponse(od);
    });
  });

  unittest.group("obj-schema-GetDataSourceIndexStatsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetDataSourceIndexStatsResponse();
      var od = new api.GetDataSourceIndexStatsResponse.fromJson(o.toJson());
      checkGetDataSourceIndexStatsResponse(od);
    });
  });

  unittest.group("obj-schema-GetSearchApplicationQueryStatsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetSearchApplicationQueryStatsResponse();
      var od =
          new api.GetSearchApplicationQueryStatsResponse.fromJson(o.toJson());
      checkGetSearchApplicationQueryStatsResponse(od);
    });
  });

  unittest.group("obj-schema-GetSearchApplicationSessionStatsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetSearchApplicationSessionStatsResponse();
      var od =
          new api.GetSearchApplicationSessionStatsResponse.fromJson(o.toJson());
      checkGetSearchApplicationSessionStatsResponse(od);
    });
  });

  unittest.group("obj-schema-GetSearchApplicationUserStatsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetSearchApplicationUserStatsResponse();
      var od =
          new api.GetSearchApplicationUserStatsResponse.fromJson(o.toJson());
      checkGetSearchApplicationUserStatsResponse(od);
    });
  });

  unittest.group("obj-schema-HtmlOperatorOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildHtmlOperatorOptions();
      var od = new api.HtmlOperatorOptions.fromJson(o.toJson());
      checkHtmlOperatorOptions(od);
    });
  });

  unittest.group("obj-schema-HtmlPropertyOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildHtmlPropertyOptions();
      var od = new api.HtmlPropertyOptions.fromJson(o.toJson());
      checkHtmlPropertyOptions(od);
    });
  });

  unittest.group("obj-schema-HtmlValues", () {
    unittest.test("to-json--from-json", () {
      var o = buildHtmlValues();
      var od = new api.HtmlValues.fromJson(o.toJson());
      checkHtmlValues(od);
    });
  });

  unittest.group("obj-schema-IndexItemOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildIndexItemOptions();
      var od = new api.IndexItemOptions.fromJson(o.toJson());
      checkIndexItemOptions(od);
    });
  });

  unittest.group("obj-schema-IndexItemRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildIndexItemRequest();
      var od = new api.IndexItemRequest.fromJson(o.toJson());
      checkIndexItemRequest(od);
    });
  });

  unittest.group("obj-schema-IntegerOperatorOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildIntegerOperatorOptions();
      var od = new api.IntegerOperatorOptions.fromJson(o.toJson());
      checkIntegerOperatorOptions(od);
    });
  });

  unittest.group("obj-schema-IntegerPropertyOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildIntegerPropertyOptions();
      var od = new api.IntegerPropertyOptions.fromJson(o.toJson());
      checkIntegerPropertyOptions(od);
    });
  });

  unittest.group("obj-schema-IntegerValues", () {
    unittest.test("to-json--from-json", () {
      var o = buildIntegerValues();
      var od = new api.IntegerValues.fromJson(o.toJson());
      checkIntegerValues(od);
    });
  });

  unittest.group("obj-schema-Interaction", () {
    unittest.test("to-json--from-json", () {
      var o = buildInteraction();
      var od = new api.Interaction.fromJson(o.toJson());
      checkInteraction(od);
    });
  });

  unittest.group("obj-schema-Item", () {
    unittest.test("to-json--from-json", () {
      var o = buildItem();
      var od = new api.Item.fromJson(o.toJson());
      checkItem(od);
    });
  });

  unittest.group("obj-schema-ItemAcl", () {
    unittest.test("to-json--from-json", () {
      var o = buildItemAcl();
      var od = new api.ItemAcl.fromJson(o.toJson());
      checkItemAcl(od);
    });
  });

  unittest.group("obj-schema-ItemContent", () {
    unittest.test("to-json--from-json", () {
      var o = buildItemContent();
      var od = new api.ItemContent.fromJson(o.toJson());
      checkItemContent(od);
    });
  });

  unittest.group("obj-schema-ItemCountByStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildItemCountByStatus();
      var od = new api.ItemCountByStatus.fromJson(o.toJson());
      checkItemCountByStatus(od);
    });
  });

  unittest.group("obj-schema-ItemMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildItemMetadata();
      var od = new api.ItemMetadata.fromJson(o.toJson());
      checkItemMetadata(od);
    });
  });

  unittest.group("obj-schema-ItemStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildItemStatus();
      var od = new api.ItemStatus.fromJson(o.toJson());
      checkItemStatus(od);
    });
  });

  unittest.group("obj-schema-ItemStructuredData", () {
    unittest.test("to-json--from-json", () {
      var o = buildItemStructuredData();
      var od = new api.ItemStructuredData.fromJson(o.toJson());
      checkItemStructuredData(od);
    });
  });

  unittest.group("obj-schema-ListDataSourceResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListDataSourceResponse();
      var od = new api.ListDataSourceResponse.fromJson(o.toJson());
      checkListDataSourceResponse(od);
    });
  });

  unittest.group("obj-schema-ListItemNamesForUnmappedIdentityResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListItemNamesForUnmappedIdentityResponse();
      var od =
          new api.ListItemNamesForUnmappedIdentityResponse.fromJson(o.toJson());
      checkListItemNamesForUnmappedIdentityResponse(od);
    });
  });

  unittest.group("obj-schema-ListItemsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListItemsResponse();
      var od = new api.ListItemsResponse.fromJson(o.toJson());
      checkListItemsResponse(od);
    });
  });

  unittest.group("obj-schema-ListQuerySourcesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListQuerySourcesResponse();
      var od = new api.ListQuerySourcesResponse.fromJson(o.toJson());
      checkListQuerySourcesResponse(od);
    });
  });

  unittest.group("obj-schema-ListSearchApplicationsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListSearchApplicationsResponse();
      var od = new api.ListSearchApplicationsResponse.fromJson(o.toJson());
      checkListSearchApplicationsResponse(od);
    });
  });

  unittest.group("obj-schema-ListUnmappedIdentitiesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListUnmappedIdentitiesResponse();
      var od = new api.ListUnmappedIdentitiesResponse.fromJson(o.toJson());
      checkListUnmappedIdentitiesResponse(od);
    });
  });

  unittest.group("obj-schema-MatchRange", () {
    unittest.test("to-json--from-json", () {
      var o = buildMatchRange();
      var od = new api.MatchRange.fromJson(o.toJson());
      checkMatchRange(od);
    });
  });

  unittest.group("obj-schema-Media", () {
    unittest.test("to-json--from-json", () {
      var o = buildMedia();
      var od = new api.Media.fromJson(o.toJson());
      checkMedia(od);
    });
  });

  unittest.group("obj-schema-Metadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetadata();
      var od = new api.Metadata.fromJson(o.toJson());
      checkMetadata(od);
    });
  });

  unittest.group("obj-schema-Metaline", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetaline();
      var od = new api.Metaline.fromJson(o.toJson());
      checkMetaline(od);
    });
  });

  unittest.group("obj-schema-Name", () {
    unittest.test("to-json--from-json", () {
      var o = buildName();
      var od = new api.Name.fromJson(o.toJson());
      checkName(od);
    });
  });

  unittest.group("obj-schema-NamedProperty", () {
    unittest.test("to-json--from-json", () {
      var o = buildNamedProperty();
      var od = new api.NamedProperty.fromJson(o.toJson());
      checkNamedProperty(od);
    });
  });

  unittest.group("obj-schema-ObjectDefinition", () {
    unittest.test("to-json--from-json", () {
      var o = buildObjectDefinition();
      var od = new api.ObjectDefinition.fromJson(o.toJson());
      checkObjectDefinition(od);
    });
  });

  unittest.group("obj-schema-ObjectDisplayOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildObjectDisplayOptions();
      var od = new api.ObjectDisplayOptions.fromJson(o.toJson());
      checkObjectDisplayOptions(od);
    });
  });

  unittest.group("obj-schema-ObjectOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildObjectOptions();
      var od = new api.ObjectOptions.fromJson(o.toJson());
      checkObjectOptions(od);
    });
  });

  unittest.group("obj-schema-ObjectPropertyOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildObjectPropertyOptions();
      var od = new api.ObjectPropertyOptions.fromJson(o.toJson());
      checkObjectPropertyOptions(od);
    });
  });

  unittest.group("obj-schema-ObjectValues", () {
    unittest.test("to-json--from-json", () {
      var o = buildObjectValues();
      var od = new api.ObjectValues.fromJson(o.toJson());
      checkObjectValues(od);
    });
  });

  unittest.group("obj-schema-Operation", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperation();
      var od = new api.Operation.fromJson(o.toJson());
      checkOperation(od);
    });
  });

  unittest.group("obj-schema-PeopleSuggestion", () {
    unittest.test("to-json--from-json", () {
      var o = buildPeopleSuggestion();
      var od = new api.PeopleSuggestion.fromJson(o.toJson());
      checkPeopleSuggestion(od);
    });
  });

  unittest.group("obj-schema-Person", () {
    unittest.test("to-json--from-json", () {
      var o = buildPerson();
      var od = new api.Person.fromJson(o.toJson());
      checkPerson(od);
    });
  });

  unittest.group("obj-schema-Photo", () {
    unittest.test("to-json--from-json", () {
      var o = buildPhoto();
      var od = new api.Photo.fromJson(o.toJson());
      checkPhoto(od);
    });
  });

  unittest.group("obj-schema-PollItemsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildPollItemsRequest();
      var od = new api.PollItemsRequest.fromJson(o.toJson());
      checkPollItemsRequest(od);
    });
  });

  unittest.group("obj-schema-PollItemsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPollItemsResponse();
      var od = new api.PollItemsResponse.fromJson(o.toJson());
      checkPollItemsResponse(od);
    });
  });

  unittest.group("obj-schema-Principal", () {
    unittest.test("to-json--from-json", () {
      var o = buildPrincipal();
      var od = new api.Principal.fromJson(o.toJson());
      checkPrincipal(od);
    });
  });

  unittest.group("obj-schema-ProcessingError", () {
    unittest.test("to-json--from-json", () {
      var o = buildProcessingError();
      var od = new api.ProcessingError.fromJson(o.toJson());
      checkProcessingError(od);
    });
  });

  unittest.group("obj-schema-PropertyDefinition", () {
    unittest.test("to-json--from-json", () {
      var o = buildPropertyDefinition();
      var od = new api.PropertyDefinition.fromJson(o.toJson());
      checkPropertyDefinition(od);
    });
  });

  unittest.group("obj-schema-PropertyDisplayOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildPropertyDisplayOptions();
      var od = new api.PropertyDisplayOptions.fromJson(o.toJson());
      checkPropertyDisplayOptions(od);
    });
  });

  unittest.group("obj-schema-PushItem", () {
    unittest.test("to-json--from-json", () {
      var o = buildPushItem();
      var od = new api.PushItem.fromJson(o.toJson());
      checkPushItem(od);
    });
  });

  unittest.group("obj-schema-PushItemRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildPushItemRequest();
      var od = new api.PushItemRequest.fromJson(o.toJson());
      checkPushItemRequest(od);
    });
  });

  unittest.group("obj-schema-QueryCountByStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryCountByStatus();
      var od = new api.QueryCountByStatus.fromJson(o.toJson());
      checkQueryCountByStatus(od);
    });
  });

  unittest.group("obj-schema-QueryInterpretation", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryInterpretation();
      var od = new api.QueryInterpretation.fromJson(o.toJson());
      checkQueryInterpretation(od);
    });
  });

  unittest.group("obj-schema-QueryInterpretationOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryInterpretationOptions();
      var od = new api.QueryInterpretationOptions.fromJson(o.toJson());
      checkQueryInterpretationOptions(od);
    });
  });

  unittest.group("obj-schema-QueryItem", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryItem();
      var od = new api.QueryItem.fromJson(o.toJson());
      checkQueryItem(od);
    });
  });

  unittest.group("obj-schema-QueryOperator", () {
    unittest.test("to-json--from-json", () {
      var o = buildQueryOperator();
      var od = new api.QueryOperator.fromJson(o.toJson());
      checkQueryOperator(od);
    });
  });

  unittest.group("obj-schema-QuerySource", () {
    unittest.test("to-json--from-json", () {
      var o = buildQuerySource();
      var od = new api.QuerySource.fromJson(o.toJson());
      checkQuerySource(od);
    });
  });

  unittest.group("obj-schema-QuerySuggestion", () {
    unittest.test("to-json--from-json", () {
      var o = buildQuerySuggestion();
      var od = new api.QuerySuggestion.fromJson(o.toJson());
      checkQuerySuggestion(od);
    });
  });

  unittest.group("obj-schema-RepositoryError", () {
    unittest.test("to-json--from-json", () {
      var o = buildRepositoryError();
      var od = new api.RepositoryError.fromJson(o.toJson());
      checkRepositoryError(od);
    });
  });

  unittest.group("obj-schema-RequestOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildRequestOptions();
      var od = new api.RequestOptions.fromJson(o.toJson());
      checkRequestOptions(od);
    });
  });

  unittest.group("obj-schema-ResetSearchApplicationRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildResetSearchApplicationRequest();
      var od = new api.ResetSearchApplicationRequest.fromJson(o.toJson());
      checkResetSearchApplicationRequest(od);
    });
  });

  unittest.group("obj-schema-ResponseDebugInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildResponseDebugInfo();
      var od = new api.ResponseDebugInfo.fromJson(o.toJson());
      checkResponseDebugInfo(od);
    });
  });

  unittest.group("obj-schema-RestrictItem", () {
    unittest.test("to-json--from-json", () {
      var o = buildRestrictItem();
      var od = new api.RestrictItem.fromJson(o.toJson());
      checkRestrictItem(od);
    });
  });

  unittest.group("obj-schema-ResultCounts", () {
    unittest.test("to-json--from-json", () {
      var o = buildResultCounts();
      var od = new api.ResultCounts.fromJson(o.toJson());
      checkResultCounts(od);
    });
  });

  unittest.group("obj-schema-ResultDebugInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildResultDebugInfo();
      var od = new api.ResultDebugInfo.fromJson(o.toJson());
      checkResultDebugInfo(od);
    });
  });

  unittest.group("obj-schema-ResultDisplayField", () {
    unittest.test("to-json--from-json", () {
      var o = buildResultDisplayField();
      var od = new api.ResultDisplayField.fromJson(o.toJson());
      checkResultDisplayField(od);
    });
  });

  unittest.group("obj-schema-ResultDisplayLine", () {
    unittest.test("to-json--from-json", () {
      var o = buildResultDisplayLine();
      var od = new api.ResultDisplayLine.fromJson(o.toJson());
      checkResultDisplayLine(od);
    });
  });

  unittest.group("obj-schema-ResultDisplayMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildResultDisplayMetadata();
      var od = new api.ResultDisplayMetadata.fromJson(o.toJson());
      checkResultDisplayMetadata(od);
    });
  });

  unittest.group("obj-schema-RetrievalImportance", () {
    unittest.test("to-json--from-json", () {
      var o = buildRetrievalImportance();
      var od = new api.RetrievalImportance.fromJson(o.toJson());
      checkRetrievalImportance(od);
    });
  });

  unittest.group("obj-schema-Schema", () {
    unittest.test("to-json--from-json", () {
      var o = buildSchema();
      var od = new api.Schema.fromJson(o.toJson());
      checkSchema(od);
    });
  });

  unittest.group("obj-schema-ScoringConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildScoringConfig();
      var od = new api.ScoringConfig.fromJson(o.toJson());
      checkScoringConfig(od);
    });
  });

  unittest.group("obj-schema-SearchApplication", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchApplication();
      var od = new api.SearchApplication.fromJson(o.toJson());
      checkSearchApplication(od);
    });
  });

  unittest.group("obj-schema-SearchApplicationQueryStats", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchApplicationQueryStats();
      var od = new api.SearchApplicationQueryStats.fromJson(o.toJson());
      checkSearchApplicationQueryStats(od);
    });
  });

  unittest.group("obj-schema-SearchApplicationSessionStats", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchApplicationSessionStats();
      var od = new api.SearchApplicationSessionStats.fromJson(o.toJson());
      checkSearchApplicationSessionStats(od);
    });
  });

  unittest.group("obj-schema-SearchApplicationUserStats", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchApplicationUserStats();
      var od = new api.SearchApplicationUserStats.fromJson(o.toJson());
      checkSearchApplicationUserStats(od);
    });
  });

  unittest.group("obj-schema-SearchItemsByViewUrlRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchItemsByViewUrlRequest();
      var od = new api.SearchItemsByViewUrlRequest.fromJson(o.toJson());
      checkSearchItemsByViewUrlRequest(od);
    });
  });

  unittest.group("obj-schema-SearchItemsByViewUrlResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchItemsByViewUrlResponse();
      var od = new api.SearchItemsByViewUrlResponse.fromJson(o.toJson());
      checkSearchItemsByViewUrlResponse(od);
    });
  });

  unittest.group("obj-schema-SearchQualityMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchQualityMetadata();
      var od = new api.SearchQualityMetadata.fromJson(o.toJson());
      checkSearchQualityMetadata(od);
    });
  });

  unittest.group("obj-schema-SearchRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchRequest();
      var od = new api.SearchRequest.fromJson(o.toJson());
      checkSearchRequest(od);
    });
  });

  unittest.group("obj-schema-SearchResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchResponse();
      var od = new api.SearchResponse.fromJson(o.toJson());
      checkSearchResponse(od);
    });
  });

  unittest.group("obj-schema-SearchResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchResult();
      var od = new api.SearchResult.fromJson(o.toJson());
      checkSearchResult(od);
    });
  });

  unittest.group("obj-schema-Snippet", () {
    unittest.test("to-json--from-json", () {
      var o = buildSnippet();
      var od = new api.Snippet.fromJson(o.toJson());
      checkSnippet(od);
    });
  });

  unittest.group("obj-schema-SortOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildSortOptions();
      var od = new api.SortOptions.fromJson(o.toJson());
      checkSortOptions(od);
    });
  });

  unittest.group("obj-schema-Source", () {
    unittest.test("to-json--from-json", () {
      var o = buildSource();
      var od = new api.Source.fromJson(o.toJson());
      checkSource(od);
    });
  });

  unittest.group("obj-schema-SourceConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceConfig();
      var od = new api.SourceConfig.fromJson(o.toJson());
      checkSourceConfig(od);
    });
  });

  unittest.group("obj-schema-SourceCrowdingConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceCrowdingConfig();
      var od = new api.SourceCrowdingConfig.fromJson(o.toJson());
      checkSourceCrowdingConfig(od);
    });
  });

  unittest.group("obj-schema-SourceResultCount", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceResultCount();
      var od = new api.SourceResultCount.fromJson(o.toJson());
      checkSourceResultCount(od);
    });
  });

  unittest.group("obj-schema-SourceScoringConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildSourceScoringConfig();
      var od = new api.SourceScoringConfig.fromJson(o.toJson());
      checkSourceScoringConfig(od);
    });
  });

  unittest.group("obj-schema-SpellResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildSpellResult();
      var od = new api.SpellResult.fromJson(o.toJson());
      checkSpellResult(od);
    });
  });

  unittest.group("obj-schema-StartUploadItemRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildStartUploadItemRequest();
      var od = new api.StartUploadItemRequest.fromJson(o.toJson());
      checkStartUploadItemRequest(od);
    });
  });

  unittest.group("obj-schema-Status", () {
    unittest.test("to-json--from-json", () {
      var o = buildStatus();
      var od = new api.Status.fromJson(o.toJson());
      checkStatus(od);
    });
  });

  unittest.group("obj-schema-StructuredDataObject", () {
    unittest.test("to-json--from-json", () {
      var o = buildStructuredDataObject();
      var od = new api.StructuredDataObject.fromJson(o.toJson());
      checkStructuredDataObject(od);
    });
  });

  unittest.group("obj-schema-StructuredResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildStructuredResult();
      var od = new api.StructuredResult.fromJson(o.toJson());
      checkStructuredResult(od);
    });
  });

  unittest.group("obj-schema-SuggestRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSuggestRequest();
      var od = new api.SuggestRequest.fromJson(o.toJson());
      checkSuggestRequest(od);
    });
  });

  unittest.group("obj-schema-SuggestResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSuggestResponse();
      var od = new api.SuggestResponse.fromJson(o.toJson());
      checkSuggestResponse(od);
    });
  });

  unittest.group("obj-schema-SuggestResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildSuggestResult();
      var od = new api.SuggestResult.fromJson(o.toJson());
      checkSuggestResult(od);
    });
  });

  unittest.group("obj-schema-TextOperatorOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildTextOperatorOptions();
      var od = new api.TextOperatorOptions.fromJson(o.toJson());
      checkTextOperatorOptions(od);
    });
  });

  unittest.group("obj-schema-TextPropertyOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildTextPropertyOptions();
      var od = new api.TextPropertyOptions.fromJson(o.toJson());
      checkTextPropertyOptions(od);
    });
  });

  unittest.group("obj-schema-TextValues", () {
    unittest.test("to-json--from-json", () {
      var o = buildTextValues();
      var od = new api.TextValues.fromJson(o.toJson());
      checkTextValues(od);
    });
  });

  unittest.group("obj-schema-TimestampOperatorOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildTimestampOperatorOptions();
      var od = new api.TimestampOperatorOptions.fromJson(o.toJson());
      checkTimestampOperatorOptions(od);
    });
  });

  unittest.group("obj-schema-TimestampPropertyOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildTimestampPropertyOptions();
      var od = new api.TimestampPropertyOptions.fromJson(o.toJson());
      checkTimestampPropertyOptions(od);
    });
  });

  unittest.group("obj-schema-TimestampValues", () {
    unittest.test("to-json--from-json", () {
      var o = buildTimestampValues();
      var od = new api.TimestampValues.fromJson(o.toJson());
      checkTimestampValues(od);
    });
  });

  unittest.group("obj-schema-UnmappedIdentity", () {
    unittest.test("to-json--from-json", () {
      var o = buildUnmappedIdentity();
      var od = new api.UnmappedIdentity.fromJson(o.toJson());
      checkUnmappedIdentity(od);
    });
  });

  unittest.group("obj-schema-UnreserveItemsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildUnreserveItemsRequest();
      var od = new api.UnreserveItemsRequest.fromJson(o.toJson());
      checkUnreserveItemsRequest(od);
    });
  });

  unittest.group("obj-schema-UpdateDataSourceRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildUpdateDataSourceRequest();
      var od = new api.UpdateDataSourceRequest.fromJson(o.toJson());
      checkUpdateDataSourceRequest(od);
    });
  });

  unittest.group("obj-schema-UpdateSchemaRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildUpdateSchemaRequest();
      var od = new api.UpdateSchemaRequest.fromJson(o.toJson());
      checkUpdateSchemaRequest(od);
    });
  });

  unittest.group("obj-schema-UploadItemRef", () {
    unittest.test("to-json--from-json", () {
      var o = buildUploadItemRef();
      var od = new api.UploadItemRef.fromJson(o.toJson());
      checkUploadItemRef(od);
    });
  });

  unittest.group("obj-schema-Value", () {
    unittest.test("to-json--from-json", () {
      var o = buildValue();
      var od = new api.Value.fromJson(o.toJson());
      checkValue(od);
    });
  });

  unittest.group("obj-schema-ValueFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildValueFilter();
      var od = new api.ValueFilter.fromJson(o.toJson());
      checkValueFilter(od);
    });
  });

  unittest.group("resource-DebugDatasourcesItemsResourceApi", () {
    unittest.test("method--checkAccess", () {
      var mock = new HttpServerMock();
      api.DebugDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).debug.datasources.items;
      var arg_request = buildPrincipal();
      var arg_name = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Principal.fromJson(json);
        checkPrincipal(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("v1/debug/"));
        pathOffset += 9;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCheckAccessResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .checkAccess(arg_request, arg_name,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCheckAccessResponse(response);
      })));
    });

    unittest.test("method--searchByViewUrl", () {
      var mock = new HttpServerMock();
      api.DebugDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).debug.datasources.items;
      var arg_request = buildSearchItemsByViewUrlRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.SearchItemsByViewUrlRequest.fromJson(json);
        checkSearchItemsByViewUrlRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("v1/debug/"));
        pathOffset += 9;
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
        var resp = convert.json.encode(buildSearchItemsByViewUrlResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .searchByViewUrl(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSearchItemsByViewUrlResponse(response);
      })));
    });
  });

  unittest.group("resource-DebugDatasourcesItemsUnmappedidsResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.DebugDatasourcesItemsUnmappedidsResourceApi res =
          new api.CloudsearchApi(mock).debug.datasources.items.unmappedids;
      var arg_parent = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("v1/debug/"));
        pathOffset += 9;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListUnmappedIdentitiesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_parent,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListUnmappedIdentitiesResponse(response);
      })));
    });
  });

  unittest.group("resource-DebugIdentitysourcesItemsResourceApi", () {
    unittest.test("method--listForunmappedidentity", () {
      var mock = new HttpServerMock();
      api.DebugIdentitysourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).debug.identitysources.items;
      var arg_parent = "foo";
      var arg_groupResourceName = "foo";
      var arg_userResourceName = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("v1/debug/"));
        pathOffset += 9;
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
        unittest.expect(queryMap["groupResourceName"].first,
            unittest.equals(arg_groupResourceName));
        unittest.expect(queryMap["userResourceName"].first,
            unittest.equals(arg_userResourceName));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json
            .encode(buildListItemNamesForUnmappedIdentityResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .listForunmappedidentity(arg_parent,
              groupResourceName: arg_groupResourceName,
              userResourceName: arg_userResourceName,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListItemNamesForUnmappedIdentityResponse(response);
      })));
    });
  });

  unittest.group("resource-DebugIdentitysourcesUnmappedidsResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.DebugIdentitysourcesUnmappedidsResourceApi res =
          new api.CloudsearchApi(mock).debug.identitysources.unmappedids;
      var arg_parent = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_resolutionStatusCode = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("v1/debug/"));
        pathOffset += 9;
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
        unittest.expect(queryMap["resolutionStatusCode"].first,
            unittest.equals(arg_resolutionStatusCode));
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListUnmappedIdentitiesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_parent,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              resolutionStatusCode: arg_resolutionStatusCode,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListUnmappedIdentitiesResponse(response);
      })));
    });
  });

  unittest.group("resource-IndexingDatasourcesResourceApi", () {
    unittest.test("method--deleteSchema", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources;
      var arg_name = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .deleteSchema(arg_name,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--getSchema", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources;
      var arg_name = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSchema());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getSchema(arg_name,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSchema(response);
      })));
    });

    unittest.test("method--updateSchema", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources;
      var arg_request = buildUpdateSchemaRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.UpdateSchemaRequest.fromJson(json);
        checkUpdateSchemaRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .updateSchema(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });
  });

  unittest.group("resource-IndexingDatasourcesItemsResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources.items;
      var arg_name = "foo";
      var arg_connectorName = "foo";
      var arg_version = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_mode = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        unittest.expect(queryMap["connectorName"].first,
            unittest.equals(arg_connectorName));
        unittest.expect(
            queryMap["version"].first, unittest.equals(arg_version));
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["mode"].first, unittest.equals(arg_mode));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_name,
              connectorName: arg_connectorName,
              version: arg_version,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              mode: arg_mode,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--deleteQueueItems", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources.items;
      var arg_request = buildDeleteQueueItemsRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.DeleteQueueItemsRequest.fromJson(json);
        checkDeleteQueueItemsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .deleteQueueItems(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources.items;
      var arg_name = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_connectorName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["connectorName"].first,
            unittest.equals(arg_connectorName));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildItem());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              connectorName: arg_connectorName,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkItem(response);
      })));
    });

    unittest.test("method--index", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources.items;
      var arg_request = buildIndexItemRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.IndexItemRequest.fromJson(json);
        checkIndexItemRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .index(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources.items;
      var arg_name = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_debugOptions_enableDebugging = true;
      var arg_connectorName = "foo";
      var arg_brief = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["connectorName"].first,
            unittest.equals(arg_connectorName));
        unittest.expect(queryMap["brief"].first, unittest.equals("$arg_brief"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListItemsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_name,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              connectorName: arg_connectorName,
              brief: arg_brief,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListItemsResponse(response);
      })));
    });

    unittest.test("method--poll", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources.items;
      var arg_request = buildPollItemsRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.PollItemsRequest.fromJson(json);
        checkPollItemsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildPollItemsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .poll(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPollItemsResponse(response);
      })));
    });

    unittest.test("method--push", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources.items;
      var arg_request = buildPushItemRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.PushItemRequest.fromJson(json);
        checkPushItemRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildItem());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .push(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkItem(response);
      })));
    });

    unittest.test("method--unreserve", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources.items;
      var arg_request = buildUnreserveItemsRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.UnreserveItemsRequest.fromJson(json);
        checkUnreserveItemsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .unreserve(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--upload", () {
      var mock = new HttpServerMock();
      api.IndexingDatasourcesItemsResourceApi res =
          new api.CloudsearchApi(mock).indexing.datasources.items;
      var arg_request = buildStartUploadItemRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.StartUploadItemRequest.fromJson(json);
        checkStartUploadItemRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/indexing/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildUploadItemRef());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .upload(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUploadItemRef(response);
      })));
    });
  });

  unittest.group("resource-MediaResourceApi", () {
    unittest.test("method--upload", () {
      // TODO: Implement tests for media upload;
      // TODO: Implement tests for media download;

      var mock = new HttpServerMock();
      api.MediaResourceApi res = new api.CloudsearchApi(mock).media;
      var arg_request = buildMedia();
      var arg_resourceName = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Media.fromJson(json);
        checkMedia(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("v1/media/"));
        pathOffset += 9;
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
        var resp = convert.json.encode(buildMedia());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .upload(arg_request, arg_resourceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkMedia(response);
      })));
    });
  });

  unittest.group("resource-OperationsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.OperationsResourceApi res = new api.CloudsearchApi(mock).operations;
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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });
  });

  unittest.group("resource-QueryResourceApi", () {
    unittest.test("method--search", () {
      var mock = new HttpServerMock();
      api.QueryResourceApi res = new api.CloudsearchApi(mock).query;
      var arg_request = buildSearchRequest();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.SearchRequest.fromJson(json);
        checkSearchRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/query/search"));
        pathOffset += 15;

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
        var resp = convert.json.encode(buildSearchResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .search(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSearchResponse(response);
      })));
    });

    unittest.test("method--suggest", () {
      var mock = new HttpServerMock();
      api.QueryResourceApi res = new api.CloudsearchApi(mock).query;
      var arg_request = buildSuggestRequest();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.SuggestRequest.fromJson(json);
        checkSuggestRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("v1/query/suggest"));
        pathOffset += 16;

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
        var resp = convert.json.encode(buildSuggestResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .suggest(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSuggestResponse(response);
      })));
    });
  });

  unittest.group("resource-QuerySourcesResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.QuerySourcesResourceApi res =
          new api.CloudsearchApi(mock).query.sources;
      var arg_requestOptions_languageCode = "foo";
      var arg_requestOptions_searchApplicationId = "foo";
      var arg_requestOptions_timeZone = "foo";
      var arg_pageToken = "foo";
      var arg_requestOptions_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("v1/query/sources"));
        pathOffset += 16;

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
        unittest.expect(queryMap["requestOptions.languageCode"].first,
            unittest.equals(arg_requestOptions_languageCode));
        unittest.expect(queryMap["requestOptions.searchApplicationId"].first,
            unittest.equals(arg_requestOptions_searchApplicationId));
        unittest.expect(queryMap["requestOptions.timeZone"].first,
            unittest.equals(arg_requestOptions_timeZone));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["requestOptions.debugOptions.enableDebugging"].first,
            unittest
                .equals("$arg_requestOptions_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListQuerySourcesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              requestOptions_languageCode: arg_requestOptions_languageCode,
              requestOptions_searchApplicationId:
                  arg_requestOptions_searchApplicationId,
              requestOptions_timeZone: arg_requestOptions_timeZone,
              pageToken: arg_pageToken,
              requestOptions_debugOptions_enableDebugging:
                  arg_requestOptions_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListQuerySourcesResponse(response);
      })));
    });
  });

  unittest.group("resource-SettingsDatasourcesResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.SettingsDatasourcesResourceApi res =
          new api.CloudsearchApi(mock).settings.datasources;
      var arg_request = buildDataSource();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.DataSource.fromJson(json);
        checkDataSource(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("v1/settings/datasources"));
        pathOffset += 23;

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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.SettingsDatasourcesResourceApi res =
          new api.CloudsearchApi(mock).settings.datasources;
      var arg_name = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/settings/"));
        pathOffset += 12;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_name,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.SettingsDatasourcesResourceApi res =
          new api.CloudsearchApi(mock).settings.datasources;
      var arg_name = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/settings/"));
        pathOffset += 12;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildDataSource());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkDataSource(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.SettingsDatasourcesResourceApi res =
          new api.CloudsearchApi(mock).settings.datasources;
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("v1/settings/datasources"));
        pathOffset += 23;

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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListDataSourceResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListDataSourceResponse(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.SettingsDatasourcesResourceApi res =
          new api.CloudsearchApi(mock).settings.datasources;
      var arg_request = buildUpdateDataSourceRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.UpdateDataSourceRequest.fromJson(json);
        checkUpdateDataSourceRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/settings/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });
  });

  unittest.group("resource-SettingsSearchapplicationsResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.SettingsSearchapplicationsResourceApi res =
          new api.CloudsearchApi(mock).settings.searchapplications;
      var arg_request = buildSearchApplication();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.SearchApplication.fromJson(json);
        checkSearchApplication(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 30),
            unittest.equals("v1/settings/searchapplications"));
        pathOffset += 30;

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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.SettingsSearchapplicationsResourceApi res =
          new api.CloudsearchApi(mock).settings.searchapplications;
      var arg_name = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/settings/"));
        pathOffset += 12;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_name,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.SettingsSearchapplicationsResourceApi res =
          new api.CloudsearchApi(mock).settings.searchapplications;
      var arg_name = "foo";
      var arg_debugOptions_enableDebugging = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/settings/"));
        pathOffset += 12;
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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSearchApplication());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name,
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSearchApplication(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.SettingsSearchapplicationsResourceApi res =
          new api.CloudsearchApi(mock).settings.searchapplications;
      var arg_debugOptions_enableDebugging = true;
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
        unittest.expect(path.substring(pathOffset, pathOffset + 30),
            unittest.equals("v1/settings/searchapplications"));
        pathOffset += 30;

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
        unittest.expect(queryMap["debugOptions.enableDebugging"].first,
            unittest.equals("$arg_debugOptions_enableDebugging"));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListSearchApplicationsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              debugOptions_enableDebugging: arg_debugOptions_enableDebugging,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListSearchApplicationsResponse(response);
      })));
    });

    unittest.test("method--reset", () {
      var mock = new HttpServerMock();
      api.SettingsSearchapplicationsResourceApi res =
          new api.CloudsearchApi(mock).settings.searchapplications;
      var arg_request = buildResetSearchApplicationRequest();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ResetSearchApplicationRequest.fromJson(json);
        checkResetSearchApplicationRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/settings/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .reset(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.SettingsSearchapplicationsResourceApi res =
          new api.CloudsearchApi(mock).settings.searchapplications;
      var arg_request = buildSearchApplication();
      var arg_name = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.SearchApplication.fromJson(json);
        checkSearchApplication(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("v1/settings/"));
        pathOffset += 12;
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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_name, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });
  });

  unittest.group("resource-StatsResourceApi", () {
    unittest.test("method--getIndex", () {
      var mock = new HttpServerMock();
      api.StatsResourceApi res = new api.CloudsearchApi(mock).stats;
      var arg_toDate_year = 42;
      var arg_fromDate_month = 42;
      var arg_fromDate_day = 42;
      var arg_fromDate_year = 42;
      var arg_toDate_day = 42;
      var arg_toDate_month = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("v1/stats/index"));
        pathOffset += 14;

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
        unittest.expect(core.int.parse(queryMap["toDate.year"].first),
            unittest.equals(arg_toDate_year));
        unittest.expect(core.int.parse(queryMap["fromDate.month"].first),
            unittest.equals(arg_fromDate_month));
        unittest.expect(core.int.parse(queryMap["fromDate.day"].first),
            unittest.equals(arg_fromDate_day));
        unittest.expect(core.int.parse(queryMap["fromDate.year"].first),
            unittest.equals(arg_fromDate_year));
        unittest.expect(core.int.parse(queryMap["toDate.day"].first),
            unittest.equals(arg_toDate_day));
        unittest.expect(core.int.parse(queryMap["toDate.month"].first),
            unittest.equals(arg_toDate_month));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildGetCustomerIndexStatsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getIndex(
              toDate_year: arg_toDate_year,
              fromDate_month: arg_fromDate_month,
              fromDate_day: arg_fromDate_day,
              fromDate_year: arg_fromDate_year,
              toDate_day: arg_toDate_day,
              toDate_month: arg_toDate_month,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGetCustomerIndexStatsResponse(response);
      })));
    });

    unittest.test("method--getQuery", () {
      var mock = new HttpServerMock();
      api.StatsResourceApi res = new api.CloudsearchApi(mock).stats;
      var arg_fromDate_year = 42;
      var arg_toDate_day = 42;
      var arg_toDate_month = 42;
      var arg_toDate_year = 42;
      var arg_fromDate_month = 42;
      var arg_fromDate_day = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("v1/stats/query"));
        pathOffset += 14;

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
        unittest.expect(core.int.parse(queryMap["fromDate.year"].first),
            unittest.equals(arg_fromDate_year));
        unittest.expect(core.int.parse(queryMap["toDate.day"].first),
            unittest.equals(arg_toDate_day));
        unittest.expect(core.int.parse(queryMap["toDate.month"].first),
            unittest.equals(arg_toDate_month));
        unittest.expect(core.int.parse(queryMap["toDate.year"].first),
            unittest.equals(arg_toDate_year));
        unittest.expect(core.int.parse(queryMap["fromDate.month"].first),
            unittest.equals(arg_fromDate_month));
        unittest.expect(core.int.parse(queryMap["fromDate.day"].first),
            unittest.equals(arg_fromDate_day));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildGetCustomerQueryStatsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getQuery(
              fromDate_year: arg_fromDate_year,
              toDate_day: arg_toDate_day,
              toDate_month: arg_toDate_month,
              toDate_year: arg_toDate_year,
              fromDate_month: arg_fromDate_month,
              fromDate_day: arg_fromDate_day,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGetCustomerQueryStatsResponse(response);
      })));
    });

    unittest.test("method--getSession", () {
      var mock = new HttpServerMock();
      api.StatsResourceApi res = new api.CloudsearchApi(mock).stats;
      var arg_fromDate_month = 42;
      var arg_fromDate_day = 42;
      var arg_fromDate_year = 42;
      var arg_toDate_day = 42;
      var arg_toDate_month = 42;
      var arg_toDate_year = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("v1/stats/session"));
        pathOffset += 16;

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
        unittest.expect(core.int.parse(queryMap["fromDate.month"].first),
            unittest.equals(arg_fromDate_month));
        unittest.expect(core.int.parse(queryMap["fromDate.day"].first),
            unittest.equals(arg_fromDate_day));
        unittest.expect(core.int.parse(queryMap["fromDate.year"].first),
            unittest.equals(arg_fromDate_year));
        unittest.expect(core.int.parse(queryMap["toDate.day"].first),
            unittest.equals(arg_toDate_day));
        unittest.expect(core.int.parse(queryMap["toDate.month"].first),
            unittest.equals(arg_toDate_month));
        unittest.expect(core.int.parse(queryMap["toDate.year"].first),
            unittest.equals(arg_toDate_year));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildGetCustomerSessionStatsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getSession(
              fromDate_month: arg_fromDate_month,
              fromDate_day: arg_fromDate_day,
              fromDate_year: arg_fromDate_year,
              toDate_day: arg_toDate_day,
              toDate_month: arg_toDate_month,
              toDate_year: arg_toDate_year,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGetCustomerSessionStatsResponse(response);
      })));
    });

    unittest.test("method--getUser", () {
      var mock = new HttpServerMock();
      api.StatsResourceApi res = new api.CloudsearchApi(mock).stats;
      var arg_toDate_day = 42;
      var arg_toDate_month = 42;
      var arg_toDate_year = 42;
      var arg_fromDate_month = 42;
      var arg_fromDate_day = 42;
      var arg_fromDate_year = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("v1/stats/user"));
        pathOffset += 13;

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
        unittest.expect(core.int.parse(queryMap["toDate.day"].first),
            unittest.equals(arg_toDate_day));
        unittest.expect(core.int.parse(queryMap["toDate.month"].first),
            unittest.equals(arg_toDate_month));
        unittest.expect(core.int.parse(queryMap["toDate.year"].first),
            unittest.equals(arg_toDate_year));
        unittest.expect(core.int.parse(queryMap["fromDate.month"].first),
            unittest.equals(arg_fromDate_month));
        unittest.expect(core.int.parse(queryMap["fromDate.day"].first),
            unittest.equals(arg_fromDate_day));
        unittest.expect(core.int.parse(queryMap["fromDate.year"].first),
            unittest.equals(arg_fromDate_year));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildGetCustomerUserStatsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getUser(
              toDate_day: arg_toDate_day,
              toDate_month: arg_toDate_month,
              toDate_year: arg_toDate_year,
              fromDate_month: arg_fromDate_month,
              fromDate_day: arg_fromDate_day,
              fromDate_year: arg_fromDate_year,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGetCustomerUserStatsResponse(response);
      })));
    });
  });

  unittest.group("resource-StatsIndexDatasourcesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.StatsIndexDatasourcesResourceApi res =
          new api.CloudsearchApi(mock).stats.index.datasources;
      var arg_name = "foo";
      var arg_toDate_month = 42;
      var arg_toDate_year = 42;
      var arg_fromDate_month = 42;
      var arg_fromDate_day = 42;
      var arg_fromDate_year = 42;
      var arg_toDate_day = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/stats/index/"));
        pathOffset += 15;
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
        unittest.expect(core.int.parse(queryMap["toDate.month"].first),
            unittest.equals(arg_toDate_month));
        unittest.expect(core.int.parse(queryMap["toDate.year"].first),
            unittest.equals(arg_toDate_year));
        unittest.expect(core.int.parse(queryMap["fromDate.month"].first),
            unittest.equals(arg_fromDate_month));
        unittest.expect(core.int.parse(queryMap["fromDate.day"].first),
            unittest.equals(arg_fromDate_day));
        unittest.expect(core.int.parse(queryMap["fromDate.year"].first),
            unittest.equals(arg_fromDate_year));
        unittest.expect(core.int.parse(queryMap["toDate.day"].first),
            unittest.equals(arg_toDate_day));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildGetDataSourceIndexStatsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name,
              toDate_month: arg_toDate_month,
              toDate_year: arg_toDate_year,
              fromDate_month: arg_fromDate_month,
              fromDate_day: arg_fromDate_day,
              fromDate_year: arg_fromDate_year,
              toDate_day: arg_toDate_day,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGetDataSourceIndexStatsResponse(response);
      })));
    });
  });

  unittest.group("resource-StatsQuerySearchapplicationsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.StatsQuerySearchapplicationsResourceApi res =
          new api.CloudsearchApi(mock).stats.query.searchapplications;
      var arg_name = "foo";
      var arg_toDate_day = 42;
      var arg_toDate_month = 42;
      var arg_toDate_year = 42;
      var arg_fromDate_month = 42;
      var arg_fromDate_day = 42;
      var arg_fromDate_year = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/stats/query/"));
        pathOffset += 15;
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
        unittest.expect(core.int.parse(queryMap["toDate.day"].first),
            unittest.equals(arg_toDate_day));
        unittest.expect(core.int.parse(queryMap["toDate.month"].first),
            unittest.equals(arg_toDate_month));
        unittest.expect(core.int.parse(queryMap["toDate.year"].first),
            unittest.equals(arg_toDate_year));
        unittest.expect(core.int.parse(queryMap["fromDate.month"].first),
            unittest.equals(arg_fromDate_month));
        unittest.expect(core.int.parse(queryMap["fromDate.day"].first),
            unittest.equals(arg_fromDate_day));
        unittest.expect(core.int.parse(queryMap["fromDate.year"].first),
            unittest.equals(arg_fromDate_year));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp =
            convert.json.encode(buildGetSearchApplicationQueryStatsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name,
              toDate_day: arg_toDate_day,
              toDate_month: arg_toDate_month,
              toDate_year: arg_toDate_year,
              fromDate_month: arg_fromDate_month,
              fromDate_day: arg_fromDate_day,
              fromDate_year: arg_fromDate_year,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGetSearchApplicationQueryStatsResponse(response);
      })));
    });
  });

  unittest.group("resource-StatsSessionSearchapplicationsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.StatsSessionSearchapplicationsResourceApi res =
          new api.CloudsearchApi(mock).stats.session.searchapplications;
      var arg_name = "foo";
      var arg_fromDate_month = 42;
      var arg_fromDate_day = 42;
      var arg_fromDate_year = 42;
      var arg_toDate_day = 42;
      var arg_toDate_month = 42;
      var arg_toDate_year = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("v1/stats/session/"));
        pathOffset += 17;
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
        unittest.expect(core.int.parse(queryMap["fromDate.month"].first),
            unittest.equals(arg_fromDate_month));
        unittest.expect(core.int.parse(queryMap["fromDate.day"].first),
            unittest.equals(arg_fromDate_day));
        unittest.expect(core.int.parse(queryMap["fromDate.year"].first),
            unittest.equals(arg_fromDate_year));
        unittest.expect(core.int.parse(queryMap["toDate.day"].first),
            unittest.equals(arg_toDate_day));
        unittest.expect(core.int.parse(queryMap["toDate.month"].first),
            unittest.equals(arg_toDate_month));
        unittest.expect(core.int.parse(queryMap["toDate.year"].first),
            unittest.equals(arg_toDate_year));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json
            .encode(buildGetSearchApplicationSessionStatsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name,
              fromDate_month: arg_fromDate_month,
              fromDate_day: arg_fromDate_day,
              fromDate_year: arg_fromDate_year,
              toDate_day: arg_toDate_day,
              toDate_month: arg_toDate_month,
              toDate_year: arg_toDate_year,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGetSearchApplicationSessionStatsResponse(response);
      })));
    });
  });

  unittest.group("resource-StatsUserSearchapplicationsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.StatsUserSearchapplicationsResourceApi res =
          new api.CloudsearchApi(mock).stats.user.searchapplications;
      var arg_name = "foo";
      var arg_fromDate_year = 42;
      var arg_toDate_day = 42;
      var arg_toDate_month = 42;
      var arg_toDate_year = 42;
      var arg_fromDate_month = 42;
      var arg_fromDate_day = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("v1/stats/user/"));
        pathOffset += 14;
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
        unittest.expect(core.int.parse(queryMap["fromDate.year"].first),
            unittest.equals(arg_fromDate_year));
        unittest.expect(core.int.parse(queryMap["toDate.day"].first),
            unittest.equals(arg_toDate_day));
        unittest.expect(core.int.parse(queryMap["toDate.month"].first),
            unittest.equals(arg_toDate_month));
        unittest.expect(core.int.parse(queryMap["toDate.year"].first),
            unittest.equals(arg_toDate_year));
        unittest.expect(core.int.parse(queryMap["fromDate.month"].first),
            unittest.equals(arg_fromDate_month));
        unittest.expect(core.int.parse(queryMap["fromDate.day"].first),
            unittest.equals(arg_fromDate_day));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp =
            convert.json.encode(buildGetSearchApplicationUserStatsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_name,
              fromDate_year: arg_fromDate_year,
              toDate_day: arg_toDate_day,
              toDate_month: arg_toDate_month,
              toDate_year: arg_toDate_year,
              fromDate_month: arg_fromDate_month,
              fromDate_day: arg_fromDate_day,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGetSearchApplicationUserStatsResponse(response);
      })));
    });
  });
}
