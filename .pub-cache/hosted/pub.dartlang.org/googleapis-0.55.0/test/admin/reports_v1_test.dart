library googleapis.admin.reports_v1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/admin/reports_v1.dart' as api;

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

buildUnnamed3320() {
  var o = new core.List<api.Activity>();
  o.add(buildActivity());
  o.add(buildActivity());
  return o;
}

checkUnnamed3320(core.List<api.Activity> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkActivity(o[0]);
  checkActivity(o[1]);
}

core.int buildCounterActivities = 0;
buildActivities() {
  var o = new api.Activities();
  buildCounterActivities++;
  if (buildCounterActivities < 3) {
    o.etag = "foo";
    o.items = buildUnnamed3320();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterActivities--;
  return o;
}

checkActivities(api.Activities o) {
  buildCounterActivities++;
  if (buildCounterActivities < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed3320(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterActivities--;
}

core.int buildCounterActivityActor = 0;
buildActivityActor() {
  var o = new api.ActivityActor();
  buildCounterActivityActor++;
  if (buildCounterActivityActor < 3) {
    o.callerType = "foo";
    o.email = "foo";
    o.key = "foo";
    o.profileId = "foo";
  }
  buildCounterActivityActor--;
  return o;
}

checkActivityActor(api.ActivityActor o) {
  buildCounterActivityActor++;
  if (buildCounterActivityActor < 3) {
    unittest.expect(o.callerType, unittest.equals('foo'));
    unittest.expect(o.email, unittest.equals('foo'));
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.profileId, unittest.equals('foo'));
  }
  buildCounterActivityActor--;
}

buildUnnamed3321() {
  var o = new core.List<api.NestedParameter>();
  o.add(buildNestedParameter());
  o.add(buildNestedParameter());
  return o;
}

checkUnnamed3321(core.List<api.NestedParameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNestedParameter(o[0]);
  checkNestedParameter(o[1]);
}

core.int buildCounterActivityEventsParametersMessageValue = 0;
buildActivityEventsParametersMessageValue() {
  var o = new api.ActivityEventsParametersMessageValue();
  buildCounterActivityEventsParametersMessageValue++;
  if (buildCounterActivityEventsParametersMessageValue < 3) {
    o.parameter = buildUnnamed3321();
  }
  buildCounterActivityEventsParametersMessageValue--;
  return o;
}

checkActivityEventsParametersMessageValue(
    api.ActivityEventsParametersMessageValue o) {
  buildCounterActivityEventsParametersMessageValue++;
  if (buildCounterActivityEventsParametersMessageValue < 3) {
    checkUnnamed3321(o.parameter);
  }
  buildCounterActivityEventsParametersMessageValue--;
}

buildUnnamed3322() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3322(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3323() {
  var o = new core.List<api.NestedParameter>();
  o.add(buildNestedParameter());
  o.add(buildNestedParameter());
  return o;
}

checkUnnamed3323(core.List<api.NestedParameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNestedParameter(o[0]);
  checkNestedParameter(o[1]);
}

core.int buildCounterActivityEventsParametersMultiMessageValue = 0;
buildActivityEventsParametersMultiMessageValue() {
  var o = new api.ActivityEventsParametersMultiMessageValue();
  buildCounterActivityEventsParametersMultiMessageValue++;
  if (buildCounterActivityEventsParametersMultiMessageValue < 3) {
    o.parameter = buildUnnamed3323();
  }
  buildCounterActivityEventsParametersMultiMessageValue--;
  return o;
}

checkActivityEventsParametersMultiMessageValue(
    api.ActivityEventsParametersMultiMessageValue o) {
  buildCounterActivityEventsParametersMultiMessageValue++;
  if (buildCounterActivityEventsParametersMultiMessageValue < 3) {
    checkUnnamed3323(o.parameter);
  }
  buildCounterActivityEventsParametersMultiMessageValue--;
}

buildUnnamed3324() {
  var o = new core.List<api.ActivityEventsParametersMultiMessageValue>();
  o.add(buildActivityEventsParametersMultiMessageValue());
  o.add(buildActivityEventsParametersMultiMessageValue());
  return o;
}

checkUnnamed3324(core.List<api.ActivityEventsParametersMultiMessageValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkActivityEventsParametersMultiMessageValue(o[0]);
  checkActivityEventsParametersMultiMessageValue(o[1]);
}

buildUnnamed3325() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3325(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterActivityEventsParameters = 0;
buildActivityEventsParameters() {
  var o = new api.ActivityEventsParameters();
  buildCounterActivityEventsParameters++;
  if (buildCounterActivityEventsParameters < 3) {
    o.boolValue = true;
    o.intValue = "foo";
    o.messageValue = buildActivityEventsParametersMessageValue();
    o.multiIntValue = buildUnnamed3322();
    o.multiMessageValue = buildUnnamed3324();
    o.multiValue = buildUnnamed3325();
    o.name = "foo";
    o.value = "foo";
  }
  buildCounterActivityEventsParameters--;
  return o;
}

checkActivityEventsParameters(api.ActivityEventsParameters o) {
  buildCounterActivityEventsParameters++;
  if (buildCounterActivityEventsParameters < 3) {
    unittest.expect(o.boolValue, unittest.isTrue);
    unittest.expect(o.intValue, unittest.equals('foo'));
    checkActivityEventsParametersMessageValue(o.messageValue);
    checkUnnamed3322(o.multiIntValue);
    checkUnnamed3324(o.multiMessageValue);
    checkUnnamed3325(o.multiValue);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterActivityEventsParameters--;
}

buildUnnamed3326() {
  var o = new core.List<api.ActivityEventsParameters>();
  o.add(buildActivityEventsParameters());
  o.add(buildActivityEventsParameters());
  return o;
}

checkUnnamed3326(core.List<api.ActivityEventsParameters> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkActivityEventsParameters(o[0]);
  checkActivityEventsParameters(o[1]);
}

core.int buildCounterActivityEvents = 0;
buildActivityEvents() {
  var o = new api.ActivityEvents();
  buildCounterActivityEvents++;
  if (buildCounterActivityEvents < 3) {
    o.name = "foo";
    o.parameters = buildUnnamed3326();
    o.type = "foo";
  }
  buildCounterActivityEvents--;
  return o;
}

checkActivityEvents(api.ActivityEvents o) {
  buildCounterActivityEvents++;
  if (buildCounterActivityEvents < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3326(o.parameters);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterActivityEvents--;
}

buildUnnamed3327() {
  var o = new core.List<api.ActivityEvents>();
  o.add(buildActivityEvents());
  o.add(buildActivityEvents());
  return o;
}

checkUnnamed3327(core.List<api.ActivityEvents> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkActivityEvents(o[0]);
  checkActivityEvents(o[1]);
}

core.int buildCounterActivityId = 0;
buildActivityId() {
  var o = new api.ActivityId();
  buildCounterActivityId++;
  if (buildCounterActivityId < 3) {
    o.applicationName = "foo";
    o.customerId = "foo";
    o.time = core.DateTime.parse("2002-02-27T14:01:02");
    o.uniqueQualifier = "foo";
  }
  buildCounterActivityId--;
  return o;
}

checkActivityId(api.ActivityId o) {
  buildCounterActivityId++;
  if (buildCounterActivityId < 3) {
    unittest.expect(o.applicationName, unittest.equals('foo'));
    unittest.expect(o.customerId, unittest.equals('foo'));
    unittest.expect(
        o.time, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.uniqueQualifier, unittest.equals('foo'));
  }
  buildCounterActivityId--;
}

core.int buildCounterActivity = 0;
buildActivity() {
  var o = new api.Activity();
  buildCounterActivity++;
  if (buildCounterActivity < 3) {
    o.actor = buildActivityActor();
    o.etag = "foo";
    o.events = buildUnnamed3327();
    o.id = buildActivityId();
    o.ipAddress = "foo";
    o.kind = "foo";
    o.ownerDomain = "foo";
  }
  buildCounterActivity--;
  return o;
}

checkActivity(api.Activity o) {
  buildCounterActivity++;
  if (buildCounterActivity < 3) {
    checkActivityActor(o.actor);
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed3327(o.events);
    checkActivityId(o.id);
    unittest.expect(o.ipAddress, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.ownerDomain, unittest.equals('foo'));
  }
  buildCounterActivity--;
}

buildUnnamed3328() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed3328(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterChannel = 0;
buildChannel() {
  var o = new api.Channel();
  buildCounterChannel++;
  if (buildCounterChannel < 3) {
    o.address = "foo";
    o.expiration = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.params = buildUnnamed3328();
    o.payload = true;
    o.resourceId = "foo";
    o.resourceUri = "foo";
    o.token = "foo";
    o.type = "foo";
  }
  buildCounterChannel--;
  return o;
}

checkChannel(api.Channel o) {
  buildCounterChannel++;
  if (buildCounterChannel < 3) {
    unittest.expect(o.address, unittest.equals('foo'));
    unittest.expect(o.expiration, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3328(o.params);
    unittest.expect(o.payload, unittest.isTrue);
    unittest.expect(o.resourceId, unittest.equals('foo'));
    unittest.expect(o.resourceUri, unittest.equals('foo'));
    unittest.expect(o.token, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterChannel--;
}

buildUnnamed3329() {
  var o = new core.List<core.bool>();
  o.add(true);
  o.add(true);
  return o;
}

checkUnnamed3329(core.List<core.bool> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.isTrue);
  unittest.expect(o[1], unittest.isTrue);
}

buildUnnamed3330() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3330(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3331() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3331(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterNestedParameter = 0;
buildNestedParameter() {
  var o = new api.NestedParameter();
  buildCounterNestedParameter++;
  if (buildCounterNestedParameter < 3) {
    o.boolValue = true;
    o.intValue = "foo";
    o.multiBoolValue = buildUnnamed3329();
    o.multiIntValue = buildUnnamed3330();
    o.multiValue = buildUnnamed3331();
    o.name = "foo";
    o.value = "foo";
  }
  buildCounterNestedParameter--;
  return o;
}

checkNestedParameter(api.NestedParameter o) {
  buildCounterNestedParameter++;
  if (buildCounterNestedParameter < 3) {
    unittest.expect(o.boolValue, unittest.isTrue);
    unittest.expect(o.intValue, unittest.equals('foo'));
    checkUnnamed3329(o.multiBoolValue);
    checkUnnamed3330(o.multiIntValue);
    checkUnnamed3331(o.multiValue);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterNestedParameter--;
}

core.int buildCounterUsageReportEntity = 0;
buildUsageReportEntity() {
  var o = new api.UsageReportEntity();
  buildCounterUsageReportEntity++;
  if (buildCounterUsageReportEntity < 3) {
    o.customerId = "foo";
    o.entityId = "foo";
    o.profileId = "foo";
    o.type = "foo";
    o.userEmail = "foo";
  }
  buildCounterUsageReportEntity--;
  return o;
}

checkUsageReportEntity(api.UsageReportEntity o) {
  buildCounterUsageReportEntity++;
  if (buildCounterUsageReportEntity < 3) {
    unittest.expect(o.customerId, unittest.equals('foo'));
    unittest.expect(o.entityId, unittest.equals('foo'));
    unittest.expect(o.profileId, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.userEmail, unittest.equals('foo'));
  }
  buildCounterUsageReportEntity--;
}

buildUnnamed3332() {
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

checkUnnamed3332(core.Map<core.String, core.Object> o) {
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

buildUnnamed3333() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed3332());
  o.add(buildUnnamed3332());
  return o;
}

checkUnnamed3333(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed3332(o[0]);
  checkUnnamed3332(o[1]);
}

core.int buildCounterUsageReportParameters = 0;
buildUsageReportParameters() {
  var o = new api.UsageReportParameters();
  buildCounterUsageReportParameters++;
  if (buildCounterUsageReportParameters < 3) {
    o.boolValue = true;
    o.datetimeValue = core.DateTime.parse("2002-02-27T14:01:02");
    o.intValue = "foo";
    o.msgValue = buildUnnamed3333();
    o.name = "foo";
    o.stringValue = "foo";
  }
  buildCounterUsageReportParameters--;
  return o;
}

checkUsageReportParameters(api.UsageReportParameters o) {
  buildCounterUsageReportParameters++;
  if (buildCounterUsageReportParameters < 3) {
    unittest.expect(o.boolValue, unittest.isTrue);
    unittest.expect(o.datetimeValue,
        unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.intValue, unittest.equals('foo'));
    checkUnnamed3333(o.msgValue);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.stringValue, unittest.equals('foo'));
  }
  buildCounterUsageReportParameters--;
}

buildUnnamed3334() {
  var o = new core.List<api.UsageReportParameters>();
  o.add(buildUsageReportParameters());
  o.add(buildUsageReportParameters());
  return o;
}

checkUnnamed3334(core.List<api.UsageReportParameters> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUsageReportParameters(o[0]);
  checkUsageReportParameters(o[1]);
}

core.int buildCounterUsageReport = 0;
buildUsageReport() {
  var o = new api.UsageReport();
  buildCounterUsageReport++;
  if (buildCounterUsageReport < 3) {
    o.date = "foo";
    o.entity = buildUsageReportEntity();
    o.etag = "foo";
    o.kind = "foo";
    o.parameters = buildUnnamed3334();
  }
  buildCounterUsageReport--;
  return o;
}

checkUsageReport(api.UsageReport o) {
  buildCounterUsageReport++;
  if (buildCounterUsageReport < 3) {
    unittest.expect(o.date, unittest.equals('foo'));
    checkUsageReportEntity(o.entity);
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3334(o.parameters);
  }
  buildCounterUsageReport--;
}

buildUnnamed3335() {
  var o = new core.List<api.UsageReport>();
  o.add(buildUsageReport());
  o.add(buildUsageReport());
  return o;
}

checkUnnamed3335(core.List<api.UsageReport> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUsageReport(o[0]);
  checkUsageReport(o[1]);
}

core.int buildCounterUsageReportsWarningsData = 0;
buildUsageReportsWarningsData() {
  var o = new api.UsageReportsWarningsData();
  buildCounterUsageReportsWarningsData++;
  if (buildCounterUsageReportsWarningsData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterUsageReportsWarningsData--;
  return o;
}

checkUsageReportsWarningsData(api.UsageReportsWarningsData o) {
  buildCounterUsageReportsWarningsData++;
  if (buildCounterUsageReportsWarningsData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterUsageReportsWarningsData--;
}

buildUnnamed3336() {
  var o = new core.List<api.UsageReportsWarningsData>();
  o.add(buildUsageReportsWarningsData());
  o.add(buildUsageReportsWarningsData());
  return o;
}

checkUnnamed3336(core.List<api.UsageReportsWarningsData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUsageReportsWarningsData(o[0]);
  checkUsageReportsWarningsData(o[1]);
}

core.int buildCounterUsageReportsWarnings = 0;
buildUsageReportsWarnings() {
  var o = new api.UsageReportsWarnings();
  buildCounterUsageReportsWarnings++;
  if (buildCounterUsageReportsWarnings < 3) {
    o.code = "foo";
    o.data = buildUnnamed3336();
    o.message = "foo";
  }
  buildCounterUsageReportsWarnings--;
  return o;
}

checkUsageReportsWarnings(api.UsageReportsWarnings o) {
  buildCounterUsageReportsWarnings++;
  if (buildCounterUsageReportsWarnings < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed3336(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterUsageReportsWarnings--;
}

buildUnnamed3337() {
  var o = new core.List<api.UsageReportsWarnings>();
  o.add(buildUsageReportsWarnings());
  o.add(buildUsageReportsWarnings());
  return o;
}

checkUnnamed3337(core.List<api.UsageReportsWarnings> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUsageReportsWarnings(o[0]);
  checkUsageReportsWarnings(o[1]);
}

core.int buildCounterUsageReports = 0;
buildUsageReports() {
  var o = new api.UsageReports();
  buildCounterUsageReports++;
  if (buildCounterUsageReports < 3) {
    o.etag = "foo";
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.usageReports = buildUnnamed3335();
    o.warnings = buildUnnamed3337();
  }
  buildCounterUsageReports--;
  return o;
}

checkUsageReports(api.UsageReports o) {
  buildCounterUsageReports++;
  if (buildCounterUsageReports < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3335(o.usageReports);
    checkUnnamed3337(o.warnings);
  }
  buildCounterUsageReports--;
}

main() {
  unittest.group("obj-schema-Activities", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivities();
      var od = new api.Activities.fromJson(o.toJson());
      checkActivities(od);
    });
  });

  unittest.group("obj-schema-ActivityActor", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivityActor();
      var od = new api.ActivityActor.fromJson(o.toJson());
      checkActivityActor(od);
    });
  });

  unittest.group("obj-schema-ActivityEventsParametersMessageValue", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivityEventsParametersMessageValue();
      var od =
          new api.ActivityEventsParametersMessageValue.fromJson(o.toJson());
      checkActivityEventsParametersMessageValue(od);
    });
  });

  unittest.group("obj-schema-ActivityEventsParametersMultiMessageValue", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivityEventsParametersMultiMessageValue();
      var od = new api.ActivityEventsParametersMultiMessageValue.fromJson(
          o.toJson());
      checkActivityEventsParametersMultiMessageValue(od);
    });
  });

  unittest.group("obj-schema-ActivityEventsParameters", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivityEventsParameters();
      var od = new api.ActivityEventsParameters.fromJson(o.toJson());
      checkActivityEventsParameters(od);
    });
  });

  unittest.group("obj-schema-ActivityEvents", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivityEvents();
      var od = new api.ActivityEvents.fromJson(o.toJson());
      checkActivityEvents(od);
    });
  });

  unittest.group("obj-schema-ActivityId", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivityId();
      var od = new api.ActivityId.fromJson(o.toJson());
      checkActivityId(od);
    });
  });

  unittest.group("obj-schema-Activity", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivity();
      var od = new api.Activity.fromJson(o.toJson());
      checkActivity(od);
    });
  });

  unittest.group("obj-schema-Channel", () {
    unittest.test("to-json--from-json", () {
      var o = buildChannel();
      var od = new api.Channel.fromJson(o.toJson());
      checkChannel(od);
    });
  });

  unittest.group("obj-schema-NestedParameter", () {
    unittest.test("to-json--from-json", () {
      var o = buildNestedParameter();
      var od = new api.NestedParameter.fromJson(o.toJson());
      checkNestedParameter(od);
    });
  });

  unittest.group("obj-schema-UsageReportEntity", () {
    unittest.test("to-json--from-json", () {
      var o = buildUsageReportEntity();
      var od = new api.UsageReportEntity.fromJson(o.toJson());
      checkUsageReportEntity(od);
    });
  });

  unittest.group("obj-schema-UsageReportParameters", () {
    unittest.test("to-json--from-json", () {
      var o = buildUsageReportParameters();
      var od = new api.UsageReportParameters.fromJson(o.toJson());
      checkUsageReportParameters(od);
    });
  });

  unittest.group("obj-schema-UsageReport", () {
    unittest.test("to-json--from-json", () {
      var o = buildUsageReport();
      var od = new api.UsageReport.fromJson(o.toJson());
      checkUsageReport(od);
    });
  });

  unittest.group("obj-schema-UsageReportsWarningsData", () {
    unittest.test("to-json--from-json", () {
      var o = buildUsageReportsWarningsData();
      var od = new api.UsageReportsWarningsData.fromJson(o.toJson());
      checkUsageReportsWarningsData(od);
    });
  });

  unittest.group("obj-schema-UsageReportsWarnings", () {
    unittest.test("to-json--from-json", () {
      var o = buildUsageReportsWarnings();
      var od = new api.UsageReportsWarnings.fromJson(o.toJson());
      checkUsageReportsWarnings(od);
    });
  });

  unittest.group("obj-schema-UsageReports", () {
    unittest.test("to-json--from-json", () {
      var o = buildUsageReports();
      var od = new api.UsageReports.fromJson(o.toJson());
      checkUsageReports(od);
    });
  });

  unittest.group("resource-ActivitiesResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ActivitiesResourceApi res = new api.AdminApi(mock).activities;
      var arg_userKey = "foo";
      var arg_applicationName = "foo";
      var arg_actorIpAddress = "foo";
      var arg_customerId = "foo";
      var arg_endTime = "foo";
      var arg_eventName = "foo";
      var arg_filters = "foo";
      var arg_maxResults = 42;
      var arg_orgUnitID = "foo";
      var arg_pageToken = "foo";
      var arg_startTime = "foo";
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
            unittest.equals("admin/reports/v1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("activity/users/"));
        pathOffset += 15;
        index = path.indexOf("/applications/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_userKey"));
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("/applications/"));
        pathOffset += 14;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_applicationName"));

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
        unittest.expect(queryMap["actorIpAddress"].first,
            unittest.equals(arg_actorIpAddress));
        unittest.expect(
            queryMap["customerId"].first, unittest.equals(arg_customerId));
        unittest.expect(
            queryMap["endTime"].first, unittest.equals(arg_endTime));
        unittest.expect(
            queryMap["eventName"].first, unittest.equals(arg_eventName));
        unittest.expect(
            queryMap["filters"].first, unittest.equals(arg_filters));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["orgUnitID"].first, unittest.equals(arg_orgUnitID));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["startTime"].first, unittest.equals(arg_startTime));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildActivities());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_userKey, arg_applicationName,
              actorIpAddress: arg_actorIpAddress,
              customerId: arg_customerId,
              endTime: arg_endTime,
              eventName: arg_eventName,
              filters: arg_filters,
              maxResults: arg_maxResults,
              orgUnitID: arg_orgUnitID,
              pageToken: arg_pageToken,
              startTime: arg_startTime,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkActivities(response);
      })));
    });

    unittest.test("method--watch", () {
      var mock = new HttpServerMock();
      api.ActivitiesResourceApi res = new api.AdminApi(mock).activities;
      var arg_request = buildChannel();
      var arg_userKey = "foo";
      var arg_applicationName = "foo";
      var arg_actorIpAddress = "foo";
      var arg_customerId = "foo";
      var arg_endTime = "foo";
      var arg_eventName = "foo";
      var arg_filters = "foo";
      var arg_maxResults = 42;
      var arg_orgUnitID = "foo";
      var arg_pageToken = "foo";
      var arg_startTime = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Channel.fromJson(json);
        checkChannel(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("admin/reports/v1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("activity/users/"));
        pathOffset += 15;
        index = path.indexOf("/applications/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_userKey"));
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("/applications/"));
        pathOffset += 14;
        index = path.indexOf("/watch", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_applicationName"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/watch"));
        pathOffset += 6;

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
        unittest.expect(queryMap["actorIpAddress"].first,
            unittest.equals(arg_actorIpAddress));
        unittest.expect(
            queryMap["customerId"].first, unittest.equals(arg_customerId));
        unittest.expect(
            queryMap["endTime"].first, unittest.equals(arg_endTime));
        unittest.expect(
            queryMap["eventName"].first, unittest.equals(arg_eventName));
        unittest.expect(
            queryMap["filters"].first, unittest.equals(arg_filters));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["orgUnitID"].first, unittest.equals(arg_orgUnitID));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["startTime"].first, unittest.equals(arg_startTime));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .watch(arg_request, arg_userKey, arg_applicationName,
              actorIpAddress: arg_actorIpAddress,
              customerId: arg_customerId,
              endTime: arg_endTime,
              eventName: arg_eventName,
              filters: arg_filters,
              maxResults: arg_maxResults,
              orgUnitID: arg_orgUnitID,
              pageToken: arg_pageToken,
              startTime: arg_startTime,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkChannel(response);
      })));
    });
  });

  unittest.group("resource-ChannelsResourceApi", () {
    unittest.test("method--stop", () {
      var mock = new HttpServerMock();
      api.ChannelsResourceApi res = new api.AdminApi(mock).channels;
      var arg_request = buildChannel();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Channel.fromJson(json);
        checkChannel(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 30),
            unittest.equals("admin/reports_v1/channels/stop"));
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
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .stop(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });
  });

  unittest.group("resource-CustomerUsageReportsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.CustomerUsageReportsResourceApi res =
          new api.AdminApi(mock).customerUsageReports;
      var arg_date = "foo";
      var arg_customerId = "foo";
      var arg_pageToken = "foo";
      var arg_parameters = "foo";
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
            unittest.equals("admin/reports/v1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("usage/dates/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_date"));

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
            queryMap["customerId"].first, unittest.equals(arg_customerId));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["parameters"].first, unittest.equals(arg_parameters));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildUsageReports());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_date,
              customerId: arg_customerId,
              pageToken: arg_pageToken,
              parameters: arg_parameters,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUsageReports(response);
      })));
    });
  });

  unittest.group("resource-EntityUsageReportsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.EntityUsageReportsResourceApi res =
          new api.AdminApi(mock).entityUsageReports;
      var arg_entityType = "foo";
      var arg_entityKey = "foo";
      var arg_date = "foo";
      var arg_customerId = "foo";
      var arg_filters = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_parameters = "foo";
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
            unittest.equals("admin/reports/v1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("usage/"));
        pathOffset += 6;
        index = path.indexOf("/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_entityType"));
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        index = path.indexOf("/dates/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_entityKey"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/dates/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_date"));

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
            queryMap["customerId"].first, unittest.equals(arg_customerId));
        unittest.expect(
            queryMap["filters"].first, unittest.equals(arg_filters));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["parameters"].first, unittest.equals(arg_parameters));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildUsageReports());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_entityType, arg_entityKey, arg_date,
              customerId: arg_customerId,
              filters: arg_filters,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              parameters: arg_parameters,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUsageReports(response);
      })));
    });
  });

  unittest.group("resource-UserUsageReportResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.UserUsageReportResourceApi res =
          new api.AdminApi(mock).userUsageReport;
      var arg_userKey = "foo";
      var arg_date = "foo";
      var arg_customerId = "foo";
      var arg_filters = "foo";
      var arg_maxResults = 42;
      var arg_orgUnitID = "foo";
      var arg_pageToken = "foo";
      var arg_parameters = "foo";
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
            unittest.equals("admin/reports/v1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("usage/users/"));
        pathOffset += 12;
        index = path.indexOf("/dates/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_userKey"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/dates/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_date"));

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
            queryMap["customerId"].first, unittest.equals(arg_customerId));
        unittest.expect(
            queryMap["filters"].first, unittest.equals(arg_filters));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["orgUnitID"].first, unittest.equals(arg_orgUnitID));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["parameters"].first, unittest.equals(arg_parameters));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildUsageReports());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_userKey, arg_date,
              customerId: arg_customerId,
              filters: arg_filters,
              maxResults: arg_maxResults,
              orgUnitID: arg_orgUnitID,
              pageToken: arg_pageToken,
              parameters: arg_parameters,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUsageReports(response);
      })));
    });
  });
}
