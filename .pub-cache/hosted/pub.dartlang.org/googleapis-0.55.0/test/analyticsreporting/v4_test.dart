library googleapis.analyticsreporting.v4.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/analyticsreporting/v4.dart' as api;

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

buildUnnamed2587() {
  var o = new core.List<api.CustomDimension>();
  o.add(buildCustomDimension());
  o.add(buildCustomDimension());
  return o;
}

checkUnnamed2587(core.List<api.CustomDimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomDimension(o[0]);
  checkCustomDimension(o[1]);
}

core.int buildCounterActivity = 0;
buildActivity() {
  var o = new api.Activity();
  buildCounterActivity++;
  if (buildCounterActivity < 3) {
    o.activityTime = "foo";
    o.activityType = "foo";
    o.appview = buildScreenviewData();
    o.campaign = "foo";
    o.channelGrouping = "foo";
    o.customDimension = buildUnnamed2587();
    o.ecommerce = buildEcommerceData();
    o.event = buildEventData();
    o.goals = buildGoalSetData();
    o.hostname = "foo";
    o.keyword = "foo";
    o.landingPagePath = "foo";
    o.medium = "foo";
    o.pageview = buildPageviewData();
    o.source = "foo";
  }
  buildCounterActivity--;
  return o;
}

checkActivity(api.Activity o) {
  buildCounterActivity++;
  if (buildCounterActivity < 3) {
    unittest.expect(o.activityTime, unittest.equals('foo'));
    unittest.expect(o.activityType, unittest.equals('foo'));
    checkScreenviewData(o.appview);
    unittest.expect(o.campaign, unittest.equals('foo'));
    unittest.expect(o.channelGrouping, unittest.equals('foo'));
    checkUnnamed2587(o.customDimension);
    checkEcommerceData(o.ecommerce);
    checkEventData(o.event);
    checkGoalSetData(o.goals);
    unittest.expect(o.hostname, unittest.equals('foo'));
    unittest.expect(o.keyword, unittest.equals('foo'));
    unittest.expect(o.landingPagePath, unittest.equals('foo'));
    unittest.expect(o.medium, unittest.equals('foo'));
    checkPageviewData(o.pageview);
    unittest.expect(o.source, unittest.equals('foo'));
  }
  buildCounterActivity--;
}

core.int buildCounterCohort = 0;
buildCohort() {
  var o = new api.Cohort();
  buildCounterCohort++;
  if (buildCounterCohort < 3) {
    o.dateRange = buildDateRange();
    o.name = "foo";
    o.type = "foo";
  }
  buildCounterCohort--;
  return o;
}

checkCohort(api.Cohort o) {
  buildCounterCohort++;
  if (buildCounterCohort < 3) {
    checkDateRange(o.dateRange);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterCohort--;
}

buildUnnamed2588() {
  var o = new core.List<api.Cohort>();
  o.add(buildCohort());
  o.add(buildCohort());
  return o;
}

checkUnnamed2588(core.List<api.Cohort> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCohort(o[0]);
  checkCohort(o[1]);
}

core.int buildCounterCohortGroup = 0;
buildCohortGroup() {
  var o = new api.CohortGroup();
  buildCounterCohortGroup++;
  if (buildCounterCohortGroup < 3) {
    o.cohorts = buildUnnamed2588();
    o.lifetimeValue = true;
  }
  buildCounterCohortGroup--;
  return o;
}

checkCohortGroup(api.CohortGroup o) {
  buildCounterCohortGroup++;
  if (buildCounterCohortGroup < 3) {
    checkUnnamed2588(o.cohorts);
    unittest.expect(o.lifetimeValue, unittest.isTrue);
  }
  buildCounterCohortGroup--;
}

buildUnnamed2589() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2589(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterColumnHeader = 0;
buildColumnHeader() {
  var o = new api.ColumnHeader();
  buildCounterColumnHeader++;
  if (buildCounterColumnHeader < 3) {
    o.dimensions = buildUnnamed2589();
    o.metricHeader = buildMetricHeader();
  }
  buildCounterColumnHeader--;
  return o;
}

checkColumnHeader(api.ColumnHeader o) {
  buildCounterColumnHeader++;
  if (buildCounterColumnHeader < 3) {
    checkUnnamed2589(o.dimensions);
    checkMetricHeader(o.metricHeader);
  }
  buildCounterColumnHeader--;
}

core.int buildCounterCustomDimension = 0;
buildCustomDimension() {
  var o = new api.CustomDimension();
  buildCounterCustomDimension++;
  if (buildCounterCustomDimension < 3) {
    o.index = 42;
    o.value = "foo";
  }
  buildCounterCustomDimension--;
  return o;
}

checkCustomDimension(api.CustomDimension o) {
  buildCounterCustomDimension++;
  if (buildCounterCustomDimension < 3) {
    unittest.expect(o.index, unittest.equals(42));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterCustomDimension--;
}

core.int buildCounterDateRange = 0;
buildDateRange() {
  var o = new api.DateRange();
  buildCounterDateRange++;
  if (buildCounterDateRange < 3) {
    o.endDate = "foo";
    o.startDate = "foo";
  }
  buildCounterDateRange--;
  return o;
}

checkDateRange(api.DateRange o) {
  buildCounterDateRange++;
  if (buildCounterDateRange < 3) {
    unittest.expect(o.endDate, unittest.equals('foo'));
    unittest.expect(o.startDate, unittest.equals('foo'));
  }
  buildCounterDateRange--;
}

buildUnnamed2590() {
  var o = new core.List<api.PivotValueRegion>();
  o.add(buildPivotValueRegion());
  o.add(buildPivotValueRegion());
  return o;
}

checkUnnamed2590(core.List<api.PivotValueRegion> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPivotValueRegion(o[0]);
  checkPivotValueRegion(o[1]);
}

buildUnnamed2591() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2591(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDateRangeValues = 0;
buildDateRangeValues() {
  var o = new api.DateRangeValues();
  buildCounterDateRangeValues++;
  if (buildCounterDateRangeValues < 3) {
    o.pivotValueRegions = buildUnnamed2590();
    o.values = buildUnnamed2591();
  }
  buildCounterDateRangeValues--;
  return o;
}

checkDateRangeValues(api.DateRangeValues o) {
  buildCounterDateRangeValues++;
  if (buildCounterDateRangeValues < 3) {
    checkUnnamed2590(o.pivotValueRegions);
    checkUnnamed2591(o.values);
  }
  buildCounterDateRangeValues--;
}

buildUnnamed2592() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2592(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDimension = 0;
buildDimension() {
  var o = new api.Dimension();
  buildCounterDimension++;
  if (buildCounterDimension < 3) {
    o.histogramBuckets = buildUnnamed2592();
    o.name = "foo";
  }
  buildCounterDimension--;
  return o;
}

checkDimension(api.Dimension o) {
  buildCounterDimension++;
  if (buildCounterDimension < 3) {
    checkUnnamed2592(o.histogramBuckets);
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterDimension--;
}

buildUnnamed2593() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2593(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDimensionFilter = 0;
buildDimensionFilter() {
  var o = new api.DimensionFilter();
  buildCounterDimensionFilter++;
  if (buildCounterDimensionFilter < 3) {
    o.caseSensitive = true;
    o.dimensionName = "foo";
    o.expressions = buildUnnamed2593();
    o.not = true;
    o.operator = "foo";
  }
  buildCounterDimensionFilter--;
  return o;
}

checkDimensionFilter(api.DimensionFilter o) {
  buildCounterDimensionFilter++;
  if (buildCounterDimensionFilter < 3) {
    unittest.expect(o.caseSensitive, unittest.isTrue);
    unittest.expect(o.dimensionName, unittest.equals('foo'));
    checkUnnamed2593(o.expressions);
    unittest.expect(o.not, unittest.isTrue);
    unittest.expect(o.operator, unittest.equals('foo'));
  }
  buildCounterDimensionFilter--;
}

buildUnnamed2594() {
  var o = new core.List<api.DimensionFilter>();
  o.add(buildDimensionFilter());
  o.add(buildDimensionFilter());
  return o;
}

checkUnnamed2594(core.List<api.DimensionFilter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionFilter(o[0]);
  checkDimensionFilter(o[1]);
}

core.int buildCounterDimensionFilterClause = 0;
buildDimensionFilterClause() {
  var o = new api.DimensionFilterClause();
  buildCounterDimensionFilterClause++;
  if (buildCounterDimensionFilterClause < 3) {
    o.filters = buildUnnamed2594();
    o.operator = "foo";
  }
  buildCounterDimensionFilterClause--;
  return o;
}

checkDimensionFilterClause(api.DimensionFilterClause o) {
  buildCounterDimensionFilterClause++;
  if (buildCounterDimensionFilterClause < 3) {
    checkUnnamed2594(o.filters);
    unittest.expect(o.operator, unittest.equals('foo'));
  }
  buildCounterDimensionFilterClause--;
}

core.int buildCounterDynamicSegment = 0;
buildDynamicSegment() {
  var o = new api.DynamicSegment();
  buildCounterDynamicSegment++;
  if (buildCounterDynamicSegment < 3) {
    o.name = "foo";
    o.sessionSegment = buildSegmentDefinition();
    o.userSegment = buildSegmentDefinition();
  }
  buildCounterDynamicSegment--;
  return o;
}

checkDynamicSegment(api.DynamicSegment o) {
  buildCounterDynamicSegment++;
  if (buildCounterDynamicSegment < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    checkSegmentDefinition(o.sessionSegment);
    checkSegmentDefinition(o.userSegment);
  }
  buildCounterDynamicSegment--;
}

buildUnnamed2595() {
  var o = new core.List<api.ProductData>();
  o.add(buildProductData());
  o.add(buildProductData());
  return o;
}

checkUnnamed2595(core.List<api.ProductData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkProductData(o[0]);
  checkProductData(o[1]);
}

core.int buildCounterEcommerceData = 0;
buildEcommerceData() {
  var o = new api.EcommerceData();
  buildCounterEcommerceData++;
  if (buildCounterEcommerceData < 3) {
    o.actionType = "foo";
    o.ecommerceType = "foo";
    o.products = buildUnnamed2595();
    o.transaction = buildTransactionData();
  }
  buildCounterEcommerceData--;
  return o;
}

checkEcommerceData(api.EcommerceData o) {
  buildCounterEcommerceData++;
  if (buildCounterEcommerceData < 3) {
    unittest.expect(o.actionType, unittest.equals('foo'));
    unittest.expect(o.ecommerceType, unittest.equals('foo'));
    checkUnnamed2595(o.products);
    checkTransactionData(o.transaction);
  }
  buildCounterEcommerceData--;
}

core.int buildCounterEventData = 0;
buildEventData() {
  var o = new api.EventData();
  buildCounterEventData++;
  if (buildCounterEventData < 3) {
    o.eventAction = "foo";
    o.eventCategory = "foo";
    o.eventCount = "foo";
    o.eventLabel = "foo";
    o.eventValue = "foo";
  }
  buildCounterEventData--;
  return o;
}

checkEventData(api.EventData o) {
  buildCounterEventData++;
  if (buildCounterEventData < 3) {
    unittest.expect(o.eventAction, unittest.equals('foo'));
    unittest.expect(o.eventCategory, unittest.equals('foo'));
    unittest.expect(o.eventCount, unittest.equals('foo'));
    unittest.expect(o.eventLabel, unittest.equals('foo'));
    unittest.expect(o.eventValue, unittest.equals('foo'));
  }
  buildCounterEventData--;
}

buildUnnamed2596() {
  var o = new core.List<api.ReportRequest>();
  o.add(buildReportRequest());
  o.add(buildReportRequest());
  return o;
}

checkUnnamed2596(core.List<api.ReportRequest> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReportRequest(o[0]);
  checkReportRequest(o[1]);
}

core.int buildCounterGetReportsRequest = 0;
buildGetReportsRequest() {
  var o = new api.GetReportsRequest();
  buildCounterGetReportsRequest++;
  if (buildCounterGetReportsRequest < 3) {
    o.reportRequests = buildUnnamed2596();
    o.useResourceQuotas = true;
  }
  buildCounterGetReportsRequest--;
  return o;
}

checkGetReportsRequest(api.GetReportsRequest o) {
  buildCounterGetReportsRequest++;
  if (buildCounterGetReportsRequest < 3) {
    checkUnnamed2596(o.reportRequests);
    unittest.expect(o.useResourceQuotas, unittest.isTrue);
  }
  buildCounterGetReportsRequest--;
}

buildUnnamed2597() {
  var o = new core.List<api.Report>();
  o.add(buildReport());
  o.add(buildReport());
  return o;
}

checkUnnamed2597(core.List<api.Report> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReport(o[0]);
  checkReport(o[1]);
}

core.int buildCounterGetReportsResponse = 0;
buildGetReportsResponse() {
  var o = new api.GetReportsResponse();
  buildCounterGetReportsResponse++;
  if (buildCounterGetReportsResponse < 3) {
    o.queryCost = 42;
    o.reports = buildUnnamed2597();
    o.resourceQuotasRemaining = buildResourceQuotasRemaining();
  }
  buildCounterGetReportsResponse--;
  return o;
}

checkGetReportsResponse(api.GetReportsResponse o) {
  buildCounterGetReportsResponse++;
  if (buildCounterGetReportsResponse < 3) {
    unittest.expect(o.queryCost, unittest.equals(42));
    checkUnnamed2597(o.reports);
    checkResourceQuotasRemaining(o.resourceQuotasRemaining);
  }
  buildCounterGetReportsResponse--;
}

core.int buildCounterGoalData = 0;
buildGoalData() {
  var o = new api.GoalData();
  buildCounterGoalData++;
  if (buildCounterGoalData < 3) {
    o.goalCompletionLocation = "foo";
    o.goalCompletions = "foo";
    o.goalIndex = 42;
    o.goalName = "foo";
    o.goalPreviousStep1 = "foo";
    o.goalPreviousStep2 = "foo";
    o.goalPreviousStep3 = "foo";
    o.goalValue = 42.0;
  }
  buildCounterGoalData--;
  return o;
}

checkGoalData(api.GoalData o) {
  buildCounterGoalData++;
  if (buildCounterGoalData < 3) {
    unittest.expect(o.goalCompletionLocation, unittest.equals('foo'));
    unittest.expect(o.goalCompletions, unittest.equals('foo'));
    unittest.expect(o.goalIndex, unittest.equals(42));
    unittest.expect(o.goalName, unittest.equals('foo'));
    unittest.expect(o.goalPreviousStep1, unittest.equals('foo'));
    unittest.expect(o.goalPreviousStep2, unittest.equals('foo'));
    unittest.expect(o.goalPreviousStep3, unittest.equals('foo'));
    unittest.expect(o.goalValue, unittest.equals(42.0));
  }
  buildCounterGoalData--;
}

buildUnnamed2598() {
  var o = new core.List<api.GoalData>();
  o.add(buildGoalData());
  o.add(buildGoalData());
  return o;
}

checkUnnamed2598(core.List<api.GoalData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkGoalData(o[0]);
  checkGoalData(o[1]);
}

core.int buildCounterGoalSetData = 0;
buildGoalSetData() {
  var o = new api.GoalSetData();
  buildCounterGoalSetData++;
  if (buildCounterGoalSetData < 3) {
    o.goals = buildUnnamed2598();
  }
  buildCounterGoalSetData--;
  return o;
}

checkGoalSetData(api.GoalSetData o) {
  buildCounterGoalSetData++;
  if (buildCounterGoalSetData < 3) {
    checkUnnamed2598(o.goals);
  }
  buildCounterGoalSetData--;
}

core.int buildCounterMetric = 0;
buildMetric() {
  var o = new api.Metric();
  buildCounterMetric++;
  if (buildCounterMetric < 3) {
    o.alias = "foo";
    o.expression = "foo";
    o.formattingType = "foo";
  }
  buildCounterMetric--;
  return o;
}

checkMetric(api.Metric o) {
  buildCounterMetric++;
  if (buildCounterMetric < 3) {
    unittest.expect(o.alias, unittest.equals('foo'));
    unittest.expect(o.expression, unittest.equals('foo'));
    unittest.expect(o.formattingType, unittest.equals('foo'));
  }
  buildCounterMetric--;
}

core.int buildCounterMetricFilter = 0;
buildMetricFilter() {
  var o = new api.MetricFilter();
  buildCounterMetricFilter++;
  if (buildCounterMetricFilter < 3) {
    o.comparisonValue = "foo";
    o.metricName = "foo";
    o.not = true;
    o.operator = "foo";
  }
  buildCounterMetricFilter--;
  return o;
}

checkMetricFilter(api.MetricFilter o) {
  buildCounterMetricFilter++;
  if (buildCounterMetricFilter < 3) {
    unittest.expect(o.comparisonValue, unittest.equals('foo'));
    unittest.expect(o.metricName, unittest.equals('foo'));
    unittest.expect(o.not, unittest.isTrue);
    unittest.expect(o.operator, unittest.equals('foo'));
  }
  buildCounterMetricFilter--;
}

buildUnnamed2599() {
  var o = new core.List<api.MetricFilter>();
  o.add(buildMetricFilter());
  o.add(buildMetricFilter());
  return o;
}

checkUnnamed2599(core.List<api.MetricFilter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetricFilter(o[0]);
  checkMetricFilter(o[1]);
}

core.int buildCounterMetricFilterClause = 0;
buildMetricFilterClause() {
  var o = new api.MetricFilterClause();
  buildCounterMetricFilterClause++;
  if (buildCounterMetricFilterClause < 3) {
    o.filters = buildUnnamed2599();
    o.operator = "foo";
  }
  buildCounterMetricFilterClause--;
  return o;
}

checkMetricFilterClause(api.MetricFilterClause o) {
  buildCounterMetricFilterClause++;
  if (buildCounterMetricFilterClause < 3) {
    checkUnnamed2599(o.filters);
    unittest.expect(o.operator, unittest.equals('foo'));
  }
  buildCounterMetricFilterClause--;
}

buildUnnamed2600() {
  var o = new core.List<api.MetricHeaderEntry>();
  o.add(buildMetricHeaderEntry());
  o.add(buildMetricHeaderEntry());
  return o;
}

checkUnnamed2600(core.List<api.MetricHeaderEntry> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetricHeaderEntry(o[0]);
  checkMetricHeaderEntry(o[1]);
}

buildUnnamed2601() {
  var o = new core.List<api.PivotHeader>();
  o.add(buildPivotHeader());
  o.add(buildPivotHeader());
  return o;
}

checkUnnamed2601(core.List<api.PivotHeader> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPivotHeader(o[0]);
  checkPivotHeader(o[1]);
}

core.int buildCounterMetricHeader = 0;
buildMetricHeader() {
  var o = new api.MetricHeader();
  buildCounterMetricHeader++;
  if (buildCounterMetricHeader < 3) {
    o.metricHeaderEntries = buildUnnamed2600();
    o.pivotHeaders = buildUnnamed2601();
  }
  buildCounterMetricHeader--;
  return o;
}

checkMetricHeader(api.MetricHeader o) {
  buildCounterMetricHeader++;
  if (buildCounterMetricHeader < 3) {
    checkUnnamed2600(o.metricHeaderEntries);
    checkUnnamed2601(o.pivotHeaders);
  }
  buildCounterMetricHeader--;
}

core.int buildCounterMetricHeaderEntry = 0;
buildMetricHeaderEntry() {
  var o = new api.MetricHeaderEntry();
  buildCounterMetricHeaderEntry++;
  if (buildCounterMetricHeaderEntry < 3) {
    o.name = "foo";
    o.type = "foo";
  }
  buildCounterMetricHeaderEntry--;
  return o;
}

checkMetricHeaderEntry(api.MetricHeaderEntry o) {
  buildCounterMetricHeaderEntry++;
  if (buildCounterMetricHeaderEntry < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterMetricHeaderEntry--;
}

buildUnnamed2602() {
  var o = new core.List<api.SegmentFilterClause>();
  o.add(buildSegmentFilterClause());
  o.add(buildSegmentFilterClause());
  return o;
}

checkUnnamed2602(core.List<api.SegmentFilterClause> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSegmentFilterClause(o[0]);
  checkSegmentFilterClause(o[1]);
}

core.int buildCounterOrFiltersForSegment = 0;
buildOrFiltersForSegment() {
  var o = new api.OrFiltersForSegment();
  buildCounterOrFiltersForSegment++;
  if (buildCounterOrFiltersForSegment < 3) {
    o.segmentFilterClauses = buildUnnamed2602();
  }
  buildCounterOrFiltersForSegment--;
  return o;
}

checkOrFiltersForSegment(api.OrFiltersForSegment o) {
  buildCounterOrFiltersForSegment++;
  if (buildCounterOrFiltersForSegment < 3) {
    checkUnnamed2602(o.segmentFilterClauses);
  }
  buildCounterOrFiltersForSegment--;
}

core.int buildCounterOrderBy = 0;
buildOrderBy() {
  var o = new api.OrderBy();
  buildCounterOrderBy++;
  if (buildCounterOrderBy < 3) {
    o.fieldName = "foo";
    o.orderType = "foo";
    o.sortOrder = "foo";
  }
  buildCounterOrderBy--;
  return o;
}

checkOrderBy(api.OrderBy o) {
  buildCounterOrderBy++;
  if (buildCounterOrderBy < 3) {
    unittest.expect(o.fieldName, unittest.equals('foo'));
    unittest.expect(o.orderType, unittest.equals('foo'));
    unittest.expect(o.sortOrder, unittest.equals('foo'));
  }
  buildCounterOrderBy--;
}

core.int buildCounterPageviewData = 0;
buildPageviewData() {
  var o = new api.PageviewData();
  buildCounterPageviewData++;
  if (buildCounterPageviewData < 3) {
    o.pagePath = "foo";
    o.pageTitle = "foo";
  }
  buildCounterPageviewData--;
  return o;
}

checkPageviewData(api.PageviewData o) {
  buildCounterPageviewData++;
  if (buildCounterPageviewData < 3) {
    unittest.expect(o.pagePath, unittest.equals('foo'));
    unittest.expect(o.pageTitle, unittest.equals('foo'));
  }
  buildCounterPageviewData--;
}

buildUnnamed2603() {
  var o = new core.List<api.DimensionFilterClause>();
  o.add(buildDimensionFilterClause());
  o.add(buildDimensionFilterClause());
  return o;
}

checkUnnamed2603(core.List<api.DimensionFilterClause> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionFilterClause(o[0]);
  checkDimensionFilterClause(o[1]);
}

buildUnnamed2604() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed2604(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed2605() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed2605(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

core.int buildCounterPivot = 0;
buildPivot() {
  var o = new api.Pivot();
  buildCounterPivot++;
  if (buildCounterPivot < 3) {
    o.dimensionFilterClauses = buildUnnamed2603();
    o.dimensions = buildUnnamed2604();
    o.maxGroupCount = 42;
    o.metrics = buildUnnamed2605();
    o.startGroup = 42;
  }
  buildCounterPivot--;
  return o;
}

checkPivot(api.Pivot o) {
  buildCounterPivot++;
  if (buildCounterPivot < 3) {
    checkUnnamed2603(o.dimensionFilterClauses);
    checkUnnamed2604(o.dimensions);
    unittest.expect(o.maxGroupCount, unittest.equals(42));
    checkUnnamed2605(o.metrics);
    unittest.expect(o.startGroup, unittest.equals(42));
  }
  buildCounterPivot--;
}

buildUnnamed2606() {
  var o = new core.List<api.PivotHeaderEntry>();
  o.add(buildPivotHeaderEntry());
  o.add(buildPivotHeaderEntry());
  return o;
}

checkUnnamed2606(core.List<api.PivotHeaderEntry> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPivotHeaderEntry(o[0]);
  checkPivotHeaderEntry(o[1]);
}

core.int buildCounterPivotHeader = 0;
buildPivotHeader() {
  var o = new api.PivotHeader();
  buildCounterPivotHeader++;
  if (buildCounterPivotHeader < 3) {
    o.pivotHeaderEntries = buildUnnamed2606();
    o.totalPivotGroupsCount = 42;
  }
  buildCounterPivotHeader--;
  return o;
}

checkPivotHeader(api.PivotHeader o) {
  buildCounterPivotHeader++;
  if (buildCounterPivotHeader < 3) {
    checkUnnamed2606(o.pivotHeaderEntries);
    unittest.expect(o.totalPivotGroupsCount, unittest.equals(42));
  }
  buildCounterPivotHeader--;
}

buildUnnamed2607() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2607(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2608() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2608(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterPivotHeaderEntry = 0;
buildPivotHeaderEntry() {
  var o = new api.PivotHeaderEntry();
  buildCounterPivotHeaderEntry++;
  if (buildCounterPivotHeaderEntry < 3) {
    o.dimensionNames = buildUnnamed2607();
    o.dimensionValues = buildUnnamed2608();
    o.metric = buildMetricHeaderEntry();
  }
  buildCounterPivotHeaderEntry--;
  return o;
}

checkPivotHeaderEntry(api.PivotHeaderEntry o) {
  buildCounterPivotHeaderEntry++;
  if (buildCounterPivotHeaderEntry < 3) {
    checkUnnamed2607(o.dimensionNames);
    checkUnnamed2608(o.dimensionValues);
    checkMetricHeaderEntry(o.metric);
  }
  buildCounterPivotHeaderEntry--;
}

buildUnnamed2609() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2609(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterPivotValueRegion = 0;
buildPivotValueRegion() {
  var o = new api.PivotValueRegion();
  buildCounterPivotValueRegion++;
  if (buildCounterPivotValueRegion < 3) {
    o.values = buildUnnamed2609();
  }
  buildCounterPivotValueRegion--;
  return o;
}

checkPivotValueRegion(api.PivotValueRegion o) {
  buildCounterPivotValueRegion++;
  if (buildCounterPivotValueRegion < 3) {
    checkUnnamed2609(o.values);
  }
  buildCounterPivotValueRegion--;
}

core.int buildCounterProductData = 0;
buildProductData() {
  var o = new api.ProductData();
  buildCounterProductData++;
  if (buildCounterProductData < 3) {
    o.itemRevenue = 42.0;
    o.productName = "foo";
    o.productQuantity = "foo";
    o.productSku = "foo";
  }
  buildCounterProductData--;
  return o;
}

checkProductData(api.ProductData o) {
  buildCounterProductData++;
  if (buildCounterProductData < 3) {
    unittest.expect(o.itemRevenue, unittest.equals(42.0));
    unittest.expect(o.productName, unittest.equals('foo'));
    unittest.expect(o.productQuantity, unittest.equals('foo'));
    unittest.expect(o.productSku, unittest.equals('foo'));
  }
  buildCounterProductData--;
}

core.int buildCounterReport = 0;
buildReport() {
  var o = new api.Report();
  buildCounterReport++;
  if (buildCounterReport < 3) {
    o.columnHeader = buildColumnHeader();
    o.data = buildReportData();
    o.nextPageToken = "foo";
  }
  buildCounterReport--;
  return o;
}

checkReport(api.Report o) {
  buildCounterReport++;
  if (buildCounterReport < 3) {
    checkColumnHeader(o.columnHeader);
    checkReportData(o.data);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterReport--;
}

buildUnnamed2610() {
  var o = new core.List<api.DateRangeValues>();
  o.add(buildDateRangeValues());
  o.add(buildDateRangeValues());
  return o;
}

checkUnnamed2610(core.List<api.DateRangeValues> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDateRangeValues(o[0]);
  checkDateRangeValues(o[1]);
}

buildUnnamed2611() {
  var o = new core.List<api.DateRangeValues>();
  o.add(buildDateRangeValues());
  o.add(buildDateRangeValues());
  return o;
}

checkUnnamed2611(core.List<api.DateRangeValues> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDateRangeValues(o[0]);
  checkDateRangeValues(o[1]);
}

buildUnnamed2612() {
  var o = new core.List<api.ReportRow>();
  o.add(buildReportRow());
  o.add(buildReportRow());
  return o;
}

checkUnnamed2612(core.List<api.ReportRow> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReportRow(o[0]);
  checkReportRow(o[1]);
}

buildUnnamed2613() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2613(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2614() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2614(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2615() {
  var o = new core.List<api.DateRangeValues>();
  o.add(buildDateRangeValues());
  o.add(buildDateRangeValues());
  return o;
}

checkUnnamed2615(core.List<api.DateRangeValues> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDateRangeValues(o[0]);
  checkDateRangeValues(o[1]);
}

core.int buildCounterReportData = 0;
buildReportData() {
  var o = new api.ReportData();
  buildCounterReportData++;
  if (buildCounterReportData < 3) {
    o.dataLastRefreshed = "foo";
    o.isDataGolden = true;
    o.maximums = buildUnnamed2610();
    o.minimums = buildUnnamed2611();
    o.rowCount = 42;
    o.rows = buildUnnamed2612();
    o.samplesReadCounts = buildUnnamed2613();
    o.samplingSpaceSizes = buildUnnamed2614();
    o.totals = buildUnnamed2615();
  }
  buildCounterReportData--;
  return o;
}

checkReportData(api.ReportData o) {
  buildCounterReportData++;
  if (buildCounterReportData < 3) {
    unittest.expect(o.dataLastRefreshed, unittest.equals('foo'));
    unittest.expect(o.isDataGolden, unittest.isTrue);
    checkUnnamed2610(o.maximums);
    checkUnnamed2611(o.minimums);
    unittest.expect(o.rowCount, unittest.equals(42));
    checkUnnamed2612(o.rows);
    checkUnnamed2613(o.samplesReadCounts);
    checkUnnamed2614(o.samplingSpaceSizes);
    checkUnnamed2615(o.totals);
  }
  buildCounterReportData--;
}

buildUnnamed2616() {
  var o = new core.List<api.DateRange>();
  o.add(buildDateRange());
  o.add(buildDateRange());
  return o;
}

checkUnnamed2616(core.List<api.DateRange> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDateRange(o[0]);
  checkDateRange(o[1]);
}

buildUnnamed2617() {
  var o = new core.List<api.DimensionFilterClause>();
  o.add(buildDimensionFilterClause());
  o.add(buildDimensionFilterClause());
  return o;
}

checkUnnamed2617(core.List<api.DimensionFilterClause> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionFilterClause(o[0]);
  checkDimensionFilterClause(o[1]);
}

buildUnnamed2618() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed2618(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed2619() {
  var o = new core.List<api.MetricFilterClause>();
  o.add(buildMetricFilterClause());
  o.add(buildMetricFilterClause());
  return o;
}

checkUnnamed2619(core.List<api.MetricFilterClause> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetricFilterClause(o[0]);
  checkMetricFilterClause(o[1]);
}

buildUnnamed2620() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed2620(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

buildUnnamed2621() {
  var o = new core.List<api.OrderBy>();
  o.add(buildOrderBy());
  o.add(buildOrderBy());
  return o;
}

checkUnnamed2621(core.List<api.OrderBy> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOrderBy(o[0]);
  checkOrderBy(o[1]);
}

buildUnnamed2622() {
  var o = new core.List<api.Pivot>();
  o.add(buildPivot());
  o.add(buildPivot());
  return o;
}

checkUnnamed2622(core.List<api.Pivot> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPivot(o[0]);
  checkPivot(o[1]);
}

buildUnnamed2623() {
  var o = new core.List<api.Segment>();
  o.add(buildSegment());
  o.add(buildSegment());
  return o;
}

checkUnnamed2623(core.List<api.Segment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSegment(o[0]);
  checkSegment(o[1]);
}

core.int buildCounterReportRequest = 0;
buildReportRequest() {
  var o = new api.ReportRequest();
  buildCounterReportRequest++;
  if (buildCounterReportRequest < 3) {
    o.cohortGroup = buildCohortGroup();
    o.dateRanges = buildUnnamed2616();
    o.dimensionFilterClauses = buildUnnamed2617();
    o.dimensions = buildUnnamed2618();
    o.filtersExpression = "foo";
    o.hideTotals = true;
    o.hideValueRanges = true;
    o.includeEmptyRows = true;
    o.metricFilterClauses = buildUnnamed2619();
    o.metrics = buildUnnamed2620();
    o.orderBys = buildUnnamed2621();
    o.pageSize = 42;
    o.pageToken = "foo";
    o.pivots = buildUnnamed2622();
    o.samplingLevel = "foo";
    o.segments = buildUnnamed2623();
    o.viewId = "foo";
  }
  buildCounterReportRequest--;
  return o;
}

checkReportRequest(api.ReportRequest o) {
  buildCounterReportRequest++;
  if (buildCounterReportRequest < 3) {
    checkCohortGroup(o.cohortGroup);
    checkUnnamed2616(o.dateRanges);
    checkUnnamed2617(o.dimensionFilterClauses);
    checkUnnamed2618(o.dimensions);
    unittest.expect(o.filtersExpression, unittest.equals('foo'));
    unittest.expect(o.hideTotals, unittest.isTrue);
    unittest.expect(o.hideValueRanges, unittest.isTrue);
    unittest.expect(o.includeEmptyRows, unittest.isTrue);
    checkUnnamed2619(o.metricFilterClauses);
    checkUnnamed2620(o.metrics);
    checkUnnamed2621(o.orderBys);
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    checkUnnamed2622(o.pivots);
    unittest.expect(o.samplingLevel, unittest.equals('foo'));
    checkUnnamed2623(o.segments);
    unittest.expect(o.viewId, unittest.equals('foo'));
  }
  buildCounterReportRequest--;
}

buildUnnamed2624() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2624(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2625() {
  var o = new core.List<api.DateRangeValues>();
  o.add(buildDateRangeValues());
  o.add(buildDateRangeValues());
  return o;
}

checkUnnamed2625(core.List<api.DateRangeValues> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDateRangeValues(o[0]);
  checkDateRangeValues(o[1]);
}

core.int buildCounterReportRow = 0;
buildReportRow() {
  var o = new api.ReportRow();
  buildCounterReportRow++;
  if (buildCounterReportRow < 3) {
    o.dimensions = buildUnnamed2624();
    o.metrics = buildUnnamed2625();
  }
  buildCounterReportRow--;
  return o;
}

checkReportRow(api.ReportRow o) {
  buildCounterReportRow++;
  if (buildCounterReportRow < 3) {
    checkUnnamed2624(o.dimensions);
    checkUnnamed2625(o.metrics);
  }
  buildCounterReportRow--;
}

core.int buildCounterResourceQuotasRemaining = 0;
buildResourceQuotasRemaining() {
  var o = new api.ResourceQuotasRemaining();
  buildCounterResourceQuotasRemaining++;
  if (buildCounterResourceQuotasRemaining < 3) {
    o.dailyQuotaTokensRemaining = 42;
    o.hourlyQuotaTokensRemaining = 42;
  }
  buildCounterResourceQuotasRemaining--;
  return o;
}

checkResourceQuotasRemaining(api.ResourceQuotasRemaining o) {
  buildCounterResourceQuotasRemaining++;
  if (buildCounterResourceQuotasRemaining < 3) {
    unittest.expect(o.dailyQuotaTokensRemaining, unittest.equals(42));
    unittest.expect(o.hourlyQuotaTokensRemaining, unittest.equals(42));
  }
  buildCounterResourceQuotasRemaining--;
}

core.int buildCounterScreenviewData = 0;
buildScreenviewData() {
  var o = new api.ScreenviewData();
  buildCounterScreenviewData++;
  if (buildCounterScreenviewData < 3) {
    o.appName = "foo";
    o.mobileDeviceBranding = "foo";
    o.mobileDeviceModel = "foo";
    o.screenName = "foo";
  }
  buildCounterScreenviewData--;
  return o;
}

checkScreenviewData(api.ScreenviewData o) {
  buildCounterScreenviewData++;
  if (buildCounterScreenviewData < 3) {
    unittest.expect(o.appName, unittest.equals('foo'));
    unittest.expect(o.mobileDeviceBranding, unittest.equals('foo'));
    unittest.expect(o.mobileDeviceModel, unittest.equals('foo'));
    unittest.expect(o.screenName, unittest.equals('foo'));
  }
  buildCounterScreenviewData--;
}

buildUnnamed2626() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2626(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchUserActivityRequest = 0;
buildSearchUserActivityRequest() {
  var o = new api.SearchUserActivityRequest();
  buildCounterSearchUserActivityRequest++;
  if (buildCounterSearchUserActivityRequest < 3) {
    o.activityTypes = buildUnnamed2626();
    o.dateRange = buildDateRange();
    o.pageSize = 42;
    o.pageToken = "foo";
    o.user = buildUser();
    o.viewId = "foo";
  }
  buildCounterSearchUserActivityRequest--;
  return o;
}

checkSearchUserActivityRequest(api.SearchUserActivityRequest o) {
  buildCounterSearchUserActivityRequest++;
  if (buildCounterSearchUserActivityRequest < 3) {
    checkUnnamed2626(o.activityTypes);
    checkDateRange(o.dateRange);
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    checkUser(o.user);
    unittest.expect(o.viewId, unittest.equals('foo'));
  }
  buildCounterSearchUserActivityRequest--;
}

buildUnnamed2627() {
  var o = new core.List<api.UserActivitySession>();
  o.add(buildUserActivitySession());
  o.add(buildUserActivitySession());
  return o;
}

checkUnnamed2627(core.List<api.UserActivitySession> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserActivitySession(o[0]);
  checkUserActivitySession(o[1]);
}

core.int buildCounterSearchUserActivityResponse = 0;
buildSearchUserActivityResponse() {
  var o = new api.SearchUserActivityResponse();
  buildCounterSearchUserActivityResponse++;
  if (buildCounterSearchUserActivityResponse < 3) {
    o.nextPageToken = "foo";
    o.sampleRate = 42.0;
    o.sessions = buildUnnamed2627();
    o.totalRows = 42;
  }
  buildCounterSearchUserActivityResponse--;
  return o;
}

checkSearchUserActivityResponse(api.SearchUserActivityResponse o) {
  buildCounterSearchUserActivityResponse++;
  if (buildCounterSearchUserActivityResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.sampleRate, unittest.equals(42.0));
    checkUnnamed2627(o.sessions);
    unittest.expect(o.totalRows, unittest.equals(42));
  }
  buildCounterSearchUserActivityResponse--;
}

core.int buildCounterSegment = 0;
buildSegment() {
  var o = new api.Segment();
  buildCounterSegment++;
  if (buildCounterSegment < 3) {
    o.dynamicSegment = buildDynamicSegment();
    o.segmentId = "foo";
  }
  buildCounterSegment--;
  return o;
}

checkSegment(api.Segment o) {
  buildCounterSegment++;
  if (buildCounterSegment < 3) {
    checkDynamicSegment(o.dynamicSegment);
    unittest.expect(o.segmentId, unittest.equals('foo'));
  }
  buildCounterSegment--;
}

buildUnnamed2628() {
  var o = new core.List<api.SegmentFilter>();
  o.add(buildSegmentFilter());
  o.add(buildSegmentFilter());
  return o;
}

checkUnnamed2628(core.List<api.SegmentFilter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSegmentFilter(o[0]);
  checkSegmentFilter(o[1]);
}

core.int buildCounterSegmentDefinition = 0;
buildSegmentDefinition() {
  var o = new api.SegmentDefinition();
  buildCounterSegmentDefinition++;
  if (buildCounterSegmentDefinition < 3) {
    o.segmentFilters = buildUnnamed2628();
  }
  buildCounterSegmentDefinition--;
  return o;
}

checkSegmentDefinition(api.SegmentDefinition o) {
  buildCounterSegmentDefinition++;
  if (buildCounterSegmentDefinition < 3) {
    checkUnnamed2628(o.segmentFilters);
  }
  buildCounterSegmentDefinition--;
}

buildUnnamed2629() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2629(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSegmentDimensionFilter = 0;
buildSegmentDimensionFilter() {
  var o = new api.SegmentDimensionFilter();
  buildCounterSegmentDimensionFilter++;
  if (buildCounterSegmentDimensionFilter < 3) {
    o.caseSensitive = true;
    o.dimensionName = "foo";
    o.expressions = buildUnnamed2629();
    o.maxComparisonValue = "foo";
    o.minComparisonValue = "foo";
    o.operator = "foo";
  }
  buildCounterSegmentDimensionFilter--;
  return o;
}

checkSegmentDimensionFilter(api.SegmentDimensionFilter o) {
  buildCounterSegmentDimensionFilter++;
  if (buildCounterSegmentDimensionFilter < 3) {
    unittest.expect(o.caseSensitive, unittest.isTrue);
    unittest.expect(o.dimensionName, unittest.equals('foo'));
    checkUnnamed2629(o.expressions);
    unittest.expect(o.maxComparisonValue, unittest.equals('foo'));
    unittest.expect(o.minComparisonValue, unittest.equals('foo'));
    unittest.expect(o.operator, unittest.equals('foo'));
  }
  buildCounterSegmentDimensionFilter--;
}

core.int buildCounterSegmentFilter = 0;
buildSegmentFilter() {
  var o = new api.SegmentFilter();
  buildCounterSegmentFilter++;
  if (buildCounterSegmentFilter < 3) {
    o.not = true;
    o.sequenceSegment = buildSequenceSegment();
    o.simpleSegment = buildSimpleSegment();
  }
  buildCounterSegmentFilter--;
  return o;
}

checkSegmentFilter(api.SegmentFilter o) {
  buildCounterSegmentFilter++;
  if (buildCounterSegmentFilter < 3) {
    unittest.expect(o.not, unittest.isTrue);
    checkSequenceSegment(o.sequenceSegment);
    checkSimpleSegment(o.simpleSegment);
  }
  buildCounterSegmentFilter--;
}

core.int buildCounterSegmentFilterClause = 0;
buildSegmentFilterClause() {
  var o = new api.SegmentFilterClause();
  buildCounterSegmentFilterClause++;
  if (buildCounterSegmentFilterClause < 3) {
    o.dimensionFilter = buildSegmentDimensionFilter();
    o.metricFilter = buildSegmentMetricFilter();
    o.not = true;
  }
  buildCounterSegmentFilterClause--;
  return o;
}

checkSegmentFilterClause(api.SegmentFilterClause o) {
  buildCounterSegmentFilterClause++;
  if (buildCounterSegmentFilterClause < 3) {
    checkSegmentDimensionFilter(o.dimensionFilter);
    checkSegmentMetricFilter(o.metricFilter);
    unittest.expect(o.not, unittest.isTrue);
  }
  buildCounterSegmentFilterClause--;
}

core.int buildCounterSegmentMetricFilter = 0;
buildSegmentMetricFilter() {
  var o = new api.SegmentMetricFilter();
  buildCounterSegmentMetricFilter++;
  if (buildCounterSegmentMetricFilter < 3) {
    o.comparisonValue = "foo";
    o.maxComparisonValue = "foo";
    o.metricName = "foo";
    o.operator = "foo";
    o.scope = "foo";
  }
  buildCounterSegmentMetricFilter--;
  return o;
}

checkSegmentMetricFilter(api.SegmentMetricFilter o) {
  buildCounterSegmentMetricFilter++;
  if (buildCounterSegmentMetricFilter < 3) {
    unittest.expect(o.comparisonValue, unittest.equals('foo'));
    unittest.expect(o.maxComparisonValue, unittest.equals('foo'));
    unittest.expect(o.metricName, unittest.equals('foo'));
    unittest.expect(o.operator, unittest.equals('foo'));
    unittest.expect(o.scope, unittest.equals('foo'));
  }
  buildCounterSegmentMetricFilter--;
}

buildUnnamed2630() {
  var o = new core.List<api.OrFiltersForSegment>();
  o.add(buildOrFiltersForSegment());
  o.add(buildOrFiltersForSegment());
  return o;
}

checkUnnamed2630(core.List<api.OrFiltersForSegment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOrFiltersForSegment(o[0]);
  checkOrFiltersForSegment(o[1]);
}

core.int buildCounterSegmentSequenceStep = 0;
buildSegmentSequenceStep() {
  var o = new api.SegmentSequenceStep();
  buildCounterSegmentSequenceStep++;
  if (buildCounterSegmentSequenceStep < 3) {
    o.matchType = "foo";
    o.orFiltersForSegment = buildUnnamed2630();
  }
  buildCounterSegmentSequenceStep--;
  return o;
}

checkSegmentSequenceStep(api.SegmentSequenceStep o) {
  buildCounterSegmentSequenceStep++;
  if (buildCounterSegmentSequenceStep < 3) {
    unittest.expect(o.matchType, unittest.equals('foo'));
    checkUnnamed2630(o.orFiltersForSegment);
  }
  buildCounterSegmentSequenceStep--;
}

buildUnnamed2631() {
  var o = new core.List<api.SegmentSequenceStep>();
  o.add(buildSegmentSequenceStep());
  o.add(buildSegmentSequenceStep());
  return o;
}

checkUnnamed2631(core.List<api.SegmentSequenceStep> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSegmentSequenceStep(o[0]);
  checkSegmentSequenceStep(o[1]);
}

core.int buildCounterSequenceSegment = 0;
buildSequenceSegment() {
  var o = new api.SequenceSegment();
  buildCounterSequenceSegment++;
  if (buildCounterSequenceSegment < 3) {
    o.firstStepShouldMatchFirstHit = true;
    o.segmentSequenceSteps = buildUnnamed2631();
  }
  buildCounterSequenceSegment--;
  return o;
}

checkSequenceSegment(api.SequenceSegment o) {
  buildCounterSequenceSegment++;
  if (buildCounterSequenceSegment < 3) {
    unittest.expect(o.firstStepShouldMatchFirstHit, unittest.isTrue);
    checkUnnamed2631(o.segmentSequenceSteps);
  }
  buildCounterSequenceSegment--;
}

buildUnnamed2632() {
  var o = new core.List<api.OrFiltersForSegment>();
  o.add(buildOrFiltersForSegment());
  o.add(buildOrFiltersForSegment());
  return o;
}

checkUnnamed2632(core.List<api.OrFiltersForSegment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOrFiltersForSegment(o[0]);
  checkOrFiltersForSegment(o[1]);
}

core.int buildCounterSimpleSegment = 0;
buildSimpleSegment() {
  var o = new api.SimpleSegment();
  buildCounterSimpleSegment++;
  if (buildCounterSimpleSegment < 3) {
    o.orFiltersForSegment = buildUnnamed2632();
  }
  buildCounterSimpleSegment--;
  return o;
}

checkSimpleSegment(api.SimpleSegment o) {
  buildCounterSimpleSegment++;
  if (buildCounterSimpleSegment < 3) {
    checkUnnamed2632(o.orFiltersForSegment);
  }
  buildCounterSimpleSegment--;
}

core.int buildCounterTransactionData = 0;
buildTransactionData() {
  var o = new api.TransactionData();
  buildCounterTransactionData++;
  if (buildCounterTransactionData < 3) {
    o.transactionId = "foo";
    o.transactionRevenue = 42.0;
    o.transactionShipping = 42.0;
    o.transactionTax = 42.0;
  }
  buildCounterTransactionData--;
  return o;
}

checkTransactionData(api.TransactionData o) {
  buildCounterTransactionData++;
  if (buildCounterTransactionData < 3) {
    unittest.expect(o.transactionId, unittest.equals('foo'));
    unittest.expect(o.transactionRevenue, unittest.equals(42.0));
    unittest.expect(o.transactionShipping, unittest.equals(42.0));
    unittest.expect(o.transactionTax, unittest.equals(42.0));
  }
  buildCounterTransactionData--;
}

core.int buildCounterUser = 0;
buildUser() {
  var o = new api.User();
  buildCounterUser++;
  if (buildCounterUser < 3) {
    o.type = "foo";
    o.userId = "foo";
  }
  buildCounterUser--;
  return o;
}

checkUser(api.User o) {
  buildCounterUser++;
  if (buildCounterUser < 3) {
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.userId, unittest.equals('foo'));
  }
  buildCounterUser--;
}

buildUnnamed2633() {
  var o = new core.List<api.Activity>();
  o.add(buildActivity());
  o.add(buildActivity());
  return o;
}

checkUnnamed2633(core.List<api.Activity> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkActivity(o[0]);
  checkActivity(o[1]);
}

core.int buildCounterUserActivitySession = 0;
buildUserActivitySession() {
  var o = new api.UserActivitySession();
  buildCounterUserActivitySession++;
  if (buildCounterUserActivitySession < 3) {
    o.activities = buildUnnamed2633();
    o.dataSource = "foo";
    o.deviceCategory = "foo";
    o.platform = "foo";
    o.sessionDate = "foo";
    o.sessionId = "foo";
  }
  buildCounterUserActivitySession--;
  return o;
}

checkUserActivitySession(api.UserActivitySession o) {
  buildCounterUserActivitySession++;
  if (buildCounterUserActivitySession < 3) {
    checkUnnamed2633(o.activities);
    unittest.expect(o.dataSource, unittest.equals('foo'));
    unittest.expect(o.deviceCategory, unittest.equals('foo'));
    unittest.expect(o.platform, unittest.equals('foo'));
    unittest.expect(o.sessionDate, unittest.equals('foo'));
    unittest.expect(o.sessionId, unittest.equals('foo'));
  }
  buildCounterUserActivitySession--;
}

main() {
  unittest.group("obj-schema-Activity", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivity();
      var od = new api.Activity.fromJson(o.toJson());
      checkActivity(od);
    });
  });

  unittest.group("obj-schema-Cohort", () {
    unittest.test("to-json--from-json", () {
      var o = buildCohort();
      var od = new api.Cohort.fromJson(o.toJson());
      checkCohort(od);
    });
  });

  unittest.group("obj-schema-CohortGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildCohortGroup();
      var od = new api.CohortGroup.fromJson(o.toJson());
      checkCohortGroup(od);
    });
  });

  unittest.group("obj-schema-ColumnHeader", () {
    unittest.test("to-json--from-json", () {
      var o = buildColumnHeader();
      var od = new api.ColumnHeader.fromJson(o.toJson());
      checkColumnHeader(od);
    });
  });

  unittest.group("obj-schema-CustomDimension", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomDimension();
      var od = new api.CustomDimension.fromJson(o.toJson());
      checkCustomDimension(od);
    });
  });

  unittest.group("obj-schema-DateRange", () {
    unittest.test("to-json--from-json", () {
      var o = buildDateRange();
      var od = new api.DateRange.fromJson(o.toJson());
      checkDateRange(od);
    });
  });

  unittest.group("obj-schema-DateRangeValues", () {
    unittest.test("to-json--from-json", () {
      var o = buildDateRangeValues();
      var od = new api.DateRangeValues.fromJson(o.toJson());
      checkDateRangeValues(od);
    });
  });

  unittest.group("obj-schema-Dimension", () {
    unittest.test("to-json--from-json", () {
      var o = buildDimension();
      var od = new api.Dimension.fromJson(o.toJson());
      checkDimension(od);
    });
  });

  unittest.group("obj-schema-DimensionFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildDimensionFilter();
      var od = new api.DimensionFilter.fromJson(o.toJson());
      checkDimensionFilter(od);
    });
  });

  unittest.group("obj-schema-DimensionFilterClause", () {
    unittest.test("to-json--from-json", () {
      var o = buildDimensionFilterClause();
      var od = new api.DimensionFilterClause.fromJson(o.toJson());
      checkDimensionFilterClause(od);
    });
  });

  unittest.group("obj-schema-DynamicSegment", () {
    unittest.test("to-json--from-json", () {
      var o = buildDynamicSegment();
      var od = new api.DynamicSegment.fromJson(o.toJson());
      checkDynamicSegment(od);
    });
  });

  unittest.group("obj-schema-EcommerceData", () {
    unittest.test("to-json--from-json", () {
      var o = buildEcommerceData();
      var od = new api.EcommerceData.fromJson(o.toJson());
      checkEcommerceData(od);
    });
  });

  unittest.group("obj-schema-EventData", () {
    unittest.test("to-json--from-json", () {
      var o = buildEventData();
      var od = new api.EventData.fromJson(o.toJson());
      checkEventData(od);
    });
  });

  unittest.group("obj-schema-GetReportsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetReportsRequest();
      var od = new api.GetReportsRequest.fromJson(o.toJson());
      checkGetReportsRequest(od);
    });
  });

  unittest.group("obj-schema-GetReportsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetReportsResponse();
      var od = new api.GetReportsResponse.fromJson(o.toJson());
      checkGetReportsResponse(od);
    });
  });

  unittest.group("obj-schema-GoalData", () {
    unittest.test("to-json--from-json", () {
      var o = buildGoalData();
      var od = new api.GoalData.fromJson(o.toJson());
      checkGoalData(od);
    });
  });

  unittest.group("obj-schema-GoalSetData", () {
    unittest.test("to-json--from-json", () {
      var o = buildGoalSetData();
      var od = new api.GoalSetData.fromJson(o.toJson());
      checkGoalSetData(od);
    });
  });

  unittest.group("obj-schema-Metric", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetric();
      var od = new api.Metric.fromJson(o.toJson());
      checkMetric(od);
    });
  });

  unittest.group("obj-schema-MetricFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetricFilter();
      var od = new api.MetricFilter.fromJson(o.toJson());
      checkMetricFilter(od);
    });
  });

  unittest.group("obj-schema-MetricFilterClause", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetricFilterClause();
      var od = new api.MetricFilterClause.fromJson(o.toJson());
      checkMetricFilterClause(od);
    });
  });

  unittest.group("obj-schema-MetricHeader", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetricHeader();
      var od = new api.MetricHeader.fromJson(o.toJson());
      checkMetricHeader(od);
    });
  });

  unittest.group("obj-schema-MetricHeaderEntry", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetricHeaderEntry();
      var od = new api.MetricHeaderEntry.fromJson(o.toJson());
      checkMetricHeaderEntry(od);
    });
  });

  unittest.group("obj-schema-OrFiltersForSegment", () {
    unittest.test("to-json--from-json", () {
      var o = buildOrFiltersForSegment();
      var od = new api.OrFiltersForSegment.fromJson(o.toJson());
      checkOrFiltersForSegment(od);
    });
  });

  unittest.group("obj-schema-OrderBy", () {
    unittest.test("to-json--from-json", () {
      var o = buildOrderBy();
      var od = new api.OrderBy.fromJson(o.toJson());
      checkOrderBy(od);
    });
  });

  unittest.group("obj-schema-PageviewData", () {
    unittest.test("to-json--from-json", () {
      var o = buildPageviewData();
      var od = new api.PageviewData.fromJson(o.toJson());
      checkPageviewData(od);
    });
  });

  unittest.group("obj-schema-Pivot", () {
    unittest.test("to-json--from-json", () {
      var o = buildPivot();
      var od = new api.Pivot.fromJson(o.toJson());
      checkPivot(od);
    });
  });

  unittest.group("obj-schema-PivotHeader", () {
    unittest.test("to-json--from-json", () {
      var o = buildPivotHeader();
      var od = new api.PivotHeader.fromJson(o.toJson());
      checkPivotHeader(od);
    });
  });

  unittest.group("obj-schema-PivotHeaderEntry", () {
    unittest.test("to-json--from-json", () {
      var o = buildPivotHeaderEntry();
      var od = new api.PivotHeaderEntry.fromJson(o.toJson());
      checkPivotHeaderEntry(od);
    });
  });

  unittest.group("obj-schema-PivotValueRegion", () {
    unittest.test("to-json--from-json", () {
      var o = buildPivotValueRegion();
      var od = new api.PivotValueRegion.fromJson(o.toJson());
      checkPivotValueRegion(od);
    });
  });

  unittest.group("obj-schema-ProductData", () {
    unittest.test("to-json--from-json", () {
      var o = buildProductData();
      var od = new api.ProductData.fromJson(o.toJson());
      checkProductData(od);
    });
  });

  unittest.group("obj-schema-Report", () {
    unittest.test("to-json--from-json", () {
      var o = buildReport();
      var od = new api.Report.fromJson(o.toJson());
      checkReport(od);
    });
  });

  unittest.group("obj-schema-ReportData", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportData();
      var od = new api.ReportData.fromJson(o.toJson());
      checkReportData(od);
    });
  });

  unittest.group("obj-schema-ReportRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportRequest();
      var od = new api.ReportRequest.fromJson(o.toJson());
      checkReportRequest(od);
    });
  });

  unittest.group("obj-schema-ReportRow", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportRow();
      var od = new api.ReportRow.fromJson(o.toJson());
      checkReportRow(od);
    });
  });

  unittest.group("obj-schema-ResourceQuotasRemaining", () {
    unittest.test("to-json--from-json", () {
      var o = buildResourceQuotasRemaining();
      var od = new api.ResourceQuotasRemaining.fromJson(o.toJson());
      checkResourceQuotasRemaining(od);
    });
  });

  unittest.group("obj-schema-ScreenviewData", () {
    unittest.test("to-json--from-json", () {
      var o = buildScreenviewData();
      var od = new api.ScreenviewData.fromJson(o.toJson());
      checkScreenviewData(od);
    });
  });

  unittest.group("obj-schema-SearchUserActivityRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchUserActivityRequest();
      var od = new api.SearchUserActivityRequest.fromJson(o.toJson());
      checkSearchUserActivityRequest(od);
    });
  });

  unittest.group("obj-schema-SearchUserActivityResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchUserActivityResponse();
      var od = new api.SearchUserActivityResponse.fromJson(o.toJson());
      checkSearchUserActivityResponse(od);
    });
  });

  unittest.group("obj-schema-Segment", () {
    unittest.test("to-json--from-json", () {
      var o = buildSegment();
      var od = new api.Segment.fromJson(o.toJson());
      checkSegment(od);
    });
  });

  unittest.group("obj-schema-SegmentDefinition", () {
    unittest.test("to-json--from-json", () {
      var o = buildSegmentDefinition();
      var od = new api.SegmentDefinition.fromJson(o.toJson());
      checkSegmentDefinition(od);
    });
  });

  unittest.group("obj-schema-SegmentDimensionFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildSegmentDimensionFilter();
      var od = new api.SegmentDimensionFilter.fromJson(o.toJson());
      checkSegmentDimensionFilter(od);
    });
  });

  unittest.group("obj-schema-SegmentFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildSegmentFilter();
      var od = new api.SegmentFilter.fromJson(o.toJson());
      checkSegmentFilter(od);
    });
  });

  unittest.group("obj-schema-SegmentFilterClause", () {
    unittest.test("to-json--from-json", () {
      var o = buildSegmentFilterClause();
      var od = new api.SegmentFilterClause.fromJson(o.toJson());
      checkSegmentFilterClause(od);
    });
  });

  unittest.group("obj-schema-SegmentMetricFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildSegmentMetricFilter();
      var od = new api.SegmentMetricFilter.fromJson(o.toJson());
      checkSegmentMetricFilter(od);
    });
  });

  unittest.group("obj-schema-SegmentSequenceStep", () {
    unittest.test("to-json--from-json", () {
      var o = buildSegmentSequenceStep();
      var od = new api.SegmentSequenceStep.fromJson(o.toJson());
      checkSegmentSequenceStep(od);
    });
  });

  unittest.group("obj-schema-SequenceSegment", () {
    unittest.test("to-json--from-json", () {
      var o = buildSequenceSegment();
      var od = new api.SequenceSegment.fromJson(o.toJson());
      checkSequenceSegment(od);
    });
  });

  unittest.group("obj-schema-SimpleSegment", () {
    unittest.test("to-json--from-json", () {
      var o = buildSimpleSegment();
      var od = new api.SimpleSegment.fromJson(o.toJson());
      checkSimpleSegment(od);
    });
  });

  unittest.group("obj-schema-TransactionData", () {
    unittest.test("to-json--from-json", () {
      var o = buildTransactionData();
      var od = new api.TransactionData.fromJson(o.toJson());
      checkTransactionData(od);
    });
  });

  unittest.group("obj-schema-User", () {
    unittest.test("to-json--from-json", () {
      var o = buildUser();
      var od = new api.User.fromJson(o.toJson());
      checkUser(od);
    });
  });

  unittest.group("obj-schema-UserActivitySession", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserActivitySession();
      var od = new api.UserActivitySession.fromJson(o.toJson());
      checkUserActivitySession(od);
    });
  });

  unittest.group("resource-ReportsResourceApi", () {
    unittest.test("method--batchGet", () {
      var mock = new HttpServerMock();
      api.ReportsResourceApi res = new api.AnalyticsreportingApi(mock).reports;
      var arg_request = buildGetReportsRequest();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.GetReportsRequest.fromJson(json);
        checkGetReportsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("v4/reports:batchGet"));
        pathOffset += 19;

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
        var resp = convert.json.encode(buildGetReportsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .batchGet(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGetReportsResponse(response);
      })));
    });
  });

  unittest.group("resource-UserActivityResourceApi", () {
    unittest.test("method--search", () {
      var mock = new HttpServerMock();
      api.UserActivityResourceApi res =
          new api.AnalyticsreportingApi(mock).userActivity;
      var arg_request = buildSearchUserActivityRequest();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.SearchUserActivityRequest.fromJson(json);
        checkSearchUserActivityRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 22),
            unittest.equals("v4/userActivity:search"));
        pathOffset += 22;

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
        var resp = convert.json.encode(buildSearchUserActivityResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .search(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSearchUserActivityResponse(response);
      })));
    });
  });
}
