library googleapis.tagmanager.v1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/tagmanager/v1.dart' as api;

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

core.int buildCounterAccount = 0;
buildAccount() {
  var o = new api.Account();
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    o.accountId = "foo";
    o.fingerprint = "foo";
    o.name = "foo";
    o.shareData = true;
  }
  buildCounterAccount--;
  return o;
}

checkAccount(api.Account o) {
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.shareData, unittest.isTrue);
  }
  buildCounterAccount--;
}

buildUnnamed4501() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4501(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAccountAccess = 0;
buildAccountAccess() {
  var o = new api.AccountAccess();
  buildCounterAccountAccess++;
  if (buildCounterAccountAccess < 3) {
    o.permission = buildUnnamed4501();
  }
  buildCounterAccountAccess--;
  return o;
}

checkAccountAccess(api.AccountAccess o) {
  buildCounterAccountAccess++;
  if (buildCounterAccountAccess < 3) {
    checkUnnamed4501(o.permission);
  }
  buildCounterAccountAccess--;
}

buildUnnamed4502() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed4502(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

core.int buildCounterCondition = 0;
buildCondition() {
  var o = new api.Condition();
  buildCounterCondition++;
  if (buildCounterCondition < 3) {
    o.parameter = buildUnnamed4502();
    o.type = "foo";
  }
  buildCounterCondition--;
  return o;
}

checkCondition(api.Condition o) {
  buildCounterCondition++;
  if (buildCounterCondition < 3) {
    checkUnnamed4502(o.parameter);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterCondition--;
}

buildUnnamed4503() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4503(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4504() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4504(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4505() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4505(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterContainer = 0;
buildContainer() {
  var o = new api.Container();
  buildCounterContainer++;
  if (buildCounterContainer < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.domainName = buildUnnamed4503();
    o.enabledBuiltInVariable = buildUnnamed4504();
    o.fingerprint = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.publicId = "foo";
    o.timeZoneCountryId = "foo";
    o.timeZoneId = "foo";
    o.usageContext = buildUnnamed4505();
  }
  buildCounterContainer--;
  return o;
}

checkContainer(api.Container o) {
  buildCounterContainer++;
  if (buildCounterContainer < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkUnnamed4503(o.domainName);
    checkUnnamed4504(o.enabledBuiltInVariable);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    unittest.expect(o.publicId, unittest.equals('foo'));
    unittest.expect(o.timeZoneCountryId, unittest.equals('foo'));
    unittest.expect(o.timeZoneId, unittest.equals('foo'));
    checkUnnamed4505(o.usageContext);
  }
  buildCounterContainer--;
}

buildUnnamed4506() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4506(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterContainerAccess = 0;
buildContainerAccess() {
  var o = new api.ContainerAccess();
  buildCounterContainerAccess++;
  if (buildCounterContainerAccess < 3) {
    o.containerId = "foo";
    o.permission = buildUnnamed4506();
  }
  buildCounterContainerAccess--;
  return o;
}

checkContainerAccess(api.ContainerAccess o) {
  buildCounterContainerAccess++;
  if (buildCounterContainerAccess < 3) {
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkUnnamed4506(o.permission);
  }
  buildCounterContainerAccess--;
}

buildUnnamed4507() {
  var o = new core.List<api.Folder>();
  o.add(buildFolder());
  o.add(buildFolder());
  return o;
}

checkUnnamed4507(core.List<api.Folder> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFolder(o[0]);
  checkFolder(o[1]);
}

buildUnnamed4508() {
  var o = new core.List<api.Macro>();
  o.add(buildMacro());
  o.add(buildMacro());
  return o;
}

checkUnnamed4508(core.List<api.Macro> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMacro(o[0]);
  checkMacro(o[1]);
}

buildUnnamed4509() {
  var o = new core.List<api.Rule>();
  o.add(buildRule());
  o.add(buildRule());
  return o;
}

checkUnnamed4509(core.List<api.Rule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRule(o[0]);
  checkRule(o[1]);
}

buildUnnamed4510() {
  var o = new core.List<api.Tag>();
  o.add(buildTag());
  o.add(buildTag());
  return o;
}

checkUnnamed4510(core.List<api.Tag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTag(o[0]);
  checkTag(o[1]);
}

buildUnnamed4511() {
  var o = new core.List<api.Trigger>();
  o.add(buildTrigger());
  o.add(buildTrigger());
  return o;
}

checkUnnamed4511(core.List<api.Trigger> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTrigger(o[0]);
  checkTrigger(o[1]);
}

buildUnnamed4512() {
  var o = new core.List<api.Variable>();
  o.add(buildVariable());
  o.add(buildVariable());
  return o;
}

checkUnnamed4512(core.List<api.Variable> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariable(o[0]);
  checkVariable(o[1]);
}

core.int buildCounterContainerVersion = 0;
buildContainerVersion() {
  var o = new api.ContainerVersion();
  buildCounterContainerVersion++;
  if (buildCounterContainerVersion < 3) {
    o.accountId = "foo";
    o.container = buildContainer();
    o.containerId = "foo";
    o.containerVersionId = "foo";
    o.deleted = true;
    o.fingerprint = "foo";
    o.folder = buildUnnamed4507();
    o.macro = buildUnnamed4508();
    o.name = "foo";
    o.notes = "foo";
    o.rule = buildUnnamed4509();
    o.tag = buildUnnamed4510();
    o.trigger = buildUnnamed4511();
    o.variable = buildUnnamed4512();
  }
  buildCounterContainerVersion--;
  return o;
}

checkContainerVersion(api.ContainerVersion o) {
  buildCounterContainerVersion++;
  if (buildCounterContainerVersion < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkContainer(o.container);
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.containerVersionId, unittest.equals('foo'));
    unittest.expect(o.deleted, unittest.isTrue);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed4507(o.folder);
    checkUnnamed4508(o.macro);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkUnnamed4509(o.rule);
    checkUnnamed4510(o.tag);
    checkUnnamed4511(o.trigger);
    checkUnnamed4512(o.variable);
  }
  buildCounterContainerVersion--;
}

core.int buildCounterContainerVersionHeader = 0;
buildContainerVersionHeader() {
  var o = new api.ContainerVersionHeader();
  buildCounterContainerVersionHeader++;
  if (buildCounterContainerVersionHeader < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.containerVersionId = "foo";
    o.deleted = true;
    o.name = "foo";
    o.numMacros = "foo";
    o.numRules = "foo";
    o.numTags = "foo";
    o.numTriggers = "foo";
    o.numVariables = "foo";
  }
  buildCounterContainerVersionHeader--;
  return o;
}

checkContainerVersionHeader(api.ContainerVersionHeader o) {
  buildCounterContainerVersionHeader++;
  if (buildCounterContainerVersionHeader < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.containerVersionId, unittest.equals('foo'));
    unittest.expect(o.deleted, unittest.isTrue);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.numMacros, unittest.equals('foo'));
    unittest.expect(o.numRules, unittest.equals('foo'));
    unittest.expect(o.numTags, unittest.equals('foo'));
    unittest.expect(o.numTriggers, unittest.equals('foo'));
    unittest.expect(o.numVariables, unittest.equals('foo'));
  }
  buildCounterContainerVersionHeader--;
}

core.int buildCounterCreateContainerVersionRequestVersionOptions = 0;
buildCreateContainerVersionRequestVersionOptions() {
  var o = new api.CreateContainerVersionRequestVersionOptions();
  buildCounterCreateContainerVersionRequestVersionOptions++;
  if (buildCounterCreateContainerVersionRequestVersionOptions < 3) {
    o.name = "foo";
    o.notes = "foo";
    o.quickPreview = true;
  }
  buildCounterCreateContainerVersionRequestVersionOptions--;
  return o;
}

checkCreateContainerVersionRequestVersionOptions(
    api.CreateContainerVersionRequestVersionOptions o) {
  buildCounterCreateContainerVersionRequestVersionOptions++;
  if (buildCounterCreateContainerVersionRequestVersionOptions < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    unittest.expect(o.quickPreview, unittest.isTrue);
  }
  buildCounterCreateContainerVersionRequestVersionOptions--;
}

core.int buildCounterCreateContainerVersionResponse = 0;
buildCreateContainerVersionResponse() {
  var o = new api.CreateContainerVersionResponse();
  buildCounterCreateContainerVersionResponse++;
  if (buildCounterCreateContainerVersionResponse < 3) {
    o.compilerError = true;
    o.containerVersion = buildContainerVersion();
  }
  buildCounterCreateContainerVersionResponse--;
  return o;
}

checkCreateContainerVersionResponse(api.CreateContainerVersionResponse o) {
  buildCounterCreateContainerVersionResponse++;
  if (buildCounterCreateContainerVersionResponse < 3) {
    unittest.expect(o.compilerError, unittest.isTrue);
    checkContainerVersion(o.containerVersion);
  }
  buildCounterCreateContainerVersionResponse--;
}

core.int buildCounterEnvironment = 0;
buildEnvironment() {
  var o = new api.Environment();
  buildCounterEnvironment++;
  if (buildCounterEnvironment < 3) {
    o.accountId = "foo";
    o.authorizationCode = "foo";
    o.authorizationTimestampMs = "foo";
    o.containerId = "foo";
    o.containerVersionId = "foo";
    o.description = "foo";
    o.enableDebug = true;
    o.environmentId = "foo";
    o.fingerprint = "foo";
    o.name = "foo";
    o.type = "foo";
    o.url = "foo";
  }
  buildCounterEnvironment--;
  return o;
}

checkEnvironment(api.Environment o) {
  buildCounterEnvironment++;
  if (buildCounterEnvironment < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.authorizationCode, unittest.equals('foo'));
    unittest.expect(o.authorizationTimestampMs, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.containerVersionId, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.enableDebug, unittest.isTrue);
    unittest.expect(o.environmentId, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterEnvironment--;
}

core.int buildCounterFolder = 0;
buildFolder() {
  var o = new api.Folder();
  buildCounterFolder++;
  if (buildCounterFolder < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.fingerprint = "foo";
    o.folderId = "foo";
    o.name = "foo";
  }
  buildCounterFolder--;
  return o;
}

checkFolder(api.Folder o) {
  buildCounterFolder++;
  if (buildCounterFolder < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.folderId, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterFolder--;
}

buildUnnamed4513() {
  var o = new core.List<api.Tag>();
  o.add(buildTag());
  o.add(buildTag());
  return o;
}

checkUnnamed4513(core.List<api.Tag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTag(o[0]);
  checkTag(o[1]);
}

buildUnnamed4514() {
  var o = new core.List<api.Trigger>();
  o.add(buildTrigger());
  o.add(buildTrigger());
  return o;
}

checkUnnamed4514(core.List<api.Trigger> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTrigger(o[0]);
  checkTrigger(o[1]);
}

buildUnnamed4515() {
  var o = new core.List<api.Variable>();
  o.add(buildVariable());
  o.add(buildVariable());
  return o;
}

checkUnnamed4515(core.List<api.Variable> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariable(o[0]);
  checkVariable(o[1]);
}

core.int buildCounterFolderEntities = 0;
buildFolderEntities() {
  var o = new api.FolderEntities();
  buildCounterFolderEntities++;
  if (buildCounterFolderEntities < 3) {
    o.tag = buildUnnamed4513();
    o.trigger = buildUnnamed4514();
    o.variable = buildUnnamed4515();
  }
  buildCounterFolderEntities--;
  return o;
}

checkFolderEntities(api.FolderEntities o) {
  buildCounterFolderEntities++;
  if (buildCounterFolderEntities < 3) {
    checkUnnamed4513(o.tag);
    checkUnnamed4514(o.trigger);
    checkUnnamed4515(o.variable);
  }
  buildCounterFolderEntities--;
}

buildUnnamed4516() {
  var o = new core.List<api.UserAccess>();
  o.add(buildUserAccess());
  o.add(buildUserAccess());
  return o;
}

checkUnnamed4516(core.List<api.UserAccess> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserAccess(o[0]);
  checkUserAccess(o[1]);
}

core.int buildCounterListAccountUsersResponse = 0;
buildListAccountUsersResponse() {
  var o = new api.ListAccountUsersResponse();
  buildCounterListAccountUsersResponse++;
  if (buildCounterListAccountUsersResponse < 3) {
    o.userAccess = buildUnnamed4516();
  }
  buildCounterListAccountUsersResponse--;
  return o;
}

checkListAccountUsersResponse(api.ListAccountUsersResponse o) {
  buildCounterListAccountUsersResponse++;
  if (buildCounterListAccountUsersResponse < 3) {
    checkUnnamed4516(o.userAccess);
  }
  buildCounterListAccountUsersResponse--;
}

buildUnnamed4517() {
  var o = new core.List<api.Account>();
  o.add(buildAccount());
  o.add(buildAccount());
  return o;
}

checkUnnamed4517(core.List<api.Account> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccount(o[0]);
  checkAccount(o[1]);
}

core.int buildCounterListAccountsResponse = 0;
buildListAccountsResponse() {
  var o = new api.ListAccountsResponse();
  buildCounterListAccountsResponse++;
  if (buildCounterListAccountsResponse < 3) {
    o.accounts = buildUnnamed4517();
  }
  buildCounterListAccountsResponse--;
  return o;
}

checkListAccountsResponse(api.ListAccountsResponse o) {
  buildCounterListAccountsResponse++;
  if (buildCounterListAccountsResponse < 3) {
    checkUnnamed4517(o.accounts);
  }
  buildCounterListAccountsResponse--;
}

buildUnnamed4518() {
  var o = new core.List<api.ContainerVersion>();
  o.add(buildContainerVersion());
  o.add(buildContainerVersion());
  return o;
}

checkUnnamed4518(core.List<api.ContainerVersion> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContainerVersion(o[0]);
  checkContainerVersion(o[1]);
}

buildUnnamed4519() {
  var o = new core.List<api.ContainerVersionHeader>();
  o.add(buildContainerVersionHeader());
  o.add(buildContainerVersionHeader());
  return o;
}

checkUnnamed4519(core.List<api.ContainerVersionHeader> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContainerVersionHeader(o[0]);
  checkContainerVersionHeader(o[1]);
}

core.int buildCounterListContainerVersionsResponse = 0;
buildListContainerVersionsResponse() {
  var o = new api.ListContainerVersionsResponse();
  buildCounterListContainerVersionsResponse++;
  if (buildCounterListContainerVersionsResponse < 3) {
    o.containerVersion = buildUnnamed4518();
    o.containerVersionHeader = buildUnnamed4519();
  }
  buildCounterListContainerVersionsResponse--;
  return o;
}

checkListContainerVersionsResponse(api.ListContainerVersionsResponse o) {
  buildCounterListContainerVersionsResponse++;
  if (buildCounterListContainerVersionsResponse < 3) {
    checkUnnamed4518(o.containerVersion);
    checkUnnamed4519(o.containerVersionHeader);
  }
  buildCounterListContainerVersionsResponse--;
}

buildUnnamed4520() {
  var o = new core.List<api.Container>();
  o.add(buildContainer());
  o.add(buildContainer());
  return o;
}

checkUnnamed4520(core.List<api.Container> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContainer(o[0]);
  checkContainer(o[1]);
}

core.int buildCounterListContainersResponse = 0;
buildListContainersResponse() {
  var o = new api.ListContainersResponse();
  buildCounterListContainersResponse++;
  if (buildCounterListContainersResponse < 3) {
    o.containers = buildUnnamed4520();
  }
  buildCounterListContainersResponse--;
  return o;
}

checkListContainersResponse(api.ListContainersResponse o) {
  buildCounterListContainersResponse++;
  if (buildCounterListContainersResponse < 3) {
    checkUnnamed4520(o.containers);
  }
  buildCounterListContainersResponse--;
}

buildUnnamed4521() {
  var o = new core.List<api.Environment>();
  o.add(buildEnvironment());
  o.add(buildEnvironment());
  return o;
}

checkUnnamed4521(core.List<api.Environment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEnvironment(o[0]);
  checkEnvironment(o[1]);
}

core.int buildCounterListEnvironmentsResponse = 0;
buildListEnvironmentsResponse() {
  var o = new api.ListEnvironmentsResponse();
  buildCounterListEnvironmentsResponse++;
  if (buildCounterListEnvironmentsResponse < 3) {
    o.environments = buildUnnamed4521();
  }
  buildCounterListEnvironmentsResponse--;
  return o;
}

checkListEnvironmentsResponse(api.ListEnvironmentsResponse o) {
  buildCounterListEnvironmentsResponse++;
  if (buildCounterListEnvironmentsResponse < 3) {
    checkUnnamed4521(o.environments);
  }
  buildCounterListEnvironmentsResponse--;
}

buildUnnamed4522() {
  var o = new core.List<api.Folder>();
  o.add(buildFolder());
  o.add(buildFolder());
  return o;
}

checkUnnamed4522(core.List<api.Folder> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFolder(o[0]);
  checkFolder(o[1]);
}

core.int buildCounterListFoldersResponse = 0;
buildListFoldersResponse() {
  var o = new api.ListFoldersResponse();
  buildCounterListFoldersResponse++;
  if (buildCounterListFoldersResponse < 3) {
    o.folders = buildUnnamed4522();
  }
  buildCounterListFoldersResponse--;
  return o;
}

checkListFoldersResponse(api.ListFoldersResponse o) {
  buildCounterListFoldersResponse++;
  if (buildCounterListFoldersResponse < 3) {
    checkUnnamed4522(o.folders);
  }
  buildCounterListFoldersResponse--;
}

buildUnnamed4523() {
  var o = new core.List<api.Tag>();
  o.add(buildTag());
  o.add(buildTag());
  return o;
}

checkUnnamed4523(core.List<api.Tag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTag(o[0]);
  checkTag(o[1]);
}

core.int buildCounterListTagsResponse = 0;
buildListTagsResponse() {
  var o = new api.ListTagsResponse();
  buildCounterListTagsResponse++;
  if (buildCounterListTagsResponse < 3) {
    o.tags = buildUnnamed4523();
  }
  buildCounterListTagsResponse--;
  return o;
}

checkListTagsResponse(api.ListTagsResponse o) {
  buildCounterListTagsResponse++;
  if (buildCounterListTagsResponse < 3) {
    checkUnnamed4523(o.tags);
  }
  buildCounterListTagsResponse--;
}

buildUnnamed4524() {
  var o = new core.List<api.Trigger>();
  o.add(buildTrigger());
  o.add(buildTrigger());
  return o;
}

checkUnnamed4524(core.List<api.Trigger> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTrigger(o[0]);
  checkTrigger(o[1]);
}

core.int buildCounterListTriggersResponse = 0;
buildListTriggersResponse() {
  var o = new api.ListTriggersResponse();
  buildCounterListTriggersResponse++;
  if (buildCounterListTriggersResponse < 3) {
    o.triggers = buildUnnamed4524();
  }
  buildCounterListTriggersResponse--;
  return o;
}

checkListTriggersResponse(api.ListTriggersResponse o) {
  buildCounterListTriggersResponse++;
  if (buildCounterListTriggersResponse < 3) {
    checkUnnamed4524(o.triggers);
  }
  buildCounterListTriggersResponse--;
}

buildUnnamed4525() {
  var o = new core.List<api.Variable>();
  o.add(buildVariable());
  o.add(buildVariable());
  return o;
}

checkUnnamed4525(core.List<api.Variable> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariable(o[0]);
  checkVariable(o[1]);
}

core.int buildCounterListVariablesResponse = 0;
buildListVariablesResponse() {
  var o = new api.ListVariablesResponse();
  buildCounterListVariablesResponse++;
  if (buildCounterListVariablesResponse < 3) {
    o.variables = buildUnnamed4525();
  }
  buildCounterListVariablesResponse--;
  return o;
}

checkListVariablesResponse(api.ListVariablesResponse o) {
  buildCounterListVariablesResponse++;
  if (buildCounterListVariablesResponse < 3) {
    checkUnnamed4525(o.variables);
  }
  buildCounterListVariablesResponse--;
}

buildUnnamed4526() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4526(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4527() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4527(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4528() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed4528(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

core.int buildCounterMacro = 0;
buildMacro() {
  var o = new api.Macro();
  buildCounterMacro++;
  if (buildCounterMacro < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.disablingRuleId = buildUnnamed4526();
    o.enablingRuleId = buildUnnamed4527();
    o.fingerprint = "foo";
    o.macroId = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.parameter = buildUnnamed4528();
    o.parentFolderId = "foo";
    o.scheduleEndMs = "foo";
    o.scheduleStartMs = "foo";
    o.type = "foo";
  }
  buildCounterMacro--;
  return o;
}

checkMacro(api.Macro o) {
  buildCounterMacro++;
  if (buildCounterMacro < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkUnnamed4526(o.disablingRuleId);
    checkUnnamed4527(o.enablingRuleId);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.macroId, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkUnnamed4528(o.parameter);
    unittest.expect(o.parentFolderId, unittest.equals('foo'));
    unittest.expect(o.scheduleEndMs, unittest.equals('foo'));
    unittest.expect(o.scheduleStartMs, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterMacro--;
}

buildUnnamed4529() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed4529(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

buildUnnamed4530() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed4530(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

core.int buildCounterParameter = 0;
buildParameter() {
  var o = new api.Parameter();
  buildCounterParameter++;
  if (buildCounterParameter < 3) {
    o.key = "foo";
    o.list = buildUnnamed4529();
    o.map = buildUnnamed4530();
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterParameter--;
  return o;
}

checkParameter(api.Parameter o) {
  buildCounterParameter++;
  if (buildCounterParameter < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    checkUnnamed4529(o.list);
    checkUnnamed4530(o.map);
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterParameter--;
}

core.int buildCounterPublishContainerVersionResponse = 0;
buildPublishContainerVersionResponse() {
  var o = new api.PublishContainerVersionResponse();
  buildCounterPublishContainerVersionResponse++;
  if (buildCounterPublishContainerVersionResponse < 3) {
    o.compilerError = true;
    o.containerVersion = buildContainerVersion();
  }
  buildCounterPublishContainerVersionResponse--;
  return o;
}

checkPublishContainerVersionResponse(api.PublishContainerVersionResponse o) {
  buildCounterPublishContainerVersionResponse++;
  if (buildCounterPublishContainerVersionResponse < 3) {
    unittest.expect(o.compilerError, unittest.isTrue);
    checkContainerVersion(o.containerVersion);
  }
  buildCounterPublishContainerVersionResponse--;
}

buildUnnamed4531() {
  var o = new core.List<api.Condition>();
  o.add(buildCondition());
  o.add(buildCondition());
  return o;
}

checkUnnamed4531(core.List<api.Condition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCondition(o[0]);
  checkCondition(o[1]);
}

core.int buildCounterRule = 0;
buildRule() {
  var o = new api.Rule();
  buildCounterRule++;
  if (buildCounterRule < 3) {
    o.accountId = "foo";
    o.condition = buildUnnamed4531();
    o.containerId = "foo";
    o.fingerprint = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.ruleId = "foo";
  }
  buildCounterRule--;
  return o;
}

checkRule(api.Rule o) {
  buildCounterRule++;
  if (buildCounterRule < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed4531(o.condition);
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    unittest.expect(o.ruleId, unittest.equals('foo'));
  }
  buildCounterRule--;
}

core.int buildCounterSetupTag = 0;
buildSetupTag() {
  var o = new api.SetupTag();
  buildCounterSetupTag++;
  if (buildCounterSetupTag < 3) {
    o.stopOnSetupFailure = true;
    o.tagName = "foo";
  }
  buildCounterSetupTag--;
  return o;
}

checkSetupTag(api.SetupTag o) {
  buildCounterSetupTag++;
  if (buildCounterSetupTag < 3) {
    unittest.expect(o.stopOnSetupFailure, unittest.isTrue);
    unittest.expect(o.tagName, unittest.equals('foo'));
  }
  buildCounterSetupTag--;
}

buildUnnamed4532() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4532(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4533() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4533(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4534() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4534(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4535() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4535(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4536() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed4536(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

buildUnnamed4537() {
  var o = new core.List<api.SetupTag>();
  o.add(buildSetupTag());
  o.add(buildSetupTag());
  return o;
}

checkUnnamed4537(core.List<api.SetupTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSetupTag(o[0]);
  checkSetupTag(o[1]);
}

buildUnnamed4538() {
  var o = new core.List<api.TeardownTag>();
  o.add(buildTeardownTag());
  o.add(buildTeardownTag());
  return o;
}

checkUnnamed4538(core.List<api.TeardownTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTeardownTag(o[0]);
  checkTeardownTag(o[1]);
}

core.int buildCounterTag = 0;
buildTag() {
  var o = new api.Tag();
  buildCounterTag++;
  if (buildCounterTag < 3) {
    o.accountId = "foo";
    o.blockingRuleId = buildUnnamed4532();
    o.blockingTriggerId = buildUnnamed4533();
    o.containerId = "foo";
    o.fingerprint = "foo";
    o.firingRuleId = buildUnnamed4534();
    o.firingTriggerId = buildUnnamed4535();
    o.liveOnly = true;
    o.name = "foo";
    o.notes = "foo";
    o.parameter = buildUnnamed4536();
    o.parentFolderId = "foo";
    o.paused = true;
    o.priority = buildParameter();
    o.scheduleEndMs = "foo";
    o.scheduleStartMs = "foo";
    o.setupTag = buildUnnamed4537();
    o.tagFiringOption = "foo";
    o.tagId = "foo";
    o.teardownTag = buildUnnamed4538();
    o.type = "foo";
  }
  buildCounterTag--;
  return o;
}

checkTag(api.Tag o) {
  buildCounterTag++;
  if (buildCounterTag < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed4532(o.blockingRuleId);
    checkUnnamed4533(o.blockingTriggerId);
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed4534(o.firingRuleId);
    checkUnnamed4535(o.firingTriggerId);
    unittest.expect(o.liveOnly, unittest.isTrue);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkUnnamed4536(o.parameter);
    unittest.expect(o.parentFolderId, unittest.equals('foo'));
    unittest.expect(o.paused, unittest.isTrue);
    checkParameter(o.priority);
    unittest.expect(o.scheduleEndMs, unittest.equals('foo'));
    unittest.expect(o.scheduleStartMs, unittest.equals('foo'));
    checkUnnamed4537(o.setupTag);
    unittest.expect(o.tagFiringOption, unittest.equals('foo'));
    unittest.expect(o.tagId, unittest.equals('foo'));
    checkUnnamed4538(o.teardownTag);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterTag--;
}

core.int buildCounterTeardownTag = 0;
buildTeardownTag() {
  var o = new api.TeardownTag();
  buildCounterTeardownTag++;
  if (buildCounterTeardownTag < 3) {
    o.stopTeardownOnFailure = true;
    o.tagName = "foo";
  }
  buildCounterTeardownTag--;
  return o;
}

checkTeardownTag(api.TeardownTag o) {
  buildCounterTeardownTag++;
  if (buildCounterTeardownTag < 3) {
    unittest.expect(o.stopTeardownOnFailure, unittest.isTrue);
    unittest.expect(o.tagName, unittest.equals('foo'));
  }
  buildCounterTeardownTag--;
}

buildUnnamed4539() {
  var o = new core.List<api.Condition>();
  o.add(buildCondition());
  o.add(buildCondition());
  return o;
}

checkUnnamed4539(core.List<api.Condition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCondition(o[0]);
  checkCondition(o[1]);
}

buildUnnamed4540() {
  var o = new core.List<api.Condition>();
  o.add(buildCondition());
  o.add(buildCondition());
  return o;
}

checkUnnamed4540(core.List<api.Condition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCondition(o[0]);
  checkCondition(o[1]);
}

buildUnnamed4541() {
  var o = new core.List<api.Condition>();
  o.add(buildCondition());
  o.add(buildCondition());
  return o;
}

checkUnnamed4541(core.List<api.Condition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCondition(o[0]);
  checkCondition(o[1]);
}

buildUnnamed4542() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed4542(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

core.int buildCounterTrigger = 0;
buildTrigger() {
  var o = new api.Trigger();
  buildCounterTrigger++;
  if (buildCounterTrigger < 3) {
    o.accountId = "foo";
    o.autoEventFilter = buildUnnamed4539();
    o.checkValidation = buildParameter();
    o.containerId = "foo";
    o.continuousTimeMinMilliseconds = buildParameter();
    o.customEventFilter = buildUnnamed4540();
    o.eventName = buildParameter();
    o.filter = buildUnnamed4541();
    o.fingerprint = "foo";
    o.horizontalScrollPercentageList = buildParameter();
    o.interval = buildParameter();
    o.intervalSeconds = buildParameter();
    o.limit = buildParameter();
    o.maxTimerLengthSeconds = buildParameter();
    o.name = "foo";
    o.parameter = buildUnnamed4542();
    o.parentFolderId = "foo";
    o.selector = buildParameter();
    o.totalTimeMinMilliseconds = buildParameter();
    o.triggerId = "foo";
    o.type = "foo";
    o.uniqueTriggerId = buildParameter();
    o.verticalScrollPercentageList = buildParameter();
    o.visibilitySelector = buildParameter();
    o.visiblePercentageMax = buildParameter();
    o.visiblePercentageMin = buildParameter();
    o.waitForTags = buildParameter();
    o.waitForTagsTimeout = buildParameter();
  }
  buildCounterTrigger--;
  return o;
}

checkTrigger(api.Trigger o) {
  buildCounterTrigger++;
  if (buildCounterTrigger < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed4539(o.autoEventFilter);
    checkParameter(o.checkValidation);
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkParameter(o.continuousTimeMinMilliseconds);
    checkUnnamed4540(o.customEventFilter);
    checkParameter(o.eventName);
    checkUnnamed4541(o.filter);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkParameter(o.horizontalScrollPercentageList);
    checkParameter(o.interval);
    checkParameter(o.intervalSeconds);
    checkParameter(o.limit);
    checkParameter(o.maxTimerLengthSeconds);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed4542(o.parameter);
    unittest.expect(o.parentFolderId, unittest.equals('foo'));
    checkParameter(o.selector);
    checkParameter(o.totalTimeMinMilliseconds);
    unittest.expect(o.triggerId, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    checkParameter(o.uniqueTriggerId);
    checkParameter(o.verticalScrollPercentageList);
    checkParameter(o.visibilitySelector);
    checkParameter(o.visiblePercentageMax);
    checkParameter(o.visiblePercentageMin);
    checkParameter(o.waitForTags);
    checkParameter(o.waitForTagsTimeout);
  }
  buildCounterTrigger--;
}

buildUnnamed4543() {
  var o = new core.List<api.ContainerAccess>();
  o.add(buildContainerAccess());
  o.add(buildContainerAccess());
  return o;
}

checkUnnamed4543(core.List<api.ContainerAccess> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContainerAccess(o[0]);
  checkContainerAccess(o[1]);
}

core.int buildCounterUserAccess = 0;
buildUserAccess() {
  var o = new api.UserAccess();
  buildCounterUserAccess++;
  if (buildCounterUserAccess < 3) {
    o.accountAccess = buildAccountAccess();
    o.accountId = "foo";
    o.containerAccess = buildUnnamed4543();
    o.emailAddress = "foo";
    o.permissionId = "foo";
  }
  buildCounterUserAccess--;
  return o;
}

checkUserAccess(api.UserAccess o) {
  buildCounterUserAccess++;
  if (buildCounterUserAccess < 3) {
    checkAccountAccess(o.accountAccess);
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed4543(o.containerAccess);
    unittest.expect(o.emailAddress, unittest.equals('foo'));
    unittest.expect(o.permissionId, unittest.equals('foo'));
  }
  buildCounterUserAccess--;
}

buildUnnamed4544() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4544(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4545() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4545(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4546() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed4546(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

core.int buildCounterVariable = 0;
buildVariable() {
  var o = new api.Variable();
  buildCounterVariable++;
  if (buildCounterVariable < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.disablingTriggerId = buildUnnamed4544();
    o.enablingTriggerId = buildUnnamed4545();
    o.fingerprint = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.parameter = buildUnnamed4546();
    o.parentFolderId = "foo";
    o.scheduleEndMs = "foo";
    o.scheduleStartMs = "foo";
    o.type = "foo";
    o.variableId = "foo";
  }
  buildCounterVariable--;
  return o;
}

checkVariable(api.Variable o) {
  buildCounterVariable++;
  if (buildCounterVariable < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkUnnamed4544(o.disablingTriggerId);
    checkUnnamed4545(o.enablingTriggerId);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkUnnamed4546(o.parameter);
    unittest.expect(o.parentFolderId, unittest.equals('foo'));
    unittest.expect(o.scheduleEndMs, unittest.equals('foo'));
    unittest.expect(o.scheduleStartMs, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.variableId, unittest.equals('foo'));
  }
  buildCounterVariable--;
}

buildUnnamed4547() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4547(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4548() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4548(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4549() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4549(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

main() {
  unittest.group("obj-schema-Account", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccount();
      var od = new api.Account.fromJson(o.toJson());
      checkAccount(od);
    });
  });

  unittest.group("obj-schema-AccountAccess", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountAccess();
      var od = new api.AccountAccess.fromJson(o.toJson());
      checkAccountAccess(od);
    });
  });

  unittest.group("obj-schema-Condition", () {
    unittest.test("to-json--from-json", () {
      var o = buildCondition();
      var od = new api.Condition.fromJson(o.toJson());
      checkCondition(od);
    });
  });

  unittest.group("obj-schema-Container", () {
    unittest.test("to-json--from-json", () {
      var o = buildContainer();
      var od = new api.Container.fromJson(o.toJson());
      checkContainer(od);
    });
  });

  unittest.group("obj-schema-ContainerAccess", () {
    unittest.test("to-json--from-json", () {
      var o = buildContainerAccess();
      var od = new api.ContainerAccess.fromJson(o.toJson());
      checkContainerAccess(od);
    });
  });

  unittest.group("obj-schema-ContainerVersion", () {
    unittest.test("to-json--from-json", () {
      var o = buildContainerVersion();
      var od = new api.ContainerVersion.fromJson(o.toJson());
      checkContainerVersion(od);
    });
  });

  unittest.group("obj-schema-ContainerVersionHeader", () {
    unittest.test("to-json--from-json", () {
      var o = buildContainerVersionHeader();
      var od = new api.ContainerVersionHeader.fromJson(o.toJson());
      checkContainerVersionHeader(od);
    });
  });

  unittest.group("obj-schema-CreateContainerVersionRequestVersionOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreateContainerVersionRequestVersionOptions();
      var od = new api.CreateContainerVersionRequestVersionOptions.fromJson(
          o.toJson());
      checkCreateContainerVersionRequestVersionOptions(od);
    });
  });

  unittest.group("obj-schema-CreateContainerVersionResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreateContainerVersionResponse();
      var od = new api.CreateContainerVersionResponse.fromJson(o.toJson());
      checkCreateContainerVersionResponse(od);
    });
  });

  unittest.group("obj-schema-Environment", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnvironment();
      var od = new api.Environment.fromJson(o.toJson());
      checkEnvironment(od);
    });
  });

  unittest.group("obj-schema-Folder", () {
    unittest.test("to-json--from-json", () {
      var o = buildFolder();
      var od = new api.Folder.fromJson(o.toJson());
      checkFolder(od);
    });
  });

  unittest.group("obj-schema-FolderEntities", () {
    unittest.test("to-json--from-json", () {
      var o = buildFolderEntities();
      var od = new api.FolderEntities.fromJson(o.toJson());
      checkFolderEntities(od);
    });
  });

  unittest.group("obj-schema-ListAccountUsersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListAccountUsersResponse();
      var od = new api.ListAccountUsersResponse.fromJson(o.toJson());
      checkListAccountUsersResponse(od);
    });
  });

  unittest.group("obj-schema-ListAccountsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListAccountsResponse();
      var od = new api.ListAccountsResponse.fromJson(o.toJson());
      checkListAccountsResponse(od);
    });
  });

  unittest.group("obj-schema-ListContainerVersionsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListContainerVersionsResponse();
      var od = new api.ListContainerVersionsResponse.fromJson(o.toJson());
      checkListContainerVersionsResponse(od);
    });
  });

  unittest.group("obj-schema-ListContainersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListContainersResponse();
      var od = new api.ListContainersResponse.fromJson(o.toJson());
      checkListContainersResponse(od);
    });
  });

  unittest.group("obj-schema-ListEnvironmentsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListEnvironmentsResponse();
      var od = new api.ListEnvironmentsResponse.fromJson(o.toJson());
      checkListEnvironmentsResponse(od);
    });
  });

  unittest.group("obj-schema-ListFoldersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListFoldersResponse();
      var od = new api.ListFoldersResponse.fromJson(o.toJson());
      checkListFoldersResponse(od);
    });
  });

  unittest.group("obj-schema-ListTagsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListTagsResponse();
      var od = new api.ListTagsResponse.fromJson(o.toJson());
      checkListTagsResponse(od);
    });
  });

  unittest.group("obj-schema-ListTriggersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListTriggersResponse();
      var od = new api.ListTriggersResponse.fromJson(o.toJson());
      checkListTriggersResponse(od);
    });
  });

  unittest.group("obj-schema-ListVariablesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListVariablesResponse();
      var od = new api.ListVariablesResponse.fromJson(o.toJson());
      checkListVariablesResponse(od);
    });
  });

  unittest.group("obj-schema-Macro", () {
    unittest.test("to-json--from-json", () {
      var o = buildMacro();
      var od = new api.Macro.fromJson(o.toJson());
      checkMacro(od);
    });
  });

  unittest.group("obj-schema-Parameter", () {
    unittest.test("to-json--from-json", () {
      var o = buildParameter();
      var od = new api.Parameter.fromJson(o.toJson());
      checkParameter(od);
    });
  });

  unittest.group("obj-schema-PublishContainerVersionResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPublishContainerVersionResponse();
      var od = new api.PublishContainerVersionResponse.fromJson(o.toJson());
      checkPublishContainerVersionResponse(od);
    });
  });

  unittest.group("obj-schema-Rule", () {
    unittest.test("to-json--from-json", () {
      var o = buildRule();
      var od = new api.Rule.fromJson(o.toJson());
      checkRule(od);
    });
  });

  unittest.group("obj-schema-SetupTag", () {
    unittest.test("to-json--from-json", () {
      var o = buildSetupTag();
      var od = new api.SetupTag.fromJson(o.toJson());
      checkSetupTag(od);
    });
  });

  unittest.group("obj-schema-Tag", () {
    unittest.test("to-json--from-json", () {
      var o = buildTag();
      var od = new api.Tag.fromJson(o.toJson());
      checkTag(od);
    });
  });

  unittest.group("obj-schema-TeardownTag", () {
    unittest.test("to-json--from-json", () {
      var o = buildTeardownTag();
      var od = new api.TeardownTag.fromJson(o.toJson());
      checkTeardownTag(od);
    });
  });

  unittest.group("obj-schema-Trigger", () {
    unittest.test("to-json--from-json", () {
      var o = buildTrigger();
      var od = new api.Trigger.fromJson(o.toJson());
      checkTrigger(od);
    });
  });

  unittest.group("obj-schema-UserAccess", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserAccess();
      var od = new api.UserAccess.fromJson(o.toJson());
      checkUserAccess(od);
    });
  });

  unittest.group("obj-schema-Variable", () {
    unittest.test("to-json--from-json", () {
      var o = buildVariable();
      var od = new api.Variable.fromJson(o.toJson());
      checkVariable(od);
    });
  });

  unittest.group("resource-AccountsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.TagmanagerApi(mock).accounts;
      var arg_accountId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));

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
        var resp = convert.json.encode(buildAccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_accountId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccount(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.TagmanagerApi(mock).accounts;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 22),
            unittest.equals("tagmanager/v1/accounts"));
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
        var resp = convert.json.encode(buildListAccountsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list($fields: arg_$fields).then(unittest.expectAsync1(((response) {
        checkListAccountsResponse(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.TagmanagerApi(mock).accounts;
      var arg_request = buildAccount();
      var arg_accountId = "foo";
      var arg_fingerprint = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Account.fromJson(json);
        checkAccount(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));

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
            queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_accountId,
              fingerprint: arg_fingerprint, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccount(response);
      })));
    });
  });

  unittest.group("resource-AccountsContainersResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers;
      var arg_request = buildContainer();
      var arg_accountId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Container.fromJson(json);
        checkContainer(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/containers"));
        pathOffset += 11;

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
        var resp = convert.json.encode(buildContainer());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_accountId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContainer(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));

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
          .delete(arg_accountId, arg_containerId, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));

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
        var resp = convert.json.encode(buildContainer());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_accountId, arg_containerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContainer(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers;
      var arg_accountId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/containers"));
        pathOffset += 11;

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
        var resp = convert.json.encode(buildListContainersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_accountId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListContainersResponse(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers;
      var arg_request = buildContainer();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_fingerprint = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Container.fromJson(json);
        checkContainer(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));

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
            queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildContainer());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_accountId, arg_containerId,
              fingerprint: arg_fingerprint, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContainer(response);
      })));
    });
  });

  unittest.group("resource-AccountsContainersEnvironmentsResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AccountsContainersEnvironmentsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.environments;
      var arg_request = buildEnvironment();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Environment.fromJson(json);
        checkEnvironment(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/environments", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("/environments"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEnvironment());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_accountId, arg_containerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEnvironment(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AccountsContainersEnvironmentsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.environments;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_environmentId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/environments/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("/environments/"));
        pathOffset += 14;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_environmentId"));

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
          .delete(arg_accountId, arg_containerId, arg_environmentId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsContainersEnvironmentsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.environments;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_environmentId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/environments/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("/environments/"));
        pathOffset += 14;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_environmentId"));

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
        var resp = convert.json.encode(buildEnvironment());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_accountId, arg_containerId, arg_environmentId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEnvironment(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsContainersEnvironmentsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.environments;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/environments", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("/environments"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListEnvironmentsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_accountId, arg_containerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListEnvironmentsResponse(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsContainersEnvironmentsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.environments;
      var arg_request = buildEnvironment();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_environmentId = "foo";
      var arg_fingerprint = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Environment.fromJson(json);
        checkEnvironment(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/environments/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("/environments/"));
        pathOffset += 14;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_environmentId"));

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
            queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEnvironment());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(
              arg_request, arg_accountId, arg_containerId, arg_environmentId,
              fingerprint: arg_fingerprint, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEnvironment(response);
      })));
    });
  });

  unittest.group("resource-AccountsContainersFoldersResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_request = buildFolder();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Folder.fromJson(json);
        checkFolder(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/folders"));
        pathOffset += 8;

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
        var resp = convert.json.encode(buildFolder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_accountId, arg_containerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFolder(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/folders/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));

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
          .delete(arg_accountId, arg_containerId, arg_folderId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/folders/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));

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
        var resp = convert.json.encode(buildFolder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_accountId, arg_containerId, arg_folderId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFolder(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/folders"));
        pathOffset += 8;

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
        var resp = convert.json.encode(buildListFoldersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_accountId, arg_containerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListFoldersResponse(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_request = buildFolder();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
      var arg_fingerprint = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Folder.fromJson(json);
        checkFolder(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/folders/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));

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
            queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFolder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_accountId, arg_containerId, arg_folderId,
              fingerprint: arg_fingerprint, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFolder(response);
      })));
    });
  });

  unittest.group("resource-AccountsContainersFoldersEntitiesResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsContainersFoldersEntitiesResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.folders.entities;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/folders/"));
        pathOffset += 9;
        index = path.indexOf("/entities", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/entities"));
        pathOffset += 9;

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
        var resp = convert.json.encode(buildFolderEntities());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_accountId, arg_containerId, arg_folderId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFolderEntities(response);
      })));
    });
  });

  unittest.group("resource-AccountsContainersMoveFoldersResourceApi", () {
    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsContainersMoveFoldersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.moveFolders;
      var arg_request = buildFolder();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
      var arg_variableId = buildUnnamed4547();
      var arg_tagId = buildUnnamed4548();
      var arg_triggerId = buildUnnamed4549();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Folder.fromJson(json);
        checkFolder(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/move_folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("/move_folders/"));
        pathOffset += 14;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));

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
            queryMap["variableId"], unittest.equals(arg_variableId));
        unittest.expect(queryMap["tagId"], unittest.equals(arg_tagId));
        unittest.expect(queryMap["triggerId"], unittest.equals(arg_triggerId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_accountId, arg_containerId, arg_folderId,
              variableId: arg_variableId,
              tagId: arg_tagId,
              triggerId: arg_triggerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });
  });

  unittest.group(
      "resource-AccountsContainersReauthorizeEnvironmentsResourceApi", () {
    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsContainersReauthorizeEnvironmentsResourceApi res =
          new api.TagmanagerApi(mock)
              .accounts
              .containers
              .reauthorizeEnvironments;
      var arg_request = buildEnvironment();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_environmentId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Environment.fromJson(json);
        checkEnvironment(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/reauthorize_environments/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 26),
            unittest.equals("/reauthorize_environments/"));
        pathOffset += 26;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_environmentId"));

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
        var resp = convert.json.encode(buildEnvironment());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(
              arg_request, arg_accountId, arg_containerId, arg_environmentId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEnvironment(response);
      })));
    });
  });

  unittest.group("resource-AccountsContainersTagsResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_request = buildTag();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Tag.fromJson(json);
        checkTag(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5),
            unittest.equals("/tags"));
        pathOffset += 5;

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
        var resp = convert.json.encode(buildTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_accountId, arg_containerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTag(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_tagId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/tags/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tagId"));

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
          .delete(arg_accountId, arg_containerId, arg_tagId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_tagId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/tags/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tagId"));

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
        var resp = convert.json.encode(buildTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_accountId, arg_containerId, arg_tagId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTag(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5),
            unittest.equals("/tags"));
        pathOffset += 5;

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
        var resp = convert.json.encode(buildListTagsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_accountId, arg_containerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListTagsResponse(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_request = buildTag();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_tagId = "foo";
      var arg_fingerprint = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Tag.fromJson(json);
        checkTag(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/tags/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tagId"));

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
            queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_accountId, arg_containerId, arg_tagId,
              fingerprint: arg_fingerprint, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTag(response);
      })));
    });
  });

  unittest.group("resource-AccountsContainersTriggersResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_request = buildTrigger();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Trigger.fromJson(json);
        checkTrigger(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/triggers"));
        pathOffset += 9;

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
        var resp = convert.json.encode(buildTrigger());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_accountId, arg_containerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTrigger(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_triggerId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/triggers/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));

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
          .delete(arg_accountId, arg_containerId, arg_triggerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_triggerId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/triggers/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));

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
        var resp = convert.json.encode(buildTrigger());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_accountId, arg_containerId, arg_triggerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTrigger(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/triggers"));
        pathOffset += 9;

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
        var resp = convert.json.encode(buildListTriggersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_accountId, arg_containerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListTriggersResponse(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_request = buildTrigger();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_triggerId = "foo";
      var arg_fingerprint = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Trigger.fromJson(json);
        checkTrigger(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/triggers/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));

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
            queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildTrigger());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_accountId, arg_containerId, arg_triggerId,
              fingerprint: arg_fingerprint, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTrigger(response);
      })));
    });
  });

  unittest.group("resource-AccountsContainersVariablesResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_request = buildVariable();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Variable.fromJson(json);
        checkVariable(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/variables"));
        pathOffset += 10;

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
        var resp = convert.json.encode(buildVariable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_accountId, arg_containerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkVariable(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_variableId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/variables/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variableId"));

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
          .delete(arg_accountId, arg_containerId, arg_variableId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_variableId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/variables/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variableId"));

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
        var resp = convert.json.encode(buildVariable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_accountId, arg_containerId, arg_variableId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkVariable(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/variables"));
        pathOffset += 10;

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
        var resp = convert.json.encode(buildListVariablesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_accountId, arg_containerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListVariablesResponse(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_request = buildVariable();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_variableId = "foo";
      var arg_fingerprint = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Variable.fromJson(json);
        checkVariable(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/variables/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variableId"));

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
            queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildVariable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_accountId, arg_containerId, arg_variableId,
              fingerprint: arg_fingerprint, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkVariable(response);
      })));
    });
  });

  unittest.group("resource-AccountsContainersVersionsResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_request = buildCreateContainerVersionRequestVersionOptions();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj =
            new api.CreateContainerVersionRequestVersionOptions.fromJson(json);
        checkCreateContainerVersionRequestVersionOptions(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/versions"));
        pathOffset += 9;

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
        var resp = convert.json.encode(buildCreateContainerVersionResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_accountId, arg_containerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreateContainerVersionResponse(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/versions/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));

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
          .delete(arg_accountId, arg_containerId, arg_containerVersionId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/versions/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));

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
        var resp = convert.json.encode(buildContainerVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_accountId, arg_containerId, arg_containerVersionId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContainerVersion(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_includeDeleted = true;
      var arg_headers = true;
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/versions"));
        pathOffset += 9;

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
        unittest.expect(queryMap["includeDeleted"].first,
            unittest.equals("$arg_includeDeleted"));
        unittest.expect(
            queryMap["headers"].first, unittest.equals("$arg_headers"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListContainerVersionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_accountId, arg_containerId,
              includeDeleted: arg_includeDeleted,
              headers: arg_headers,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListContainerVersionsResponse(response);
      })));
    });

    unittest.test("method--publish", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
      var arg_fingerprint = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/versions/"));
        pathOffset += 10;
        index = path.indexOf("/publish", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/publish"));
        pathOffset += 8;

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
            queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildPublishContainerVersionResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .publish(arg_accountId, arg_containerId, arg_containerVersionId,
              fingerprint: arg_fingerprint, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPublishContainerVersionResponse(response);
      })));
    });

    unittest.test("method--restore", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/versions/"));
        pathOffset += 10;
        index = path.indexOf("/restore", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/restore"));
        pathOffset += 8;

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
        var resp = convert.json.encode(buildContainerVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .restore(arg_accountId, arg_containerId, arg_containerVersionId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContainerVersion(response);
      })));
    });

    unittest.test("method--undelete", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/versions/"));
        pathOffset += 10;
        index = path.indexOf("/undelete", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/undelete"));
        pathOffset += 9;

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
        var resp = convert.json.encode(buildContainerVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .undelete(arg_accountId, arg_containerId, arg_containerVersionId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContainerVersion(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_request = buildContainerVersion();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
      var arg_fingerprint = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ContainerVersion.fromJson(json);
        checkContainerVersion(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/versions/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));

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
            queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildContainerVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_accountId, arg_containerId,
              arg_containerVersionId,
              fingerprint: arg_fingerprint, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContainerVersion(response);
      })));
    });
  });

  unittest.group("resource-AccountsPermissionsResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.permissions;
      var arg_request = buildUserAccess();
      var arg_accountId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.UserAccess.fromJson(json);
        checkUserAccess(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/permissions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/permissions"));
        pathOffset += 12;

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
        var resp = convert.json.encode(buildUserAccess());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_accountId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserAccess(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.permissions;
      var arg_accountId = "foo";
      var arg_permissionId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/permissions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("/permissions/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_permissionId"));

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
          .delete(arg_accountId, arg_permissionId, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.permissions;
      var arg_accountId = "foo";
      var arg_permissionId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/permissions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("/permissions/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_permissionId"));

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
        var resp = convert.json.encode(buildUserAccess());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_accountId, arg_permissionId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserAccess(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.permissions;
      var arg_accountId = "foo";
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
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/permissions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/permissions"));
        pathOffset += 12;

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
        var resp = convert.json.encode(buildListAccountUsersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_accountId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListAccountUsersResponse(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res =
          new api.TagmanagerApi(mock).accounts.permissions;
      var arg_request = buildUserAccess();
      var arg_accountId = "foo";
      var arg_permissionId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.UserAccess.fromJson(json);
        checkUserAccess(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("tagmanager/v1/accounts/"));
        pathOffset += 23;
        index = path.indexOf("/permissions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("/permissions/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_permissionId"));

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
        var resp = convert.json.encode(buildUserAccess());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_accountId, arg_permissionId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserAccess(response);
      })));
    });
  });
}
