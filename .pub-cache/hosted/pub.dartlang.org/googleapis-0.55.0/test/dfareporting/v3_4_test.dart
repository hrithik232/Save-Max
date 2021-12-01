library googleapis.dfareporting.v3_4.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/dfareporting/v3_4.dart' as api;

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

buildUnnamed5043() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5043(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5044() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5044(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAccount = 0;
buildAccount() {
  var o = new api.Account();
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    o.accountPermissionIds = buildUnnamed5043();
    o.accountProfile = "foo";
    o.active = true;
    o.activeAdsLimitTier = "foo";
    o.activeViewOptOut = true;
    o.availablePermissionIds = buildUnnamed5044();
    o.countryId = "foo";
    o.currencyId = "foo";
    o.defaultCreativeSizeId = "foo";
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.locale = "foo";
    o.maximumImageSize = "foo";
    o.name = "foo";
    o.nielsenOcrEnabled = true;
    o.reportsConfiguration = buildReportsConfiguration();
    o.shareReportsWithTwitter = true;
    o.teaserSizeLimit = "foo";
  }
  buildCounterAccount--;
  return o;
}

checkAccount(api.Account o) {
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    checkUnnamed5043(o.accountPermissionIds);
    unittest.expect(o.accountProfile, unittest.equals('foo'));
    unittest.expect(o.active, unittest.isTrue);
    unittest.expect(o.activeAdsLimitTier, unittest.equals('foo'));
    unittest.expect(o.activeViewOptOut, unittest.isTrue);
    checkUnnamed5044(o.availablePermissionIds);
    unittest.expect(o.countryId, unittest.equals('foo'));
    unittest.expect(o.currencyId, unittest.equals('foo'));
    unittest.expect(o.defaultCreativeSizeId, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.locale, unittest.equals('foo'));
    unittest.expect(o.maximumImageSize, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.nielsenOcrEnabled, unittest.isTrue);
    checkReportsConfiguration(o.reportsConfiguration);
    unittest.expect(o.shareReportsWithTwitter, unittest.isTrue);
    unittest.expect(o.teaserSizeLimit, unittest.equals('foo'));
  }
  buildCounterAccount--;
}

core.int buildCounterAccountActiveAdSummary = 0;
buildAccountActiveAdSummary() {
  var o = new api.AccountActiveAdSummary();
  buildCounterAccountActiveAdSummary++;
  if (buildCounterAccountActiveAdSummary < 3) {
    o.accountId = "foo";
    o.activeAds = "foo";
    o.activeAdsLimitTier = "foo";
    o.availableAds = "foo";
    o.kind = "foo";
  }
  buildCounterAccountActiveAdSummary--;
  return o;
}

checkAccountActiveAdSummary(api.AccountActiveAdSummary o) {
  buildCounterAccountActiveAdSummary++;
  if (buildCounterAccountActiveAdSummary < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.activeAds, unittest.equals('foo'));
    unittest.expect(o.activeAdsLimitTier, unittest.equals('foo'));
    unittest.expect(o.availableAds, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterAccountActiveAdSummary--;
}

buildUnnamed5045() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5045(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAccountPermission = 0;
buildAccountPermission() {
  var o = new api.AccountPermission();
  buildCounterAccountPermission++;
  if (buildCounterAccountPermission < 3) {
    o.accountProfiles = buildUnnamed5045();
    o.id = "foo";
    o.kind = "foo";
    o.level = "foo";
    o.name = "foo";
    o.permissionGroupId = "foo";
  }
  buildCounterAccountPermission--;
  return o;
}

checkAccountPermission(api.AccountPermission o) {
  buildCounterAccountPermission++;
  if (buildCounterAccountPermission < 3) {
    checkUnnamed5045(o.accountProfiles);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.level, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.permissionGroupId, unittest.equals('foo'));
  }
  buildCounterAccountPermission--;
}

core.int buildCounterAccountPermissionGroup = 0;
buildAccountPermissionGroup() {
  var o = new api.AccountPermissionGroup();
  buildCounterAccountPermissionGroup++;
  if (buildCounterAccountPermissionGroup < 3) {
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterAccountPermissionGroup--;
  return o;
}

checkAccountPermissionGroup(api.AccountPermissionGroup o) {
  buildCounterAccountPermissionGroup++;
  if (buildCounterAccountPermissionGroup < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterAccountPermissionGroup--;
}

buildUnnamed5046() {
  var o = new core.List<api.AccountPermissionGroup>();
  o.add(buildAccountPermissionGroup());
  o.add(buildAccountPermissionGroup());
  return o;
}

checkUnnamed5046(core.List<api.AccountPermissionGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccountPermissionGroup(o[0]);
  checkAccountPermissionGroup(o[1]);
}

core.int buildCounterAccountPermissionGroupsListResponse = 0;
buildAccountPermissionGroupsListResponse() {
  var o = new api.AccountPermissionGroupsListResponse();
  buildCounterAccountPermissionGroupsListResponse++;
  if (buildCounterAccountPermissionGroupsListResponse < 3) {
    o.accountPermissionGroups = buildUnnamed5046();
    o.kind = "foo";
  }
  buildCounterAccountPermissionGroupsListResponse--;
  return o;
}

checkAccountPermissionGroupsListResponse(
    api.AccountPermissionGroupsListResponse o) {
  buildCounterAccountPermissionGroupsListResponse++;
  if (buildCounterAccountPermissionGroupsListResponse < 3) {
    checkUnnamed5046(o.accountPermissionGroups);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterAccountPermissionGroupsListResponse--;
}

buildUnnamed5047() {
  var o = new core.List<api.AccountPermission>();
  o.add(buildAccountPermission());
  o.add(buildAccountPermission());
  return o;
}

checkUnnamed5047(core.List<api.AccountPermission> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccountPermission(o[0]);
  checkAccountPermission(o[1]);
}

core.int buildCounterAccountPermissionsListResponse = 0;
buildAccountPermissionsListResponse() {
  var o = new api.AccountPermissionsListResponse();
  buildCounterAccountPermissionsListResponse++;
  if (buildCounterAccountPermissionsListResponse < 3) {
    o.accountPermissions = buildUnnamed5047();
    o.kind = "foo";
  }
  buildCounterAccountPermissionsListResponse--;
  return o;
}

checkAccountPermissionsListResponse(api.AccountPermissionsListResponse o) {
  buildCounterAccountPermissionsListResponse++;
  if (buildCounterAccountPermissionsListResponse < 3) {
    checkUnnamed5047(o.accountPermissions);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterAccountPermissionsListResponse--;
}

core.int buildCounterAccountUserProfile = 0;
buildAccountUserProfile() {
  var o = new api.AccountUserProfile();
  buildCounterAccountUserProfile++;
  if (buildCounterAccountUserProfile < 3) {
    o.accountId = "foo";
    o.active = true;
    o.advertiserFilter = buildObjectFilter();
    o.campaignFilter = buildObjectFilter();
    o.comments = "foo";
    o.email = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.locale = "foo";
    o.name = "foo";
    o.siteFilter = buildObjectFilter();
    o.subaccountId = "foo";
    o.traffickerType = "foo";
    o.userAccessType = "foo";
    o.userRoleFilter = buildObjectFilter();
    o.userRoleId = "foo";
  }
  buildCounterAccountUserProfile--;
  return o;
}

checkAccountUserProfile(api.AccountUserProfile o) {
  buildCounterAccountUserProfile++;
  if (buildCounterAccountUserProfile < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.active, unittest.isTrue);
    checkObjectFilter(o.advertiserFilter);
    checkObjectFilter(o.campaignFilter);
    unittest.expect(o.comments, unittest.equals('foo'));
    unittest.expect(o.email, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.locale, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkObjectFilter(o.siteFilter);
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.traffickerType, unittest.equals('foo'));
    unittest.expect(o.userAccessType, unittest.equals('foo'));
    checkObjectFilter(o.userRoleFilter);
    unittest.expect(o.userRoleId, unittest.equals('foo'));
  }
  buildCounterAccountUserProfile--;
}

buildUnnamed5048() {
  var o = new core.List<api.AccountUserProfile>();
  o.add(buildAccountUserProfile());
  o.add(buildAccountUserProfile());
  return o;
}

checkUnnamed5048(core.List<api.AccountUserProfile> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccountUserProfile(o[0]);
  checkAccountUserProfile(o[1]);
}

core.int buildCounterAccountUserProfilesListResponse = 0;
buildAccountUserProfilesListResponse() {
  var o = new api.AccountUserProfilesListResponse();
  buildCounterAccountUserProfilesListResponse++;
  if (buildCounterAccountUserProfilesListResponse < 3) {
    o.accountUserProfiles = buildUnnamed5048();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterAccountUserProfilesListResponse--;
  return o;
}

checkAccountUserProfilesListResponse(api.AccountUserProfilesListResponse o) {
  buildCounterAccountUserProfilesListResponse++;
  if (buildCounterAccountUserProfilesListResponse < 3) {
    checkUnnamed5048(o.accountUserProfiles);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterAccountUserProfilesListResponse--;
}

buildUnnamed5049() {
  var o = new core.List<api.Account>();
  o.add(buildAccount());
  o.add(buildAccount());
  return o;
}

checkUnnamed5049(core.List<api.Account> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccount(o[0]);
  checkAccount(o[1]);
}

core.int buildCounterAccountsListResponse = 0;
buildAccountsListResponse() {
  var o = new api.AccountsListResponse();
  buildCounterAccountsListResponse++;
  if (buildCounterAccountsListResponse < 3) {
    o.accounts = buildUnnamed5049();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterAccountsListResponse--;
  return o;
}

checkAccountsListResponse(api.AccountsListResponse o) {
  buildCounterAccountsListResponse++;
  if (buildCounterAccountsListResponse < 3) {
    checkUnnamed5049(o.accounts);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterAccountsListResponse--;
}

buildUnnamed5050() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5050(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

buildUnnamed5051() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5051(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterActivities = 0;
buildActivities() {
  var o = new api.Activities();
  buildCounterActivities++;
  if (buildCounterActivities < 3) {
    o.filters = buildUnnamed5050();
    o.kind = "foo";
    o.metricNames = buildUnnamed5051();
  }
  buildCounterActivities--;
  return o;
}

checkActivities(api.Activities o) {
  buildCounterActivities++;
  if (buildCounterActivities < 3) {
    checkUnnamed5050(o.filters);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5051(o.metricNames);
  }
  buildCounterActivities--;
}

buildUnnamed5052() {
  var o = new core.List<api.CreativeGroupAssignment>();
  o.add(buildCreativeGroupAssignment());
  o.add(buildCreativeGroupAssignment());
  return o;
}

checkUnnamed5052(core.List<api.CreativeGroupAssignment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeGroupAssignment(o[0]);
  checkCreativeGroupAssignment(o[1]);
}

buildUnnamed5053() {
  var o = new core.List<api.EventTagOverride>();
  o.add(buildEventTagOverride());
  o.add(buildEventTagOverride());
  return o;
}

checkUnnamed5053(core.List<api.EventTagOverride> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEventTagOverride(o[0]);
  checkEventTagOverride(o[1]);
}

buildUnnamed5054() {
  var o = new core.List<api.PlacementAssignment>();
  o.add(buildPlacementAssignment());
  o.add(buildPlacementAssignment());
  return o;
}

checkUnnamed5054(core.List<api.PlacementAssignment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPlacementAssignment(o[0]);
  checkPlacementAssignment(o[1]);
}

core.int buildCounterAd = 0;
buildAd() {
  var o = new api.Ad();
  buildCounterAd++;
  if (buildCounterAd < 3) {
    o.accountId = "foo";
    o.active = true;
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.archived = true;
    o.audienceSegmentId = "foo";
    o.campaignId = "foo";
    o.campaignIdDimensionValue = buildDimensionValue();
    o.clickThroughUrl = buildClickThroughUrl();
    o.clickThroughUrlSuffixProperties = buildClickThroughUrlSuffixProperties();
    o.comments = "foo";
    o.compatibility = "foo";
    o.createInfo = buildLastModifiedInfo();
    o.creativeGroupAssignments = buildUnnamed5052();
    o.creativeRotation = buildCreativeRotation();
    o.dayPartTargeting = buildDayPartTargeting();
    o.defaultClickThroughEventTagProperties =
        buildDefaultClickThroughEventTagProperties();
    o.deliverySchedule = buildDeliverySchedule();
    o.dynamicClickTracker = true;
    o.endTime = core.DateTime.parse("2002-02-27T14:01:02");
    o.eventTagOverrides = buildUnnamed5053();
    o.geoTargeting = buildGeoTargeting();
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.keyValueTargetingExpression = buildKeyValueTargetingExpression();
    o.kind = "foo";
    o.languageTargeting = buildLanguageTargeting();
    o.lastModifiedInfo = buildLastModifiedInfo();
    o.name = "foo";
    o.placementAssignments = buildUnnamed5054();
    o.remarketingListExpression = buildListTargetingExpression();
    o.size = buildSize();
    o.sslCompliant = true;
    o.sslRequired = true;
    o.startTime = core.DateTime.parse("2002-02-27T14:01:02");
    o.subaccountId = "foo";
    o.targetingTemplateId = "foo";
    o.technologyTargeting = buildTechnologyTargeting();
    o.type = "foo";
  }
  buildCounterAd--;
  return o;
}

checkAd(api.Ad o) {
  buildCounterAd++;
  if (buildCounterAd < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.active, unittest.isTrue);
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.archived, unittest.isTrue);
    unittest.expect(o.audienceSegmentId, unittest.equals('foo'));
    unittest.expect(o.campaignId, unittest.equals('foo'));
    checkDimensionValue(o.campaignIdDimensionValue);
    checkClickThroughUrl(o.clickThroughUrl);
    checkClickThroughUrlSuffixProperties(o.clickThroughUrlSuffixProperties);
    unittest.expect(o.comments, unittest.equals('foo'));
    unittest.expect(o.compatibility, unittest.equals('foo'));
    checkLastModifiedInfo(o.createInfo);
    checkUnnamed5052(o.creativeGroupAssignments);
    checkCreativeRotation(o.creativeRotation);
    checkDayPartTargeting(o.dayPartTargeting);
    checkDefaultClickThroughEventTagProperties(
        o.defaultClickThroughEventTagProperties);
    checkDeliverySchedule(o.deliverySchedule);
    unittest.expect(o.dynamicClickTracker, unittest.isTrue);
    unittest.expect(
        o.endTime, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    checkUnnamed5053(o.eventTagOverrides);
    checkGeoTargeting(o.geoTargeting);
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    checkKeyValueTargetingExpression(o.keyValueTargetingExpression);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLanguageTargeting(o.languageTargeting);
    checkLastModifiedInfo(o.lastModifiedInfo);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed5054(o.placementAssignments);
    checkListTargetingExpression(o.remarketingListExpression);
    checkSize(o.size);
    unittest.expect(o.sslCompliant, unittest.isTrue);
    unittest.expect(o.sslRequired, unittest.isTrue);
    unittest.expect(o.startTime,
        unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.targetingTemplateId, unittest.equals('foo'));
    checkTechnologyTargeting(o.technologyTargeting);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterAd--;
}

core.int buildCounterAdBlockingConfiguration = 0;
buildAdBlockingConfiguration() {
  var o = new api.AdBlockingConfiguration();
  buildCounterAdBlockingConfiguration++;
  if (buildCounterAdBlockingConfiguration < 3) {
    o.clickThroughUrl = "foo";
    o.creativeBundleId = "foo";
    o.enabled = true;
    o.overrideClickThroughUrl = true;
  }
  buildCounterAdBlockingConfiguration--;
  return o;
}

checkAdBlockingConfiguration(api.AdBlockingConfiguration o) {
  buildCounterAdBlockingConfiguration++;
  if (buildCounterAdBlockingConfiguration < 3) {
    unittest.expect(o.clickThroughUrl, unittest.equals('foo'));
    unittest.expect(o.creativeBundleId, unittest.equals('foo'));
    unittest.expect(o.enabled, unittest.isTrue);
    unittest.expect(o.overrideClickThroughUrl, unittest.isTrue);
  }
  buildCounterAdBlockingConfiguration--;
}

core.int buildCounterAdSlot = 0;
buildAdSlot() {
  var o = new api.AdSlot();
  buildCounterAdSlot++;
  if (buildCounterAdSlot < 3) {
    o.comment = "foo";
    o.compatibility = "foo";
    o.height = "foo";
    o.linkedPlacementId = "foo";
    o.name = "foo";
    o.paymentSourceType = "foo";
    o.primary = true;
    o.width = "foo";
  }
  buildCounterAdSlot--;
  return o;
}

checkAdSlot(api.AdSlot o) {
  buildCounterAdSlot++;
  if (buildCounterAdSlot < 3) {
    unittest.expect(o.comment, unittest.equals('foo'));
    unittest.expect(o.compatibility, unittest.equals('foo'));
    unittest.expect(o.height, unittest.equals('foo'));
    unittest.expect(o.linkedPlacementId, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.paymentSourceType, unittest.equals('foo'));
    unittest.expect(o.primary, unittest.isTrue);
    unittest.expect(o.width, unittest.equals('foo'));
  }
  buildCounterAdSlot--;
}

buildUnnamed5055() {
  var o = new core.List<api.Ad>();
  o.add(buildAd());
  o.add(buildAd());
  return o;
}

checkUnnamed5055(core.List<api.Ad> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAd(o[0]);
  checkAd(o[1]);
}

core.int buildCounterAdsListResponse = 0;
buildAdsListResponse() {
  var o = new api.AdsListResponse();
  buildCounterAdsListResponse++;
  if (buildCounterAdsListResponse < 3) {
    o.ads = buildUnnamed5055();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterAdsListResponse--;
  return o;
}

checkAdsListResponse(api.AdsListResponse o) {
  buildCounterAdsListResponse++;
  if (buildCounterAdsListResponse < 3) {
    checkUnnamed5055(o.ads);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterAdsListResponse--;
}

core.int buildCounterAdvertiser = 0;
buildAdvertiser() {
  var o = new api.Advertiser();
  buildCounterAdvertiser++;
  if (buildCounterAdvertiser < 3) {
    o.accountId = "foo";
    o.advertiserGroupId = "foo";
    o.clickThroughUrlSuffix = "foo";
    o.defaultClickThroughEventTagId = "foo";
    o.defaultEmail = "foo";
    o.floodlightConfigurationId = "foo";
    o.floodlightConfigurationIdDimensionValue = buildDimensionValue();
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.kind = "foo";
    o.name = "foo";
    o.originalFloodlightConfigurationId = "foo";
    o.status = "foo";
    o.subaccountId = "foo";
    o.suspended = true;
  }
  buildCounterAdvertiser--;
  return o;
}

checkAdvertiser(api.Advertiser o) {
  buildCounterAdvertiser++;
  if (buildCounterAdvertiser < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserGroupId, unittest.equals('foo'));
    unittest.expect(o.clickThroughUrlSuffix, unittest.equals('foo'));
    unittest.expect(o.defaultClickThroughEventTagId, unittest.equals('foo'));
    unittest.expect(o.defaultEmail, unittest.equals('foo'));
    unittest.expect(o.floodlightConfigurationId, unittest.equals('foo'));
    checkDimensionValue(o.floodlightConfigurationIdDimensionValue);
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(
        o.originalFloodlightConfigurationId, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.suspended, unittest.isTrue);
  }
  buildCounterAdvertiser--;
}

core.int buildCounterAdvertiserGroup = 0;
buildAdvertiserGroup() {
  var o = new api.AdvertiserGroup();
  buildCounterAdvertiserGroup++;
  if (buildCounterAdvertiserGroup < 3) {
    o.accountId = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterAdvertiserGroup--;
  return o;
}

checkAdvertiserGroup(api.AdvertiserGroup o) {
  buildCounterAdvertiserGroup++;
  if (buildCounterAdvertiserGroup < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterAdvertiserGroup--;
}

buildUnnamed5056() {
  var o = new core.List<api.AdvertiserGroup>();
  o.add(buildAdvertiserGroup());
  o.add(buildAdvertiserGroup());
  return o;
}

checkUnnamed5056(core.List<api.AdvertiserGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAdvertiserGroup(o[0]);
  checkAdvertiserGroup(o[1]);
}

core.int buildCounterAdvertiserGroupsListResponse = 0;
buildAdvertiserGroupsListResponse() {
  var o = new api.AdvertiserGroupsListResponse();
  buildCounterAdvertiserGroupsListResponse++;
  if (buildCounterAdvertiserGroupsListResponse < 3) {
    o.advertiserGroups = buildUnnamed5056();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterAdvertiserGroupsListResponse--;
  return o;
}

checkAdvertiserGroupsListResponse(api.AdvertiserGroupsListResponse o) {
  buildCounterAdvertiserGroupsListResponse++;
  if (buildCounterAdvertiserGroupsListResponse < 3) {
    checkUnnamed5056(o.advertiserGroups);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterAdvertiserGroupsListResponse--;
}

buildUnnamed5057() {
  var o = new core.List<api.LandingPage>();
  o.add(buildLandingPage());
  o.add(buildLandingPage());
  return o;
}

checkUnnamed5057(core.List<api.LandingPage> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLandingPage(o[0]);
  checkLandingPage(o[1]);
}

core.int buildCounterAdvertiserLandingPagesListResponse = 0;
buildAdvertiserLandingPagesListResponse() {
  var o = new api.AdvertiserLandingPagesListResponse();
  buildCounterAdvertiserLandingPagesListResponse++;
  if (buildCounterAdvertiserLandingPagesListResponse < 3) {
    o.kind = "foo";
    o.landingPages = buildUnnamed5057();
    o.nextPageToken = "foo";
  }
  buildCounterAdvertiserLandingPagesListResponse--;
  return o;
}

checkAdvertiserLandingPagesListResponse(
    api.AdvertiserLandingPagesListResponse o) {
  buildCounterAdvertiserLandingPagesListResponse++;
  if (buildCounterAdvertiserLandingPagesListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5057(o.landingPages);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterAdvertiserLandingPagesListResponse--;
}

buildUnnamed5058() {
  var o = new core.List<api.Advertiser>();
  o.add(buildAdvertiser());
  o.add(buildAdvertiser());
  return o;
}

checkUnnamed5058(core.List<api.Advertiser> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAdvertiser(o[0]);
  checkAdvertiser(o[1]);
}

core.int buildCounterAdvertisersListResponse = 0;
buildAdvertisersListResponse() {
  var o = new api.AdvertisersListResponse();
  buildCounterAdvertisersListResponse++;
  if (buildCounterAdvertisersListResponse < 3) {
    o.advertisers = buildUnnamed5058();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterAdvertisersListResponse--;
  return o;
}

checkAdvertisersListResponse(api.AdvertisersListResponse o) {
  buildCounterAdvertisersListResponse++;
  if (buildCounterAdvertisersListResponse < 3) {
    checkUnnamed5058(o.advertisers);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterAdvertisersListResponse--;
}

core.int buildCounterAudienceSegment = 0;
buildAudienceSegment() {
  var o = new api.AudienceSegment();
  buildCounterAudienceSegment++;
  if (buildCounterAudienceSegment < 3) {
    o.allocation = 42;
    o.id = "foo";
    o.name = "foo";
  }
  buildCounterAudienceSegment--;
  return o;
}

checkAudienceSegment(api.AudienceSegment o) {
  buildCounterAudienceSegment++;
  if (buildCounterAudienceSegment < 3) {
    unittest.expect(o.allocation, unittest.equals(42));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterAudienceSegment--;
}

buildUnnamed5059() {
  var o = new core.List<api.AudienceSegment>();
  o.add(buildAudienceSegment());
  o.add(buildAudienceSegment());
  return o;
}

checkUnnamed5059(core.List<api.AudienceSegment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAudienceSegment(o[0]);
  checkAudienceSegment(o[1]);
}

core.int buildCounterAudienceSegmentGroup = 0;
buildAudienceSegmentGroup() {
  var o = new api.AudienceSegmentGroup();
  buildCounterAudienceSegmentGroup++;
  if (buildCounterAudienceSegmentGroup < 3) {
    o.audienceSegments = buildUnnamed5059();
    o.id = "foo";
    o.name = "foo";
  }
  buildCounterAudienceSegmentGroup--;
  return o;
}

checkAudienceSegmentGroup(api.AudienceSegmentGroup o) {
  buildCounterAudienceSegmentGroup++;
  if (buildCounterAudienceSegmentGroup < 3) {
    checkUnnamed5059(o.audienceSegments);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterAudienceSegmentGroup--;
}

core.int buildCounterBrowser = 0;
buildBrowser() {
  var o = new api.Browser();
  buildCounterBrowser++;
  if (buildCounterBrowser < 3) {
    o.browserVersionId = "foo";
    o.dartId = "foo";
    o.kind = "foo";
    o.majorVersion = "foo";
    o.minorVersion = "foo";
    o.name = "foo";
  }
  buildCounterBrowser--;
  return o;
}

checkBrowser(api.Browser o) {
  buildCounterBrowser++;
  if (buildCounterBrowser < 3) {
    unittest.expect(o.browserVersionId, unittest.equals('foo'));
    unittest.expect(o.dartId, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.majorVersion, unittest.equals('foo'));
    unittest.expect(o.minorVersion, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterBrowser--;
}

buildUnnamed5060() {
  var o = new core.List<api.Browser>();
  o.add(buildBrowser());
  o.add(buildBrowser());
  return o;
}

checkUnnamed5060(core.List<api.Browser> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBrowser(o[0]);
  checkBrowser(o[1]);
}

core.int buildCounterBrowsersListResponse = 0;
buildBrowsersListResponse() {
  var o = new api.BrowsersListResponse();
  buildCounterBrowsersListResponse++;
  if (buildCounterBrowsersListResponse < 3) {
    o.browsers = buildUnnamed5060();
    o.kind = "foo";
  }
  buildCounterBrowsersListResponse--;
  return o;
}

checkBrowsersListResponse(api.BrowsersListResponse o) {
  buildCounterBrowsersListResponse++;
  if (buildCounterBrowsersListResponse < 3) {
    checkUnnamed5060(o.browsers);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterBrowsersListResponse--;
}

buildUnnamed5061() {
  var o = new core.List<api.CreativeOptimizationConfiguration>();
  o.add(buildCreativeOptimizationConfiguration());
  o.add(buildCreativeOptimizationConfiguration());
  return o;
}

checkUnnamed5061(core.List<api.CreativeOptimizationConfiguration> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeOptimizationConfiguration(o[0]);
  checkCreativeOptimizationConfiguration(o[1]);
}

buildUnnamed5062() {
  var o = new core.List<api.AudienceSegmentGroup>();
  o.add(buildAudienceSegmentGroup());
  o.add(buildAudienceSegmentGroup());
  return o;
}

checkUnnamed5062(core.List<api.AudienceSegmentGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAudienceSegmentGroup(o[0]);
  checkAudienceSegmentGroup(o[1]);
}

buildUnnamed5063() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5063(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5064() {
  var o = new core.List<api.EventTagOverride>();
  o.add(buildEventTagOverride());
  o.add(buildEventTagOverride());
  return o;
}

checkUnnamed5064(core.List<api.EventTagOverride> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEventTagOverride(o[0]);
  checkEventTagOverride(o[1]);
}

buildUnnamed5065() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5065(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterCampaign = 0;
buildCampaign() {
  var o = new api.Campaign();
  buildCounterCampaign++;
  if (buildCounterCampaign < 3) {
    o.accountId = "foo";
    o.adBlockingConfiguration = buildAdBlockingConfiguration();
    o.additionalCreativeOptimizationConfigurations = buildUnnamed5061();
    o.advertiserGroupId = "foo";
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.archived = true;
    o.audienceSegmentGroups = buildUnnamed5062();
    o.billingInvoiceCode = "foo";
    o.clickThroughUrlSuffixProperties = buildClickThroughUrlSuffixProperties();
    o.comment = "foo";
    o.createInfo = buildLastModifiedInfo();
    o.creativeGroupIds = buildUnnamed5063();
    o.creativeOptimizationConfiguration =
        buildCreativeOptimizationConfiguration();
    o.defaultClickThroughEventTagProperties =
        buildDefaultClickThroughEventTagProperties();
    o.defaultLandingPageId = "foo";
    o.endDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.eventTagOverrides = buildUnnamed5064();
    o.externalId = "foo";
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.kind = "foo";
    o.lastModifiedInfo = buildLastModifiedInfo();
    o.name = "foo";
    o.nielsenOcrEnabled = true;
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.subaccountId = "foo";
    o.traffickerEmails = buildUnnamed5065();
  }
  buildCounterCampaign--;
  return o;
}

checkCampaign(api.Campaign o) {
  buildCounterCampaign++;
  if (buildCounterCampaign < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkAdBlockingConfiguration(o.adBlockingConfiguration);
    checkUnnamed5061(o.additionalCreativeOptimizationConfigurations);
    unittest.expect(o.advertiserGroupId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.archived, unittest.isTrue);
    checkUnnamed5062(o.audienceSegmentGroups);
    unittest.expect(o.billingInvoiceCode, unittest.equals('foo'));
    checkClickThroughUrlSuffixProperties(o.clickThroughUrlSuffixProperties);
    unittest.expect(o.comment, unittest.equals('foo'));
    checkLastModifiedInfo(o.createInfo);
    checkUnnamed5063(o.creativeGroupIds);
    checkCreativeOptimizationConfiguration(o.creativeOptimizationConfiguration);
    checkDefaultClickThroughEventTagProperties(
        o.defaultClickThroughEventTagProperties);
    unittest.expect(o.defaultLandingPageId, unittest.equals('foo'));
    unittest.expect(
        o.endDate, unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    checkUnnamed5064(o.eventTagOverrides);
    unittest.expect(o.externalId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLastModifiedInfo(o.lastModifiedInfo);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.nielsenOcrEnabled, unittest.isTrue);
    unittest.expect(o.startDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    checkUnnamed5065(o.traffickerEmails);
  }
  buildCounterCampaign--;
}

core.int buildCounterCampaignCreativeAssociation = 0;
buildCampaignCreativeAssociation() {
  var o = new api.CampaignCreativeAssociation();
  buildCounterCampaignCreativeAssociation++;
  if (buildCounterCampaignCreativeAssociation < 3) {
    o.creativeId = "foo";
    o.kind = "foo";
  }
  buildCounterCampaignCreativeAssociation--;
  return o;
}

checkCampaignCreativeAssociation(api.CampaignCreativeAssociation o) {
  buildCounterCampaignCreativeAssociation++;
  if (buildCounterCampaignCreativeAssociation < 3) {
    unittest.expect(o.creativeId, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterCampaignCreativeAssociation--;
}

buildUnnamed5066() {
  var o = new core.List<api.CampaignCreativeAssociation>();
  o.add(buildCampaignCreativeAssociation());
  o.add(buildCampaignCreativeAssociation());
  return o;
}

checkUnnamed5066(core.List<api.CampaignCreativeAssociation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCampaignCreativeAssociation(o[0]);
  checkCampaignCreativeAssociation(o[1]);
}

core.int buildCounterCampaignCreativeAssociationsListResponse = 0;
buildCampaignCreativeAssociationsListResponse() {
  var o = new api.CampaignCreativeAssociationsListResponse();
  buildCounterCampaignCreativeAssociationsListResponse++;
  if (buildCounterCampaignCreativeAssociationsListResponse < 3) {
    o.campaignCreativeAssociations = buildUnnamed5066();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterCampaignCreativeAssociationsListResponse--;
  return o;
}

checkCampaignCreativeAssociationsListResponse(
    api.CampaignCreativeAssociationsListResponse o) {
  buildCounterCampaignCreativeAssociationsListResponse++;
  if (buildCounterCampaignCreativeAssociationsListResponse < 3) {
    checkUnnamed5066(o.campaignCreativeAssociations);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterCampaignCreativeAssociationsListResponse--;
}

core.int buildCounterCampaignManagerIds = 0;
buildCampaignManagerIds() {
  var o = new api.CampaignManagerIds();
  buildCounterCampaignManagerIds++;
  if (buildCounterCampaignManagerIds < 3) {
    o.adId = "foo";
    o.campaignId = "foo";
    o.creativeId = "foo";
    o.kind = "foo";
    o.placementId = "foo";
    o.siteId = "foo";
  }
  buildCounterCampaignManagerIds--;
  return o;
}

checkCampaignManagerIds(api.CampaignManagerIds o) {
  buildCounterCampaignManagerIds++;
  if (buildCounterCampaignManagerIds < 3) {
    unittest.expect(o.adId, unittest.equals('foo'));
    unittest.expect(o.campaignId, unittest.equals('foo'));
    unittest.expect(o.creativeId, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.placementId, unittest.equals('foo'));
    unittest.expect(o.siteId, unittest.equals('foo'));
  }
  buildCounterCampaignManagerIds--;
}

buildUnnamed5067() {
  var o = new core.List<api.Campaign>();
  o.add(buildCampaign());
  o.add(buildCampaign());
  return o;
}

checkUnnamed5067(core.List<api.Campaign> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCampaign(o[0]);
  checkCampaign(o[1]);
}

core.int buildCounterCampaignsListResponse = 0;
buildCampaignsListResponse() {
  var o = new api.CampaignsListResponse();
  buildCounterCampaignsListResponse++;
  if (buildCounterCampaignsListResponse < 3) {
    o.campaigns = buildUnnamed5067();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterCampaignsListResponse--;
  return o;
}

checkCampaignsListResponse(api.CampaignsListResponse o) {
  buildCounterCampaignsListResponse++;
  if (buildCounterCampaignsListResponse < 3) {
    checkUnnamed5067(o.campaigns);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterCampaignsListResponse--;
}

core.int buildCounterChangeLog = 0;
buildChangeLog() {
  var o = new api.ChangeLog();
  buildCounterChangeLog++;
  if (buildCounterChangeLog < 3) {
    o.accountId = "foo";
    o.action = "foo";
    o.changeTime = core.DateTime.parse("2002-02-27T14:01:02");
    o.fieldName = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.newValue = "foo";
    o.objectId = "foo";
    o.objectType = "foo";
    o.oldValue = "foo";
    o.subaccountId = "foo";
    o.transactionId = "foo";
    o.userProfileId = "foo";
    o.userProfileName = "foo";
  }
  buildCounterChangeLog--;
  return o;
}

checkChangeLog(api.ChangeLog o) {
  buildCounterChangeLog++;
  if (buildCounterChangeLog < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.action, unittest.equals('foo'));
    unittest.expect(o.changeTime,
        unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.fieldName, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.newValue, unittest.equals('foo'));
    unittest.expect(o.objectId, unittest.equals('foo'));
    unittest.expect(o.objectType, unittest.equals('foo'));
    unittest.expect(o.oldValue, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.transactionId, unittest.equals('foo'));
    unittest.expect(o.userProfileId, unittest.equals('foo'));
    unittest.expect(o.userProfileName, unittest.equals('foo'));
  }
  buildCounterChangeLog--;
}

buildUnnamed5068() {
  var o = new core.List<api.ChangeLog>();
  o.add(buildChangeLog());
  o.add(buildChangeLog());
  return o;
}

checkUnnamed5068(core.List<api.ChangeLog> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkChangeLog(o[0]);
  checkChangeLog(o[1]);
}

core.int buildCounterChangeLogsListResponse = 0;
buildChangeLogsListResponse() {
  var o = new api.ChangeLogsListResponse();
  buildCounterChangeLogsListResponse++;
  if (buildCounterChangeLogsListResponse < 3) {
    o.changeLogs = buildUnnamed5068();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterChangeLogsListResponse--;
  return o;
}

checkChangeLogsListResponse(api.ChangeLogsListResponse o) {
  buildCounterChangeLogsListResponse++;
  if (buildCounterChangeLogsListResponse < 3) {
    checkUnnamed5068(o.changeLogs);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterChangeLogsListResponse--;
}

buildUnnamed5069() {
  var o = new core.List<api.City>();
  o.add(buildCity());
  o.add(buildCity());
  return o;
}

checkUnnamed5069(core.List<api.City> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCity(o[0]);
  checkCity(o[1]);
}

core.int buildCounterCitiesListResponse = 0;
buildCitiesListResponse() {
  var o = new api.CitiesListResponse();
  buildCounterCitiesListResponse++;
  if (buildCounterCitiesListResponse < 3) {
    o.cities = buildUnnamed5069();
    o.kind = "foo";
  }
  buildCounterCitiesListResponse--;
  return o;
}

checkCitiesListResponse(api.CitiesListResponse o) {
  buildCounterCitiesListResponse++;
  if (buildCounterCitiesListResponse < 3) {
    checkUnnamed5069(o.cities);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterCitiesListResponse--;
}

core.int buildCounterCity = 0;
buildCity() {
  var o = new api.City();
  buildCounterCity++;
  if (buildCounterCity < 3) {
    o.countryCode = "foo";
    o.countryDartId = "foo";
    o.dartId = "foo";
    o.kind = "foo";
    o.metroCode = "foo";
    o.metroDmaId = "foo";
    o.name = "foo";
    o.regionCode = "foo";
    o.regionDartId = "foo";
  }
  buildCounterCity--;
  return o;
}

checkCity(api.City o) {
  buildCounterCity++;
  if (buildCounterCity < 3) {
    unittest.expect(o.countryCode, unittest.equals('foo'));
    unittest.expect(o.countryDartId, unittest.equals('foo'));
    unittest.expect(o.dartId, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.metroCode, unittest.equals('foo'));
    unittest.expect(o.metroDmaId, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.regionCode, unittest.equals('foo'));
    unittest.expect(o.regionDartId, unittest.equals('foo'));
  }
  buildCounterCity--;
}

core.int buildCounterClickTag = 0;
buildClickTag() {
  var o = new api.ClickTag();
  buildCounterClickTag++;
  if (buildCounterClickTag < 3) {
    o.clickThroughUrl = buildCreativeClickThroughUrl();
    o.eventName = "foo";
    o.name = "foo";
  }
  buildCounterClickTag--;
  return o;
}

checkClickTag(api.ClickTag o) {
  buildCounterClickTag++;
  if (buildCounterClickTag < 3) {
    checkCreativeClickThroughUrl(o.clickThroughUrl);
    unittest.expect(o.eventName, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterClickTag--;
}

core.int buildCounterClickThroughUrl = 0;
buildClickThroughUrl() {
  var o = new api.ClickThroughUrl();
  buildCounterClickThroughUrl++;
  if (buildCounterClickThroughUrl < 3) {
    o.computedClickThroughUrl = "foo";
    o.customClickThroughUrl = "foo";
    o.defaultLandingPage = true;
    o.landingPageId = "foo";
  }
  buildCounterClickThroughUrl--;
  return o;
}

checkClickThroughUrl(api.ClickThroughUrl o) {
  buildCounterClickThroughUrl++;
  if (buildCounterClickThroughUrl < 3) {
    unittest.expect(o.computedClickThroughUrl, unittest.equals('foo'));
    unittest.expect(o.customClickThroughUrl, unittest.equals('foo'));
    unittest.expect(o.defaultLandingPage, unittest.isTrue);
    unittest.expect(o.landingPageId, unittest.equals('foo'));
  }
  buildCounterClickThroughUrl--;
}

core.int buildCounterClickThroughUrlSuffixProperties = 0;
buildClickThroughUrlSuffixProperties() {
  var o = new api.ClickThroughUrlSuffixProperties();
  buildCounterClickThroughUrlSuffixProperties++;
  if (buildCounterClickThroughUrlSuffixProperties < 3) {
    o.clickThroughUrlSuffix = "foo";
    o.overrideInheritedSuffix = true;
  }
  buildCounterClickThroughUrlSuffixProperties--;
  return o;
}

checkClickThroughUrlSuffixProperties(api.ClickThroughUrlSuffixProperties o) {
  buildCounterClickThroughUrlSuffixProperties++;
  if (buildCounterClickThroughUrlSuffixProperties < 3) {
    unittest.expect(o.clickThroughUrlSuffix, unittest.equals('foo'));
    unittest.expect(o.overrideInheritedSuffix, unittest.isTrue);
  }
  buildCounterClickThroughUrlSuffixProperties--;
}

core.int buildCounterCompanionClickThroughOverride = 0;
buildCompanionClickThroughOverride() {
  var o = new api.CompanionClickThroughOverride();
  buildCounterCompanionClickThroughOverride++;
  if (buildCounterCompanionClickThroughOverride < 3) {
    o.clickThroughUrl = buildClickThroughUrl();
    o.creativeId = "foo";
  }
  buildCounterCompanionClickThroughOverride--;
  return o;
}

checkCompanionClickThroughOverride(api.CompanionClickThroughOverride o) {
  buildCounterCompanionClickThroughOverride++;
  if (buildCounterCompanionClickThroughOverride < 3) {
    checkClickThroughUrl(o.clickThroughUrl);
    unittest.expect(o.creativeId, unittest.equals('foo'));
  }
  buildCounterCompanionClickThroughOverride--;
}

buildUnnamed5070() {
  var o = new core.List<api.Size>();
  o.add(buildSize());
  o.add(buildSize());
  return o;
}

checkUnnamed5070(core.List<api.Size> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSize(o[0]);
  checkSize(o[1]);
}

core.int buildCounterCompanionSetting = 0;
buildCompanionSetting() {
  var o = new api.CompanionSetting();
  buildCounterCompanionSetting++;
  if (buildCounterCompanionSetting < 3) {
    o.companionsDisabled = true;
    o.enabledSizes = buildUnnamed5070();
    o.imageOnly = true;
    o.kind = "foo";
  }
  buildCounterCompanionSetting--;
  return o;
}

checkCompanionSetting(api.CompanionSetting o) {
  buildCounterCompanionSetting++;
  if (buildCounterCompanionSetting < 3) {
    unittest.expect(o.companionsDisabled, unittest.isTrue);
    checkUnnamed5070(o.enabledSizes);
    unittest.expect(o.imageOnly, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterCompanionSetting--;
}

core.int buildCounterCompatibleFields = 0;
buildCompatibleFields() {
  var o = new api.CompatibleFields();
  buildCounterCompatibleFields++;
  if (buildCounterCompatibleFields < 3) {
    o.crossDimensionReachReportCompatibleFields =
        buildCrossDimensionReachReportCompatibleFields();
    o.floodlightReportCompatibleFields =
        buildFloodlightReportCompatibleFields();
    o.kind = "foo";
    o.pathToConversionReportCompatibleFields =
        buildPathToConversionReportCompatibleFields();
    o.reachReportCompatibleFields = buildReachReportCompatibleFields();
    o.reportCompatibleFields = buildReportCompatibleFields();
  }
  buildCounterCompatibleFields--;
  return o;
}

checkCompatibleFields(api.CompatibleFields o) {
  buildCounterCompatibleFields++;
  if (buildCounterCompatibleFields < 3) {
    checkCrossDimensionReachReportCompatibleFields(
        o.crossDimensionReachReportCompatibleFields);
    checkFloodlightReportCompatibleFields(o.floodlightReportCompatibleFields);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkPathToConversionReportCompatibleFields(
        o.pathToConversionReportCompatibleFields);
    checkReachReportCompatibleFields(o.reachReportCompatibleFields);
    checkReportCompatibleFields(o.reportCompatibleFields);
  }
  buildCounterCompatibleFields--;
}

core.int buildCounterConnectionType = 0;
buildConnectionType() {
  var o = new api.ConnectionType();
  buildCounterConnectionType++;
  if (buildCounterConnectionType < 3) {
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterConnectionType--;
  return o;
}

checkConnectionType(api.ConnectionType o) {
  buildCounterConnectionType++;
  if (buildCounterConnectionType < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterConnectionType--;
}

buildUnnamed5071() {
  var o = new core.List<api.ConnectionType>();
  o.add(buildConnectionType());
  o.add(buildConnectionType());
  return o;
}

checkUnnamed5071(core.List<api.ConnectionType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkConnectionType(o[0]);
  checkConnectionType(o[1]);
}

core.int buildCounterConnectionTypesListResponse = 0;
buildConnectionTypesListResponse() {
  var o = new api.ConnectionTypesListResponse();
  buildCounterConnectionTypesListResponse++;
  if (buildCounterConnectionTypesListResponse < 3) {
    o.connectionTypes = buildUnnamed5071();
    o.kind = "foo";
  }
  buildCounterConnectionTypesListResponse--;
  return o;
}

checkConnectionTypesListResponse(api.ConnectionTypesListResponse o) {
  buildCounterConnectionTypesListResponse++;
  if (buildCounterConnectionTypesListResponse < 3) {
    checkUnnamed5071(o.connectionTypes);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterConnectionTypesListResponse--;
}

buildUnnamed5072() {
  var o = new core.List<api.ContentCategory>();
  o.add(buildContentCategory());
  o.add(buildContentCategory());
  return o;
}

checkUnnamed5072(core.List<api.ContentCategory> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContentCategory(o[0]);
  checkContentCategory(o[1]);
}

core.int buildCounterContentCategoriesListResponse = 0;
buildContentCategoriesListResponse() {
  var o = new api.ContentCategoriesListResponse();
  buildCounterContentCategoriesListResponse++;
  if (buildCounterContentCategoriesListResponse < 3) {
    o.contentCategories = buildUnnamed5072();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterContentCategoriesListResponse--;
  return o;
}

checkContentCategoriesListResponse(api.ContentCategoriesListResponse o) {
  buildCounterContentCategoriesListResponse++;
  if (buildCounterContentCategoriesListResponse < 3) {
    checkUnnamed5072(o.contentCategories);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterContentCategoriesListResponse--;
}

core.int buildCounterContentCategory = 0;
buildContentCategory() {
  var o = new api.ContentCategory();
  buildCounterContentCategory++;
  if (buildCounterContentCategory < 3) {
    o.accountId = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterContentCategory--;
  return o;
}

checkContentCategory(api.ContentCategory o) {
  buildCounterContentCategory++;
  if (buildCounterContentCategory < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterContentCategory--;
}

buildUnnamed5073() {
  var o = new core.List<api.CustomFloodlightVariable>();
  o.add(buildCustomFloodlightVariable());
  o.add(buildCustomFloodlightVariable());
  return o;
}

checkUnnamed5073(core.List<api.CustomFloodlightVariable> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomFloodlightVariable(o[0]);
  checkCustomFloodlightVariable(o[1]);
}

buildUnnamed5074() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5074(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterConversion = 0;
buildConversion() {
  var o = new api.Conversion();
  buildCounterConversion++;
  if (buildCounterConversion < 3) {
    o.childDirectedTreatment = true;
    o.customVariables = buildUnnamed5073();
    o.encryptedUserId = "foo";
    o.encryptedUserIdCandidates = buildUnnamed5074();
    o.floodlightActivityId = "foo";
    o.floodlightConfigurationId = "foo";
    o.gclid = "foo";
    o.kind = "foo";
    o.limitAdTracking = true;
    o.matchId = "foo";
    o.mobileDeviceId = "foo";
    o.nonPersonalizedAd = true;
    o.ordinal = "foo";
    o.quantity = "foo";
    o.timestampMicros = "foo";
    o.treatmentForUnderage = true;
    o.value = 42.0;
  }
  buildCounterConversion--;
  return o;
}

checkConversion(api.Conversion o) {
  buildCounterConversion++;
  if (buildCounterConversion < 3) {
    unittest.expect(o.childDirectedTreatment, unittest.isTrue);
    checkUnnamed5073(o.customVariables);
    unittest.expect(o.encryptedUserId, unittest.equals('foo'));
    checkUnnamed5074(o.encryptedUserIdCandidates);
    unittest.expect(o.floodlightActivityId, unittest.equals('foo'));
    unittest.expect(o.floodlightConfigurationId, unittest.equals('foo'));
    unittest.expect(o.gclid, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.limitAdTracking, unittest.isTrue);
    unittest.expect(o.matchId, unittest.equals('foo'));
    unittest.expect(o.mobileDeviceId, unittest.equals('foo'));
    unittest.expect(o.nonPersonalizedAd, unittest.isTrue);
    unittest.expect(o.ordinal, unittest.equals('foo'));
    unittest.expect(o.quantity, unittest.equals('foo'));
    unittest.expect(o.timestampMicros, unittest.equals('foo'));
    unittest.expect(o.treatmentForUnderage, unittest.isTrue);
    unittest.expect(o.value, unittest.equals(42.0));
  }
  buildCounterConversion--;
}

core.int buildCounterConversionError = 0;
buildConversionError() {
  var o = new api.ConversionError();
  buildCounterConversionError++;
  if (buildCounterConversionError < 3) {
    o.code = "foo";
    o.kind = "foo";
    o.message = "foo";
  }
  buildCounterConversionError--;
  return o;
}

checkConversionError(api.ConversionError o) {
  buildCounterConversionError++;
  if (buildCounterConversionError < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterConversionError--;
}

buildUnnamed5075() {
  var o = new core.List<api.ConversionError>();
  o.add(buildConversionError());
  o.add(buildConversionError());
  return o;
}

checkUnnamed5075(core.List<api.ConversionError> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkConversionError(o[0]);
  checkConversionError(o[1]);
}

core.int buildCounterConversionStatus = 0;
buildConversionStatus() {
  var o = new api.ConversionStatus();
  buildCounterConversionStatus++;
  if (buildCounterConversionStatus < 3) {
    o.conversion = buildConversion();
    o.errors = buildUnnamed5075();
    o.kind = "foo";
  }
  buildCounterConversionStatus--;
  return o;
}

checkConversionStatus(api.ConversionStatus o) {
  buildCounterConversionStatus++;
  if (buildCounterConversionStatus < 3) {
    checkConversion(o.conversion);
    checkUnnamed5075(o.errors);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterConversionStatus--;
}

buildUnnamed5076() {
  var o = new core.List<api.Conversion>();
  o.add(buildConversion());
  o.add(buildConversion());
  return o;
}

checkUnnamed5076(core.List<api.Conversion> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkConversion(o[0]);
  checkConversion(o[1]);
}

core.int buildCounterConversionsBatchInsertRequest = 0;
buildConversionsBatchInsertRequest() {
  var o = new api.ConversionsBatchInsertRequest();
  buildCounterConversionsBatchInsertRequest++;
  if (buildCounterConversionsBatchInsertRequest < 3) {
    o.conversions = buildUnnamed5076();
    o.encryptionInfo = buildEncryptionInfo();
    o.kind = "foo";
  }
  buildCounterConversionsBatchInsertRequest--;
  return o;
}

checkConversionsBatchInsertRequest(api.ConversionsBatchInsertRequest o) {
  buildCounterConversionsBatchInsertRequest++;
  if (buildCounterConversionsBatchInsertRequest < 3) {
    checkUnnamed5076(o.conversions);
    checkEncryptionInfo(o.encryptionInfo);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterConversionsBatchInsertRequest--;
}

buildUnnamed5077() {
  var o = new core.List<api.ConversionStatus>();
  o.add(buildConversionStatus());
  o.add(buildConversionStatus());
  return o;
}

checkUnnamed5077(core.List<api.ConversionStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkConversionStatus(o[0]);
  checkConversionStatus(o[1]);
}

core.int buildCounterConversionsBatchInsertResponse = 0;
buildConversionsBatchInsertResponse() {
  var o = new api.ConversionsBatchInsertResponse();
  buildCounterConversionsBatchInsertResponse++;
  if (buildCounterConversionsBatchInsertResponse < 3) {
    o.hasFailures = true;
    o.kind = "foo";
    o.status = buildUnnamed5077();
  }
  buildCounterConversionsBatchInsertResponse--;
  return o;
}

checkConversionsBatchInsertResponse(api.ConversionsBatchInsertResponse o) {
  buildCounterConversionsBatchInsertResponse++;
  if (buildCounterConversionsBatchInsertResponse < 3) {
    unittest.expect(o.hasFailures, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5077(o.status);
  }
  buildCounterConversionsBatchInsertResponse--;
}

buildUnnamed5078() {
  var o = new core.List<api.Conversion>();
  o.add(buildConversion());
  o.add(buildConversion());
  return o;
}

checkUnnamed5078(core.List<api.Conversion> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkConversion(o[0]);
  checkConversion(o[1]);
}

core.int buildCounterConversionsBatchUpdateRequest = 0;
buildConversionsBatchUpdateRequest() {
  var o = new api.ConversionsBatchUpdateRequest();
  buildCounterConversionsBatchUpdateRequest++;
  if (buildCounterConversionsBatchUpdateRequest < 3) {
    o.conversions = buildUnnamed5078();
    o.encryptionInfo = buildEncryptionInfo();
    o.kind = "foo";
  }
  buildCounterConversionsBatchUpdateRequest--;
  return o;
}

checkConversionsBatchUpdateRequest(api.ConversionsBatchUpdateRequest o) {
  buildCounterConversionsBatchUpdateRequest++;
  if (buildCounterConversionsBatchUpdateRequest < 3) {
    checkUnnamed5078(o.conversions);
    checkEncryptionInfo(o.encryptionInfo);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterConversionsBatchUpdateRequest--;
}

buildUnnamed5079() {
  var o = new core.List<api.ConversionStatus>();
  o.add(buildConversionStatus());
  o.add(buildConversionStatus());
  return o;
}

checkUnnamed5079(core.List<api.ConversionStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkConversionStatus(o[0]);
  checkConversionStatus(o[1]);
}

core.int buildCounterConversionsBatchUpdateResponse = 0;
buildConversionsBatchUpdateResponse() {
  var o = new api.ConversionsBatchUpdateResponse();
  buildCounterConversionsBatchUpdateResponse++;
  if (buildCounterConversionsBatchUpdateResponse < 3) {
    o.hasFailures = true;
    o.kind = "foo";
    o.status = buildUnnamed5079();
  }
  buildCounterConversionsBatchUpdateResponse--;
  return o;
}

checkConversionsBatchUpdateResponse(api.ConversionsBatchUpdateResponse o) {
  buildCounterConversionsBatchUpdateResponse++;
  if (buildCounterConversionsBatchUpdateResponse < 3) {
    unittest.expect(o.hasFailures, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5079(o.status);
  }
  buildCounterConversionsBatchUpdateResponse--;
}

buildUnnamed5080() {
  var o = new core.List<api.Country>();
  o.add(buildCountry());
  o.add(buildCountry());
  return o;
}

checkUnnamed5080(core.List<api.Country> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCountry(o[0]);
  checkCountry(o[1]);
}

core.int buildCounterCountriesListResponse = 0;
buildCountriesListResponse() {
  var o = new api.CountriesListResponse();
  buildCounterCountriesListResponse++;
  if (buildCounterCountriesListResponse < 3) {
    o.countries = buildUnnamed5080();
    o.kind = "foo";
  }
  buildCounterCountriesListResponse--;
  return o;
}

checkCountriesListResponse(api.CountriesListResponse o) {
  buildCounterCountriesListResponse++;
  if (buildCounterCountriesListResponse < 3) {
    checkUnnamed5080(o.countries);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterCountriesListResponse--;
}

core.int buildCounterCountry = 0;
buildCountry() {
  var o = new api.Country();
  buildCounterCountry++;
  if (buildCounterCountry < 3) {
    o.countryCode = "foo";
    o.dartId = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.sslEnabled = true;
  }
  buildCounterCountry--;
  return o;
}

checkCountry(api.Country o) {
  buildCounterCountry++;
  if (buildCounterCountry < 3) {
    unittest.expect(o.countryCode, unittest.equals('foo'));
    unittest.expect(o.dartId, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.sslEnabled, unittest.isTrue);
  }
  buildCounterCountry--;
}

buildUnnamed5081() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5081(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5082() {
  var o = new core.List<api.Size>();
  o.add(buildSize());
  o.add(buildSize());
  return o;
}

checkUnnamed5082(core.List<api.Size> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSize(o[0]);
  checkSize(o[1]);
}

buildUnnamed5083() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5083(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5084() {
  var o = new core.List<api.ClickTag>();
  o.add(buildClickTag());
  o.add(buildClickTag());
  return o;
}

checkUnnamed5084(core.List<api.ClickTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkClickTag(o[0]);
  checkClickTag(o[1]);
}

buildUnnamed5085() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5085(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5086() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5086(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5087() {
  var o = new core.List<api.CreativeCustomEvent>();
  o.add(buildCreativeCustomEvent());
  o.add(buildCreativeCustomEvent());
  return o;
}

checkUnnamed5087(core.List<api.CreativeCustomEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeCustomEvent(o[0]);
  checkCreativeCustomEvent(o[1]);
}

buildUnnamed5088() {
  var o = new core.List<api.CreativeAsset>();
  o.add(buildCreativeAsset());
  o.add(buildCreativeAsset());
  return o;
}

checkUnnamed5088(core.List<api.CreativeAsset> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeAsset(o[0]);
  checkCreativeAsset(o[1]);
}

buildUnnamed5089() {
  var o = new core.List<api.CreativeFieldAssignment>();
  o.add(buildCreativeFieldAssignment());
  o.add(buildCreativeFieldAssignment());
  return o;
}

checkUnnamed5089(core.List<api.CreativeFieldAssignment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeFieldAssignment(o[0]);
  checkCreativeFieldAssignment(o[1]);
}

buildUnnamed5090() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5090(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5091() {
  var o = new core.List<api.CreativeCustomEvent>();
  o.add(buildCreativeCustomEvent());
  o.add(buildCreativeCustomEvent());
  return o;
}

checkUnnamed5091(core.List<api.CreativeCustomEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeCustomEvent(o[0]);
  checkCreativeCustomEvent(o[1]);
}

buildUnnamed5092() {
  var o = new core.List<api.ThirdPartyTrackingUrl>();
  o.add(buildThirdPartyTrackingUrl());
  o.add(buildThirdPartyTrackingUrl());
  return o;
}

checkUnnamed5092(core.List<api.ThirdPartyTrackingUrl> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkThirdPartyTrackingUrl(o[0]);
  checkThirdPartyTrackingUrl(o[1]);
}

buildUnnamed5093() {
  var o = new core.List<api.CreativeCustomEvent>();
  o.add(buildCreativeCustomEvent());
  o.add(buildCreativeCustomEvent());
  return o;
}

checkUnnamed5093(core.List<api.CreativeCustomEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeCustomEvent(o[0]);
  checkCreativeCustomEvent(o[1]);
}

core.int buildCounterCreative = 0;
buildCreative() {
  var o = new api.Creative();
  buildCounterCreative++;
  if (buildCounterCreative < 3) {
    o.accountId = "foo";
    o.active = true;
    o.adParameters = "foo";
    o.adTagKeys = buildUnnamed5081();
    o.additionalSizes = buildUnnamed5082();
    o.advertiserId = "foo";
    o.allowScriptAccess = true;
    o.archived = true;
    o.artworkType = "foo";
    o.authoringSource = "foo";
    o.authoringTool = "foo";
    o.autoAdvanceImages = true;
    o.backgroundColor = "foo";
    o.backupImageClickThroughUrl = buildCreativeClickThroughUrl();
    o.backupImageFeatures = buildUnnamed5083();
    o.backupImageReportingLabel = "foo";
    o.backupImageTargetWindow = buildTargetWindow();
    o.clickTags = buildUnnamed5084();
    o.commercialId = "foo";
    o.companionCreatives = buildUnnamed5085();
    o.compatibility = buildUnnamed5086();
    o.convertFlashToHtml5 = true;
    o.counterCustomEvents = buildUnnamed5087();
    o.creativeAssetSelection = buildCreativeAssetSelection();
    o.creativeAssets = buildUnnamed5088();
    o.creativeFieldAssignments = buildUnnamed5089();
    o.customKeyValues = buildUnnamed5090();
    o.dynamicAssetSelection = true;
    o.exitCustomEvents = buildUnnamed5091();
    o.fsCommand = buildFsCommand();
    o.htmlCode = "foo";
    o.htmlCodeLocked = true;
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.kind = "foo";
    o.lastModifiedInfo = buildLastModifiedInfo();
    o.latestTraffickedCreativeId = "foo";
    o.mediaDescription = "foo";
    o.mediaDuration = 42.0;
    o.name = "foo";
    o.obaIcon = buildObaIcon();
    o.overrideCss = "foo";
    o.progressOffset = buildVideoOffset();
    o.redirectUrl = "foo";
    o.renderingId = "foo";
    o.renderingIdDimensionValue = buildDimensionValue();
    o.requiredFlashPluginVersion = "foo";
    o.requiredFlashVersion = 42;
    o.size = buildSize();
    o.skipOffset = buildVideoOffset();
    o.skippable = true;
    o.sslCompliant = true;
    o.sslOverride = true;
    o.studioAdvertiserId = "foo";
    o.studioCreativeId = "foo";
    o.studioTraffickedCreativeId = "foo";
    o.subaccountId = "foo";
    o.thirdPartyBackupImageImpressionsUrl = "foo";
    o.thirdPartyRichMediaImpressionsUrl = "foo";
    o.thirdPartyUrls = buildUnnamed5092();
    o.timerCustomEvents = buildUnnamed5093();
    o.totalFileSize = "foo";
    o.type = "foo";
    o.universalAdId = buildUniversalAdId();
    o.version = 42;
  }
  buildCounterCreative--;
  return o;
}

checkCreative(api.Creative o) {
  buildCounterCreative++;
  if (buildCounterCreative < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.active, unittest.isTrue);
    unittest.expect(o.adParameters, unittest.equals('foo'));
    checkUnnamed5081(o.adTagKeys);
    checkUnnamed5082(o.additionalSizes);
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    unittest.expect(o.allowScriptAccess, unittest.isTrue);
    unittest.expect(o.archived, unittest.isTrue);
    unittest.expect(o.artworkType, unittest.equals('foo'));
    unittest.expect(o.authoringSource, unittest.equals('foo'));
    unittest.expect(o.authoringTool, unittest.equals('foo'));
    unittest.expect(o.autoAdvanceImages, unittest.isTrue);
    unittest.expect(o.backgroundColor, unittest.equals('foo'));
    checkCreativeClickThroughUrl(o.backupImageClickThroughUrl);
    checkUnnamed5083(o.backupImageFeatures);
    unittest.expect(o.backupImageReportingLabel, unittest.equals('foo'));
    checkTargetWindow(o.backupImageTargetWindow);
    checkUnnamed5084(o.clickTags);
    unittest.expect(o.commercialId, unittest.equals('foo'));
    checkUnnamed5085(o.companionCreatives);
    checkUnnamed5086(o.compatibility);
    unittest.expect(o.convertFlashToHtml5, unittest.isTrue);
    checkUnnamed5087(o.counterCustomEvents);
    checkCreativeAssetSelection(o.creativeAssetSelection);
    checkUnnamed5088(o.creativeAssets);
    checkUnnamed5089(o.creativeFieldAssignments);
    checkUnnamed5090(o.customKeyValues);
    unittest.expect(o.dynamicAssetSelection, unittest.isTrue);
    checkUnnamed5091(o.exitCustomEvents);
    checkFsCommand(o.fsCommand);
    unittest.expect(o.htmlCode, unittest.equals('foo'));
    unittest.expect(o.htmlCodeLocked, unittest.isTrue);
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLastModifiedInfo(o.lastModifiedInfo);
    unittest.expect(o.latestTraffickedCreativeId, unittest.equals('foo'));
    unittest.expect(o.mediaDescription, unittest.equals('foo'));
    unittest.expect(o.mediaDuration, unittest.equals(42.0));
    unittest.expect(o.name, unittest.equals('foo'));
    checkObaIcon(o.obaIcon);
    unittest.expect(o.overrideCss, unittest.equals('foo'));
    checkVideoOffset(o.progressOffset);
    unittest.expect(o.redirectUrl, unittest.equals('foo'));
    unittest.expect(o.renderingId, unittest.equals('foo'));
    checkDimensionValue(o.renderingIdDimensionValue);
    unittest.expect(o.requiredFlashPluginVersion, unittest.equals('foo'));
    unittest.expect(o.requiredFlashVersion, unittest.equals(42));
    checkSize(o.size);
    checkVideoOffset(o.skipOffset);
    unittest.expect(o.skippable, unittest.isTrue);
    unittest.expect(o.sslCompliant, unittest.isTrue);
    unittest.expect(o.sslOverride, unittest.isTrue);
    unittest.expect(o.studioAdvertiserId, unittest.equals('foo'));
    unittest.expect(o.studioCreativeId, unittest.equals('foo'));
    unittest.expect(o.studioTraffickedCreativeId, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(
        o.thirdPartyBackupImageImpressionsUrl, unittest.equals('foo'));
    unittest.expect(
        o.thirdPartyRichMediaImpressionsUrl, unittest.equals('foo'));
    checkUnnamed5092(o.thirdPartyUrls);
    checkUnnamed5093(o.timerCustomEvents);
    unittest.expect(o.totalFileSize, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    checkUniversalAdId(o.universalAdId);
    unittest.expect(o.version, unittest.equals(42));
  }
  buildCounterCreative--;
}

buildUnnamed5094() {
  var o = new core.List<api.Size>();
  o.add(buildSize());
  o.add(buildSize());
  return o;
}

checkUnnamed5094(core.List<api.Size> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSize(o[0]);
  checkSize(o[1]);
}

buildUnnamed5095() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5095(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5096() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5096(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterCreativeAsset = 0;
buildCreativeAsset() {
  var o = new api.CreativeAsset();
  buildCounterCreativeAsset++;
  if (buildCounterCreativeAsset < 3) {
    o.actionScript3 = true;
    o.active = true;
    o.additionalSizes = buildUnnamed5094();
    o.alignment = "foo";
    o.artworkType = "foo";
    o.assetIdentifier = buildCreativeAssetId();
    o.audioBitRate = 42;
    o.audioSampleRate = 42;
    o.backupImageExit = buildCreativeCustomEvent();
    o.bitRate = 42;
    o.childAssetType = "foo";
    o.collapsedSize = buildSize();
    o.companionCreativeIds = buildUnnamed5095();
    o.customStartTimeValue = 42;
    o.detectedFeatures = buildUnnamed5096();
    o.displayType = "foo";
    o.duration = 42;
    o.durationType = "foo";
    o.expandedDimension = buildSize();
    o.fileSize = "foo";
    o.flashVersion = 42;
    o.frameRate = 42.0;
    o.hideFlashObjects = true;
    o.hideSelectionBoxes = true;
    o.horizontallyLocked = true;
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.mediaDuration = 42.0;
    o.mimeType = "foo";
    o.offset = buildOffsetPosition();
    o.orientation = "foo";
    o.originalBackup = true;
    o.politeLoad = true;
    o.position = buildOffsetPosition();
    o.positionLeftUnit = "foo";
    o.positionTopUnit = "foo";
    o.progressiveServingUrl = "foo";
    o.pushdown = true;
    o.pushdownDuration = 42.0;
    o.role = "foo";
    o.size = buildSize();
    o.sslCompliant = true;
    o.startTimeType = "foo";
    o.streamingServingUrl = "foo";
    o.transparency = true;
    o.verticallyLocked = true;
    o.windowMode = "foo";
    o.zIndex = 42;
    o.zipFilename = "foo";
    o.zipFilesize = "foo";
  }
  buildCounterCreativeAsset--;
  return o;
}

checkCreativeAsset(api.CreativeAsset o) {
  buildCounterCreativeAsset++;
  if (buildCounterCreativeAsset < 3) {
    unittest.expect(o.actionScript3, unittest.isTrue);
    unittest.expect(o.active, unittest.isTrue);
    checkUnnamed5094(o.additionalSizes);
    unittest.expect(o.alignment, unittest.equals('foo'));
    unittest.expect(o.artworkType, unittest.equals('foo'));
    checkCreativeAssetId(o.assetIdentifier);
    unittest.expect(o.audioBitRate, unittest.equals(42));
    unittest.expect(o.audioSampleRate, unittest.equals(42));
    checkCreativeCustomEvent(o.backupImageExit);
    unittest.expect(o.bitRate, unittest.equals(42));
    unittest.expect(o.childAssetType, unittest.equals('foo'));
    checkSize(o.collapsedSize);
    checkUnnamed5095(o.companionCreativeIds);
    unittest.expect(o.customStartTimeValue, unittest.equals(42));
    checkUnnamed5096(o.detectedFeatures);
    unittest.expect(o.displayType, unittest.equals('foo'));
    unittest.expect(o.duration, unittest.equals(42));
    unittest.expect(o.durationType, unittest.equals('foo'));
    checkSize(o.expandedDimension);
    unittest.expect(o.fileSize, unittest.equals('foo'));
    unittest.expect(o.flashVersion, unittest.equals(42));
    unittest.expect(o.frameRate, unittest.equals(42.0));
    unittest.expect(o.hideFlashObjects, unittest.isTrue);
    unittest.expect(o.hideSelectionBoxes, unittest.isTrue);
    unittest.expect(o.horizontallyLocked, unittest.isTrue);
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.mediaDuration, unittest.equals(42.0));
    unittest.expect(o.mimeType, unittest.equals('foo'));
    checkOffsetPosition(o.offset);
    unittest.expect(o.orientation, unittest.equals('foo'));
    unittest.expect(o.originalBackup, unittest.isTrue);
    unittest.expect(o.politeLoad, unittest.isTrue);
    checkOffsetPosition(o.position);
    unittest.expect(o.positionLeftUnit, unittest.equals('foo'));
    unittest.expect(o.positionTopUnit, unittest.equals('foo'));
    unittest.expect(o.progressiveServingUrl, unittest.equals('foo'));
    unittest.expect(o.pushdown, unittest.isTrue);
    unittest.expect(o.pushdownDuration, unittest.equals(42.0));
    unittest.expect(o.role, unittest.equals('foo'));
    checkSize(o.size);
    unittest.expect(o.sslCompliant, unittest.isTrue);
    unittest.expect(o.startTimeType, unittest.equals('foo'));
    unittest.expect(o.streamingServingUrl, unittest.equals('foo'));
    unittest.expect(o.transparency, unittest.isTrue);
    unittest.expect(o.verticallyLocked, unittest.isTrue);
    unittest.expect(o.windowMode, unittest.equals('foo'));
    unittest.expect(o.zIndex, unittest.equals(42));
    unittest.expect(o.zipFilename, unittest.equals('foo'));
    unittest.expect(o.zipFilesize, unittest.equals('foo'));
  }
  buildCounterCreativeAsset--;
}

core.int buildCounterCreativeAssetId = 0;
buildCreativeAssetId() {
  var o = new api.CreativeAssetId();
  buildCounterCreativeAssetId++;
  if (buildCounterCreativeAssetId < 3) {
    o.name = "foo";
    o.type = "foo";
  }
  buildCounterCreativeAssetId--;
  return o;
}

checkCreativeAssetId(api.CreativeAssetId o) {
  buildCounterCreativeAssetId++;
  if (buildCounterCreativeAssetId < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterCreativeAssetId--;
}

buildUnnamed5097() {
  var o = new core.List<api.ClickTag>();
  o.add(buildClickTag());
  o.add(buildClickTag());
  return o;
}

checkUnnamed5097(core.List<api.ClickTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkClickTag(o[0]);
  checkClickTag(o[1]);
}

buildUnnamed5098() {
  var o = new core.List<api.CreativeCustomEvent>();
  o.add(buildCreativeCustomEvent());
  o.add(buildCreativeCustomEvent());
  return o;
}

checkUnnamed5098(core.List<api.CreativeCustomEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeCustomEvent(o[0]);
  checkCreativeCustomEvent(o[1]);
}

buildUnnamed5099() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5099(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5100() {
  var o = new core.List<api.CreativeCustomEvent>();
  o.add(buildCreativeCustomEvent());
  o.add(buildCreativeCustomEvent());
  return o;
}

checkUnnamed5100(core.List<api.CreativeCustomEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeCustomEvent(o[0]);
  checkCreativeCustomEvent(o[1]);
}

buildUnnamed5101() {
  var o = new core.List<api.CreativeCustomEvent>();
  o.add(buildCreativeCustomEvent());
  o.add(buildCreativeCustomEvent());
  return o;
}

checkUnnamed5101(core.List<api.CreativeCustomEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeCustomEvent(o[0]);
  checkCreativeCustomEvent(o[1]);
}

buildUnnamed5102() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5102(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterCreativeAssetMetadata = 0;
buildCreativeAssetMetadata() {
  var o = new api.CreativeAssetMetadata();
  buildCounterCreativeAssetMetadata++;
  if (buildCounterCreativeAssetMetadata < 3) {
    o.assetIdentifier = buildCreativeAssetId();
    o.clickTags = buildUnnamed5097();
    o.counterCustomEvents = buildUnnamed5098();
    o.detectedFeatures = buildUnnamed5099();
    o.exitCustomEvents = buildUnnamed5100();
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.kind = "foo";
    o.richMedia = true;
    o.timerCustomEvents = buildUnnamed5101();
    o.warnedValidationRules = buildUnnamed5102();
  }
  buildCounterCreativeAssetMetadata--;
  return o;
}

checkCreativeAssetMetadata(api.CreativeAssetMetadata o) {
  buildCounterCreativeAssetMetadata++;
  if (buildCounterCreativeAssetMetadata < 3) {
    checkCreativeAssetId(o.assetIdentifier);
    checkUnnamed5097(o.clickTags);
    checkUnnamed5098(o.counterCustomEvents);
    checkUnnamed5099(o.detectedFeatures);
    checkUnnamed5100(o.exitCustomEvents);
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.richMedia, unittest.isTrue);
    checkUnnamed5101(o.timerCustomEvents);
    checkUnnamed5102(o.warnedValidationRules);
  }
  buildCounterCreativeAssetMetadata--;
}

buildUnnamed5103() {
  var o = new core.List<api.Rule>();
  o.add(buildRule());
  o.add(buildRule());
  return o;
}

checkUnnamed5103(core.List<api.Rule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRule(o[0]);
  checkRule(o[1]);
}

core.int buildCounterCreativeAssetSelection = 0;
buildCreativeAssetSelection() {
  var o = new api.CreativeAssetSelection();
  buildCounterCreativeAssetSelection++;
  if (buildCounterCreativeAssetSelection < 3) {
    o.defaultAssetId = "foo";
    o.rules = buildUnnamed5103();
  }
  buildCounterCreativeAssetSelection--;
  return o;
}

checkCreativeAssetSelection(api.CreativeAssetSelection o) {
  buildCounterCreativeAssetSelection++;
  if (buildCounterCreativeAssetSelection < 3) {
    unittest.expect(o.defaultAssetId, unittest.equals('foo'));
    checkUnnamed5103(o.rules);
  }
  buildCounterCreativeAssetSelection--;
}

buildUnnamed5104() {
  var o = new core.List<api.CompanionClickThroughOverride>();
  o.add(buildCompanionClickThroughOverride());
  o.add(buildCompanionClickThroughOverride());
  return o;
}

checkUnnamed5104(core.List<api.CompanionClickThroughOverride> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCompanionClickThroughOverride(o[0]);
  checkCompanionClickThroughOverride(o[1]);
}

buildUnnamed5105() {
  var o = new core.List<api.CreativeGroupAssignment>();
  o.add(buildCreativeGroupAssignment());
  o.add(buildCreativeGroupAssignment());
  return o;
}

checkUnnamed5105(core.List<api.CreativeGroupAssignment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeGroupAssignment(o[0]);
  checkCreativeGroupAssignment(o[1]);
}

buildUnnamed5106() {
  var o = new core.List<api.RichMediaExitOverride>();
  o.add(buildRichMediaExitOverride());
  o.add(buildRichMediaExitOverride());
  return o;
}

checkUnnamed5106(core.List<api.RichMediaExitOverride> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRichMediaExitOverride(o[0]);
  checkRichMediaExitOverride(o[1]);
}

core.int buildCounterCreativeAssignment = 0;
buildCreativeAssignment() {
  var o = new api.CreativeAssignment();
  buildCounterCreativeAssignment++;
  if (buildCounterCreativeAssignment < 3) {
    o.active = true;
    o.applyEventTags = true;
    o.clickThroughUrl = buildClickThroughUrl();
    o.companionCreativeOverrides = buildUnnamed5104();
    o.creativeGroupAssignments = buildUnnamed5105();
    o.creativeId = "foo";
    o.creativeIdDimensionValue = buildDimensionValue();
    o.endTime = core.DateTime.parse("2002-02-27T14:01:02");
    o.richMediaExitOverrides = buildUnnamed5106();
    o.sequence = 42;
    o.sslCompliant = true;
    o.startTime = core.DateTime.parse("2002-02-27T14:01:02");
    o.weight = 42;
  }
  buildCounterCreativeAssignment--;
  return o;
}

checkCreativeAssignment(api.CreativeAssignment o) {
  buildCounterCreativeAssignment++;
  if (buildCounterCreativeAssignment < 3) {
    unittest.expect(o.active, unittest.isTrue);
    unittest.expect(o.applyEventTags, unittest.isTrue);
    checkClickThroughUrl(o.clickThroughUrl);
    checkUnnamed5104(o.companionCreativeOverrides);
    checkUnnamed5105(o.creativeGroupAssignments);
    unittest.expect(o.creativeId, unittest.equals('foo'));
    checkDimensionValue(o.creativeIdDimensionValue);
    unittest.expect(
        o.endTime, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    checkUnnamed5106(o.richMediaExitOverrides);
    unittest.expect(o.sequence, unittest.equals(42));
    unittest.expect(o.sslCompliant, unittest.isTrue);
    unittest.expect(o.startTime,
        unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.weight, unittest.equals(42));
  }
  buildCounterCreativeAssignment--;
}

core.int buildCounterCreativeClickThroughUrl = 0;
buildCreativeClickThroughUrl() {
  var o = new api.CreativeClickThroughUrl();
  buildCounterCreativeClickThroughUrl++;
  if (buildCounterCreativeClickThroughUrl < 3) {
    o.computedClickThroughUrl = "foo";
    o.customClickThroughUrl = "foo";
    o.landingPageId = "foo";
  }
  buildCounterCreativeClickThroughUrl--;
  return o;
}

checkCreativeClickThroughUrl(api.CreativeClickThroughUrl o) {
  buildCounterCreativeClickThroughUrl++;
  if (buildCounterCreativeClickThroughUrl < 3) {
    unittest.expect(o.computedClickThroughUrl, unittest.equals('foo'));
    unittest.expect(o.customClickThroughUrl, unittest.equals('foo'));
    unittest.expect(o.landingPageId, unittest.equals('foo'));
  }
  buildCounterCreativeClickThroughUrl--;
}

core.int buildCounterCreativeCustomEvent = 0;
buildCreativeCustomEvent() {
  var o = new api.CreativeCustomEvent();
  buildCounterCreativeCustomEvent++;
  if (buildCounterCreativeCustomEvent < 3) {
    o.advertiserCustomEventId = "foo";
    o.advertiserCustomEventName = "foo";
    o.advertiserCustomEventType = "foo";
    o.artworkLabel = "foo";
    o.artworkType = "foo";
    o.exitClickThroughUrl = buildCreativeClickThroughUrl();
    o.id = "foo";
    o.popupWindowProperties = buildPopupWindowProperties();
    o.targetType = "foo";
    o.videoReportingId = "foo";
  }
  buildCounterCreativeCustomEvent--;
  return o;
}

checkCreativeCustomEvent(api.CreativeCustomEvent o) {
  buildCounterCreativeCustomEvent++;
  if (buildCounterCreativeCustomEvent < 3) {
    unittest.expect(o.advertiserCustomEventId, unittest.equals('foo'));
    unittest.expect(o.advertiserCustomEventName, unittest.equals('foo'));
    unittest.expect(o.advertiserCustomEventType, unittest.equals('foo'));
    unittest.expect(o.artworkLabel, unittest.equals('foo'));
    unittest.expect(o.artworkType, unittest.equals('foo'));
    checkCreativeClickThroughUrl(o.exitClickThroughUrl);
    unittest.expect(o.id, unittest.equals('foo'));
    checkPopupWindowProperties(o.popupWindowProperties);
    unittest.expect(o.targetType, unittest.equals('foo'));
    unittest.expect(o.videoReportingId, unittest.equals('foo'));
  }
  buildCounterCreativeCustomEvent--;
}

core.int buildCounterCreativeField = 0;
buildCreativeField() {
  var o = new api.CreativeField();
  buildCounterCreativeField++;
  if (buildCounterCreativeField < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.subaccountId = "foo";
  }
  buildCounterCreativeField--;
  return o;
}

checkCreativeField(api.CreativeField o) {
  buildCounterCreativeField++;
  if (buildCounterCreativeField < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
  }
  buildCounterCreativeField--;
}

core.int buildCounterCreativeFieldAssignment = 0;
buildCreativeFieldAssignment() {
  var o = new api.CreativeFieldAssignment();
  buildCounterCreativeFieldAssignment++;
  if (buildCounterCreativeFieldAssignment < 3) {
    o.creativeFieldId = "foo";
    o.creativeFieldValueId = "foo";
  }
  buildCounterCreativeFieldAssignment--;
  return o;
}

checkCreativeFieldAssignment(api.CreativeFieldAssignment o) {
  buildCounterCreativeFieldAssignment++;
  if (buildCounterCreativeFieldAssignment < 3) {
    unittest.expect(o.creativeFieldId, unittest.equals('foo'));
    unittest.expect(o.creativeFieldValueId, unittest.equals('foo'));
  }
  buildCounterCreativeFieldAssignment--;
}

core.int buildCounterCreativeFieldValue = 0;
buildCreativeFieldValue() {
  var o = new api.CreativeFieldValue();
  buildCounterCreativeFieldValue++;
  if (buildCounterCreativeFieldValue < 3) {
    o.id = "foo";
    o.kind = "foo";
    o.value = "foo";
  }
  buildCounterCreativeFieldValue--;
  return o;
}

checkCreativeFieldValue(api.CreativeFieldValue o) {
  buildCounterCreativeFieldValue++;
  if (buildCounterCreativeFieldValue < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterCreativeFieldValue--;
}

buildUnnamed5107() {
  var o = new core.List<api.CreativeFieldValue>();
  o.add(buildCreativeFieldValue());
  o.add(buildCreativeFieldValue());
  return o;
}

checkUnnamed5107(core.List<api.CreativeFieldValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeFieldValue(o[0]);
  checkCreativeFieldValue(o[1]);
}

core.int buildCounterCreativeFieldValuesListResponse = 0;
buildCreativeFieldValuesListResponse() {
  var o = new api.CreativeFieldValuesListResponse();
  buildCounterCreativeFieldValuesListResponse++;
  if (buildCounterCreativeFieldValuesListResponse < 3) {
    o.creativeFieldValues = buildUnnamed5107();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterCreativeFieldValuesListResponse--;
  return o;
}

checkCreativeFieldValuesListResponse(api.CreativeFieldValuesListResponse o) {
  buildCounterCreativeFieldValuesListResponse++;
  if (buildCounterCreativeFieldValuesListResponse < 3) {
    checkUnnamed5107(o.creativeFieldValues);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterCreativeFieldValuesListResponse--;
}

buildUnnamed5108() {
  var o = new core.List<api.CreativeField>();
  o.add(buildCreativeField());
  o.add(buildCreativeField());
  return o;
}

checkUnnamed5108(core.List<api.CreativeField> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeField(o[0]);
  checkCreativeField(o[1]);
}

core.int buildCounterCreativeFieldsListResponse = 0;
buildCreativeFieldsListResponse() {
  var o = new api.CreativeFieldsListResponse();
  buildCounterCreativeFieldsListResponse++;
  if (buildCounterCreativeFieldsListResponse < 3) {
    o.creativeFields = buildUnnamed5108();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterCreativeFieldsListResponse--;
  return o;
}

checkCreativeFieldsListResponse(api.CreativeFieldsListResponse o) {
  buildCounterCreativeFieldsListResponse++;
  if (buildCounterCreativeFieldsListResponse < 3) {
    checkUnnamed5108(o.creativeFields);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterCreativeFieldsListResponse--;
}

core.int buildCounterCreativeGroup = 0;
buildCreativeGroup() {
  var o = new api.CreativeGroup();
  buildCounterCreativeGroup++;
  if (buildCounterCreativeGroup < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.groupNumber = 42;
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.subaccountId = "foo";
  }
  buildCounterCreativeGroup--;
  return o;
}

checkCreativeGroup(api.CreativeGroup o) {
  buildCounterCreativeGroup++;
  if (buildCounterCreativeGroup < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.groupNumber, unittest.equals(42));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
  }
  buildCounterCreativeGroup--;
}

core.int buildCounterCreativeGroupAssignment = 0;
buildCreativeGroupAssignment() {
  var o = new api.CreativeGroupAssignment();
  buildCounterCreativeGroupAssignment++;
  if (buildCounterCreativeGroupAssignment < 3) {
    o.creativeGroupId = "foo";
    o.creativeGroupNumber = "foo";
  }
  buildCounterCreativeGroupAssignment--;
  return o;
}

checkCreativeGroupAssignment(api.CreativeGroupAssignment o) {
  buildCounterCreativeGroupAssignment++;
  if (buildCounterCreativeGroupAssignment < 3) {
    unittest.expect(o.creativeGroupId, unittest.equals('foo'));
    unittest.expect(o.creativeGroupNumber, unittest.equals('foo'));
  }
  buildCounterCreativeGroupAssignment--;
}

buildUnnamed5109() {
  var o = new core.List<api.CreativeGroup>();
  o.add(buildCreativeGroup());
  o.add(buildCreativeGroup());
  return o;
}

checkUnnamed5109(core.List<api.CreativeGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeGroup(o[0]);
  checkCreativeGroup(o[1]);
}

core.int buildCounterCreativeGroupsListResponse = 0;
buildCreativeGroupsListResponse() {
  var o = new api.CreativeGroupsListResponse();
  buildCounterCreativeGroupsListResponse++;
  if (buildCounterCreativeGroupsListResponse < 3) {
    o.creativeGroups = buildUnnamed5109();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterCreativeGroupsListResponse--;
  return o;
}

checkCreativeGroupsListResponse(api.CreativeGroupsListResponse o) {
  buildCounterCreativeGroupsListResponse++;
  if (buildCounterCreativeGroupsListResponse < 3) {
    checkUnnamed5109(o.creativeGroups);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterCreativeGroupsListResponse--;
}

buildUnnamed5110() {
  var o = new core.List<api.OptimizationActivity>();
  o.add(buildOptimizationActivity());
  o.add(buildOptimizationActivity());
  return o;
}

checkUnnamed5110(core.List<api.OptimizationActivity> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOptimizationActivity(o[0]);
  checkOptimizationActivity(o[1]);
}

core.int buildCounterCreativeOptimizationConfiguration = 0;
buildCreativeOptimizationConfiguration() {
  var o = new api.CreativeOptimizationConfiguration();
  buildCounterCreativeOptimizationConfiguration++;
  if (buildCounterCreativeOptimizationConfiguration < 3) {
    o.id = "foo";
    o.name = "foo";
    o.optimizationActivitys = buildUnnamed5110();
    o.optimizationModel = "foo";
  }
  buildCounterCreativeOptimizationConfiguration--;
  return o;
}

checkCreativeOptimizationConfiguration(
    api.CreativeOptimizationConfiguration o) {
  buildCounterCreativeOptimizationConfiguration++;
  if (buildCounterCreativeOptimizationConfiguration < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed5110(o.optimizationActivitys);
    unittest.expect(o.optimizationModel, unittest.equals('foo'));
  }
  buildCounterCreativeOptimizationConfiguration--;
}

buildUnnamed5111() {
  var o = new core.List<api.CreativeAssignment>();
  o.add(buildCreativeAssignment());
  o.add(buildCreativeAssignment());
  return o;
}

checkUnnamed5111(core.List<api.CreativeAssignment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeAssignment(o[0]);
  checkCreativeAssignment(o[1]);
}

core.int buildCounterCreativeRotation = 0;
buildCreativeRotation() {
  var o = new api.CreativeRotation();
  buildCounterCreativeRotation++;
  if (buildCounterCreativeRotation < 3) {
    o.creativeAssignments = buildUnnamed5111();
    o.creativeOptimizationConfigurationId = "foo";
    o.type = "foo";
    o.weightCalculationStrategy = "foo";
  }
  buildCounterCreativeRotation--;
  return o;
}

checkCreativeRotation(api.CreativeRotation o) {
  buildCounterCreativeRotation++;
  if (buildCounterCreativeRotation < 3) {
    checkUnnamed5111(o.creativeAssignments);
    unittest.expect(
        o.creativeOptimizationConfigurationId, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.weightCalculationStrategy, unittest.equals('foo'));
  }
  buildCounterCreativeRotation--;
}

buildUnnamed5112() {
  var o = new core.List<api.Creative>();
  o.add(buildCreative());
  o.add(buildCreative());
  return o;
}

checkUnnamed5112(core.List<api.Creative> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreative(o[0]);
  checkCreative(o[1]);
}

core.int buildCounterCreativesListResponse = 0;
buildCreativesListResponse() {
  var o = new api.CreativesListResponse();
  buildCounterCreativesListResponse++;
  if (buildCounterCreativesListResponse < 3) {
    o.creatives = buildUnnamed5112();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterCreativesListResponse--;
  return o;
}

checkCreativesListResponse(api.CreativesListResponse o) {
  buildCounterCreativesListResponse++;
  if (buildCounterCreativesListResponse < 3) {
    checkUnnamed5112(o.creatives);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterCreativesListResponse--;
}

buildUnnamed5113() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5113(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5114() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5114(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5115() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed5115(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

buildUnnamed5116() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed5116(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

core.int buildCounterCrossDimensionReachReportCompatibleFields = 0;
buildCrossDimensionReachReportCompatibleFields() {
  var o = new api.CrossDimensionReachReportCompatibleFields();
  buildCounterCrossDimensionReachReportCompatibleFields++;
  if (buildCounterCrossDimensionReachReportCompatibleFields < 3) {
    o.breakdown = buildUnnamed5113();
    o.dimensionFilters = buildUnnamed5114();
    o.kind = "foo";
    o.metrics = buildUnnamed5115();
    o.overlapMetrics = buildUnnamed5116();
  }
  buildCounterCrossDimensionReachReportCompatibleFields--;
  return o;
}

checkCrossDimensionReachReportCompatibleFields(
    api.CrossDimensionReachReportCompatibleFields o) {
  buildCounterCrossDimensionReachReportCompatibleFields++;
  if (buildCounterCrossDimensionReachReportCompatibleFields < 3) {
    checkUnnamed5113(o.breakdown);
    checkUnnamed5114(o.dimensionFilters);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5115(o.metrics);
    checkUnnamed5116(o.overlapMetrics);
  }
  buildCounterCrossDimensionReachReportCompatibleFields--;
}

buildUnnamed5117() {
  var o = new core.List<api.CustomVariable>();
  o.add(buildCustomVariable());
  o.add(buildCustomVariable());
  return o;
}

checkUnnamed5117(core.List<api.CustomVariable> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomVariable(o[0]);
  checkCustomVariable(o[1]);
}

core.int buildCounterCustomEvent = 0;
buildCustomEvent() {
  var o = new api.CustomEvent();
  buildCounterCustomEvent++;
  if (buildCounterCustomEvent < 3) {
    o.annotateClickEvent = buildCustomEventClickAnnotation();
    o.annotateImpressionEvent = buildCustomEventImpressionAnnotation();
    o.customVariables = buildUnnamed5117();
    o.eventType = "foo";
    o.floodlightConfigurationId = "foo";
    o.insertEvent = buildCustomEventInsert();
    o.kind = "foo";
    o.ordinal = "foo";
    o.timestampMicros = "foo";
  }
  buildCounterCustomEvent--;
  return o;
}

checkCustomEvent(api.CustomEvent o) {
  buildCounterCustomEvent++;
  if (buildCounterCustomEvent < 3) {
    checkCustomEventClickAnnotation(o.annotateClickEvent);
    checkCustomEventImpressionAnnotation(o.annotateImpressionEvent);
    checkUnnamed5117(o.customVariables);
    unittest.expect(o.eventType, unittest.equals('foo'));
    unittest.expect(o.floodlightConfigurationId, unittest.equals('foo'));
    checkCustomEventInsert(o.insertEvent);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.ordinal, unittest.equals('foo'));
    unittest.expect(o.timestampMicros, unittest.equals('foo'));
  }
  buildCounterCustomEvent--;
}

core.int buildCounterCustomEventClickAnnotation = 0;
buildCustomEventClickAnnotation() {
  var o = new api.CustomEventClickAnnotation();
  buildCounterCustomEventClickAnnotation++;
  if (buildCounterCustomEventClickAnnotation < 3) {
    o.gclid = "foo";
    o.kind = "foo";
  }
  buildCounterCustomEventClickAnnotation--;
  return o;
}

checkCustomEventClickAnnotation(api.CustomEventClickAnnotation o) {
  buildCounterCustomEventClickAnnotation++;
  if (buildCounterCustomEventClickAnnotation < 3) {
    unittest.expect(o.gclid, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterCustomEventClickAnnotation--;
}

core.int buildCounterCustomEventError = 0;
buildCustomEventError() {
  var o = new api.CustomEventError();
  buildCounterCustomEventError++;
  if (buildCounterCustomEventError < 3) {
    o.code = "foo";
    o.kind = "foo";
    o.message = "foo";
  }
  buildCounterCustomEventError--;
  return o;
}

checkCustomEventError(api.CustomEventError o) {
  buildCounterCustomEventError++;
  if (buildCounterCustomEventError < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterCustomEventError--;
}

core.int buildCounterCustomEventImpressionAnnotation = 0;
buildCustomEventImpressionAnnotation() {
  var o = new api.CustomEventImpressionAnnotation();
  buildCounterCustomEventImpressionAnnotation++;
  if (buildCounterCustomEventImpressionAnnotation < 3) {
    o.kind = "foo";
    o.pathImpressionId = "foo";
  }
  buildCounterCustomEventImpressionAnnotation--;
  return o;
}

checkCustomEventImpressionAnnotation(api.CustomEventImpressionAnnotation o) {
  buildCounterCustomEventImpressionAnnotation++;
  if (buildCounterCustomEventImpressionAnnotation < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.pathImpressionId, unittest.equals('foo'));
  }
  buildCounterCustomEventImpressionAnnotation--;
}

core.int buildCounterCustomEventInsert = 0;
buildCustomEventInsert() {
  var o = new api.CustomEventInsert();
  buildCounterCustomEventInsert++;
  if (buildCounterCustomEventInsert < 3) {
    o.cmDimensions = buildCampaignManagerIds();
    o.dv3Dimensions = buildDV3Ids();
    o.insertEventType = "foo";
    o.kind = "foo";
    o.matchId = "foo";
    o.mobileDeviceId = "foo";
  }
  buildCounterCustomEventInsert--;
  return o;
}

checkCustomEventInsert(api.CustomEventInsert o) {
  buildCounterCustomEventInsert++;
  if (buildCounterCustomEventInsert < 3) {
    checkCampaignManagerIds(o.cmDimensions);
    checkDV3Ids(o.dv3Dimensions);
    unittest.expect(o.insertEventType, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.matchId, unittest.equals('foo'));
    unittest.expect(o.mobileDeviceId, unittest.equals('foo'));
  }
  buildCounterCustomEventInsert--;
}

buildUnnamed5118() {
  var o = new core.List<api.CustomEventError>();
  o.add(buildCustomEventError());
  o.add(buildCustomEventError());
  return o;
}

checkUnnamed5118(core.List<api.CustomEventError> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomEventError(o[0]);
  checkCustomEventError(o[1]);
}

core.int buildCounterCustomEventStatus = 0;
buildCustomEventStatus() {
  var o = new api.CustomEventStatus();
  buildCounterCustomEventStatus++;
  if (buildCounterCustomEventStatus < 3) {
    o.customEvent = buildCustomEvent();
    o.errors = buildUnnamed5118();
    o.kind = "foo";
  }
  buildCounterCustomEventStatus--;
  return o;
}

checkCustomEventStatus(api.CustomEventStatus o) {
  buildCounterCustomEventStatus++;
  if (buildCounterCustomEventStatus < 3) {
    checkCustomEvent(o.customEvent);
    checkUnnamed5118(o.errors);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterCustomEventStatus--;
}

buildUnnamed5119() {
  var o = new core.List<api.CustomEvent>();
  o.add(buildCustomEvent());
  o.add(buildCustomEvent());
  return o;
}

checkUnnamed5119(core.List<api.CustomEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomEvent(o[0]);
  checkCustomEvent(o[1]);
}

core.int buildCounterCustomEventsBatchInsertRequest = 0;
buildCustomEventsBatchInsertRequest() {
  var o = new api.CustomEventsBatchInsertRequest();
  buildCounterCustomEventsBatchInsertRequest++;
  if (buildCounterCustomEventsBatchInsertRequest < 3) {
    o.customEvents = buildUnnamed5119();
    o.kind = "foo";
  }
  buildCounterCustomEventsBatchInsertRequest--;
  return o;
}

checkCustomEventsBatchInsertRequest(api.CustomEventsBatchInsertRequest o) {
  buildCounterCustomEventsBatchInsertRequest++;
  if (buildCounterCustomEventsBatchInsertRequest < 3) {
    checkUnnamed5119(o.customEvents);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterCustomEventsBatchInsertRequest--;
}

buildUnnamed5120() {
  var o = new core.List<api.CustomEventStatus>();
  o.add(buildCustomEventStatus());
  o.add(buildCustomEventStatus());
  return o;
}

checkUnnamed5120(core.List<api.CustomEventStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomEventStatus(o[0]);
  checkCustomEventStatus(o[1]);
}

core.int buildCounterCustomEventsBatchInsertResponse = 0;
buildCustomEventsBatchInsertResponse() {
  var o = new api.CustomEventsBatchInsertResponse();
  buildCounterCustomEventsBatchInsertResponse++;
  if (buildCounterCustomEventsBatchInsertResponse < 3) {
    o.hasFailures = true;
    o.kind = "foo";
    o.status = buildUnnamed5120();
  }
  buildCounterCustomEventsBatchInsertResponse--;
  return o;
}

checkCustomEventsBatchInsertResponse(api.CustomEventsBatchInsertResponse o) {
  buildCounterCustomEventsBatchInsertResponse++;
  if (buildCounterCustomEventsBatchInsertResponse < 3) {
    unittest.expect(o.hasFailures, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5120(o.status);
  }
  buildCounterCustomEventsBatchInsertResponse--;
}

core.int buildCounterCustomFloodlightVariable = 0;
buildCustomFloodlightVariable() {
  var o = new api.CustomFloodlightVariable();
  buildCounterCustomFloodlightVariable++;
  if (buildCounterCustomFloodlightVariable < 3) {
    o.kind = "foo";
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterCustomFloodlightVariable--;
  return o;
}

checkCustomFloodlightVariable(api.CustomFloodlightVariable o) {
  buildCounterCustomFloodlightVariable++;
  if (buildCounterCustomFloodlightVariable < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterCustomFloodlightVariable--;
}

buildUnnamed5121() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5121(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

core.int buildCounterCustomRichMediaEvents = 0;
buildCustomRichMediaEvents() {
  var o = new api.CustomRichMediaEvents();
  buildCounterCustomRichMediaEvents++;
  if (buildCounterCustomRichMediaEvents < 3) {
    o.filteredEventIds = buildUnnamed5121();
    o.kind = "foo";
  }
  buildCounterCustomRichMediaEvents--;
  return o;
}

checkCustomRichMediaEvents(api.CustomRichMediaEvents o) {
  buildCounterCustomRichMediaEvents++;
  if (buildCounterCustomRichMediaEvents < 3) {
    checkUnnamed5121(o.filteredEventIds);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterCustomRichMediaEvents--;
}

core.int buildCounterCustomVariable = 0;
buildCustomVariable() {
  var o = new api.CustomVariable();
  buildCounterCustomVariable++;
  if (buildCounterCustomVariable < 3) {
    o.index = "foo";
    o.kind = "foo";
    o.value = "foo";
  }
  buildCounterCustomVariable--;
  return o;
}

checkCustomVariable(api.CustomVariable o) {
  buildCounterCustomVariable++;
  if (buildCounterCustomVariable < 3) {
    unittest.expect(o.index, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterCustomVariable--;
}

core.int buildCounterCustomViewabilityMetric = 0;
buildCustomViewabilityMetric() {
  var o = new api.CustomViewabilityMetric();
  buildCounterCustomViewabilityMetric++;
  if (buildCounterCustomViewabilityMetric < 3) {
    o.configuration = buildCustomViewabilityMetricConfiguration();
    o.id = "foo";
    o.name = "foo";
  }
  buildCounterCustomViewabilityMetric--;
  return o;
}

checkCustomViewabilityMetric(api.CustomViewabilityMetric o) {
  buildCounterCustomViewabilityMetric++;
  if (buildCounterCustomViewabilityMetric < 3) {
    checkCustomViewabilityMetricConfiguration(o.configuration);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterCustomViewabilityMetric--;
}

core.int buildCounterCustomViewabilityMetricConfiguration = 0;
buildCustomViewabilityMetricConfiguration() {
  var o = new api.CustomViewabilityMetricConfiguration();
  buildCounterCustomViewabilityMetricConfiguration++;
  if (buildCounterCustomViewabilityMetricConfiguration < 3) {
    o.audible = true;
    o.timeMillis = 42;
    o.timePercent = 42;
    o.viewabilityPercent = 42;
  }
  buildCounterCustomViewabilityMetricConfiguration--;
  return o;
}

checkCustomViewabilityMetricConfiguration(
    api.CustomViewabilityMetricConfiguration o) {
  buildCounterCustomViewabilityMetricConfiguration++;
  if (buildCounterCustomViewabilityMetricConfiguration < 3) {
    unittest.expect(o.audible, unittest.isTrue);
    unittest.expect(o.timeMillis, unittest.equals(42));
    unittest.expect(o.timePercent, unittest.equals(42));
    unittest.expect(o.viewabilityPercent, unittest.equals(42));
  }
  buildCounterCustomViewabilityMetricConfiguration--;
}

core.int buildCounterDV3Ids = 0;
buildDV3Ids() {
  var o = new api.DV3Ids();
  buildCounterDV3Ids++;
  if (buildCounterDV3Ids < 3) {
    o.dvCampaignId = "foo";
    o.dvCreativeId = "foo";
    o.dvInsertionOrderId = "foo";
    o.dvLineItemId = "foo";
    o.dvSiteId = "foo";
    o.kind = "foo";
  }
  buildCounterDV3Ids--;
  return o;
}

checkDV3Ids(api.DV3Ids o) {
  buildCounterDV3Ids++;
  if (buildCounterDV3Ids < 3) {
    unittest.expect(o.dvCampaignId, unittest.equals('foo'));
    unittest.expect(o.dvCreativeId, unittest.equals('foo'));
    unittest.expect(o.dvInsertionOrderId, unittest.equals('foo'));
    unittest.expect(o.dvLineItemId, unittest.equals('foo'));
    unittest.expect(o.dvSiteId, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterDV3Ids--;
}

core.int buildCounterDateRange = 0;
buildDateRange() {
  var o = new api.DateRange();
  buildCounterDateRange++;
  if (buildCounterDateRange < 3) {
    o.endDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.kind = "foo";
    o.relativeDateRange = "foo";
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02Z");
  }
  buildCounterDateRange--;
  return o;
}

checkDateRange(api.DateRange o) {
  buildCounterDateRange++;
  if (buildCounterDateRange < 3) {
    unittest.expect(
        o.endDate, unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.relativeDateRange, unittest.equals('foo'));
    unittest.expect(o.startDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
  }
  buildCounterDateRange--;
}

buildUnnamed5122() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5122(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5123() {
  var o = new core.List<core.int>();
  o.add(42);
  o.add(42);
  return o;
}

checkUnnamed5123(core.List<core.int> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals(42));
  unittest.expect(o[1], unittest.equals(42));
}

core.int buildCounterDayPartTargeting = 0;
buildDayPartTargeting() {
  var o = new api.DayPartTargeting();
  buildCounterDayPartTargeting++;
  if (buildCounterDayPartTargeting < 3) {
    o.daysOfWeek = buildUnnamed5122();
    o.hoursOfDay = buildUnnamed5123();
    o.userLocalTime = true;
  }
  buildCounterDayPartTargeting--;
  return o;
}

checkDayPartTargeting(api.DayPartTargeting o) {
  buildCounterDayPartTargeting++;
  if (buildCounterDayPartTargeting < 3) {
    checkUnnamed5122(o.daysOfWeek);
    checkUnnamed5123(o.hoursOfDay);
    unittest.expect(o.userLocalTime, unittest.isTrue);
  }
  buildCounterDayPartTargeting--;
}

buildUnnamed5124() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5124(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDeepLink = 0;
buildDeepLink() {
  var o = new api.DeepLink();
  buildCounterDeepLink++;
  if (buildCounterDeepLink < 3) {
    o.appUrl = "foo";
    o.fallbackUrl = "foo";
    o.kind = "foo";
    o.mobileApp = buildMobileApp();
    o.remarketingListIds = buildUnnamed5124();
  }
  buildCounterDeepLink--;
  return o;
}

checkDeepLink(api.DeepLink o) {
  buildCounterDeepLink++;
  if (buildCounterDeepLink < 3) {
    unittest.expect(o.appUrl, unittest.equals('foo'));
    unittest.expect(o.fallbackUrl, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkMobileApp(o.mobileApp);
    checkUnnamed5124(o.remarketingListIds);
  }
  buildCounterDeepLink--;
}

core.int buildCounterDefaultClickThroughEventTagProperties = 0;
buildDefaultClickThroughEventTagProperties() {
  var o = new api.DefaultClickThroughEventTagProperties();
  buildCounterDefaultClickThroughEventTagProperties++;
  if (buildCounterDefaultClickThroughEventTagProperties < 3) {
    o.defaultClickThroughEventTagId = "foo";
    o.overrideInheritedEventTag = true;
  }
  buildCounterDefaultClickThroughEventTagProperties--;
  return o;
}

checkDefaultClickThroughEventTagProperties(
    api.DefaultClickThroughEventTagProperties o) {
  buildCounterDefaultClickThroughEventTagProperties++;
  if (buildCounterDefaultClickThroughEventTagProperties < 3) {
    unittest.expect(o.defaultClickThroughEventTagId, unittest.equals('foo'));
    unittest.expect(o.overrideInheritedEventTag, unittest.isTrue);
  }
  buildCounterDefaultClickThroughEventTagProperties--;
}

core.int buildCounterDeliverySchedule = 0;
buildDeliverySchedule() {
  var o = new api.DeliverySchedule();
  buildCounterDeliverySchedule++;
  if (buildCounterDeliverySchedule < 3) {
    o.frequencyCap = buildFrequencyCap();
    o.hardCutoff = true;
    o.impressionRatio = "foo";
    o.priority = "foo";
  }
  buildCounterDeliverySchedule--;
  return o;
}

checkDeliverySchedule(api.DeliverySchedule o) {
  buildCounterDeliverySchedule++;
  if (buildCounterDeliverySchedule < 3) {
    checkFrequencyCap(o.frequencyCap);
    unittest.expect(o.hardCutoff, unittest.isTrue);
    unittest.expect(o.impressionRatio, unittest.equals('foo'));
    unittest.expect(o.priority, unittest.equals('foo'));
  }
  buildCounterDeliverySchedule--;
}

core.int buildCounterDfpSettings = 0;
buildDfpSettings() {
  var o = new api.DfpSettings();
  buildCounterDfpSettings++;
  if (buildCounterDfpSettings < 3) {
    o.dfpNetworkCode = "foo";
    o.dfpNetworkName = "foo";
    o.programmaticPlacementAccepted = true;
    o.pubPaidPlacementAccepted = true;
    o.publisherPortalOnly = true;
  }
  buildCounterDfpSettings--;
  return o;
}

checkDfpSettings(api.DfpSettings o) {
  buildCounterDfpSettings++;
  if (buildCounterDfpSettings < 3) {
    unittest.expect(o.dfpNetworkCode, unittest.equals('foo'));
    unittest.expect(o.dfpNetworkName, unittest.equals('foo'));
    unittest.expect(o.programmaticPlacementAccepted, unittest.isTrue);
    unittest.expect(o.pubPaidPlacementAccepted, unittest.isTrue);
    unittest.expect(o.publisherPortalOnly, unittest.isTrue);
  }
  buildCounterDfpSettings--;
}

core.int buildCounterDimension = 0;
buildDimension() {
  var o = new api.Dimension();
  buildCounterDimension++;
  if (buildCounterDimension < 3) {
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterDimension--;
  return o;
}

checkDimension(api.Dimension o) {
  buildCounterDimension++;
  if (buildCounterDimension < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterDimension--;
}

core.int buildCounterDimensionFilter = 0;
buildDimensionFilter() {
  var o = new api.DimensionFilter();
  buildCounterDimensionFilter++;
  if (buildCounterDimensionFilter < 3) {
    o.dimensionName = "foo";
    o.kind = "foo";
    o.value = "foo";
  }
  buildCounterDimensionFilter--;
  return o;
}

checkDimensionFilter(api.DimensionFilter o) {
  buildCounterDimensionFilter++;
  if (buildCounterDimensionFilter < 3) {
    unittest.expect(o.dimensionName, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterDimensionFilter--;
}

core.int buildCounterDimensionValue = 0;
buildDimensionValue() {
  var o = new api.DimensionValue();
  buildCounterDimensionValue++;
  if (buildCounterDimensionValue < 3) {
    o.dimensionName = "foo";
    o.etag = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.matchType = "foo";
    o.value = "foo";
  }
  buildCounterDimensionValue--;
  return o;
}

checkDimensionValue(api.DimensionValue o) {
  buildCounterDimensionValue++;
  if (buildCounterDimensionValue < 3) {
    unittest.expect(o.dimensionName, unittest.equals('foo'));
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.matchType, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterDimensionValue--;
}

buildUnnamed5125() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5125(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

core.int buildCounterDimensionValueList = 0;
buildDimensionValueList() {
  var o = new api.DimensionValueList();
  buildCounterDimensionValueList++;
  if (buildCounterDimensionValueList < 3) {
    o.etag = "foo";
    o.items = buildUnnamed5125();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterDimensionValueList--;
  return o;
}

checkDimensionValueList(api.DimensionValueList o) {
  buildCounterDimensionValueList++;
  if (buildCounterDimensionValueList < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed5125(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterDimensionValueList--;
}

buildUnnamed5126() {
  var o = new core.List<api.DimensionFilter>();
  o.add(buildDimensionFilter());
  o.add(buildDimensionFilter());
  return o;
}

checkUnnamed5126(core.List<api.DimensionFilter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionFilter(o[0]);
  checkDimensionFilter(o[1]);
}

core.int buildCounterDimensionValueRequest = 0;
buildDimensionValueRequest() {
  var o = new api.DimensionValueRequest();
  buildCounterDimensionValueRequest++;
  if (buildCounterDimensionValueRequest < 3) {
    o.dimensionName = "foo";
    o.endDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.filters = buildUnnamed5126();
    o.kind = "foo";
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02Z");
  }
  buildCounterDimensionValueRequest--;
  return o;
}

checkDimensionValueRequest(api.DimensionValueRequest o) {
  buildCounterDimensionValueRequest++;
  if (buildCounterDimensionValueRequest < 3) {
    unittest.expect(o.dimensionName, unittest.equals('foo'));
    unittest.expect(
        o.endDate, unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    checkUnnamed5126(o.filters);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.startDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
  }
  buildCounterDimensionValueRequest--;
}

buildUnnamed5127() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5127(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5128() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5128(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDirectorySite = 0;
buildDirectorySite() {
  var o = new api.DirectorySite();
  buildCounterDirectorySite++;
  if (buildCounterDirectorySite < 3) {
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.inpageTagFormats = buildUnnamed5127();
    o.interstitialTagFormats = buildUnnamed5128();
    o.kind = "foo";
    o.name = "foo";
    o.settings = buildDirectorySiteSettings();
    o.url = "foo";
  }
  buildCounterDirectorySite--;
  return o;
}

checkDirectorySite(api.DirectorySite o) {
  buildCounterDirectorySite++;
  if (buildCounterDirectorySite < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    checkUnnamed5127(o.inpageTagFormats);
    checkUnnamed5128(o.interstitialTagFormats);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkDirectorySiteSettings(o.settings);
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterDirectorySite--;
}

core.int buildCounterDirectorySiteSettings = 0;
buildDirectorySiteSettings() {
  var o = new api.DirectorySiteSettings();
  buildCounterDirectorySiteSettings++;
  if (buildCounterDirectorySiteSettings < 3) {
    o.activeViewOptOut = true;
    o.dfpSettings = buildDfpSettings();
    o.instreamVideoPlacementAccepted = true;
    o.interstitialPlacementAccepted = true;
  }
  buildCounterDirectorySiteSettings--;
  return o;
}

checkDirectorySiteSettings(api.DirectorySiteSettings o) {
  buildCounterDirectorySiteSettings++;
  if (buildCounterDirectorySiteSettings < 3) {
    unittest.expect(o.activeViewOptOut, unittest.isTrue);
    checkDfpSettings(o.dfpSettings);
    unittest.expect(o.instreamVideoPlacementAccepted, unittest.isTrue);
    unittest.expect(o.interstitialPlacementAccepted, unittest.isTrue);
  }
  buildCounterDirectorySiteSettings--;
}

buildUnnamed5129() {
  var o = new core.List<api.DirectorySite>();
  o.add(buildDirectorySite());
  o.add(buildDirectorySite());
  return o;
}

checkUnnamed5129(core.List<api.DirectorySite> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDirectorySite(o[0]);
  checkDirectorySite(o[1]);
}

core.int buildCounterDirectorySitesListResponse = 0;
buildDirectorySitesListResponse() {
  var o = new api.DirectorySitesListResponse();
  buildCounterDirectorySitesListResponse++;
  if (buildCounterDirectorySitesListResponse < 3) {
    o.directorySites = buildUnnamed5129();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterDirectorySitesListResponse--;
  return o;
}

checkDirectorySitesListResponse(api.DirectorySitesListResponse o) {
  buildCounterDirectorySitesListResponse++;
  if (buildCounterDirectorySitesListResponse < 3) {
    checkUnnamed5129(o.directorySites);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterDirectorySitesListResponse--;
}

core.int buildCounterDynamicTargetingKey = 0;
buildDynamicTargetingKey() {
  var o = new api.DynamicTargetingKey();
  buildCounterDynamicTargetingKey++;
  if (buildCounterDynamicTargetingKey < 3) {
    o.kind = "foo";
    o.name = "foo";
    o.objectId = "foo";
    o.objectType = "foo";
  }
  buildCounterDynamicTargetingKey--;
  return o;
}

checkDynamicTargetingKey(api.DynamicTargetingKey o) {
  buildCounterDynamicTargetingKey++;
  if (buildCounterDynamicTargetingKey < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.objectId, unittest.equals('foo'));
    unittest.expect(o.objectType, unittest.equals('foo'));
  }
  buildCounterDynamicTargetingKey--;
}

buildUnnamed5130() {
  var o = new core.List<api.DynamicTargetingKey>();
  o.add(buildDynamicTargetingKey());
  o.add(buildDynamicTargetingKey());
  return o;
}

checkUnnamed5130(core.List<api.DynamicTargetingKey> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDynamicTargetingKey(o[0]);
  checkDynamicTargetingKey(o[1]);
}

core.int buildCounterDynamicTargetingKeysListResponse = 0;
buildDynamicTargetingKeysListResponse() {
  var o = new api.DynamicTargetingKeysListResponse();
  buildCounterDynamicTargetingKeysListResponse++;
  if (buildCounterDynamicTargetingKeysListResponse < 3) {
    o.dynamicTargetingKeys = buildUnnamed5130();
    o.kind = "foo";
  }
  buildCounterDynamicTargetingKeysListResponse--;
  return o;
}

checkDynamicTargetingKeysListResponse(api.DynamicTargetingKeysListResponse o) {
  buildCounterDynamicTargetingKeysListResponse++;
  if (buildCounterDynamicTargetingKeysListResponse < 3) {
    checkUnnamed5130(o.dynamicTargetingKeys);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterDynamicTargetingKeysListResponse--;
}

core.int buildCounterEncryptionInfo = 0;
buildEncryptionInfo() {
  var o = new api.EncryptionInfo();
  buildCounterEncryptionInfo++;
  if (buildCounterEncryptionInfo < 3) {
    o.encryptionEntityId = "foo";
    o.encryptionEntityType = "foo";
    o.encryptionSource = "foo";
    o.kind = "foo";
  }
  buildCounterEncryptionInfo--;
  return o;
}

checkEncryptionInfo(api.EncryptionInfo o) {
  buildCounterEncryptionInfo++;
  if (buildCounterEncryptionInfo < 3) {
    unittest.expect(o.encryptionEntityId, unittest.equals('foo'));
    unittest.expect(o.encryptionEntityType, unittest.equals('foo'));
    unittest.expect(o.encryptionSource, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterEncryptionInfo--;
}

buildUnnamed5131() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5131(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterEventTag = 0;
buildEventTag() {
  var o = new api.EventTag();
  buildCounterEventTag++;
  if (buildCounterEventTag < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.campaignId = "foo";
    o.campaignIdDimensionValue = buildDimensionValue();
    o.enabledByDefault = true;
    o.excludeFromAdxRequests = true;
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.siteFilterType = "foo";
    o.siteIds = buildUnnamed5131();
    o.sslCompliant = true;
    o.status = "foo";
    o.subaccountId = "foo";
    o.type = "foo";
    o.url = "foo";
    o.urlEscapeLevels = 42;
  }
  buildCounterEventTag--;
  return o;
}

checkEventTag(api.EventTag o) {
  buildCounterEventTag++;
  if (buildCounterEventTag < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.campaignId, unittest.equals('foo'));
    checkDimensionValue(o.campaignIdDimensionValue);
    unittest.expect(o.enabledByDefault, unittest.isTrue);
    unittest.expect(o.excludeFromAdxRequests, unittest.isTrue);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.siteFilterType, unittest.equals('foo'));
    checkUnnamed5131(o.siteIds);
    unittest.expect(o.sslCompliant, unittest.isTrue);
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
    unittest.expect(o.urlEscapeLevels, unittest.equals(42));
  }
  buildCounterEventTag--;
}

core.int buildCounterEventTagOverride = 0;
buildEventTagOverride() {
  var o = new api.EventTagOverride();
  buildCounterEventTagOverride++;
  if (buildCounterEventTagOverride < 3) {
    o.enabled = true;
    o.id = "foo";
  }
  buildCounterEventTagOverride--;
  return o;
}

checkEventTagOverride(api.EventTagOverride o) {
  buildCounterEventTagOverride++;
  if (buildCounterEventTagOverride < 3) {
    unittest.expect(o.enabled, unittest.isTrue);
    unittest.expect(o.id, unittest.equals('foo'));
  }
  buildCounterEventTagOverride--;
}

buildUnnamed5132() {
  var o = new core.List<api.EventTag>();
  o.add(buildEventTag());
  o.add(buildEventTag());
  return o;
}

checkUnnamed5132(core.List<api.EventTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEventTag(o[0]);
  checkEventTag(o[1]);
}

core.int buildCounterEventTagsListResponse = 0;
buildEventTagsListResponse() {
  var o = new api.EventTagsListResponse();
  buildCounterEventTagsListResponse++;
  if (buildCounterEventTagsListResponse < 3) {
    o.eventTags = buildUnnamed5132();
    o.kind = "foo";
  }
  buildCounterEventTagsListResponse--;
  return o;
}

checkEventTagsListResponse(api.EventTagsListResponse o) {
  buildCounterEventTagsListResponse++;
  if (buildCounterEventTagsListResponse < 3) {
    checkUnnamed5132(o.eventTags);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterEventTagsListResponse--;
}

core.int buildCounterFileUrls = 0;
buildFileUrls() {
  var o = new api.FileUrls();
  buildCounterFileUrls++;
  if (buildCounterFileUrls < 3) {
    o.apiUrl = "foo";
    o.browserUrl = "foo";
  }
  buildCounterFileUrls--;
  return o;
}

checkFileUrls(api.FileUrls o) {
  buildCounterFileUrls++;
  if (buildCounterFileUrls < 3) {
    unittest.expect(o.apiUrl, unittest.equals('foo'));
    unittest.expect(o.browserUrl, unittest.equals('foo'));
  }
  buildCounterFileUrls--;
}

core.int buildCounterFile = 0;
buildFile() {
  var o = new api.File();
  buildCounterFile++;
  if (buildCounterFile < 3) {
    o.dateRange = buildDateRange();
    o.etag = "foo";
    o.fileName = "foo";
    o.format = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.lastModifiedTime = "foo";
    o.reportId = "foo";
    o.status = "foo";
    o.urls = buildFileUrls();
  }
  buildCounterFile--;
  return o;
}

checkFile(api.File o) {
  buildCounterFile++;
  if (buildCounterFile < 3) {
    checkDateRange(o.dateRange);
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.fileName, unittest.equals('foo'));
    unittest.expect(o.format, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.lastModifiedTime, unittest.equals('foo'));
    unittest.expect(o.reportId, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    checkFileUrls(o.urls);
  }
  buildCounterFile--;
}

buildUnnamed5133() {
  var o = new core.List<api.File>();
  o.add(buildFile());
  o.add(buildFile());
  return o;
}

checkUnnamed5133(core.List<api.File> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFile(o[0]);
  checkFile(o[1]);
}

core.int buildCounterFileList = 0;
buildFileList() {
  var o = new api.FileList();
  buildCounterFileList++;
  if (buildCounterFileList < 3) {
    o.etag = "foo";
    o.items = buildUnnamed5133();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterFileList--;
  return o;
}

checkFileList(api.FileList o) {
  buildCounterFileList++;
  if (buildCounterFileList < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed5133(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterFileList--;
}

core.int buildCounterFlight = 0;
buildFlight() {
  var o = new api.Flight();
  buildCounterFlight++;
  if (buildCounterFlight < 3) {
    o.endDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.rateOrCost = "foo";
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.units = "foo";
  }
  buildCounterFlight--;
  return o;
}

checkFlight(api.Flight o) {
  buildCounterFlight++;
  if (buildCounterFlight < 3) {
    unittest.expect(
        o.endDate, unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.rateOrCost, unittest.equals('foo'));
    unittest.expect(o.startDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.units, unittest.equals('foo'));
  }
  buildCounterFlight--;
}

core.int buildCounterFloodlightActivitiesGenerateTagResponse = 0;
buildFloodlightActivitiesGenerateTagResponse() {
  var o = new api.FloodlightActivitiesGenerateTagResponse();
  buildCounterFloodlightActivitiesGenerateTagResponse++;
  if (buildCounterFloodlightActivitiesGenerateTagResponse < 3) {
    o.floodlightActivityTag = "foo";
    o.globalSiteTagGlobalSnippet = "foo";
    o.kind = "foo";
  }
  buildCounterFloodlightActivitiesGenerateTagResponse--;
  return o;
}

checkFloodlightActivitiesGenerateTagResponse(
    api.FloodlightActivitiesGenerateTagResponse o) {
  buildCounterFloodlightActivitiesGenerateTagResponse++;
  if (buildCounterFloodlightActivitiesGenerateTagResponse < 3) {
    unittest.expect(o.floodlightActivityTag, unittest.equals('foo'));
    unittest.expect(o.globalSiteTagGlobalSnippet, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterFloodlightActivitiesGenerateTagResponse--;
}

buildUnnamed5134() {
  var o = new core.List<api.FloodlightActivity>();
  o.add(buildFloodlightActivity());
  o.add(buildFloodlightActivity());
  return o;
}

checkUnnamed5134(core.List<api.FloodlightActivity> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFloodlightActivity(o[0]);
  checkFloodlightActivity(o[1]);
}

core.int buildCounterFloodlightActivitiesListResponse = 0;
buildFloodlightActivitiesListResponse() {
  var o = new api.FloodlightActivitiesListResponse();
  buildCounterFloodlightActivitiesListResponse++;
  if (buildCounterFloodlightActivitiesListResponse < 3) {
    o.floodlightActivities = buildUnnamed5134();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterFloodlightActivitiesListResponse--;
  return o;
}

checkFloodlightActivitiesListResponse(api.FloodlightActivitiesListResponse o) {
  buildCounterFloodlightActivitiesListResponse++;
  if (buildCounterFloodlightActivitiesListResponse < 3) {
    checkUnnamed5134(o.floodlightActivities);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterFloodlightActivitiesListResponse--;
}

buildUnnamed5135() {
  var o = new core.List<api.FloodlightActivityDynamicTag>();
  o.add(buildFloodlightActivityDynamicTag());
  o.add(buildFloodlightActivityDynamicTag());
  return o;
}

checkUnnamed5135(core.List<api.FloodlightActivityDynamicTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFloodlightActivityDynamicTag(o[0]);
  checkFloodlightActivityDynamicTag(o[1]);
}

buildUnnamed5136() {
  var o = new core.List<api.FloodlightActivityPublisherDynamicTag>();
  o.add(buildFloodlightActivityPublisherDynamicTag());
  o.add(buildFloodlightActivityPublisherDynamicTag());
  return o;
}

checkUnnamed5136(core.List<api.FloodlightActivityPublisherDynamicTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFloodlightActivityPublisherDynamicTag(o[0]);
  checkFloodlightActivityPublisherDynamicTag(o[1]);
}

buildUnnamed5137() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5137(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterFloodlightActivity = 0;
buildFloodlightActivity() {
  var o = new api.FloodlightActivity();
  buildCounterFloodlightActivity++;
  if (buildCounterFloodlightActivity < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.cacheBustingType = "foo";
    o.countingMethod = "foo";
    o.defaultTags = buildUnnamed5135();
    o.expectedUrl = "foo";
    o.floodlightActivityGroupId = "foo";
    o.floodlightActivityGroupName = "foo";
    o.floodlightActivityGroupTagString = "foo";
    o.floodlightActivityGroupType = "foo";
    o.floodlightConfigurationId = "foo";
    o.floodlightConfigurationIdDimensionValue = buildDimensionValue();
    o.floodlightTagType = "foo";
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.kind = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.publisherTags = buildUnnamed5136();
    o.secure = true;
    o.sslCompliant = true;
    o.sslRequired = true;
    o.status = "foo";
    o.subaccountId = "foo";
    o.tagFormat = "foo";
    o.tagString = "foo";
    o.userDefinedVariableTypes = buildUnnamed5137();
  }
  buildCounterFloodlightActivity--;
  return o;
}

checkFloodlightActivity(api.FloodlightActivity o) {
  buildCounterFloodlightActivity++;
  if (buildCounterFloodlightActivity < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.cacheBustingType, unittest.equals('foo'));
    unittest.expect(o.countingMethod, unittest.equals('foo'));
    checkUnnamed5135(o.defaultTags);
    unittest.expect(o.expectedUrl, unittest.equals('foo'));
    unittest.expect(o.floodlightActivityGroupId, unittest.equals('foo'));
    unittest.expect(o.floodlightActivityGroupName, unittest.equals('foo'));
    unittest.expect(o.floodlightActivityGroupTagString, unittest.equals('foo'));
    unittest.expect(o.floodlightActivityGroupType, unittest.equals('foo'));
    unittest.expect(o.floodlightConfigurationId, unittest.equals('foo'));
    checkDimensionValue(o.floodlightConfigurationIdDimensionValue);
    unittest.expect(o.floodlightTagType, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkUnnamed5136(o.publisherTags);
    unittest.expect(o.secure, unittest.isTrue);
    unittest.expect(o.sslCompliant, unittest.isTrue);
    unittest.expect(o.sslRequired, unittest.isTrue);
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.tagFormat, unittest.equals('foo'));
    unittest.expect(o.tagString, unittest.equals('foo'));
    checkUnnamed5137(o.userDefinedVariableTypes);
  }
  buildCounterFloodlightActivity--;
}

core.int buildCounterFloodlightActivityDynamicTag = 0;
buildFloodlightActivityDynamicTag() {
  var o = new api.FloodlightActivityDynamicTag();
  buildCounterFloodlightActivityDynamicTag++;
  if (buildCounterFloodlightActivityDynamicTag < 3) {
    o.id = "foo";
    o.name = "foo";
    o.tag = "foo";
  }
  buildCounterFloodlightActivityDynamicTag--;
  return o;
}

checkFloodlightActivityDynamicTag(api.FloodlightActivityDynamicTag o) {
  buildCounterFloodlightActivityDynamicTag++;
  if (buildCounterFloodlightActivityDynamicTag < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.tag, unittest.equals('foo'));
  }
  buildCounterFloodlightActivityDynamicTag--;
}

core.int buildCounterFloodlightActivityGroup = 0;
buildFloodlightActivityGroup() {
  var o = new api.FloodlightActivityGroup();
  buildCounterFloodlightActivityGroup++;
  if (buildCounterFloodlightActivityGroup < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.floodlightConfigurationId = "foo";
    o.floodlightConfigurationIdDimensionValue = buildDimensionValue();
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.kind = "foo";
    o.name = "foo";
    o.subaccountId = "foo";
    o.tagString = "foo";
    o.type = "foo";
  }
  buildCounterFloodlightActivityGroup--;
  return o;
}

checkFloodlightActivityGroup(api.FloodlightActivityGroup o) {
  buildCounterFloodlightActivityGroup++;
  if (buildCounterFloodlightActivityGroup < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.floodlightConfigurationId, unittest.equals('foo'));
    checkDimensionValue(o.floodlightConfigurationIdDimensionValue);
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.tagString, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterFloodlightActivityGroup--;
}

buildUnnamed5138() {
  var o = new core.List<api.FloodlightActivityGroup>();
  o.add(buildFloodlightActivityGroup());
  o.add(buildFloodlightActivityGroup());
  return o;
}

checkUnnamed5138(core.List<api.FloodlightActivityGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFloodlightActivityGroup(o[0]);
  checkFloodlightActivityGroup(o[1]);
}

core.int buildCounterFloodlightActivityGroupsListResponse = 0;
buildFloodlightActivityGroupsListResponse() {
  var o = new api.FloodlightActivityGroupsListResponse();
  buildCounterFloodlightActivityGroupsListResponse++;
  if (buildCounterFloodlightActivityGroupsListResponse < 3) {
    o.floodlightActivityGroups = buildUnnamed5138();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterFloodlightActivityGroupsListResponse--;
  return o;
}

checkFloodlightActivityGroupsListResponse(
    api.FloodlightActivityGroupsListResponse o) {
  buildCounterFloodlightActivityGroupsListResponse++;
  if (buildCounterFloodlightActivityGroupsListResponse < 3) {
    checkUnnamed5138(o.floodlightActivityGroups);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterFloodlightActivityGroupsListResponse--;
}

core.int buildCounterFloodlightActivityPublisherDynamicTag = 0;
buildFloodlightActivityPublisherDynamicTag() {
  var o = new api.FloodlightActivityPublisherDynamicTag();
  buildCounterFloodlightActivityPublisherDynamicTag++;
  if (buildCounterFloodlightActivityPublisherDynamicTag < 3) {
    o.clickThrough = true;
    o.directorySiteId = "foo";
    o.dynamicTag = buildFloodlightActivityDynamicTag();
    o.siteId = "foo";
    o.siteIdDimensionValue = buildDimensionValue();
    o.viewThrough = true;
  }
  buildCounterFloodlightActivityPublisherDynamicTag--;
  return o;
}

checkFloodlightActivityPublisherDynamicTag(
    api.FloodlightActivityPublisherDynamicTag o) {
  buildCounterFloodlightActivityPublisherDynamicTag++;
  if (buildCounterFloodlightActivityPublisherDynamicTag < 3) {
    unittest.expect(o.clickThrough, unittest.isTrue);
    unittest.expect(o.directorySiteId, unittest.equals('foo'));
    checkFloodlightActivityDynamicTag(o.dynamicTag);
    unittest.expect(o.siteId, unittest.equals('foo'));
    checkDimensionValue(o.siteIdDimensionValue);
    unittest.expect(o.viewThrough, unittest.isTrue);
  }
  buildCounterFloodlightActivityPublisherDynamicTag--;
}

buildUnnamed5139() {
  var o = new core.List<api.ThirdPartyAuthenticationToken>();
  o.add(buildThirdPartyAuthenticationToken());
  o.add(buildThirdPartyAuthenticationToken());
  return o;
}

checkUnnamed5139(core.List<api.ThirdPartyAuthenticationToken> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkThirdPartyAuthenticationToken(o[0]);
  checkThirdPartyAuthenticationToken(o[1]);
}

buildUnnamed5140() {
  var o = new core.List<api.UserDefinedVariableConfiguration>();
  o.add(buildUserDefinedVariableConfiguration());
  o.add(buildUserDefinedVariableConfiguration());
  return o;
}

checkUnnamed5140(core.List<api.UserDefinedVariableConfiguration> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserDefinedVariableConfiguration(o[0]);
  checkUserDefinedVariableConfiguration(o[1]);
}

core.int buildCounterFloodlightConfiguration = 0;
buildFloodlightConfiguration() {
  var o = new api.FloodlightConfiguration();
  buildCounterFloodlightConfiguration++;
  if (buildCounterFloodlightConfiguration < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.analyticsDataSharingEnabled = true;
    o.customViewabilityMetric = buildCustomViewabilityMetric();
    o.exposureToConversionEnabled = true;
    o.firstDayOfWeek = "foo";
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.inAppAttributionTrackingEnabled = true;
    o.kind = "foo";
    o.lookbackConfiguration = buildLookbackConfiguration();
    o.naturalSearchConversionAttributionOption = "foo";
    o.omnitureSettings = buildOmnitureSettings();
    o.subaccountId = "foo";
    o.tagSettings = buildTagSettings();
    o.thirdPartyAuthenticationTokens = buildUnnamed5139();
    o.userDefinedVariableConfigurations = buildUnnamed5140();
  }
  buildCounterFloodlightConfiguration--;
  return o;
}

checkFloodlightConfiguration(api.FloodlightConfiguration o) {
  buildCounterFloodlightConfiguration++;
  if (buildCounterFloodlightConfiguration < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.analyticsDataSharingEnabled, unittest.isTrue);
    checkCustomViewabilityMetric(o.customViewabilityMetric);
    unittest.expect(o.exposureToConversionEnabled, unittest.isTrue);
    unittest.expect(o.firstDayOfWeek, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.inAppAttributionTrackingEnabled, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLookbackConfiguration(o.lookbackConfiguration);
    unittest.expect(
        o.naturalSearchConversionAttributionOption, unittest.equals('foo'));
    checkOmnitureSettings(o.omnitureSettings);
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    checkTagSettings(o.tagSettings);
    checkUnnamed5139(o.thirdPartyAuthenticationTokens);
    checkUnnamed5140(o.userDefinedVariableConfigurations);
  }
  buildCounterFloodlightConfiguration--;
}

buildUnnamed5141() {
  var o = new core.List<api.FloodlightConfiguration>();
  o.add(buildFloodlightConfiguration());
  o.add(buildFloodlightConfiguration());
  return o;
}

checkUnnamed5141(core.List<api.FloodlightConfiguration> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFloodlightConfiguration(o[0]);
  checkFloodlightConfiguration(o[1]);
}

core.int buildCounterFloodlightConfigurationsListResponse = 0;
buildFloodlightConfigurationsListResponse() {
  var o = new api.FloodlightConfigurationsListResponse();
  buildCounterFloodlightConfigurationsListResponse++;
  if (buildCounterFloodlightConfigurationsListResponse < 3) {
    o.floodlightConfigurations = buildUnnamed5141();
    o.kind = "foo";
  }
  buildCounterFloodlightConfigurationsListResponse--;
  return o;
}

checkFloodlightConfigurationsListResponse(
    api.FloodlightConfigurationsListResponse o) {
  buildCounterFloodlightConfigurationsListResponse++;
  if (buildCounterFloodlightConfigurationsListResponse < 3) {
    checkUnnamed5141(o.floodlightConfigurations);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterFloodlightConfigurationsListResponse--;
}

buildUnnamed5142() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5142(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5143() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5143(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5144() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed5144(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

core.int buildCounterFloodlightReportCompatibleFields = 0;
buildFloodlightReportCompatibleFields() {
  var o = new api.FloodlightReportCompatibleFields();
  buildCounterFloodlightReportCompatibleFields++;
  if (buildCounterFloodlightReportCompatibleFields < 3) {
    o.dimensionFilters = buildUnnamed5142();
    o.dimensions = buildUnnamed5143();
    o.kind = "foo";
    o.metrics = buildUnnamed5144();
  }
  buildCounterFloodlightReportCompatibleFields--;
  return o;
}

checkFloodlightReportCompatibleFields(api.FloodlightReportCompatibleFields o) {
  buildCounterFloodlightReportCompatibleFields++;
  if (buildCounterFloodlightReportCompatibleFields < 3) {
    checkUnnamed5142(o.dimensionFilters);
    checkUnnamed5143(o.dimensions);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5144(o.metrics);
  }
  buildCounterFloodlightReportCompatibleFields--;
}

core.int buildCounterFrequencyCap = 0;
buildFrequencyCap() {
  var o = new api.FrequencyCap();
  buildCounterFrequencyCap++;
  if (buildCounterFrequencyCap < 3) {
    o.duration = "foo";
    o.impressions = "foo";
  }
  buildCounterFrequencyCap--;
  return o;
}

checkFrequencyCap(api.FrequencyCap o) {
  buildCounterFrequencyCap++;
  if (buildCounterFrequencyCap < 3) {
    unittest.expect(o.duration, unittest.equals('foo'));
    unittest.expect(o.impressions, unittest.equals('foo'));
  }
  buildCounterFrequencyCap--;
}

core.int buildCounterFsCommand = 0;
buildFsCommand() {
  var o = new api.FsCommand();
  buildCounterFsCommand++;
  if (buildCounterFsCommand < 3) {
    o.left = 42;
    o.positionOption = "foo";
    o.top = 42;
    o.windowHeight = 42;
    o.windowWidth = 42;
  }
  buildCounterFsCommand--;
  return o;
}

checkFsCommand(api.FsCommand o) {
  buildCounterFsCommand++;
  if (buildCounterFsCommand < 3) {
    unittest.expect(o.left, unittest.equals(42));
    unittest.expect(o.positionOption, unittest.equals('foo'));
    unittest.expect(o.top, unittest.equals(42));
    unittest.expect(o.windowHeight, unittest.equals(42));
    unittest.expect(o.windowWidth, unittest.equals(42));
  }
  buildCounterFsCommand--;
}

buildUnnamed5145() {
  var o = new core.List<api.City>();
  o.add(buildCity());
  o.add(buildCity());
  return o;
}

checkUnnamed5145(core.List<api.City> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCity(o[0]);
  checkCity(o[1]);
}

buildUnnamed5146() {
  var o = new core.List<api.Country>();
  o.add(buildCountry());
  o.add(buildCountry());
  return o;
}

checkUnnamed5146(core.List<api.Country> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCountry(o[0]);
  checkCountry(o[1]);
}

buildUnnamed5147() {
  var o = new core.List<api.Metro>();
  o.add(buildMetro());
  o.add(buildMetro());
  return o;
}

checkUnnamed5147(core.List<api.Metro> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetro(o[0]);
  checkMetro(o[1]);
}

buildUnnamed5148() {
  var o = new core.List<api.PostalCode>();
  o.add(buildPostalCode());
  o.add(buildPostalCode());
  return o;
}

checkUnnamed5148(core.List<api.PostalCode> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPostalCode(o[0]);
  checkPostalCode(o[1]);
}

buildUnnamed5149() {
  var o = new core.List<api.Region>();
  o.add(buildRegion());
  o.add(buildRegion());
  return o;
}

checkUnnamed5149(core.List<api.Region> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRegion(o[0]);
  checkRegion(o[1]);
}

core.int buildCounterGeoTargeting = 0;
buildGeoTargeting() {
  var o = new api.GeoTargeting();
  buildCounterGeoTargeting++;
  if (buildCounterGeoTargeting < 3) {
    o.cities = buildUnnamed5145();
    o.countries = buildUnnamed5146();
    o.excludeCountries = true;
    o.metros = buildUnnamed5147();
    o.postalCodes = buildUnnamed5148();
    o.regions = buildUnnamed5149();
  }
  buildCounterGeoTargeting--;
  return o;
}

checkGeoTargeting(api.GeoTargeting o) {
  buildCounterGeoTargeting++;
  if (buildCounterGeoTargeting < 3) {
    checkUnnamed5145(o.cities);
    checkUnnamed5146(o.countries);
    unittest.expect(o.excludeCountries, unittest.isTrue);
    checkUnnamed5147(o.metros);
    checkUnnamed5148(o.postalCodes);
    checkUnnamed5149(o.regions);
  }
  buildCounterGeoTargeting--;
}

buildUnnamed5150() {
  var o = new core.List<api.AdSlot>();
  o.add(buildAdSlot());
  o.add(buildAdSlot());
  return o;
}

checkUnnamed5150(core.List<api.AdSlot> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAdSlot(o[0]);
  checkAdSlot(o[1]);
}

core.int buildCounterInventoryItem = 0;
buildInventoryItem() {
  var o = new api.InventoryItem();
  buildCounterInventoryItem++;
  if (buildCounterInventoryItem < 3) {
    o.accountId = "foo";
    o.adSlots = buildUnnamed5150();
    o.advertiserId = "foo";
    o.contentCategoryId = "foo";
    o.estimatedClickThroughRate = "foo";
    o.estimatedConversionRate = "foo";
    o.id = "foo";
    o.inPlan = true;
    o.kind = "foo";
    o.lastModifiedInfo = buildLastModifiedInfo();
    o.name = "foo";
    o.negotiationChannelId = "foo";
    o.orderId = "foo";
    o.placementStrategyId = "foo";
    o.pricing = buildPricing();
    o.projectId = "foo";
    o.rfpId = "foo";
    o.siteId = "foo";
    o.subaccountId = "foo";
    o.type = "foo";
  }
  buildCounterInventoryItem--;
  return o;
}

checkInventoryItem(api.InventoryItem o) {
  buildCounterInventoryItem++;
  if (buildCounterInventoryItem < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed5150(o.adSlots);
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    unittest.expect(o.contentCategoryId, unittest.equals('foo'));
    unittest.expect(o.estimatedClickThroughRate, unittest.equals('foo'));
    unittest.expect(o.estimatedConversionRate, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.inPlan, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLastModifiedInfo(o.lastModifiedInfo);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.negotiationChannelId, unittest.equals('foo'));
    unittest.expect(o.orderId, unittest.equals('foo'));
    unittest.expect(o.placementStrategyId, unittest.equals('foo'));
    checkPricing(o.pricing);
    unittest.expect(o.projectId, unittest.equals('foo'));
    unittest.expect(o.rfpId, unittest.equals('foo'));
    unittest.expect(o.siteId, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterInventoryItem--;
}

buildUnnamed5151() {
  var o = new core.List<api.InventoryItem>();
  o.add(buildInventoryItem());
  o.add(buildInventoryItem());
  return o;
}

checkUnnamed5151(core.List<api.InventoryItem> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInventoryItem(o[0]);
  checkInventoryItem(o[1]);
}

core.int buildCounterInventoryItemsListResponse = 0;
buildInventoryItemsListResponse() {
  var o = new api.InventoryItemsListResponse();
  buildCounterInventoryItemsListResponse++;
  if (buildCounterInventoryItemsListResponse < 3) {
    o.inventoryItems = buildUnnamed5151();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterInventoryItemsListResponse--;
  return o;
}

checkInventoryItemsListResponse(api.InventoryItemsListResponse o) {
  buildCounterInventoryItemsListResponse++;
  if (buildCounterInventoryItemsListResponse < 3) {
    checkUnnamed5151(o.inventoryItems);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterInventoryItemsListResponse--;
}

core.int buildCounterKeyValueTargetingExpression = 0;
buildKeyValueTargetingExpression() {
  var o = new api.KeyValueTargetingExpression();
  buildCounterKeyValueTargetingExpression++;
  if (buildCounterKeyValueTargetingExpression < 3) {
    o.expression = "foo";
  }
  buildCounterKeyValueTargetingExpression--;
  return o;
}

checkKeyValueTargetingExpression(api.KeyValueTargetingExpression o) {
  buildCounterKeyValueTargetingExpression++;
  if (buildCounterKeyValueTargetingExpression < 3) {
    unittest.expect(o.expression, unittest.equals('foo'));
  }
  buildCounterKeyValueTargetingExpression--;
}

buildUnnamed5152() {
  var o = new core.List<api.DeepLink>();
  o.add(buildDeepLink());
  o.add(buildDeepLink());
  return o;
}

checkUnnamed5152(core.List<api.DeepLink> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDeepLink(o[0]);
  checkDeepLink(o[1]);
}

core.int buildCounterLandingPage = 0;
buildLandingPage() {
  var o = new api.LandingPage();
  buildCounterLandingPage++;
  if (buildCounterLandingPage < 3) {
    o.advertiserId = "foo";
    o.archived = true;
    o.deepLinks = buildUnnamed5152();
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.url = "foo";
  }
  buildCounterLandingPage--;
  return o;
}

checkLandingPage(api.LandingPage o) {
  buildCounterLandingPage++;
  if (buildCounterLandingPage < 3) {
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    unittest.expect(o.archived, unittest.isTrue);
    checkUnnamed5152(o.deepLinks);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterLandingPage--;
}

core.int buildCounterLanguage = 0;
buildLanguage() {
  var o = new api.Language();
  buildCounterLanguage++;
  if (buildCounterLanguage < 3) {
    o.id = "foo";
    o.kind = "foo";
    o.languageCode = "foo";
    o.name = "foo";
  }
  buildCounterLanguage--;
  return o;
}

checkLanguage(api.Language o) {
  buildCounterLanguage++;
  if (buildCounterLanguage < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.languageCode, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterLanguage--;
}

buildUnnamed5153() {
  var o = new core.List<api.Language>();
  o.add(buildLanguage());
  o.add(buildLanguage());
  return o;
}

checkUnnamed5153(core.List<api.Language> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLanguage(o[0]);
  checkLanguage(o[1]);
}

core.int buildCounterLanguageTargeting = 0;
buildLanguageTargeting() {
  var o = new api.LanguageTargeting();
  buildCounterLanguageTargeting++;
  if (buildCounterLanguageTargeting < 3) {
    o.languages = buildUnnamed5153();
  }
  buildCounterLanguageTargeting--;
  return o;
}

checkLanguageTargeting(api.LanguageTargeting o) {
  buildCounterLanguageTargeting++;
  if (buildCounterLanguageTargeting < 3) {
    checkUnnamed5153(o.languages);
  }
  buildCounterLanguageTargeting--;
}

buildUnnamed5154() {
  var o = new core.List<api.Language>();
  o.add(buildLanguage());
  o.add(buildLanguage());
  return o;
}

checkUnnamed5154(core.List<api.Language> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLanguage(o[0]);
  checkLanguage(o[1]);
}

core.int buildCounterLanguagesListResponse = 0;
buildLanguagesListResponse() {
  var o = new api.LanguagesListResponse();
  buildCounterLanguagesListResponse++;
  if (buildCounterLanguagesListResponse < 3) {
    o.kind = "foo";
    o.languages = buildUnnamed5154();
  }
  buildCounterLanguagesListResponse--;
  return o;
}

checkLanguagesListResponse(api.LanguagesListResponse o) {
  buildCounterLanguagesListResponse++;
  if (buildCounterLanguagesListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5154(o.languages);
  }
  buildCounterLanguagesListResponse--;
}

core.int buildCounterLastModifiedInfo = 0;
buildLastModifiedInfo() {
  var o = new api.LastModifiedInfo();
  buildCounterLastModifiedInfo++;
  if (buildCounterLastModifiedInfo < 3) {
    o.time = "foo";
  }
  buildCounterLastModifiedInfo--;
  return o;
}

checkLastModifiedInfo(api.LastModifiedInfo o) {
  buildCounterLastModifiedInfo++;
  if (buildCounterLastModifiedInfo < 3) {
    unittest.expect(o.time, unittest.equals('foo'));
  }
  buildCounterLastModifiedInfo--;
}

buildUnnamed5155() {
  var o = new core.List<api.ListPopulationTerm>();
  o.add(buildListPopulationTerm());
  o.add(buildListPopulationTerm());
  return o;
}

checkUnnamed5155(core.List<api.ListPopulationTerm> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkListPopulationTerm(o[0]);
  checkListPopulationTerm(o[1]);
}

core.int buildCounterListPopulationClause = 0;
buildListPopulationClause() {
  var o = new api.ListPopulationClause();
  buildCounterListPopulationClause++;
  if (buildCounterListPopulationClause < 3) {
    o.terms = buildUnnamed5155();
  }
  buildCounterListPopulationClause--;
  return o;
}

checkListPopulationClause(api.ListPopulationClause o) {
  buildCounterListPopulationClause++;
  if (buildCounterListPopulationClause < 3) {
    checkUnnamed5155(o.terms);
  }
  buildCounterListPopulationClause--;
}

buildUnnamed5156() {
  var o = new core.List<api.ListPopulationClause>();
  o.add(buildListPopulationClause());
  o.add(buildListPopulationClause());
  return o;
}

checkUnnamed5156(core.List<api.ListPopulationClause> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkListPopulationClause(o[0]);
  checkListPopulationClause(o[1]);
}

core.int buildCounterListPopulationRule = 0;
buildListPopulationRule() {
  var o = new api.ListPopulationRule();
  buildCounterListPopulationRule++;
  if (buildCounterListPopulationRule < 3) {
    o.floodlightActivityId = "foo";
    o.floodlightActivityName = "foo";
    o.listPopulationClauses = buildUnnamed5156();
  }
  buildCounterListPopulationRule--;
  return o;
}

checkListPopulationRule(api.ListPopulationRule o) {
  buildCounterListPopulationRule++;
  if (buildCounterListPopulationRule < 3) {
    unittest.expect(o.floodlightActivityId, unittest.equals('foo'));
    unittest.expect(o.floodlightActivityName, unittest.equals('foo'));
    checkUnnamed5156(o.listPopulationClauses);
  }
  buildCounterListPopulationRule--;
}

core.int buildCounterListPopulationTerm = 0;
buildListPopulationTerm() {
  var o = new api.ListPopulationTerm();
  buildCounterListPopulationTerm++;
  if (buildCounterListPopulationTerm < 3) {
    o.contains = true;
    o.negation = true;
    o.operator = "foo";
    o.remarketingListId = "foo";
    o.type = "foo";
    o.value = "foo";
    o.variableFriendlyName = "foo";
    o.variableName = "foo";
  }
  buildCounterListPopulationTerm--;
  return o;
}

checkListPopulationTerm(api.ListPopulationTerm o) {
  buildCounterListPopulationTerm++;
  if (buildCounterListPopulationTerm < 3) {
    unittest.expect(o.contains, unittest.isTrue);
    unittest.expect(o.negation, unittest.isTrue);
    unittest.expect(o.operator, unittest.equals('foo'));
    unittest.expect(o.remarketingListId, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
    unittest.expect(o.variableFriendlyName, unittest.equals('foo'));
    unittest.expect(o.variableName, unittest.equals('foo'));
  }
  buildCounterListPopulationTerm--;
}

core.int buildCounterListTargetingExpression = 0;
buildListTargetingExpression() {
  var o = new api.ListTargetingExpression();
  buildCounterListTargetingExpression++;
  if (buildCounterListTargetingExpression < 3) {
    o.expression = "foo";
  }
  buildCounterListTargetingExpression--;
  return o;
}

checkListTargetingExpression(api.ListTargetingExpression o) {
  buildCounterListTargetingExpression++;
  if (buildCounterListTargetingExpression < 3) {
    unittest.expect(o.expression, unittest.equals('foo'));
  }
  buildCounterListTargetingExpression--;
}

core.int buildCounterLookbackConfiguration = 0;
buildLookbackConfiguration() {
  var o = new api.LookbackConfiguration();
  buildCounterLookbackConfiguration++;
  if (buildCounterLookbackConfiguration < 3) {
    o.clickDuration = 42;
    o.postImpressionActivitiesDuration = 42;
  }
  buildCounterLookbackConfiguration--;
  return o;
}

checkLookbackConfiguration(api.LookbackConfiguration o) {
  buildCounterLookbackConfiguration++;
  if (buildCounterLookbackConfiguration < 3) {
    unittest.expect(o.clickDuration, unittest.equals(42));
    unittest.expect(o.postImpressionActivitiesDuration, unittest.equals(42));
  }
  buildCounterLookbackConfiguration--;
}

core.int buildCounterMetric = 0;
buildMetric() {
  var o = new api.Metric();
  buildCounterMetric++;
  if (buildCounterMetric < 3) {
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterMetric--;
  return o;
}

checkMetric(api.Metric o) {
  buildCounterMetric++;
  if (buildCounterMetric < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterMetric--;
}

core.int buildCounterMetro = 0;
buildMetro() {
  var o = new api.Metro();
  buildCounterMetro++;
  if (buildCounterMetro < 3) {
    o.countryCode = "foo";
    o.countryDartId = "foo";
    o.dartId = "foo";
    o.dmaId = "foo";
    o.kind = "foo";
    o.metroCode = "foo";
    o.name = "foo";
  }
  buildCounterMetro--;
  return o;
}

checkMetro(api.Metro o) {
  buildCounterMetro++;
  if (buildCounterMetro < 3) {
    unittest.expect(o.countryCode, unittest.equals('foo'));
    unittest.expect(o.countryDartId, unittest.equals('foo'));
    unittest.expect(o.dartId, unittest.equals('foo'));
    unittest.expect(o.dmaId, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.metroCode, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterMetro--;
}

buildUnnamed5157() {
  var o = new core.List<api.Metro>();
  o.add(buildMetro());
  o.add(buildMetro());
  return o;
}

checkUnnamed5157(core.List<api.Metro> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetro(o[0]);
  checkMetro(o[1]);
}

core.int buildCounterMetrosListResponse = 0;
buildMetrosListResponse() {
  var o = new api.MetrosListResponse();
  buildCounterMetrosListResponse++;
  if (buildCounterMetrosListResponse < 3) {
    o.kind = "foo";
    o.metros = buildUnnamed5157();
  }
  buildCounterMetrosListResponse--;
  return o;
}

checkMetrosListResponse(api.MetrosListResponse o) {
  buildCounterMetrosListResponse++;
  if (buildCounterMetrosListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5157(o.metros);
  }
  buildCounterMetrosListResponse--;
}

core.int buildCounterMobileApp = 0;
buildMobileApp() {
  var o = new api.MobileApp();
  buildCounterMobileApp++;
  if (buildCounterMobileApp < 3) {
    o.directory = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.publisherName = "foo";
    o.title = "foo";
  }
  buildCounterMobileApp--;
  return o;
}

checkMobileApp(api.MobileApp o) {
  buildCounterMobileApp++;
  if (buildCounterMobileApp < 3) {
    unittest.expect(o.directory, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.publisherName, unittest.equals('foo'));
    unittest.expect(o.title, unittest.equals('foo'));
  }
  buildCounterMobileApp--;
}

buildUnnamed5158() {
  var o = new core.List<api.MobileApp>();
  o.add(buildMobileApp());
  o.add(buildMobileApp());
  return o;
}

checkUnnamed5158(core.List<api.MobileApp> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMobileApp(o[0]);
  checkMobileApp(o[1]);
}

core.int buildCounterMobileAppsListResponse = 0;
buildMobileAppsListResponse() {
  var o = new api.MobileAppsListResponse();
  buildCounterMobileAppsListResponse++;
  if (buildCounterMobileAppsListResponse < 3) {
    o.kind = "foo";
    o.mobileApps = buildUnnamed5158();
    o.nextPageToken = "foo";
  }
  buildCounterMobileAppsListResponse--;
  return o;
}

checkMobileAppsListResponse(api.MobileAppsListResponse o) {
  buildCounterMobileAppsListResponse++;
  if (buildCounterMobileAppsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5158(o.mobileApps);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterMobileAppsListResponse--;
}

core.int buildCounterMobileCarrier = 0;
buildMobileCarrier() {
  var o = new api.MobileCarrier();
  buildCounterMobileCarrier++;
  if (buildCounterMobileCarrier < 3) {
    o.countryCode = "foo";
    o.countryDartId = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterMobileCarrier--;
  return o;
}

checkMobileCarrier(api.MobileCarrier o) {
  buildCounterMobileCarrier++;
  if (buildCounterMobileCarrier < 3) {
    unittest.expect(o.countryCode, unittest.equals('foo'));
    unittest.expect(o.countryDartId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterMobileCarrier--;
}

buildUnnamed5159() {
  var o = new core.List<api.MobileCarrier>();
  o.add(buildMobileCarrier());
  o.add(buildMobileCarrier());
  return o;
}

checkUnnamed5159(core.List<api.MobileCarrier> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMobileCarrier(o[0]);
  checkMobileCarrier(o[1]);
}

core.int buildCounterMobileCarriersListResponse = 0;
buildMobileCarriersListResponse() {
  var o = new api.MobileCarriersListResponse();
  buildCounterMobileCarriersListResponse++;
  if (buildCounterMobileCarriersListResponse < 3) {
    o.kind = "foo";
    o.mobileCarriers = buildUnnamed5159();
  }
  buildCounterMobileCarriersListResponse--;
  return o;
}

checkMobileCarriersListResponse(api.MobileCarriersListResponse o) {
  buildCounterMobileCarriersListResponse++;
  if (buildCounterMobileCarriersListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5159(o.mobileCarriers);
  }
  buildCounterMobileCarriersListResponse--;
}

core.int buildCounterObaIcon = 0;
buildObaIcon() {
  var o = new api.ObaIcon();
  buildCounterObaIcon++;
  if (buildCounterObaIcon < 3) {
    o.iconClickThroughUrl = "foo";
    o.iconClickTrackingUrl = "foo";
    o.iconViewTrackingUrl = "foo";
    o.program = "foo";
    o.resourceUrl = "foo";
    o.size = buildSize();
    o.xPosition = "foo";
    o.yPosition = "foo";
  }
  buildCounterObaIcon--;
  return o;
}

checkObaIcon(api.ObaIcon o) {
  buildCounterObaIcon++;
  if (buildCounterObaIcon < 3) {
    unittest.expect(o.iconClickThroughUrl, unittest.equals('foo'));
    unittest.expect(o.iconClickTrackingUrl, unittest.equals('foo'));
    unittest.expect(o.iconViewTrackingUrl, unittest.equals('foo'));
    unittest.expect(o.program, unittest.equals('foo'));
    unittest.expect(o.resourceUrl, unittest.equals('foo'));
    checkSize(o.size);
    unittest.expect(o.xPosition, unittest.equals('foo'));
    unittest.expect(o.yPosition, unittest.equals('foo'));
  }
  buildCounterObaIcon--;
}

buildUnnamed5160() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5160(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterObjectFilter = 0;
buildObjectFilter() {
  var o = new api.ObjectFilter();
  buildCounterObjectFilter++;
  if (buildCounterObjectFilter < 3) {
    o.kind = "foo";
    o.objectIds = buildUnnamed5160();
    o.status = "foo";
  }
  buildCounterObjectFilter--;
  return o;
}

checkObjectFilter(api.ObjectFilter o) {
  buildCounterObjectFilter++;
  if (buildCounterObjectFilter < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5160(o.objectIds);
    unittest.expect(o.status, unittest.equals('foo'));
  }
  buildCounterObjectFilter--;
}

core.int buildCounterOffsetPosition = 0;
buildOffsetPosition() {
  var o = new api.OffsetPosition();
  buildCounterOffsetPosition++;
  if (buildCounterOffsetPosition < 3) {
    o.left = 42;
    o.top = 42;
  }
  buildCounterOffsetPosition--;
  return o;
}

checkOffsetPosition(api.OffsetPosition o) {
  buildCounterOffsetPosition++;
  if (buildCounterOffsetPosition < 3) {
    unittest.expect(o.left, unittest.equals(42));
    unittest.expect(o.top, unittest.equals(42));
  }
  buildCounterOffsetPosition--;
}

core.int buildCounterOmnitureSettings = 0;
buildOmnitureSettings() {
  var o = new api.OmnitureSettings();
  buildCounterOmnitureSettings++;
  if (buildCounterOmnitureSettings < 3) {
    o.omnitureCostDataEnabled = true;
    o.omnitureIntegrationEnabled = true;
  }
  buildCounterOmnitureSettings--;
  return o;
}

checkOmnitureSettings(api.OmnitureSettings o) {
  buildCounterOmnitureSettings++;
  if (buildCounterOmnitureSettings < 3) {
    unittest.expect(o.omnitureCostDataEnabled, unittest.isTrue);
    unittest.expect(o.omnitureIntegrationEnabled, unittest.isTrue);
  }
  buildCounterOmnitureSettings--;
}

core.int buildCounterOperatingSystem = 0;
buildOperatingSystem() {
  var o = new api.OperatingSystem();
  buildCounterOperatingSystem++;
  if (buildCounterOperatingSystem < 3) {
    o.dartId = "foo";
    o.desktop = true;
    o.kind = "foo";
    o.mobile = true;
    o.name = "foo";
  }
  buildCounterOperatingSystem--;
  return o;
}

checkOperatingSystem(api.OperatingSystem o) {
  buildCounterOperatingSystem++;
  if (buildCounterOperatingSystem < 3) {
    unittest.expect(o.dartId, unittest.equals('foo'));
    unittest.expect(o.desktop, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.mobile, unittest.isTrue);
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterOperatingSystem--;
}

core.int buildCounterOperatingSystemVersion = 0;
buildOperatingSystemVersion() {
  var o = new api.OperatingSystemVersion();
  buildCounterOperatingSystemVersion++;
  if (buildCounterOperatingSystemVersion < 3) {
    o.id = "foo";
    o.kind = "foo";
    o.majorVersion = "foo";
    o.minorVersion = "foo";
    o.name = "foo";
    o.operatingSystem = buildOperatingSystem();
  }
  buildCounterOperatingSystemVersion--;
  return o;
}

checkOperatingSystemVersion(api.OperatingSystemVersion o) {
  buildCounterOperatingSystemVersion++;
  if (buildCounterOperatingSystemVersion < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.majorVersion, unittest.equals('foo'));
    unittest.expect(o.minorVersion, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkOperatingSystem(o.operatingSystem);
  }
  buildCounterOperatingSystemVersion--;
}

buildUnnamed5161() {
  var o = new core.List<api.OperatingSystemVersion>();
  o.add(buildOperatingSystemVersion());
  o.add(buildOperatingSystemVersion());
  return o;
}

checkUnnamed5161(core.List<api.OperatingSystemVersion> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperatingSystemVersion(o[0]);
  checkOperatingSystemVersion(o[1]);
}

core.int buildCounterOperatingSystemVersionsListResponse = 0;
buildOperatingSystemVersionsListResponse() {
  var o = new api.OperatingSystemVersionsListResponse();
  buildCounterOperatingSystemVersionsListResponse++;
  if (buildCounterOperatingSystemVersionsListResponse < 3) {
    o.kind = "foo";
    o.operatingSystemVersions = buildUnnamed5161();
  }
  buildCounterOperatingSystemVersionsListResponse--;
  return o;
}

checkOperatingSystemVersionsListResponse(
    api.OperatingSystemVersionsListResponse o) {
  buildCounterOperatingSystemVersionsListResponse++;
  if (buildCounterOperatingSystemVersionsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5161(o.operatingSystemVersions);
  }
  buildCounterOperatingSystemVersionsListResponse--;
}

buildUnnamed5162() {
  var o = new core.List<api.OperatingSystem>();
  o.add(buildOperatingSystem());
  o.add(buildOperatingSystem());
  return o;
}

checkUnnamed5162(core.List<api.OperatingSystem> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperatingSystem(o[0]);
  checkOperatingSystem(o[1]);
}

core.int buildCounterOperatingSystemsListResponse = 0;
buildOperatingSystemsListResponse() {
  var o = new api.OperatingSystemsListResponse();
  buildCounterOperatingSystemsListResponse++;
  if (buildCounterOperatingSystemsListResponse < 3) {
    o.kind = "foo";
    o.operatingSystems = buildUnnamed5162();
  }
  buildCounterOperatingSystemsListResponse--;
  return o;
}

checkOperatingSystemsListResponse(api.OperatingSystemsListResponse o) {
  buildCounterOperatingSystemsListResponse++;
  if (buildCounterOperatingSystemsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5162(o.operatingSystems);
  }
  buildCounterOperatingSystemsListResponse--;
}

core.int buildCounterOptimizationActivity = 0;
buildOptimizationActivity() {
  var o = new api.OptimizationActivity();
  buildCounterOptimizationActivity++;
  if (buildCounterOptimizationActivity < 3) {
    o.floodlightActivityId = "foo";
    o.floodlightActivityIdDimensionValue = buildDimensionValue();
    o.weight = 42;
  }
  buildCounterOptimizationActivity--;
  return o;
}

checkOptimizationActivity(api.OptimizationActivity o) {
  buildCounterOptimizationActivity++;
  if (buildCounterOptimizationActivity < 3) {
    unittest.expect(o.floodlightActivityId, unittest.equals('foo'));
    checkDimensionValue(o.floodlightActivityIdDimensionValue);
    unittest.expect(o.weight, unittest.equals(42));
  }
  buildCounterOptimizationActivity--;
}

buildUnnamed5163() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5163(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5164() {
  var o = new core.List<api.OrderContact>();
  o.add(buildOrderContact());
  o.add(buildOrderContact());
  return o;
}

checkUnnamed5164(core.List<api.OrderContact> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOrderContact(o[0]);
  checkOrderContact(o[1]);
}

buildUnnamed5165() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5165(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5166() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5166(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterOrder = 0;
buildOrder() {
  var o = new api.Order();
  buildCounterOrder++;
  if (buildCounterOrder < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.approverUserProfileIds = buildUnnamed5163();
    o.buyerInvoiceId = "foo";
    o.buyerOrganizationName = "foo";
    o.comments = "foo";
    o.contacts = buildUnnamed5164();
    o.id = "foo";
    o.kind = "foo";
    o.lastModifiedInfo = buildLastModifiedInfo();
    o.name = "foo";
    o.notes = "foo";
    o.planningTermId = "foo";
    o.projectId = "foo";
    o.sellerOrderId = "foo";
    o.sellerOrganizationName = "foo";
    o.siteId = buildUnnamed5165();
    o.siteNames = buildUnnamed5166();
    o.subaccountId = "foo";
    o.termsAndConditions = "foo";
  }
  buildCounterOrder--;
  return o;
}

checkOrder(api.Order o) {
  buildCounterOrder++;
  if (buildCounterOrder < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkUnnamed5163(o.approverUserProfileIds);
    unittest.expect(o.buyerInvoiceId, unittest.equals('foo'));
    unittest.expect(o.buyerOrganizationName, unittest.equals('foo'));
    unittest.expect(o.comments, unittest.equals('foo'));
    checkUnnamed5164(o.contacts);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLastModifiedInfo(o.lastModifiedInfo);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    unittest.expect(o.planningTermId, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
    unittest.expect(o.sellerOrderId, unittest.equals('foo'));
    unittest.expect(o.sellerOrganizationName, unittest.equals('foo'));
    checkUnnamed5165(o.siteId);
    checkUnnamed5166(o.siteNames);
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.termsAndConditions, unittest.equals('foo'));
  }
  buildCounterOrder--;
}

core.int buildCounterOrderContact = 0;
buildOrderContact() {
  var o = new api.OrderContact();
  buildCounterOrderContact++;
  if (buildCounterOrderContact < 3) {
    o.contactInfo = "foo";
    o.contactName = "foo";
    o.contactTitle = "foo";
    o.contactType = "foo";
    o.signatureUserProfileId = "foo";
  }
  buildCounterOrderContact--;
  return o;
}

checkOrderContact(api.OrderContact o) {
  buildCounterOrderContact++;
  if (buildCounterOrderContact < 3) {
    unittest.expect(o.contactInfo, unittest.equals('foo'));
    unittest.expect(o.contactName, unittest.equals('foo'));
    unittest.expect(o.contactTitle, unittest.equals('foo'));
    unittest.expect(o.contactType, unittest.equals('foo'));
    unittest.expect(o.signatureUserProfileId, unittest.equals('foo'));
  }
  buildCounterOrderContact--;
}

buildUnnamed5167() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5167(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5168() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5168(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterOrderDocument = 0;
buildOrderDocument() {
  var o = new api.OrderDocument();
  buildCounterOrderDocument++;
  if (buildCounterOrderDocument < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.amendedOrderDocumentId = "foo";
    o.approvedByUserProfileIds = buildUnnamed5167();
    o.cancelled = true;
    o.createdInfo = buildLastModifiedInfo();
    o.effectiveDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.id = "foo";
    o.kind = "foo";
    o.lastSentRecipients = buildUnnamed5168();
    o.lastSentTime = core.DateTime.parse("2002-02-27T14:01:02");
    o.orderId = "foo";
    o.projectId = "foo";
    o.signed = true;
    o.subaccountId = "foo";
    o.title = "foo";
    o.type = "foo";
  }
  buildCounterOrderDocument--;
  return o;
}

checkOrderDocument(api.OrderDocument o) {
  buildCounterOrderDocument++;
  if (buildCounterOrderDocument < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    unittest.expect(o.amendedOrderDocumentId, unittest.equals('foo'));
    checkUnnamed5167(o.approvedByUserProfileIds);
    unittest.expect(o.cancelled, unittest.isTrue);
    checkLastModifiedInfo(o.createdInfo);
    unittest.expect(o.effectiveDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5168(o.lastSentRecipients);
    unittest.expect(o.lastSentTime,
        unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.orderId, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
    unittest.expect(o.signed, unittest.isTrue);
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.title, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterOrderDocument--;
}

buildUnnamed5169() {
  var o = new core.List<api.OrderDocument>();
  o.add(buildOrderDocument());
  o.add(buildOrderDocument());
  return o;
}

checkUnnamed5169(core.List<api.OrderDocument> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOrderDocument(o[0]);
  checkOrderDocument(o[1]);
}

core.int buildCounterOrderDocumentsListResponse = 0;
buildOrderDocumentsListResponse() {
  var o = new api.OrderDocumentsListResponse();
  buildCounterOrderDocumentsListResponse++;
  if (buildCounterOrderDocumentsListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.orderDocuments = buildUnnamed5169();
  }
  buildCounterOrderDocumentsListResponse--;
  return o;
}

checkOrderDocumentsListResponse(api.OrderDocumentsListResponse o) {
  buildCounterOrderDocumentsListResponse++;
  if (buildCounterOrderDocumentsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5169(o.orderDocuments);
  }
  buildCounterOrderDocumentsListResponse--;
}

buildUnnamed5170() {
  var o = new core.List<api.Order>();
  o.add(buildOrder());
  o.add(buildOrder());
  return o;
}

checkUnnamed5170(core.List<api.Order> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOrder(o[0]);
  checkOrder(o[1]);
}

core.int buildCounterOrdersListResponse = 0;
buildOrdersListResponse() {
  var o = new api.OrdersListResponse();
  buildCounterOrdersListResponse++;
  if (buildCounterOrdersListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.orders = buildUnnamed5170();
  }
  buildCounterOrdersListResponse--;
  return o;
}

checkOrdersListResponse(api.OrdersListResponse o) {
  buildCounterOrdersListResponse++;
  if (buildCounterOrdersListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5170(o.orders);
  }
  buildCounterOrdersListResponse--;
}

buildUnnamed5171() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5171(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5172() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5172(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5173() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed5173(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

buildUnnamed5174() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5174(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

core.int buildCounterPathToConversionReportCompatibleFields = 0;
buildPathToConversionReportCompatibleFields() {
  var o = new api.PathToConversionReportCompatibleFields();
  buildCounterPathToConversionReportCompatibleFields++;
  if (buildCounterPathToConversionReportCompatibleFields < 3) {
    o.conversionDimensions = buildUnnamed5171();
    o.customFloodlightVariables = buildUnnamed5172();
    o.kind = "foo";
    o.metrics = buildUnnamed5173();
    o.perInteractionDimensions = buildUnnamed5174();
  }
  buildCounterPathToConversionReportCompatibleFields--;
  return o;
}

checkPathToConversionReportCompatibleFields(
    api.PathToConversionReportCompatibleFields o) {
  buildCounterPathToConversionReportCompatibleFields++;
  if (buildCounterPathToConversionReportCompatibleFields < 3) {
    checkUnnamed5171(o.conversionDimensions);
    checkUnnamed5172(o.customFloodlightVariables);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5173(o.metrics);
    checkUnnamed5174(o.perInteractionDimensions);
  }
  buildCounterPathToConversionReportCompatibleFields--;
}

buildUnnamed5175() {
  var o = new core.List<api.Size>();
  o.add(buildSize());
  o.add(buildSize());
  return o;
}

checkUnnamed5175(core.List<api.Size> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSize(o[0]);
  checkSize(o[1]);
}

buildUnnamed5176() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5176(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterPlacement = 0;
buildPlacement() {
  var o = new api.Placement();
  buildCounterPlacement++;
  if (buildCounterPlacement < 3) {
    o.accountId = "foo";
    o.adBlockingOptOut = true;
    o.additionalSizes = buildUnnamed5175();
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.archived = true;
    o.campaignId = "foo";
    o.campaignIdDimensionValue = buildDimensionValue();
    o.comment = "foo";
    o.compatibility = "foo";
    o.contentCategoryId = "foo";
    o.createInfo = buildLastModifiedInfo();
    o.directorySiteId = "foo";
    o.directorySiteIdDimensionValue = buildDimensionValue();
    o.externalId = "foo";
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.keyName = "foo";
    o.kind = "foo";
    o.lastModifiedInfo = buildLastModifiedInfo();
    o.lookbackConfiguration = buildLookbackConfiguration();
    o.name = "foo";
    o.paymentApproved = true;
    o.paymentSource = "foo";
    o.placementGroupId = "foo";
    o.placementGroupIdDimensionValue = buildDimensionValue();
    o.placementStrategyId = "foo";
    o.pricingSchedule = buildPricingSchedule();
    o.primary = true;
    o.publisherUpdateInfo = buildLastModifiedInfo();
    o.siteId = "foo";
    o.siteIdDimensionValue = buildDimensionValue();
    o.size = buildSize();
    o.sslRequired = true;
    o.status = "foo";
    o.subaccountId = "foo";
    o.tagFormats = buildUnnamed5176();
    o.tagSetting = buildTagSetting();
    o.videoActiveViewOptOut = true;
    o.videoSettings = buildVideoSettings();
    o.vpaidAdapterChoice = "foo";
  }
  buildCounterPlacement--;
  return o;
}

checkPlacement(api.Placement o) {
  buildCounterPlacement++;
  if (buildCounterPlacement < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.adBlockingOptOut, unittest.isTrue);
    checkUnnamed5175(o.additionalSizes);
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.archived, unittest.isTrue);
    unittest.expect(o.campaignId, unittest.equals('foo'));
    checkDimensionValue(o.campaignIdDimensionValue);
    unittest.expect(o.comment, unittest.equals('foo'));
    unittest.expect(o.compatibility, unittest.equals('foo'));
    unittest.expect(o.contentCategoryId, unittest.equals('foo'));
    checkLastModifiedInfo(o.createInfo);
    unittest.expect(o.directorySiteId, unittest.equals('foo'));
    checkDimensionValue(o.directorySiteIdDimensionValue);
    unittest.expect(o.externalId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.keyName, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLastModifiedInfo(o.lastModifiedInfo);
    checkLookbackConfiguration(o.lookbackConfiguration);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.paymentApproved, unittest.isTrue);
    unittest.expect(o.paymentSource, unittest.equals('foo'));
    unittest.expect(o.placementGroupId, unittest.equals('foo'));
    checkDimensionValue(o.placementGroupIdDimensionValue);
    unittest.expect(o.placementStrategyId, unittest.equals('foo'));
    checkPricingSchedule(o.pricingSchedule);
    unittest.expect(o.primary, unittest.isTrue);
    checkLastModifiedInfo(o.publisherUpdateInfo);
    unittest.expect(o.siteId, unittest.equals('foo'));
    checkDimensionValue(o.siteIdDimensionValue);
    checkSize(o.size);
    unittest.expect(o.sslRequired, unittest.isTrue);
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    checkUnnamed5176(o.tagFormats);
    checkTagSetting(o.tagSetting);
    unittest.expect(o.videoActiveViewOptOut, unittest.isTrue);
    checkVideoSettings(o.videoSettings);
    unittest.expect(o.vpaidAdapterChoice, unittest.equals('foo'));
  }
  buildCounterPlacement--;
}

core.int buildCounterPlacementAssignment = 0;
buildPlacementAssignment() {
  var o = new api.PlacementAssignment();
  buildCounterPlacementAssignment++;
  if (buildCounterPlacementAssignment < 3) {
    o.active = true;
    o.placementId = "foo";
    o.placementIdDimensionValue = buildDimensionValue();
    o.sslRequired = true;
  }
  buildCounterPlacementAssignment--;
  return o;
}

checkPlacementAssignment(api.PlacementAssignment o) {
  buildCounterPlacementAssignment++;
  if (buildCounterPlacementAssignment < 3) {
    unittest.expect(o.active, unittest.isTrue);
    unittest.expect(o.placementId, unittest.equals('foo'));
    checkDimensionValue(o.placementIdDimensionValue);
    unittest.expect(o.sslRequired, unittest.isTrue);
  }
  buildCounterPlacementAssignment--;
}

buildUnnamed5177() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5177(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterPlacementGroup = 0;
buildPlacementGroup() {
  var o = new api.PlacementGroup();
  buildCounterPlacementGroup++;
  if (buildCounterPlacementGroup < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.archived = true;
    o.campaignId = "foo";
    o.campaignIdDimensionValue = buildDimensionValue();
    o.childPlacementIds = buildUnnamed5177();
    o.comment = "foo";
    o.contentCategoryId = "foo";
    o.createInfo = buildLastModifiedInfo();
    o.directorySiteId = "foo";
    o.directorySiteIdDimensionValue = buildDimensionValue();
    o.externalId = "foo";
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.kind = "foo";
    o.lastModifiedInfo = buildLastModifiedInfo();
    o.name = "foo";
    o.placementGroupType = "foo";
    o.placementStrategyId = "foo";
    o.pricingSchedule = buildPricingSchedule();
    o.primaryPlacementId = "foo";
    o.primaryPlacementIdDimensionValue = buildDimensionValue();
    o.siteId = "foo";
    o.siteIdDimensionValue = buildDimensionValue();
    o.subaccountId = "foo";
  }
  buildCounterPlacementGroup--;
  return o;
}

checkPlacementGroup(api.PlacementGroup o) {
  buildCounterPlacementGroup++;
  if (buildCounterPlacementGroup < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.archived, unittest.isTrue);
    unittest.expect(o.campaignId, unittest.equals('foo'));
    checkDimensionValue(o.campaignIdDimensionValue);
    checkUnnamed5177(o.childPlacementIds);
    unittest.expect(o.comment, unittest.equals('foo'));
    unittest.expect(o.contentCategoryId, unittest.equals('foo'));
    checkLastModifiedInfo(o.createInfo);
    unittest.expect(o.directorySiteId, unittest.equals('foo'));
    checkDimensionValue(o.directorySiteIdDimensionValue);
    unittest.expect(o.externalId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLastModifiedInfo(o.lastModifiedInfo);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.placementGroupType, unittest.equals('foo'));
    unittest.expect(o.placementStrategyId, unittest.equals('foo'));
    checkPricingSchedule(o.pricingSchedule);
    unittest.expect(o.primaryPlacementId, unittest.equals('foo'));
    checkDimensionValue(o.primaryPlacementIdDimensionValue);
    unittest.expect(o.siteId, unittest.equals('foo'));
    checkDimensionValue(o.siteIdDimensionValue);
    unittest.expect(o.subaccountId, unittest.equals('foo'));
  }
  buildCounterPlacementGroup--;
}

buildUnnamed5178() {
  var o = new core.List<api.PlacementGroup>();
  o.add(buildPlacementGroup());
  o.add(buildPlacementGroup());
  return o;
}

checkUnnamed5178(core.List<api.PlacementGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPlacementGroup(o[0]);
  checkPlacementGroup(o[1]);
}

core.int buildCounterPlacementGroupsListResponse = 0;
buildPlacementGroupsListResponse() {
  var o = new api.PlacementGroupsListResponse();
  buildCounterPlacementGroupsListResponse++;
  if (buildCounterPlacementGroupsListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.placementGroups = buildUnnamed5178();
  }
  buildCounterPlacementGroupsListResponse--;
  return o;
}

checkPlacementGroupsListResponse(api.PlacementGroupsListResponse o) {
  buildCounterPlacementGroupsListResponse++;
  if (buildCounterPlacementGroupsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5178(o.placementGroups);
  }
  buildCounterPlacementGroupsListResponse--;
}

buildUnnamed5179() {
  var o = new core.List<api.PlacementStrategy>();
  o.add(buildPlacementStrategy());
  o.add(buildPlacementStrategy());
  return o;
}

checkUnnamed5179(core.List<api.PlacementStrategy> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPlacementStrategy(o[0]);
  checkPlacementStrategy(o[1]);
}

core.int buildCounterPlacementStrategiesListResponse = 0;
buildPlacementStrategiesListResponse() {
  var o = new api.PlacementStrategiesListResponse();
  buildCounterPlacementStrategiesListResponse++;
  if (buildCounterPlacementStrategiesListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.placementStrategies = buildUnnamed5179();
  }
  buildCounterPlacementStrategiesListResponse--;
  return o;
}

checkPlacementStrategiesListResponse(api.PlacementStrategiesListResponse o) {
  buildCounterPlacementStrategiesListResponse++;
  if (buildCounterPlacementStrategiesListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5179(o.placementStrategies);
  }
  buildCounterPlacementStrategiesListResponse--;
}

core.int buildCounterPlacementStrategy = 0;
buildPlacementStrategy() {
  var o = new api.PlacementStrategy();
  buildCounterPlacementStrategy++;
  if (buildCounterPlacementStrategy < 3) {
    o.accountId = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterPlacementStrategy--;
  return o;
}

checkPlacementStrategy(api.PlacementStrategy o) {
  buildCounterPlacementStrategy++;
  if (buildCounterPlacementStrategy < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterPlacementStrategy--;
}

buildUnnamed5180() {
  var o = new core.List<api.TagData>();
  o.add(buildTagData());
  o.add(buildTagData());
  return o;
}

checkUnnamed5180(core.List<api.TagData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTagData(o[0]);
  checkTagData(o[1]);
}

core.int buildCounterPlacementTag = 0;
buildPlacementTag() {
  var o = new api.PlacementTag();
  buildCounterPlacementTag++;
  if (buildCounterPlacementTag < 3) {
    o.placementId = "foo";
    o.tagDatas = buildUnnamed5180();
  }
  buildCounterPlacementTag--;
  return o;
}

checkPlacementTag(api.PlacementTag o) {
  buildCounterPlacementTag++;
  if (buildCounterPlacementTag < 3) {
    unittest.expect(o.placementId, unittest.equals('foo'));
    checkUnnamed5180(o.tagDatas);
  }
  buildCounterPlacementTag--;
}

buildUnnamed5181() {
  var o = new core.List<api.PlacementTag>();
  o.add(buildPlacementTag());
  o.add(buildPlacementTag());
  return o;
}

checkUnnamed5181(core.List<api.PlacementTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPlacementTag(o[0]);
  checkPlacementTag(o[1]);
}

core.int buildCounterPlacementsGenerateTagsResponse = 0;
buildPlacementsGenerateTagsResponse() {
  var o = new api.PlacementsGenerateTagsResponse();
  buildCounterPlacementsGenerateTagsResponse++;
  if (buildCounterPlacementsGenerateTagsResponse < 3) {
    o.kind = "foo";
    o.placementTags = buildUnnamed5181();
  }
  buildCounterPlacementsGenerateTagsResponse--;
  return o;
}

checkPlacementsGenerateTagsResponse(api.PlacementsGenerateTagsResponse o) {
  buildCounterPlacementsGenerateTagsResponse++;
  if (buildCounterPlacementsGenerateTagsResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5181(o.placementTags);
  }
  buildCounterPlacementsGenerateTagsResponse--;
}

buildUnnamed5182() {
  var o = new core.List<api.Placement>();
  o.add(buildPlacement());
  o.add(buildPlacement());
  return o;
}

checkUnnamed5182(core.List<api.Placement> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPlacement(o[0]);
  checkPlacement(o[1]);
}

core.int buildCounterPlacementsListResponse = 0;
buildPlacementsListResponse() {
  var o = new api.PlacementsListResponse();
  buildCounterPlacementsListResponse++;
  if (buildCounterPlacementsListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.placements = buildUnnamed5182();
  }
  buildCounterPlacementsListResponse--;
  return o;
}

checkPlacementsListResponse(api.PlacementsListResponse o) {
  buildCounterPlacementsListResponse++;
  if (buildCounterPlacementsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5182(o.placements);
  }
  buildCounterPlacementsListResponse--;
}

core.int buildCounterPlatformType = 0;
buildPlatformType() {
  var o = new api.PlatformType();
  buildCounterPlatformType++;
  if (buildCounterPlatformType < 3) {
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterPlatformType--;
  return o;
}

checkPlatformType(api.PlatformType o) {
  buildCounterPlatformType++;
  if (buildCounterPlatformType < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterPlatformType--;
}

buildUnnamed5183() {
  var o = new core.List<api.PlatformType>();
  o.add(buildPlatformType());
  o.add(buildPlatformType());
  return o;
}

checkUnnamed5183(core.List<api.PlatformType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPlatformType(o[0]);
  checkPlatformType(o[1]);
}

core.int buildCounterPlatformTypesListResponse = 0;
buildPlatformTypesListResponse() {
  var o = new api.PlatformTypesListResponse();
  buildCounterPlatformTypesListResponse++;
  if (buildCounterPlatformTypesListResponse < 3) {
    o.kind = "foo";
    o.platformTypes = buildUnnamed5183();
  }
  buildCounterPlatformTypesListResponse--;
  return o;
}

checkPlatformTypesListResponse(api.PlatformTypesListResponse o) {
  buildCounterPlatformTypesListResponse++;
  if (buildCounterPlatformTypesListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5183(o.platformTypes);
  }
  buildCounterPlatformTypesListResponse--;
}

core.int buildCounterPopupWindowProperties = 0;
buildPopupWindowProperties() {
  var o = new api.PopupWindowProperties();
  buildCounterPopupWindowProperties++;
  if (buildCounterPopupWindowProperties < 3) {
    o.dimension = buildSize();
    o.offset = buildOffsetPosition();
    o.positionType = "foo";
    o.showAddressBar = true;
    o.showMenuBar = true;
    o.showScrollBar = true;
    o.showStatusBar = true;
    o.showToolBar = true;
    o.title = "foo";
  }
  buildCounterPopupWindowProperties--;
  return o;
}

checkPopupWindowProperties(api.PopupWindowProperties o) {
  buildCounterPopupWindowProperties++;
  if (buildCounterPopupWindowProperties < 3) {
    checkSize(o.dimension);
    checkOffsetPosition(o.offset);
    unittest.expect(o.positionType, unittest.equals('foo'));
    unittest.expect(o.showAddressBar, unittest.isTrue);
    unittest.expect(o.showMenuBar, unittest.isTrue);
    unittest.expect(o.showScrollBar, unittest.isTrue);
    unittest.expect(o.showStatusBar, unittest.isTrue);
    unittest.expect(o.showToolBar, unittest.isTrue);
    unittest.expect(o.title, unittest.equals('foo'));
  }
  buildCounterPopupWindowProperties--;
}

core.int buildCounterPostalCode = 0;
buildPostalCode() {
  var o = new api.PostalCode();
  buildCounterPostalCode++;
  if (buildCounterPostalCode < 3) {
    o.code = "foo";
    o.countryCode = "foo";
    o.countryDartId = "foo";
    o.id = "foo";
    o.kind = "foo";
  }
  buildCounterPostalCode--;
  return o;
}

checkPostalCode(api.PostalCode o) {
  buildCounterPostalCode++;
  if (buildCounterPostalCode < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    unittest.expect(o.countryCode, unittest.equals('foo'));
    unittest.expect(o.countryDartId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterPostalCode--;
}

buildUnnamed5184() {
  var o = new core.List<api.PostalCode>();
  o.add(buildPostalCode());
  o.add(buildPostalCode());
  return o;
}

checkUnnamed5184(core.List<api.PostalCode> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPostalCode(o[0]);
  checkPostalCode(o[1]);
}

core.int buildCounterPostalCodesListResponse = 0;
buildPostalCodesListResponse() {
  var o = new api.PostalCodesListResponse();
  buildCounterPostalCodesListResponse++;
  if (buildCounterPostalCodesListResponse < 3) {
    o.kind = "foo";
    o.postalCodes = buildUnnamed5184();
  }
  buildCounterPostalCodesListResponse--;
  return o;
}

checkPostalCodesListResponse(api.PostalCodesListResponse o) {
  buildCounterPostalCodesListResponse++;
  if (buildCounterPostalCodesListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5184(o.postalCodes);
  }
  buildCounterPostalCodesListResponse--;
}

buildUnnamed5185() {
  var o = new core.List<api.Flight>();
  o.add(buildFlight());
  o.add(buildFlight());
  return o;
}

checkUnnamed5185(core.List<api.Flight> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFlight(o[0]);
  checkFlight(o[1]);
}

core.int buildCounterPricing = 0;
buildPricing() {
  var o = new api.Pricing();
  buildCounterPricing++;
  if (buildCounterPricing < 3) {
    o.capCostType = "foo";
    o.endDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.flights = buildUnnamed5185();
    o.groupType = "foo";
    o.pricingType = "foo";
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02Z");
  }
  buildCounterPricing--;
  return o;
}

checkPricing(api.Pricing o) {
  buildCounterPricing++;
  if (buildCounterPricing < 3) {
    unittest.expect(o.capCostType, unittest.equals('foo'));
    unittest.expect(
        o.endDate, unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    checkUnnamed5185(o.flights);
    unittest.expect(o.groupType, unittest.equals('foo'));
    unittest.expect(o.pricingType, unittest.equals('foo'));
    unittest.expect(o.startDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
  }
  buildCounterPricing--;
}

buildUnnamed5186() {
  var o = new core.List<api.PricingSchedulePricingPeriod>();
  o.add(buildPricingSchedulePricingPeriod());
  o.add(buildPricingSchedulePricingPeriod());
  return o;
}

checkUnnamed5186(core.List<api.PricingSchedulePricingPeriod> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPricingSchedulePricingPeriod(o[0]);
  checkPricingSchedulePricingPeriod(o[1]);
}

core.int buildCounterPricingSchedule = 0;
buildPricingSchedule() {
  var o = new api.PricingSchedule();
  buildCounterPricingSchedule++;
  if (buildCounterPricingSchedule < 3) {
    o.capCostOption = "foo";
    o.endDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.flighted = true;
    o.floodlightActivityId = "foo";
    o.pricingPeriods = buildUnnamed5186();
    o.pricingType = "foo";
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.testingStartDate = core.DateTime.parse("2002-02-27T14:01:02Z");
  }
  buildCounterPricingSchedule--;
  return o;
}

checkPricingSchedule(api.PricingSchedule o) {
  buildCounterPricingSchedule++;
  if (buildCounterPricingSchedule < 3) {
    unittest.expect(o.capCostOption, unittest.equals('foo'));
    unittest.expect(
        o.endDate, unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.flighted, unittest.isTrue);
    unittest.expect(o.floodlightActivityId, unittest.equals('foo'));
    checkUnnamed5186(o.pricingPeriods);
    unittest.expect(o.pricingType, unittest.equals('foo'));
    unittest.expect(o.startDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.testingStartDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
  }
  buildCounterPricingSchedule--;
}

core.int buildCounterPricingSchedulePricingPeriod = 0;
buildPricingSchedulePricingPeriod() {
  var o = new api.PricingSchedulePricingPeriod();
  buildCounterPricingSchedulePricingPeriod++;
  if (buildCounterPricingSchedulePricingPeriod < 3) {
    o.endDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.pricingComment = "foo";
    o.rateOrCostNanos = "foo";
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.units = "foo";
  }
  buildCounterPricingSchedulePricingPeriod--;
  return o;
}

checkPricingSchedulePricingPeriod(api.PricingSchedulePricingPeriod o) {
  buildCounterPricingSchedulePricingPeriod++;
  if (buildCounterPricingSchedulePricingPeriod < 3) {
    unittest.expect(
        o.endDate, unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.pricingComment, unittest.equals('foo'));
    unittest.expect(o.rateOrCostNanos, unittest.equals('foo'));
    unittest.expect(o.startDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.units, unittest.equals('foo'));
  }
  buildCounterPricingSchedulePricingPeriod--;
}

core.int buildCounterProject = 0;
buildProject() {
  var o = new api.Project();
  buildCounterProject++;
  if (buildCounterProject < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.audienceAgeGroup = "foo";
    o.audienceGender = "foo";
    o.budget = "foo";
    o.clientBillingCode = "foo";
    o.clientName = "foo";
    o.endDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.id = "foo";
    o.kind = "foo";
    o.lastModifiedInfo = buildLastModifiedInfo();
    o.name = "foo";
    o.overview = "foo";
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.subaccountId = "foo";
    o.targetClicks = "foo";
    o.targetConversions = "foo";
    o.targetCpaNanos = "foo";
    o.targetCpcNanos = "foo";
    o.targetCpmActiveViewNanos = "foo";
    o.targetCpmNanos = "foo";
    o.targetImpressions = "foo";
  }
  buildCounterProject--;
  return o;
}

checkProject(api.Project o) {
  buildCounterProject++;
  if (buildCounterProject < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    unittest.expect(o.audienceAgeGroup, unittest.equals('foo'));
    unittest.expect(o.audienceGender, unittest.equals('foo'));
    unittest.expect(o.budget, unittest.equals('foo'));
    unittest.expect(o.clientBillingCode, unittest.equals('foo'));
    unittest.expect(o.clientName, unittest.equals('foo'));
    unittest.expect(
        o.endDate, unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLastModifiedInfo(o.lastModifiedInfo);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.overview, unittest.equals('foo'));
    unittest.expect(o.startDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    unittest.expect(o.targetClicks, unittest.equals('foo'));
    unittest.expect(o.targetConversions, unittest.equals('foo'));
    unittest.expect(o.targetCpaNanos, unittest.equals('foo'));
    unittest.expect(o.targetCpcNanos, unittest.equals('foo'));
    unittest.expect(o.targetCpmActiveViewNanos, unittest.equals('foo'));
    unittest.expect(o.targetCpmNanos, unittest.equals('foo'));
    unittest.expect(o.targetImpressions, unittest.equals('foo'));
  }
  buildCounterProject--;
}

buildUnnamed5187() {
  var o = new core.List<api.Project>();
  o.add(buildProject());
  o.add(buildProject());
  return o;
}

checkUnnamed5187(core.List<api.Project> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkProject(o[0]);
  checkProject(o[1]);
}

core.int buildCounterProjectsListResponse = 0;
buildProjectsListResponse() {
  var o = new api.ProjectsListResponse();
  buildCounterProjectsListResponse++;
  if (buildCounterProjectsListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.projects = buildUnnamed5187();
  }
  buildCounterProjectsListResponse--;
  return o;
}

checkProjectsListResponse(api.ProjectsListResponse o) {
  buildCounterProjectsListResponse++;
  if (buildCounterProjectsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5187(o.projects);
  }
  buildCounterProjectsListResponse--;
}

buildUnnamed5188() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5188(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5189() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5189(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5190() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed5190(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

buildUnnamed5191() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed5191(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

buildUnnamed5192() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed5192(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

core.int buildCounterReachReportCompatibleFields = 0;
buildReachReportCompatibleFields() {
  var o = new api.ReachReportCompatibleFields();
  buildCounterReachReportCompatibleFields++;
  if (buildCounterReachReportCompatibleFields < 3) {
    o.dimensionFilters = buildUnnamed5188();
    o.dimensions = buildUnnamed5189();
    o.kind = "foo";
    o.metrics = buildUnnamed5190();
    o.pivotedActivityMetrics = buildUnnamed5191();
    o.reachByFrequencyMetrics = buildUnnamed5192();
  }
  buildCounterReachReportCompatibleFields--;
  return o;
}

checkReachReportCompatibleFields(api.ReachReportCompatibleFields o) {
  buildCounterReachReportCompatibleFields++;
  if (buildCounterReachReportCompatibleFields < 3) {
    checkUnnamed5188(o.dimensionFilters);
    checkUnnamed5189(o.dimensions);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5190(o.metrics);
    checkUnnamed5191(o.pivotedActivityMetrics);
    checkUnnamed5192(o.reachByFrequencyMetrics);
  }
  buildCounterReachReportCompatibleFields--;
}

core.int buildCounterRecipient = 0;
buildRecipient() {
  var o = new api.Recipient();
  buildCounterRecipient++;
  if (buildCounterRecipient < 3) {
    o.deliveryType = "foo";
    o.email = "foo";
    o.kind = "foo";
  }
  buildCounterRecipient--;
  return o;
}

checkRecipient(api.Recipient o) {
  buildCounterRecipient++;
  if (buildCounterRecipient < 3) {
    unittest.expect(o.deliveryType, unittest.equals('foo'));
    unittest.expect(o.email, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterRecipient--;
}

core.int buildCounterRegion = 0;
buildRegion() {
  var o = new api.Region();
  buildCounterRegion++;
  if (buildCounterRegion < 3) {
    o.countryCode = "foo";
    o.countryDartId = "foo";
    o.dartId = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.regionCode = "foo";
  }
  buildCounterRegion--;
  return o;
}

checkRegion(api.Region o) {
  buildCounterRegion++;
  if (buildCounterRegion < 3) {
    unittest.expect(o.countryCode, unittest.equals('foo'));
    unittest.expect(o.countryDartId, unittest.equals('foo'));
    unittest.expect(o.dartId, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.regionCode, unittest.equals('foo'));
  }
  buildCounterRegion--;
}

buildUnnamed5193() {
  var o = new core.List<api.Region>();
  o.add(buildRegion());
  o.add(buildRegion());
  return o;
}

checkUnnamed5193(core.List<api.Region> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRegion(o[0]);
  checkRegion(o[1]);
}

core.int buildCounterRegionsListResponse = 0;
buildRegionsListResponse() {
  var o = new api.RegionsListResponse();
  buildCounterRegionsListResponse++;
  if (buildCounterRegionsListResponse < 3) {
    o.kind = "foo";
    o.regions = buildUnnamed5193();
  }
  buildCounterRegionsListResponse--;
  return o;
}

checkRegionsListResponse(api.RegionsListResponse o) {
  buildCounterRegionsListResponse++;
  if (buildCounterRegionsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5193(o.regions);
  }
  buildCounterRegionsListResponse--;
}

core.int buildCounterRemarketingList = 0;
buildRemarketingList() {
  var o = new api.RemarketingList();
  buildCounterRemarketingList++;
  if (buildCounterRemarketingList < 3) {
    o.accountId = "foo";
    o.active = true;
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.lifeSpan = "foo";
    o.listPopulationRule = buildListPopulationRule();
    o.listSize = "foo";
    o.listSource = "foo";
    o.name = "foo";
    o.subaccountId = "foo";
  }
  buildCounterRemarketingList--;
  return o;
}

checkRemarketingList(api.RemarketingList o) {
  buildCounterRemarketingList++;
  if (buildCounterRemarketingList < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.active, unittest.isTrue);
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.lifeSpan, unittest.equals('foo'));
    checkListPopulationRule(o.listPopulationRule);
    unittest.expect(o.listSize, unittest.equals('foo'));
    unittest.expect(o.listSource, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
  }
  buildCounterRemarketingList--;
}

buildUnnamed5194() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5194(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5195() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5195(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterRemarketingListShare = 0;
buildRemarketingListShare() {
  var o = new api.RemarketingListShare();
  buildCounterRemarketingListShare++;
  if (buildCounterRemarketingListShare < 3) {
    o.kind = "foo";
    o.remarketingListId = "foo";
    o.sharedAccountIds = buildUnnamed5194();
    o.sharedAdvertiserIds = buildUnnamed5195();
  }
  buildCounterRemarketingListShare--;
  return o;
}

checkRemarketingListShare(api.RemarketingListShare o) {
  buildCounterRemarketingListShare++;
  if (buildCounterRemarketingListShare < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.remarketingListId, unittest.equals('foo'));
    checkUnnamed5194(o.sharedAccountIds);
    checkUnnamed5195(o.sharedAdvertiserIds);
  }
  buildCounterRemarketingListShare--;
}

buildUnnamed5196() {
  var o = new core.List<api.RemarketingList>();
  o.add(buildRemarketingList());
  o.add(buildRemarketingList());
  return o;
}

checkUnnamed5196(core.List<api.RemarketingList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRemarketingList(o[0]);
  checkRemarketingList(o[1]);
}

core.int buildCounterRemarketingListsListResponse = 0;
buildRemarketingListsListResponse() {
  var o = new api.RemarketingListsListResponse();
  buildCounterRemarketingListsListResponse++;
  if (buildCounterRemarketingListsListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.remarketingLists = buildUnnamed5196();
  }
  buildCounterRemarketingListsListResponse--;
  return o;
}

checkRemarketingListsListResponse(api.RemarketingListsListResponse o) {
  buildCounterRemarketingListsListResponse++;
  if (buildCounterRemarketingListsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5196(o.remarketingLists);
  }
  buildCounterRemarketingListsListResponse--;
}

buildUnnamed5197() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5197(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

buildUnnamed5198() {
  var o = new core.List<api.SortedDimension>();
  o.add(buildSortedDimension());
  o.add(buildSortedDimension());
  return o;
}

checkUnnamed5198(core.List<api.SortedDimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSortedDimension(o[0]);
  checkSortedDimension(o[1]);
}

buildUnnamed5199() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5199(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterReportCriteria = 0;
buildReportCriteria() {
  var o = new api.ReportCriteria();
  buildCounterReportCriteria++;
  if (buildCounterReportCriteria < 3) {
    o.activities = buildActivities();
    o.customRichMediaEvents = buildCustomRichMediaEvents();
    o.dateRange = buildDateRange();
    o.dimensionFilters = buildUnnamed5197();
    o.dimensions = buildUnnamed5198();
    o.metricNames = buildUnnamed5199();
  }
  buildCounterReportCriteria--;
  return o;
}

checkReportCriteria(api.ReportCriteria o) {
  buildCounterReportCriteria++;
  if (buildCounterReportCriteria < 3) {
    checkActivities(o.activities);
    checkCustomRichMediaEvents(o.customRichMediaEvents);
    checkDateRange(o.dateRange);
    checkUnnamed5197(o.dimensionFilters);
    checkUnnamed5198(o.dimensions);
    checkUnnamed5199(o.metricNames);
  }
  buildCounterReportCriteria--;
}

buildUnnamed5200() {
  var o = new core.List<api.SortedDimension>();
  o.add(buildSortedDimension());
  o.add(buildSortedDimension());
  return o;
}

checkUnnamed5200(core.List<api.SortedDimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSortedDimension(o[0]);
  checkSortedDimension(o[1]);
}

buildUnnamed5201() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5201(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

buildUnnamed5202() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5202(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5203() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5203(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterReportCrossDimensionReachCriteria = 0;
buildReportCrossDimensionReachCriteria() {
  var o = new api.ReportCrossDimensionReachCriteria();
  buildCounterReportCrossDimensionReachCriteria++;
  if (buildCounterReportCrossDimensionReachCriteria < 3) {
    o.breakdown = buildUnnamed5200();
    o.dateRange = buildDateRange();
    o.dimension = "foo";
    o.dimensionFilters = buildUnnamed5201();
    o.metricNames = buildUnnamed5202();
    o.overlapMetricNames = buildUnnamed5203();
    o.pivoted = true;
  }
  buildCounterReportCrossDimensionReachCriteria--;
  return o;
}

checkReportCrossDimensionReachCriteria(
    api.ReportCrossDimensionReachCriteria o) {
  buildCounterReportCrossDimensionReachCriteria++;
  if (buildCounterReportCrossDimensionReachCriteria < 3) {
    checkUnnamed5200(o.breakdown);
    checkDateRange(o.dateRange);
    unittest.expect(o.dimension, unittest.equals('foo'));
    checkUnnamed5201(o.dimensionFilters);
    checkUnnamed5202(o.metricNames);
    checkUnnamed5203(o.overlapMetricNames);
    unittest.expect(o.pivoted, unittest.isTrue);
  }
  buildCounterReportCrossDimensionReachCriteria--;
}

buildUnnamed5204() {
  var o = new core.List<api.Recipient>();
  o.add(buildRecipient());
  o.add(buildRecipient());
  return o;
}

checkUnnamed5204(core.List<api.Recipient> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRecipient(o[0]);
  checkRecipient(o[1]);
}

core.int buildCounterReportDelivery = 0;
buildReportDelivery() {
  var o = new api.ReportDelivery();
  buildCounterReportDelivery++;
  if (buildCounterReportDelivery < 3) {
    o.emailOwner = true;
    o.emailOwnerDeliveryType = "foo";
    o.message = "foo";
    o.recipients = buildUnnamed5204();
  }
  buildCounterReportDelivery--;
  return o;
}

checkReportDelivery(api.ReportDelivery o) {
  buildCounterReportDelivery++;
  if (buildCounterReportDelivery < 3) {
    unittest.expect(o.emailOwner, unittest.isTrue);
    unittest.expect(o.emailOwnerDeliveryType, unittest.equals('foo'));
    unittest.expect(o.message, unittest.equals('foo'));
    checkUnnamed5204(o.recipients);
  }
  buildCounterReportDelivery--;
}

buildUnnamed5205() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5205(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

buildUnnamed5206() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5206(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

buildUnnamed5207() {
  var o = new core.List<api.SortedDimension>();
  o.add(buildSortedDimension());
  o.add(buildSortedDimension());
  return o;
}

checkUnnamed5207(core.List<api.SortedDimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSortedDimension(o[0]);
  checkSortedDimension(o[1]);
}

buildUnnamed5208() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5208(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterReportFloodlightCriteriaReportProperties = 0;
buildReportFloodlightCriteriaReportProperties() {
  var o = new api.ReportFloodlightCriteriaReportProperties();
  buildCounterReportFloodlightCriteriaReportProperties++;
  if (buildCounterReportFloodlightCriteriaReportProperties < 3) {
    o.includeAttributedIPConversions = true;
    o.includeUnattributedCookieConversions = true;
    o.includeUnattributedIPConversions = true;
  }
  buildCounterReportFloodlightCriteriaReportProperties--;
  return o;
}

checkReportFloodlightCriteriaReportProperties(
    api.ReportFloodlightCriteriaReportProperties o) {
  buildCounterReportFloodlightCriteriaReportProperties++;
  if (buildCounterReportFloodlightCriteriaReportProperties < 3) {
    unittest.expect(o.includeAttributedIPConversions, unittest.isTrue);
    unittest.expect(o.includeUnattributedCookieConversions, unittest.isTrue);
    unittest.expect(o.includeUnattributedIPConversions, unittest.isTrue);
  }
  buildCounterReportFloodlightCriteriaReportProperties--;
}

core.int buildCounterReportFloodlightCriteria = 0;
buildReportFloodlightCriteria() {
  var o = new api.ReportFloodlightCriteria();
  buildCounterReportFloodlightCriteria++;
  if (buildCounterReportFloodlightCriteria < 3) {
    o.customRichMediaEvents = buildUnnamed5205();
    o.dateRange = buildDateRange();
    o.dimensionFilters = buildUnnamed5206();
    o.dimensions = buildUnnamed5207();
    o.floodlightConfigId = buildDimensionValue();
    o.metricNames = buildUnnamed5208();
    o.reportProperties = buildReportFloodlightCriteriaReportProperties();
  }
  buildCounterReportFloodlightCriteria--;
  return o;
}

checkReportFloodlightCriteria(api.ReportFloodlightCriteria o) {
  buildCounterReportFloodlightCriteria++;
  if (buildCounterReportFloodlightCriteria < 3) {
    checkUnnamed5205(o.customRichMediaEvents);
    checkDateRange(o.dateRange);
    checkUnnamed5206(o.dimensionFilters);
    checkUnnamed5207(o.dimensions);
    checkDimensionValue(o.floodlightConfigId);
    checkUnnamed5208(o.metricNames);
    checkReportFloodlightCriteriaReportProperties(o.reportProperties);
  }
  buildCounterReportFloodlightCriteria--;
}

buildUnnamed5209() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5209(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

buildUnnamed5210() {
  var o = new core.List<api.SortedDimension>();
  o.add(buildSortedDimension());
  o.add(buildSortedDimension());
  return o;
}

checkUnnamed5210(core.List<api.SortedDimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSortedDimension(o[0]);
  checkSortedDimension(o[1]);
}

buildUnnamed5211() {
  var o = new core.List<api.SortedDimension>();
  o.add(buildSortedDimension());
  o.add(buildSortedDimension());
  return o;
}

checkUnnamed5211(core.List<api.SortedDimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSortedDimension(o[0]);
  checkSortedDimension(o[1]);
}

buildUnnamed5212() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5212(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

buildUnnamed5213() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5213(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5214() {
  var o = new core.List<api.SortedDimension>();
  o.add(buildSortedDimension());
  o.add(buildSortedDimension());
  return o;
}

checkUnnamed5214(core.List<api.SortedDimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSortedDimension(o[0]);
  checkSortedDimension(o[1]);
}

core.int buildCounterReportPathToConversionCriteriaReportProperties = 0;
buildReportPathToConversionCriteriaReportProperties() {
  var o = new api.ReportPathToConversionCriteriaReportProperties();
  buildCounterReportPathToConversionCriteriaReportProperties++;
  if (buildCounterReportPathToConversionCriteriaReportProperties < 3) {
    o.clicksLookbackWindow = 42;
    o.impressionsLookbackWindow = 42;
    o.includeAttributedIPConversions = true;
    o.includeUnattributedCookieConversions = true;
    o.includeUnattributedIPConversions = true;
    o.maximumClickInteractions = 42;
    o.maximumImpressionInteractions = 42;
    o.maximumInteractionGap = 42;
    o.pivotOnInteractionPath = true;
  }
  buildCounterReportPathToConversionCriteriaReportProperties--;
  return o;
}

checkReportPathToConversionCriteriaReportProperties(
    api.ReportPathToConversionCriteriaReportProperties o) {
  buildCounterReportPathToConversionCriteriaReportProperties++;
  if (buildCounterReportPathToConversionCriteriaReportProperties < 3) {
    unittest.expect(o.clicksLookbackWindow, unittest.equals(42));
    unittest.expect(o.impressionsLookbackWindow, unittest.equals(42));
    unittest.expect(o.includeAttributedIPConversions, unittest.isTrue);
    unittest.expect(o.includeUnattributedCookieConversions, unittest.isTrue);
    unittest.expect(o.includeUnattributedIPConversions, unittest.isTrue);
    unittest.expect(o.maximumClickInteractions, unittest.equals(42));
    unittest.expect(o.maximumImpressionInteractions, unittest.equals(42));
    unittest.expect(o.maximumInteractionGap, unittest.equals(42));
    unittest.expect(o.pivotOnInteractionPath, unittest.isTrue);
  }
  buildCounterReportPathToConversionCriteriaReportProperties--;
}

core.int buildCounterReportPathToConversionCriteria = 0;
buildReportPathToConversionCriteria() {
  var o = new api.ReportPathToConversionCriteria();
  buildCounterReportPathToConversionCriteria++;
  if (buildCounterReportPathToConversionCriteria < 3) {
    o.activityFilters = buildUnnamed5209();
    o.conversionDimensions = buildUnnamed5210();
    o.customFloodlightVariables = buildUnnamed5211();
    o.customRichMediaEvents = buildUnnamed5212();
    o.dateRange = buildDateRange();
    o.floodlightConfigId = buildDimensionValue();
    o.metricNames = buildUnnamed5213();
    o.perInteractionDimensions = buildUnnamed5214();
    o.reportProperties = buildReportPathToConversionCriteriaReportProperties();
  }
  buildCounterReportPathToConversionCriteria--;
  return o;
}

checkReportPathToConversionCriteria(api.ReportPathToConversionCriteria o) {
  buildCounterReportPathToConversionCriteria++;
  if (buildCounterReportPathToConversionCriteria < 3) {
    checkUnnamed5209(o.activityFilters);
    checkUnnamed5210(o.conversionDimensions);
    checkUnnamed5211(o.customFloodlightVariables);
    checkUnnamed5212(o.customRichMediaEvents);
    checkDateRange(o.dateRange);
    checkDimensionValue(o.floodlightConfigId);
    checkUnnamed5213(o.metricNames);
    checkUnnamed5214(o.perInteractionDimensions);
    checkReportPathToConversionCriteriaReportProperties(o.reportProperties);
  }
  buildCounterReportPathToConversionCriteria--;
}

buildUnnamed5215() {
  var o = new core.List<api.DimensionValue>();
  o.add(buildDimensionValue());
  o.add(buildDimensionValue());
  return o;
}

checkUnnamed5215(core.List<api.DimensionValue> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensionValue(o[0]);
  checkDimensionValue(o[1]);
}

buildUnnamed5216() {
  var o = new core.List<api.SortedDimension>();
  o.add(buildSortedDimension());
  o.add(buildSortedDimension());
  return o;
}

checkUnnamed5216(core.List<api.SortedDimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSortedDimension(o[0]);
  checkSortedDimension(o[1]);
}

buildUnnamed5217() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5217(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5218() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5218(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterReportReachCriteria = 0;
buildReportReachCriteria() {
  var o = new api.ReportReachCriteria();
  buildCounterReportReachCriteria++;
  if (buildCounterReportReachCriteria < 3) {
    o.activities = buildActivities();
    o.customRichMediaEvents = buildCustomRichMediaEvents();
    o.dateRange = buildDateRange();
    o.dimensionFilters = buildUnnamed5215();
    o.dimensions = buildUnnamed5216();
    o.enableAllDimensionCombinations = true;
    o.metricNames = buildUnnamed5217();
    o.reachByFrequencyMetricNames = buildUnnamed5218();
  }
  buildCounterReportReachCriteria--;
  return o;
}

checkReportReachCriteria(api.ReportReachCriteria o) {
  buildCounterReportReachCriteria++;
  if (buildCounterReportReachCriteria < 3) {
    checkActivities(o.activities);
    checkCustomRichMediaEvents(o.customRichMediaEvents);
    checkDateRange(o.dateRange);
    checkUnnamed5215(o.dimensionFilters);
    checkUnnamed5216(o.dimensions);
    unittest.expect(o.enableAllDimensionCombinations, unittest.isTrue);
    checkUnnamed5217(o.metricNames);
    checkUnnamed5218(o.reachByFrequencyMetricNames);
  }
  buildCounterReportReachCriteria--;
}

buildUnnamed5219() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5219(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterReportSchedule = 0;
buildReportSchedule() {
  var o = new api.ReportSchedule();
  buildCounterReportSchedule++;
  if (buildCounterReportSchedule < 3) {
    o.active = true;
    o.every = 42;
    o.expirationDate = core.DateTime.parse("2002-02-27T14:01:02Z");
    o.repeats = "foo";
    o.repeatsOnWeekDays = buildUnnamed5219();
    o.runsOnDayOfMonth = "foo";
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02Z");
  }
  buildCounterReportSchedule--;
  return o;
}

checkReportSchedule(api.ReportSchedule o) {
  buildCounterReportSchedule++;
  if (buildCounterReportSchedule < 3) {
    unittest.expect(o.active, unittest.isTrue);
    unittest.expect(o.every, unittest.equals(42));
    unittest.expect(o.expirationDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
    unittest.expect(o.repeats, unittest.equals('foo'));
    checkUnnamed5219(o.repeatsOnWeekDays);
    unittest.expect(o.runsOnDayOfMonth, unittest.equals('foo'));
    unittest.expect(o.startDate,
        unittest.equals(core.DateTime.parse("2002-02-27T00:00:00")));
  }
  buildCounterReportSchedule--;
}

core.int buildCounterReport = 0;
buildReport() {
  var o = new api.Report();
  buildCounterReport++;
  if (buildCounterReport < 3) {
    o.accountId = "foo";
    o.criteria = buildReportCriteria();
    o.crossDimensionReachCriteria = buildReportCrossDimensionReachCriteria();
    o.delivery = buildReportDelivery();
    o.etag = "foo";
    o.fileName = "foo";
    o.floodlightCriteria = buildReportFloodlightCriteria();
    o.format = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.lastModifiedTime = "foo";
    o.name = "foo";
    o.ownerProfileId = "foo";
    o.pathToConversionCriteria = buildReportPathToConversionCriteria();
    o.reachCriteria = buildReportReachCriteria();
    o.schedule = buildReportSchedule();
    o.subAccountId = "foo";
    o.type = "foo";
  }
  buildCounterReport--;
  return o;
}

checkReport(api.Report o) {
  buildCounterReport++;
  if (buildCounterReport < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkReportCriteria(o.criteria);
    checkReportCrossDimensionReachCriteria(o.crossDimensionReachCriteria);
    checkReportDelivery(o.delivery);
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.fileName, unittest.equals('foo'));
    checkReportFloodlightCriteria(o.floodlightCriteria);
    unittest.expect(o.format, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.lastModifiedTime, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.ownerProfileId, unittest.equals('foo'));
    checkReportPathToConversionCriteria(o.pathToConversionCriteria);
    checkReportReachCriteria(o.reachCriteria);
    checkReportSchedule(o.schedule);
    unittest.expect(o.subAccountId, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterReport--;
}

buildUnnamed5220() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5220(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5221() {
  var o = new core.List<api.Dimension>();
  o.add(buildDimension());
  o.add(buildDimension());
  return o;
}

checkUnnamed5221(core.List<api.Dimension> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimension(o[0]);
  checkDimension(o[1]);
}

buildUnnamed5222() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed5222(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

buildUnnamed5223() {
  var o = new core.List<api.Metric>();
  o.add(buildMetric());
  o.add(buildMetric());
  return o;
}

checkUnnamed5223(core.List<api.Metric> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetric(o[0]);
  checkMetric(o[1]);
}

core.int buildCounterReportCompatibleFields = 0;
buildReportCompatibleFields() {
  var o = new api.ReportCompatibleFields();
  buildCounterReportCompatibleFields++;
  if (buildCounterReportCompatibleFields < 3) {
    o.dimensionFilters = buildUnnamed5220();
    o.dimensions = buildUnnamed5221();
    o.kind = "foo";
    o.metrics = buildUnnamed5222();
    o.pivotedActivityMetrics = buildUnnamed5223();
  }
  buildCounterReportCompatibleFields--;
  return o;
}

checkReportCompatibleFields(api.ReportCompatibleFields o) {
  buildCounterReportCompatibleFields++;
  if (buildCounterReportCompatibleFields < 3) {
    checkUnnamed5220(o.dimensionFilters);
    checkUnnamed5221(o.dimensions);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5222(o.metrics);
    checkUnnamed5223(o.pivotedActivityMetrics);
  }
  buildCounterReportCompatibleFields--;
}

buildUnnamed5224() {
  var o = new core.List<api.Report>();
  o.add(buildReport());
  o.add(buildReport());
  return o;
}

checkUnnamed5224(core.List<api.Report> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReport(o[0]);
  checkReport(o[1]);
}

core.int buildCounterReportList = 0;
buildReportList() {
  var o = new api.ReportList();
  buildCounterReportList++;
  if (buildCounterReportList < 3) {
    o.etag = "foo";
    o.items = buildUnnamed5224();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterReportList--;
  return o;
}

checkReportList(api.ReportList o) {
  buildCounterReportList++;
  if (buildCounterReportList < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed5224(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterReportList--;
}

core.int buildCounterReportsConfiguration = 0;
buildReportsConfiguration() {
  var o = new api.ReportsConfiguration();
  buildCounterReportsConfiguration++;
  if (buildCounterReportsConfiguration < 3) {
    o.exposureToConversionEnabled = true;
    o.lookbackConfiguration = buildLookbackConfiguration();
    o.reportGenerationTimeZoneId = "foo";
  }
  buildCounterReportsConfiguration--;
  return o;
}

checkReportsConfiguration(api.ReportsConfiguration o) {
  buildCounterReportsConfiguration++;
  if (buildCounterReportsConfiguration < 3) {
    unittest.expect(o.exposureToConversionEnabled, unittest.isTrue);
    checkLookbackConfiguration(o.lookbackConfiguration);
    unittest.expect(o.reportGenerationTimeZoneId, unittest.equals('foo'));
  }
  buildCounterReportsConfiguration--;
}

core.int buildCounterRichMediaExitOverride = 0;
buildRichMediaExitOverride() {
  var o = new api.RichMediaExitOverride();
  buildCounterRichMediaExitOverride++;
  if (buildCounterRichMediaExitOverride < 3) {
    o.clickThroughUrl = buildClickThroughUrl();
    o.enabled = true;
    o.exitId = "foo";
  }
  buildCounterRichMediaExitOverride--;
  return o;
}

checkRichMediaExitOverride(api.RichMediaExitOverride o) {
  buildCounterRichMediaExitOverride++;
  if (buildCounterRichMediaExitOverride < 3) {
    checkClickThroughUrl(o.clickThroughUrl);
    unittest.expect(o.enabled, unittest.isTrue);
    unittest.expect(o.exitId, unittest.equals('foo'));
  }
  buildCounterRichMediaExitOverride--;
}

core.int buildCounterRule = 0;
buildRule() {
  var o = new api.Rule();
  buildCounterRule++;
  if (buildCounterRule < 3) {
    o.assetId = "foo";
    o.name = "foo";
    o.targetingTemplateId = "foo";
  }
  buildCounterRule--;
  return o;
}

checkRule(api.Rule o) {
  buildCounterRule++;
  if (buildCounterRule < 3) {
    unittest.expect(o.assetId, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.targetingTemplateId, unittest.equals('foo'));
  }
  buildCounterRule--;
}

buildUnnamed5225() {
  var o = new core.List<api.SiteContact>();
  o.add(buildSiteContact());
  o.add(buildSiteContact());
  return o;
}

checkUnnamed5225(core.List<api.SiteContact> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSiteContact(o[0]);
  checkSiteContact(o[1]);
}

core.int buildCounterSite = 0;
buildSite() {
  var o = new api.Site();
  buildCounterSite++;
  if (buildCounterSite < 3) {
    o.accountId = "foo";
    o.approved = true;
    o.directorySiteId = "foo";
    o.directorySiteIdDimensionValue = buildDimensionValue();
    o.id = "foo";
    o.idDimensionValue = buildDimensionValue();
    o.keyName = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.siteContacts = buildUnnamed5225();
    o.siteSettings = buildSiteSettings();
    o.subaccountId = "foo";
    o.videoSettings = buildSiteVideoSettings();
  }
  buildCounterSite--;
  return o;
}

checkSite(api.Site o) {
  buildCounterSite++;
  if (buildCounterSite < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.approved, unittest.isTrue);
    unittest.expect(o.directorySiteId, unittest.equals('foo'));
    checkDimensionValue(o.directorySiteIdDimensionValue);
    unittest.expect(o.id, unittest.equals('foo'));
    checkDimensionValue(o.idDimensionValue);
    unittest.expect(o.keyName, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed5225(o.siteContacts);
    checkSiteSettings(o.siteSettings);
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    checkSiteVideoSettings(o.videoSettings);
  }
  buildCounterSite--;
}

buildUnnamed5226() {
  var o = new core.List<api.Size>();
  o.add(buildSize());
  o.add(buildSize());
  return o;
}

checkUnnamed5226(core.List<api.Size> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSize(o[0]);
  checkSize(o[1]);
}

core.int buildCounterSiteCompanionSetting = 0;
buildSiteCompanionSetting() {
  var o = new api.SiteCompanionSetting();
  buildCounterSiteCompanionSetting++;
  if (buildCounterSiteCompanionSetting < 3) {
    o.companionsDisabled = true;
    o.enabledSizes = buildUnnamed5226();
    o.imageOnly = true;
    o.kind = "foo";
  }
  buildCounterSiteCompanionSetting--;
  return o;
}

checkSiteCompanionSetting(api.SiteCompanionSetting o) {
  buildCounterSiteCompanionSetting++;
  if (buildCounterSiteCompanionSetting < 3) {
    unittest.expect(o.companionsDisabled, unittest.isTrue);
    checkUnnamed5226(o.enabledSizes);
    unittest.expect(o.imageOnly, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterSiteCompanionSetting--;
}

core.int buildCounterSiteContact = 0;
buildSiteContact() {
  var o = new api.SiteContact();
  buildCounterSiteContact++;
  if (buildCounterSiteContact < 3) {
    o.address = "foo";
    o.contactType = "foo";
    o.email = "foo";
    o.firstName = "foo";
    o.id = "foo";
    o.lastName = "foo";
    o.phone = "foo";
    o.title = "foo";
  }
  buildCounterSiteContact--;
  return o;
}

checkSiteContact(api.SiteContact o) {
  buildCounterSiteContact++;
  if (buildCounterSiteContact < 3) {
    unittest.expect(o.address, unittest.equals('foo'));
    unittest.expect(o.contactType, unittest.equals('foo'));
    unittest.expect(o.email, unittest.equals('foo'));
    unittest.expect(o.firstName, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.lastName, unittest.equals('foo'));
    unittest.expect(o.phone, unittest.equals('foo'));
    unittest.expect(o.title, unittest.equals('foo'));
  }
  buildCounterSiteContact--;
}

core.int buildCounterSiteSettings = 0;
buildSiteSettings() {
  var o = new api.SiteSettings();
  buildCounterSiteSettings++;
  if (buildCounterSiteSettings < 3) {
    o.activeViewOptOut = true;
    o.adBlockingOptOut = true;
    o.disableNewCookie = true;
    o.tagSetting = buildTagSetting();
    o.videoActiveViewOptOutTemplate = true;
    o.vpaidAdapterChoiceTemplate = "foo";
  }
  buildCounterSiteSettings--;
  return o;
}

checkSiteSettings(api.SiteSettings o) {
  buildCounterSiteSettings++;
  if (buildCounterSiteSettings < 3) {
    unittest.expect(o.activeViewOptOut, unittest.isTrue);
    unittest.expect(o.adBlockingOptOut, unittest.isTrue);
    unittest.expect(o.disableNewCookie, unittest.isTrue);
    checkTagSetting(o.tagSetting);
    unittest.expect(o.videoActiveViewOptOutTemplate, unittest.isTrue);
    unittest.expect(o.vpaidAdapterChoiceTemplate, unittest.equals('foo'));
  }
  buildCounterSiteSettings--;
}

core.int buildCounterSiteSkippableSetting = 0;
buildSiteSkippableSetting() {
  var o = new api.SiteSkippableSetting();
  buildCounterSiteSkippableSetting++;
  if (buildCounterSiteSkippableSetting < 3) {
    o.kind = "foo";
    o.progressOffset = buildVideoOffset();
    o.skipOffset = buildVideoOffset();
    o.skippable = true;
  }
  buildCounterSiteSkippableSetting--;
  return o;
}

checkSiteSkippableSetting(api.SiteSkippableSetting o) {
  buildCounterSiteSkippableSetting++;
  if (buildCounterSiteSkippableSetting < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkVideoOffset(o.progressOffset);
    checkVideoOffset(o.skipOffset);
    unittest.expect(o.skippable, unittest.isTrue);
  }
  buildCounterSiteSkippableSetting--;
}

buildUnnamed5227() {
  var o = new core.List<core.int>();
  o.add(42);
  o.add(42);
  return o;
}

checkUnnamed5227(core.List<core.int> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals(42));
  unittest.expect(o[1], unittest.equals(42));
}

core.int buildCounterSiteTranscodeSetting = 0;
buildSiteTranscodeSetting() {
  var o = new api.SiteTranscodeSetting();
  buildCounterSiteTranscodeSetting++;
  if (buildCounterSiteTranscodeSetting < 3) {
    o.enabledVideoFormats = buildUnnamed5227();
    o.kind = "foo";
  }
  buildCounterSiteTranscodeSetting--;
  return o;
}

checkSiteTranscodeSetting(api.SiteTranscodeSetting o) {
  buildCounterSiteTranscodeSetting++;
  if (buildCounterSiteTranscodeSetting < 3) {
    checkUnnamed5227(o.enabledVideoFormats);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterSiteTranscodeSetting--;
}

core.int buildCounterSiteVideoSettings = 0;
buildSiteVideoSettings() {
  var o = new api.SiteVideoSettings();
  buildCounterSiteVideoSettings++;
  if (buildCounterSiteVideoSettings < 3) {
    o.companionSettings = buildSiteCompanionSetting();
    o.kind = "foo";
    o.orientation = "foo";
    o.skippableSettings = buildSiteSkippableSetting();
    o.transcodeSettings = buildSiteTranscodeSetting();
  }
  buildCounterSiteVideoSettings--;
  return o;
}

checkSiteVideoSettings(api.SiteVideoSettings o) {
  buildCounterSiteVideoSettings++;
  if (buildCounterSiteVideoSettings < 3) {
    checkSiteCompanionSetting(o.companionSettings);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.orientation, unittest.equals('foo'));
    checkSiteSkippableSetting(o.skippableSettings);
    checkSiteTranscodeSetting(o.transcodeSettings);
  }
  buildCounterSiteVideoSettings--;
}

buildUnnamed5228() {
  var o = new core.List<api.Site>();
  o.add(buildSite());
  o.add(buildSite());
  return o;
}

checkUnnamed5228(core.List<api.Site> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSite(o[0]);
  checkSite(o[1]);
}

core.int buildCounterSitesListResponse = 0;
buildSitesListResponse() {
  var o = new api.SitesListResponse();
  buildCounterSitesListResponse++;
  if (buildCounterSitesListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.sites = buildUnnamed5228();
  }
  buildCounterSitesListResponse--;
  return o;
}

checkSitesListResponse(api.SitesListResponse o) {
  buildCounterSitesListResponse++;
  if (buildCounterSitesListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5228(o.sites);
  }
  buildCounterSitesListResponse--;
}

core.int buildCounterSize = 0;
buildSize() {
  var o = new api.Size();
  buildCounterSize++;
  if (buildCounterSize < 3) {
    o.height = 42;
    o.iab = true;
    o.id = "foo";
    o.kind = "foo";
    o.width = 42;
  }
  buildCounterSize--;
  return o;
}

checkSize(api.Size o) {
  buildCounterSize++;
  if (buildCounterSize < 3) {
    unittest.expect(o.height, unittest.equals(42));
    unittest.expect(o.iab, unittest.isTrue);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.width, unittest.equals(42));
  }
  buildCounterSize--;
}

buildUnnamed5229() {
  var o = new core.List<api.Size>();
  o.add(buildSize());
  o.add(buildSize());
  return o;
}

checkUnnamed5229(core.List<api.Size> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSize(o[0]);
  checkSize(o[1]);
}

core.int buildCounterSizesListResponse = 0;
buildSizesListResponse() {
  var o = new api.SizesListResponse();
  buildCounterSizesListResponse++;
  if (buildCounterSizesListResponse < 3) {
    o.kind = "foo";
    o.sizes = buildUnnamed5229();
  }
  buildCounterSizesListResponse--;
  return o;
}

checkSizesListResponse(api.SizesListResponse o) {
  buildCounterSizesListResponse++;
  if (buildCounterSizesListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5229(o.sizes);
  }
  buildCounterSizesListResponse--;
}

core.int buildCounterSkippableSetting = 0;
buildSkippableSetting() {
  var o = new api.SkippableSetting();
  buildCounterSkippableSetting++;
  if (buildCounterSkippableSetting < 3) {
    o.kind = "foo";
    o.progressOffset = buildVideoOffset();
    o.skipOffset = buildVideoOffset();
    o.skippable = true;
  }
  buildCounterSkippableSetting--;
  return o;
}

checkSkippableSetting(api.SkippableSetting o) {
  buildCounterSkippableSetting++;
  if (buildCounterSkippableSetting < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkVideoOffset(o.progressOffset);
    checkVideoOffset(o.skipOffset);
    unittest.expect(o.skippable, unittest.isTrue);
  }
  buildCounterSkippableSetting--;
}

core.int buildCounterSortedDimension = 0;
buildSortedDimension() {
  var o = new api.SortedDimension();
  buildCounterSortedDimension++;
  if (buildCounterSortedDimension < 3) {
    o.kind = "foo";
    o.name = "foo";
    o.sortOrder = "foo";
  }
  buildCounterSortedDimension--;
  return o;
}

checkSortedDimension(api.SortedDimension o) {
  buildCounterSortedDimension++;
  if (buildCounterSortedDimension < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.sortOrder, unittest.equals('foo'));
  }
  buildCounterSortedDimension--;
}

buildUnnamed5230() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5230(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSubaccount = 0;
buildSubaccount() {
  var o = new api.Subaccount();
  buildCounterSubaccount++;
  if (buildCounterSubaccount < 3) {
    o.accountId = "foo";
    o.availablePermissionIds = buildUnnamed5230();
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterSubaccount--;
  return o;
}

checkSubaccount(api.Subaccount o) {
  buildCounterSubaccount++;
  if (buildCounterSubaccount < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed5230(o.availablePermissionIds);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterSubaccount--;
}

buildUnnamed5231() {
  var o = new core.List<api.Subaccount>();
  o.add(buildSubaccount());
  o.add(buildSubaccount());
  return o;
}

checkUnnamed5231(core.List<api.Subaccount> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSubaccount(o[0]);
  checkSubaccount(o[1]);
}

core.int buildCounterSubaccountsListResponse = 0;
buildSubaccountsListResponse() {
  var o = new api.SubaccountsListResponse();
  buildCounterSubaccountsListResponse++;
  if (buildCounterSubaccountsListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.subaccounts = buildUnnamed5231();
  }
  buildCounterSubaccountsListResponse--;
  return o;
}

checkSubaccountsListResponse(api.SubaccountsListResponse o) {
  buildCounterSubaccountsListResponse++;
  if (buildCounterSubaccountsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5231(o.subaccounts);
  }
  buildCounterSubaccountsListResponse--;
}

core.int buildCounterTagData = 0;
buildTagData() {
  var o = new api.TagData();
  buildCounterTagData++;
  if (buildCounterTagData < 3) {
    o.adId = "foo";
    o.clickTag = "foo";
    o.creativeId = "foo";
    o.format = "foo";
    o.impressionTag = "foo";
  }
  buildCounterTagData--;
  return o;
}

checkTagData(api.TagData o) {
  buildCounterTagData++;
  if (buildCounterTagData < 3) {
    unittest.expect(o.adId, unittest.equals('foo'));
    unittest.expect(o.clickTag, unittest.equals('foo'));
    unittest.expect(o.creativeId, unittest.equals('foo'));
    unittest.expect(o.format, unittest.equals('foo'));
    unittest.expect(o.impressionTag, unittest.equals('foo'));
  }
  buildCounterTagData--;
}

core.int buildCounterTagSetting = 0;
buildTagSetting() {
  var o = new api.TagSetting();
  buildCounterTagSetting++;
  if (buildCounterTagSetting < 3) {
    o.additionalKeyValues = "foo";
    o.includeClickThroughUrls = true;
    o.includeClickTracking = true;
    o.keywordOption = "foo";
  }
  buildCounterTagSetting--;
  return o;
}

checkTagSetting(api.TagSetting o) {
  buildCounterTagSetting++;
  if (buildCounterTagSetting < 3) {
    unittest.expect(o.additionalKeyValues, unittest.equals('foo'));
    unittest.expect(o.includeClickThroughUrls, unittest.isTrue);
    unittest.expect(o.includeClickTracking, unittest.isTrue);
    unittest.expect(o.keywordOption, unittest.equals('foo'));
  }
  buildCounterTagSetting--;
}

core.int buildCounterTagSettings = 0;
buildTagSettings() {
  var o = new api.TagSettings();
  buildCounterTagSettings++;
  if (buildCounterTagSettings < 3) {
    o.dynamicTagEnabled = true;
    o.imageTagEnabled = true;
  }
  buildCounterTagSettings--;
  return o;
}

checkTagSettings(api.TagSettings o) {
  buildCounterTagSettings++;
  if (buildCounterTagSettings < 3) {
    unittest.expect(o.dynamicTagEnabled, unittest.isTrue);
    unittest.expect(o.imageTagEnabled, unittest.isTrue);
  }
  buildCounterTagSettings--;
}

core.int buildCounterTargetWindow = 0;
buildTargetWindow() {
  var o = new api.TargetWindow();
  buildCounterTargetWindow++;
  if (buildCounterTargetWindow < 3) {
    o.customHtml = "foo";
    o.targetWindowOption = "foo";
  }
  buildCounterTargetWindow--;
  return o;
}

checkTargetWindow(api.TargetWindow o) {
  buildCounterTargetWindow++;
  if (buildCounterTargetWindow < 3) {
    unittest.expect(o.customHtml, unittest.equals('foo'));
    unittest.expect(o.targetWindowOption, unittest.equals('foo'));
  }
  buildCounterTargetWindow--;
}

core.int buildCounterTargetableRemarketingList = 0;
buildTargetableRemarketingList() {
  var o = new api.TargetableRemarketingList();
  buildCounterTargetableRemarketingList++;
  if (buildCounterTargetableRemarketingList < 3) {
    o.accountId = "foo";
    o.active = true;
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.lifeSpan = "foo";
    o.listSize = "foo";
    o.listSource = "foo";
    o.name = "foo";
    o.subaccountId = "foo";
  }
  buildCounterTargetableRemarketingList--;
  return o;
}

checkTargetableRemarketingList(api.TargetableRemarketingList o) {
  buildCounterTargetableRemarketingList++;
  if (buildCounterTargetableRemarketingList < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.active, unittest.isTrue);
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.lifeSpan, unittest.equals('foo'));
    unittest.expect(o.listSize, unittest.equals('foo'));
    unittest.expect(o.listSource, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
  }
  buildCounterTargetableRemarketingList--;
}

buildUnnamed5232() {
  var o = new core.List<api.TargetableRemarketingList>();
  o.add(buildTargetableRemarketingList());
  o.add(buildTargetableRemarketingList());
  return o;
}

checkUnnamed5232(core.List<api.TargetableRemarketingList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetableRemarketingList(o[0]);
  checkTargetableRemarketingList(o[1]);
}

core.int buildCounterTargetableRemarketingListsListResponse = 0;
buildTargetableRemarketingListsListResponse() {
  var o = new api.TargetableRemarketingListsListResponse();
  buildCounterTargetableRemarketingListsListResponse++;
  if (buildCounterTargetableRemarketingListsListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.targetableRemarketingLists = buildUnnamed5232();
  }
  buildCounterTargetableRemarketingListsListResponse--;
  return o;
}

checkTargetableRemarketingListsListResponse(
    api.TargetableRemarketingListsListResponse o) {
  buildCounterTargetableRemarketingListsListResponse++;
  if (buildCounterTargetableRemarketingListsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5232(o.targetableRemarketingLists);
  }
  buildCounterTargetableRemarketingListsListResponse--;
}

core.int buildCounterTargetingTemplate = 0;
buildTargetingTemplate() {
  var o = new api.TargetingTemplate();
  buildCounterTargetingTemplate++;
  if (buildCounterTargetingTemplate < 3) {
    o.accountId = "foo";
    o.advertiserId = "foo";
    o.advertiserIdDimensionValue = buildDimensionValue();
    o.dayPartTargeting = buildDayPartTargeting();
    o.geoTargeting = buildGeoTargeting();
    o.id = "foo";
    o.keyValueTargetingExpression = buildKeyValueTargetingExpression();
    o.kind = "foo";
    o.languageTargeting = buildLanguageTargeting();
    o.listTargetingExpression = buildListTargetingExpression();
    o.name = "foo";
    o.subaccountId = "foo";
    o.technologyTargeting = buildTechnologyTargeting();
  }
  buildCounterTargetingTemplate--;
  return o;
}

checkTargetingTemplate(api.TargetingTemplate o) {
  buildCounterTargetingTemplate++;
  if (buildCounterTargetingTemplate < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkDimensionValue(o.advertiserIdDimensionValue);
    checkDayPartTargeting(o.dayPartTargeting);
    checkGeoTargeting(o.geoTargeting);
    unittest.expect(o.id, unittest.equals('foo'));
    checkKeyValueTargetingExpression(o.keyValueTargetingExpression);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkLanguageTargeting(o.languageTargeting);
    checkListTargetingExpression(o.listTargetingExpression);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.subaccountId, unittest.equals('foo'));
    checkTechnologyTargeting(o.technologyTargeting);
  }
  buildCounterTargetingTemplate--;
}

buildUnnamed5233() {
  var o = new core.List<api.TargetingTemplate>();
  o.add(buildTargetingTemplate());
  o.add(buildTargetingTemplate());
  return o;
}

checkUnnamed5233(core.List<api.TargetingTemplate> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetingTemplate(o[0]);
  checkTargetingTemplate(o[1]);
}

core.int buildCounterTargetingTemplatesListResponse = 0;
buildTargetingTemplatesListResponse() {
  var o = new api.TargetingTemplatesListResponse();
  buildCounterTargetingTemplatesListResponse++;
  if (buildCounterTargetingTemplatesListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.targetingTemplates = buildUnnamed5233();
  }
  buildCounterTargetingTemplatesListResponse--;
  return o;
}

checkTargetingTemplatesListResponse(api.TargetingTemplatesListResponse o) {
  buildCounterTargetingTemplatesListResponse++;
  if (buildCounterTargetingTemplatesListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5233(o.targetingTemplates);
  }
  buildCounterTargetingTemplatesListResponse--;
}

buildUnnamed5234() {
  var o = new core.List<api.Browser>();
  o.add(buildBrowser());
  o.add(buildBrowser());
  return o;
}

checkUnnamed5234(core.List<api.Browser> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBrowser(o[0]);
  checkBrowser(o[1]);
}

buildUnnamed5235() {
  var o = new core.List<api.ConnectionType>();
  o.add(buildConnectionType());
  o.add(buildConnectionType());
  return o;
}

checkUnnamed5235(core.List<api.ConnectionType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkConnectionType(o[0]);
  checkConnectionType(o[1]);
}

buildUnnamed5236() {
  var o = new core.List<api.MobileCarrier>();
  o.add(buildMobileCarrier());
  o.add(buildMobileCarrier());
  return o;
}

checkUnnamed5236(core.List<api.MobileCarrier> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMobileCarrier(o[0]);
  checkMobileCarrier(o[1]);
}

buildUnnamed5237() {
  var o = new core.List<api.OperatingSystemVersion>();
  o.add(buildOperatingSystemVersion());
  o.add(buildOperatingSystemVersion());
  return o;
}

checkUnnamed5237(core.List<api.OperatingSystemVersion> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperatingSystemVersion(o[0]);
  checkOperatingSystemVersion(o[1]);
}

buildUnnamed5238() {
  var o = new core.List<api.OperatingSystem>();
  o.add(buildOperatingSystem());
  o.add(buildOperatingSystem());
  return o;
}

checkUnnamed5238(core.List<api.OperatingSystem> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperatingSystem(o[0]);
  checkOperatingSystem(o[1]);
}

buildUnnamed5239() {
  var o = new core.List<api.PlatformType>();
  o.add(buildPlatformType());
  o.add(buildPlatformType());
  return o;
}

checkUnnamed5239(core.List<api.PlatformType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPlatformType(o[0]);
  checkPlatformType(o[1]);
}

core.int buildCounterTechnologyTargeting = 0;
buildTechnologyTargeting() {
  var o = new api.TechnologyTargeting();
  buildCounterTechnologyTargeting++;
  if (buildCounterTechnologyTargeting < 3) {
    o.browsers = buildUnnamed5234();
    o.connectionTypes = buildUnnamed5235();
    o.mobileCarriers = buildUnnamed5236();
    o.operatingSystemVersions = buildUnnamed5237();
    o.operatingSystems = buildUnnamed5238();
    o.platformTypes = buildUnnamed5239();
  }
  buildCounterTechnologyTargeting--;
  return o;
}

checkTechnologyTargeting(api.TechnologyTargeting o) {
  buildCounterTechnologyTargeting++;
  if (buildCounterTechnologyTargeting < 3) {
    checkUnnamed5234(o.browsers);
    checkUnnamed5235(o.connectionTypes);
    checkUnnamed5236(o.mobileCarriers);
    checkUnnamed5237(o.operatingSystemVersions);
    checkUnnamed5238(o.operatingSystems);
    checkUnnamed5239(o.platformTypes);
  }
  buildCounterTechnologyTargeting--;
}

core.int buildCounterThirdPartyAuthenticationToken = 0;
buildThirdPartyAuthenticationToken() {
  var o = new api.ThirdPartyAuthenticationToken();
  buildCounterThirdPartyAuthenticationToken++;
  if (buildCounterThirdPartyAuthenticationToken < 3) {
    o.name = "foo";
    o.value = "foo";
  }
  buildCounterThirdPartyAuthenticationToken--;
  return o;
}

checkThirdPartyAuthenticationToken(api.ThirdPartyAuthenticationToken o) {
  buildCounterThirdPartyAuthenticationToken++;
  if (buildCounterThirdPartyAuthenticationToken < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterThirdPartyAuthenticationToken--;
}

core.int buildCounterThirdPartyTrackingUrl = 0;
buildThirdPartyTrackingUrl() {
  var o = new api.ThirdPartyTrackingUrl();
  buildCounterThirdPartyTrackingUrl++;
  if (buildCounterThirdPartyTrackingUrl < 3) {
    o.thirdPartyUrlType = "foo";
    o.url = "foo";
  }
  buildCounterThirdPartyTrackingUrl--;
  return o;
}

checkThirdPartyTrackingUrl(api.ThirdPartyTrackingUrl o) {
  buildCounterThirdPartyTrackingUrl++;
  if (buildCounterThirdPartyTrackingUrl < 3) {
    unittest.expect(o.thirdPartyUrlType, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterThirdPartyTrackingUrl--;
}

buildUnnamed5240() {
  var o = new core.List<core.int>();
  o.add(42);
  o.add(42);
  return o;
}

checkUnnamed5240(core.List<core.int> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals(42));
  unittest.expect(o[1], unittest.equals(42));
}

core.int buildCounterTranscodeSetting = 0;
buildTranscodeSetting() {
  var o = new api.TranscodeSetting();
  buildCounterTranscodeSetting++;
  if (buildCounterTranscodeSetting < 3) {
    o.enabledVideoFormats = buildUnnamed5240();
    o.kind = "foo";
  }
  buildCounterTranscodeSetting--;
  return o;
}

checkTranscodeSetting(api.TranscodeSetting o) {
  buildCounterTranscodeSetting++;
  if (buildCounterTranscodeSetting < 3) {
    checkUnnamed5240(o.enabledVideoFormats);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterTranscodeSetting--;
}

core.int buildCounterUniversalAdId = 0;
buildUniversalAdId() {
  var o = new api.UniversalAdId();
  buildCounterUniversalAdId++;
  if (buildCounterUniversalAdId < 3) {
    o.registry = "foo";
    o.value = "foo";
  }
  buildCounterUniversalAdId--;
  return o;
}

checkUniversalAdId(api.UniversalAdId o) {
  buildCounterUniversalAdId++;
  if (buildCounterUniversalAdId < 3) {
    unittest.expect(o.registry, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterUniversalAdId--;
}

core.int buildCounterUserDefinedVariableConfiguration = 0;
buildUserDefinedVariableConfiguration() {
  var o = new api.UserDefinedVariableConfiguration();
  buildCounterUserDefinedVariableConfiguration++;
  if (buildCounterUserDefinedVariableConfiguration < 3) {
    o.dataType = "foo";
    o.reportName = "foo";
    o.variableType = "foo";
  }
  buildCounterUserDefinedVariableConfiguration--;
  return o;
}

checkUserDefinedVariableConfiguration(api.UserDefinedVariableConfiguration o) {
  buildCounterUserDefinedVariableConfiguration++;
  if (buildCounterUserDefinedVariableConfiguration < 3) {
    unittest.expect(o.dataType, unittest.equals('foo'));
    unittest.expect(o.reportName, unittest.equals('foo'));
    unittest.expect(o.variableType, unittest.equals('foo'));
  }
  buildCounterUserDefinedVariableConfiguration--;
}

core.int buildCounterUserProfile = 0;
buildUserProfile() {
  var o = new api.UserProfile();
  buildCounterUserProfile++;
  if (buildCounterUserProfile < 3) {
    o.accountId = "foo";
    o.accountName = "foo";
    o.etag = "foo";
    o.kind = "foo";
    o.profileId = "foo";
    o.subAccountId = "foo";
    o.subAccountName = "foo";
    o.userName = "foo";
  }
  buildCounterUserProfile--;
  return o;
}

checkUserProfile(api.UserProfile o) {
  buildCounterUserProfile++;
  if (buildCounterUserProfile < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.accountName, unittest.equals('foo'));
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.profileId, unittest.equals('foo'));
    unittest.expect(o.subAccountId, unittest.equals('foo'));
    unittest.expect(o.subAccountName, unittest.equals('foo'));
    unittest.expect(o.userName, unittest.equals('foo'));
  }
  buildCounterUserProfile--;
}

buildUnnamed5241() {
  var o = new core.List<api.UserProfile>();
  o.add(buildUserProfile());
  o.add(buildUserProfile());
  return o;
}

checkUnnamed5241(core.List<api.UserProfile> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserProfile(o[0]);
  checkUserProfile(o[1]);
}

core.int buildCounterUserProfileList = 0;
buildUserProfileList() {
  var o = new api.UserProfileList();
  buildCounterUserProfileList++;
  if (buildCounterUserProfileList < 3) {
    o.etag = "foo";
    o.items = buildUnnamed5241();
    o.kind = "foo";
  }
  buildCounterUserProfileList--;
  return o;
}

checkUserProfileList(api.UserProfileList o) {
  buildCounterUserProfileList++;
  if (buildCounterUserProfileList < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed5241(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterUserProfileList--;
}

buildUnnamed5242() {
  var o = new core.List<api.UserRolePermission>();
  o.add(buildUserRolePermission());
  o.add(buildUserRolePermission());
  return o;
}

checkUnnamed5242(core.List<api.UserRolePermission> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserRolePermission(o[0]);
  checkUserRolePermission(o[1]);
}

core.int buildCounterUserRole = 0;
buildUserRole() {
  var o = new api.UserRole();
  buildCounterUserRole++;
  if (buildCounterUserRole < 3) {
    o.accountId = "foo";
    o.defaultUserRole = true;
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.parentUserRoleId = "foo";
    o.permissions = buildUnnamed5242();
    o.subaccountId = "foo";
  }
  buildCounterUserRole--;
  return o;
}

checkUserRole(api.UserRole o) {
  buildCounterUserRole++;
  if (buildCounterUserRole < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.defaultUserRole, unittest.isTrue);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.parentUserRoleId, unittest.equals('foo'));
    checkUnnamed5242(o.permissions);
    unittest.expect(o.subaccountId, unittest.equals('foo'));
  }
  buildCounterUserRole--;
}

core.int buildCounterUserRolePermission = 0;
buildUserRolePermission() {
  var o = new api.UserRolePermission();
  buildCounterUserRolePermission++;
  if (buildCounterUserRolePermission < 3) {
    o.availability = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.permissionGroupId = "foo";
  }
  buildCounterUserRolePermission--;
  return o;
}

checkUserRolePermission(api.UserRolePermission o) {
  buildCounterUserRolePermission++;
  if (buildCounterUserRolePermission < 3) {
    unittest.expect(o.availability, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.permissionGroupId, unittest.equals('foo'));
  }
  buildCounterUserRolePermission--;
}

core.int buildCounterUserRolePermissionGroup = 0;
buildUserRolePermissionGroup() {
  var o = new api.UserRolePermissionGroup();
  buildCounterUserRolePermissionGroup++;
  if (buildCounterUserRolePermissionGroup < 3) {
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterUserRolePermissionGroup--;
  return o;
}

checkUserRolePermissionGroup(api.UserRolePermissionGroup o) {
  buildCounterUserRolePermissionGroup++;
  if (buildCounterUserRolePermissionGroup < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterUserRolePermissionGroup--;
}

buildUnnamed5243() {
  var o = new core.List<api.UserRolePermissionGroup>();
  o.add(buildUserRolePermissionGroup());
  o.add(buildUserRolePermissionGroup());
  return o;
}

checkUnnamed5243(core.List<api.UserRolePermissionGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserRolePermissionGroup(o[0]);
  checkUserRolePermissionGroup(o[1]);
}

core.int buildCounterUserRolePermissionGroupsListResponse = 0;
buildUserRolePermissionGroupsListResponse() {
  var o = new api.UserRolePermissionGroupsListResponse();
  buildCounterUserRolePermissionGroupsListResponse++;
  if (buildCounterUserRolePermissionGroupsListResponse < 3) {
    o.kind = "foo";
    o.userRolePermissionGroups = buildUnnamed5243();
  }
  buildCounterUserRolePermissionGroupsListResponse--;
  return o;
}

checkUserRolePermissionGroupsListResponse(
    api.UserRolePermissionGroupsListResponse o) {
  buildCounterUserRolePermissionGroupsListResponse++;
  if (buildCounterUserRolePermissionGroupsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5243(o.userRolePermissionGroups);
  }
  buildCounterUserRolePermissionGroupsListResponse--;
}

buildUnnamed5244() {
  var o = new core.List<api.UserRolePermission>();
  o.add(buildUserRolePermission());
  o.add(buildUserRolePermission());
  return o;
}

checkUnnamed5244(core.List<api.UserRolePermission> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserRolePermission(o[0]);
  checkUserRolePermission(o[1]);
}

core.int buildCounterUserRolePermissionsListResponse = 0;
buildUserRolePermissionsListResponse() {
  var o = new api.UserRolePermissionsListResponse();
  buildCounterUserRolePermissionsListResponse++;
  if (buildCounterUserRolePermissionsListResponse < 3) {
    o.kind = "foo";
    o.userRolePermissions = buildUnnamed5244();
  }
  buildCounterUserRolePermissionsListResponse--;
  return o;
}

checkUserRolePermissionsListResponse(api.UserRolePermissionsListResponse o) {
  buildCounterUserRolePermissionsListResponse++;
  if (buildCounterUserRolePermissionsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5244(o.userRolePermissions);
  }
  buildCounterUserRolePermissionsListResponse--;
}

buildUnnamed5245() {
  var o = new core.List<api.UserRole>();
  o.add(buildUserRole());
  o.add(buildUserRole());
  return o;
}

checkUnnamed5245(core.List<api.UserRole> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserRole(o[0]);
  checkUserRole(o[1]);
}

core.int buildCounterUserRolesListResponse = 0;
buildUserRolesListResponse() {
  var o = new api.UserRolesListResponse();
  buildCounterUserRolesListResponse++;
  if (buildCounterUserRolesListResponse < 3) {
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.userRoles = buildUnnamed5245();
  }
  buildCounterUserRolesListResponse--;
  return o;
}

checkUserRolesListResponse(api.UserRolesListResponse o) {
  buildCounterUserRolesListResponse++;
  if (buildCounterUserRolesListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed5245(o.userRoles);
  }
  buildCounterUserRolesListResponse--;
}

core.int buildCounterVideoFormat = 0;
buildVideoFormat() {
  var o = new api.VideoFormat();
  buildCounterVideoFormat++;
  if (buildCounterVideoFormat < 3) {
    o.fileType = "foo";
    o.id = 42;
    o.kind = "foo";
    o.resolution = buildSize();
    o.targetBitRate = 42;
  }
  buildCounterVideoFormat--;
  return o;
}

checkVideoFormat(api.VideoFormat o) {
  buildCounterVideoFormat++;
  if (buildCounterVideoFormat < 3) {
    unittest.expect(o.fileType, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals(42));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkSize(o.resolution);
    unittest.expect(o.targetBitRate, unittest.equals(42));
  }
  buildCounterVideoFormat--;
}

buildUnnamed5246() {
  var o = new core.List<api.VideoFormat>();
  o.add(buildVideoFormat());
  o.add(buildVideoFormat());
  return o;
}

checkUnnamed5246(core.List<api.VideoFormat> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVideoFormat(o[0]);
  checkVideoFormat(o[1]);
}

core.int buildCounterVideoFormatsListResponse = 0;
buildVideoFormatsListResponse() {
  var o = new api.VideoFormatsListResponse();
  buildCounterVideoFormatsListResponse++;
  if (buildCounterVideoFormatsListResponse < 3) {
    o.kind = "foo";
    o.videoFormats = buildUnnamed5246();
  }
  buildCounterVideoFormatsListResponse--;
  return o;
}

checkVideoFormatsListResponse(api.VideoFormatsListResponse o) {
  buildCounterVideoFormatsListResponse++;
  if (buildCounterVideoFormatsListResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed5246(o.videoFormats);
  }
  buildCounterVideoFormatsListResponse--;
}

core.int buildCounterVideoOffset = 0;
buildVideoOffset() {
  var o = new api.VideoOffset();
  buildCounterVideoOffset++;
  if (buildCounterVideoOffset < 3) {
    o.offsetPercentage = 42;
    o.offsetSeconds = 42;
  }
  buildCounterVideoOffset--;
  return o;
}

checkVideoOffset(api.VideoOffset o) {
  buildCounterVideoOffset++;
  if (buildCounterVideoOffset < 3) {
    unittest.expect(o.offsetPercentage, unittest.equals(42));
    unittest.expect(o.offsetSeconds, unittest.equals(42));
  }
  buildCounterVideoOffset--;
}

core.int buildCounterVideoSettings = 0;
buildVideoSettings() {
  var o = new api.VideoSettings();
  buildCounterVideoSettings++;
  if (buildCounterVideoSettings < 3) {
    o.companionSettings = buildCompanionSetting();
    o.kind = "foo";
    o.orientation = "foo";
    o.skippableSettings = buildSkippableSetting();
    o.transcodeSettings = buildTranscodeSetting();
  }
  buildCounterVideoSettings--;
  return o;
}

checkVideoSettings(api.VideoSettings o) {
  buildCounterVideoSettings++;
  if (buildCounterVideoSettings < 3) {
    checkCompanionSetting(o.companionSettings);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.orientation, unittest.equals('foo'));
    checkSkippableSetting(o.skippableSettings);
    checkTranscodeSetting(o.transcodeSettings);
  }
  buildCounterVideoSettings--;
}

buildUnnamed5247() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5247(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5248() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5248(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5249() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5249(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5250() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5250(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5251() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5251(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5252() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5252(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5253() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5253(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5254() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5254(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5255() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5255(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5256() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5256(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5257() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5257(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5258() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5258(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5259() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5259(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5260() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5260(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5261() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5261(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5262() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5262(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5263() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5263(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5264() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5264(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5265() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5265(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5266() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5266(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5267() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5267(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5268() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5268(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5269() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5269(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5270() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5270(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5271() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5271(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5272() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5272(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5273() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5273(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5274() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5274(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5275() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5275(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5276() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5276(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5277() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5277(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5278() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5278(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5279() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5279(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5280() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5280(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5281() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5281(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5282() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5282(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5283() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5283(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5284() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5284(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5285() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5285(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5286() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5286(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5287() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5287(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5288() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5288(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5289() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5289(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5290() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5290(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5291() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5291(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5292() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5292(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5293() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5293(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5294() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5294(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5295() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5295(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5296() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5296(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5297() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5297(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5298() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5298(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5299() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5299(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5300() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5300(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5301() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5301(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5302() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5302(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5303() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5303(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5304() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5304(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5305() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5305(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5306() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5306(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5307() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5307(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5308() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5308(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5309() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5309(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5310() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5310(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5311() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5311(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5312() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5312(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5313() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5313(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5314() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5314(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5315() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5315(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5316() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5316(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5317() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5317(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5318() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5318(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5319() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5319(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5320() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5320(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5321() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5321(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5322() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5322(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5323() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5323(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5324() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5324(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5325() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5325(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5326() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5326(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5327() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5327(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5328() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5328(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5329() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5329(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5330() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5330(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5331() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5331(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5332() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5332(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5333() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5333(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5334() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5334(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5335() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5335(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5336() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5336(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed5337() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed5337(core.List<core.String> o) {
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

  unittest.group("obj-schema-AccountActiveAdSummary", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountActiveAdSummary();
      var od = new api.AccountActiveAdSummary.fromJson(o.toJson());
      checkAccountActiveAdSummary(od);
    });
  });

  unittest.group("obj-schema-AccountPermission", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountPermission();
      var od = new api.AccountPermission.fromJson(o.toJson());
      checkAccountPermission(od);
    });
  });

  unittest.group("obj-schema-AccountPermissionGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountPermissionGroup();
      var od = new api.AccountPermissionGroup.fromJson(o.toJson());
      checkAccountPermissionGroup(od);
    });
  });

  unittest.group("obj-schema-AccountPermissionGroupsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountPermissionGroupsListResponse();
      var od = new api.AccountPermissionGroupsListResponse.fromJson(o.toJson());
      checkAccountPermissionGroupsListResponse(od);
    });
  });

  unittest.group("obj-schema-AccountPermissionsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountPermissionsListResponse();
      var od = new api.AccountPermissionsListResponse.fromJson(o.toJson());
      checkAccountPermissionsListResponse(od);
    });
  });

  unittest.group("obj-schema-AccountUserProfile", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountUserProfile();
      var od = new api.AccountUserProfile.fromJson(o.toJson());
      checkAccountUserProfile(od);
    });
  });

  unittest.group("obj-schema-AccountUserProfilesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountUserProfilesListResponse();
      var od = new api.AccountUserProfilesListResponse.fromJson(o.toJson());
      checkAccountUserProfilesListResponse(od);
    });
  });

  unittest.group("obj-schema-AccountsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountsListResponse();
      var od = new api.AccountsListResponse.fromJson(o.toJson());
      checkAccountsListResponse(od);
    });
  });

  unittest.group("obj-schema-Activities", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivities();
      var od = new api.Activities.fromJson(o.toJson());
      checkActivities(od);
    });
  });

  unittest.group("obj-schema-Ad", () {
    unittest.test("to-json--from-json", () {
      var o = buildAd();
      var od = new api.Ad.fromJson(o.toJson());
      checkAd(od);
    });
  });

  unittest.group("obj-schema-AdBlockingConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdBlockingConfiguration();
      var od = new api.AdBlockingConfiguration.fromJson(o.toJson());
      checkAdBlockingConfiguration(od);
    });
  });

  unittest.group("obj-schema-AdSlot", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdSlot();
      var od = new api.AdSlot.fromJson(o.toJson());
      checkAdSlot(od);
    });
  });

  unittest.group("obj-schema-AdsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdsListResponse();
      var od = new api.AdsListResponse.fromJson(o.toJson());
      checkAdsListResponse(od);
    });
  });

  unittest.group("obj-schema-Advertiser", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiser();
      var od = new api.Advertiser.fromJson(o.toJson());
      checkAdvertiser(od);
    });
  });

  unittest.group("obj-schema-AdvertiserGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiserGroup();
      var od = new api.AdvertiserGroup.fromJson(o.toJson());
      checkAdvertiserGroup(od);
    });
  });

  unittest.group("obj-schema-AdvertiserGroupsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiserGroupsListResponse();
      var od = new api.AdvertiserGroupsListResponse.fromJson(o.toJson());
      checkAdvertiserGroupsListResponse(od);
    });
  });

  unittest.group("obj-schema-AdvertiserLandingPagesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiserLandingPagesListResponse();
      var od = new api.AdvertiserLandingPagesListResponse.fromJson(o.toJson());
      checkAdvertiserLandingPagesListResponse(od);
    });
  });

  unittest.group("obj-schema-AdvertisersListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertisersListResponse();
      var od = new api.AdvertisersListResponse.fromJson(o.toJson());
      checkAdvertisersListResponse(od);
    });
  });

  unittest.group("obj-schema-AudienceSegment", () {
    unittest.test("to-json--from-json", () {
      var o = buildAudienceSegment();
      var od = new api.AudienceSegment.fromJson(o.toJson());
      checkAudienceSegment(od);
    });
  });

  unittest.group("obj-schema-AudienceSegmentGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildAudienceSegmentGroup();
      var od = new api.AudienceSegmentGroup.fromJson(o.toJson());
      checkAudienceSegmentGroup(od);
    });
  });

  unittest.group("obj-schema-Browser", () {
    unittest.test("to-json--from-json", () {
      var o = buildBrowser();
      var od = new api.Browser.fromJson(o.toJson());
      checkBrowser(od);
    });
  });

  unittest.group("obj-schema-BrowsersListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildBrowsersListResponse();
      var od = new api.BrowsersListResponse.fromJson(o.toJson());
      checkBrowsersListResponse(od);
    });
  });

  unittest.group("obj-schema-Campaign", () {
    unittest.test("to-json--from-json", () {
      var o = buildCampaign();
      var od = new api.Campaign.fromJson(o.toJson());
      checkCampaign(od);
    });
  });

  unittest.group("obj-schema-CampaignCreativeAssociation", () {
    unittest.test("to-json--from-json", () {
      var o = buildCampaignCreativeAssociation();
      var od = new api.CampaignCreativeAssociation.fromJson(o.toJson());
      checkCampaignCreativeAssociation(od);
    });
  });

  unittest.group("obj-schema-CampaignCreativeAssociationsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCampaignCreativeAssociationsListResponse();
      var od =
          new api.CampaignCreativeAssociationsListResponse.fromJson(o.toJson());
      checkCampaignCreativeAssociationsListResponse(od);
    });
  });

  unittest.group("obj-schema-CampaignManagerIds", () {
    unittest.test("to-json--from-json", () {
      var o = buildCampaignManagerIds();
      var od = new api.CampaignManagerIds.fromJson(o.toJson());
      checkCampaignManagerIds(od);
    });
  });

  unittest.group("obj-schema-CampaignsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCampaignsListResponse();
      var od = new api.CampaignsListResponse.fromJson(o.toJson());
      checkCampaignsListResponse(od);
    });
  });

  unittest.group("obj-schema-ChangeLog", () {
    unittest.test("to-json--from-json", () {
      var o = buildChangeLog();
      var od = new api.ChangeLog.fromJson(o.toJson());
      checkChangeLog(od);
    });
  });

  unittest.group("obj-schema-ChangeLogsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildChangeLogsListResponse();
      var od = new api.ChangeLogsListResponse.fromJson(o.toJson());
      checkChangeLogsListResponse(od);
    });
  });

  unittest.group("obj-schema-CitiesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCitiesListResponse();
      var od = new api.CitiesListResponse.fromJson(o.toJson());
      checkCitiesListResponse(od);
    });
  });

  unittest.group("obj-schema-City", () {
    unittest.test("to-json--from-json", () {
      var o = buildCity();
      var od = new api.City.fromJson(o.toJson());
      checkCity(od);
    });
  });

  unittest.group("obj-schema-ClickTag", () {
    unittest.test("to-json--from-json", () {
      var o = buildClickTag();
      var od = new api.ClickTag.fromJson(o.toJson());
      checkClickTag(od);
    });
  });

  unittest.group("obj-schema-ClickThroughUrl", () {
    unittest.test("to-json--from-json", () {
      var o = buildClickThroughUrl();
      var od = new api.ClickThroughUrl.fromJson(o.toJson());
      checkClickThroughUrl(od);
    });
  });

  unittest.group("obj-schema-ClickThroughUrlSuffixProperties", () {
    unittest.test("to-json--from-json", () {
      var o = buildClickThroughUrlSuffixProperties();
      var od = new api.ClickThroughUrlSuffixProperties.fromJson(o.toJson());
      checkClickThroughUrlSuffixProperties(od);
    });
  });

  unittest.group("obj-schema-CompanionClickThroughOverride", () {
    unittest.test("to-json--from-json", () {
      var o = buildCompanionClickThroughOverride();
      var od = new api.CompanionClickThroughOverride.fromJson(o.toJson());
      checkCompanionClickThroughOverride(od);
    });
  });

  unittest.group("obj-schema-CompanionSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildCompanionSetting();
      var od = new api.CompanionSetting.fromJson(o.toJson());
      checkCompanionSetting(od);
    });
  });

  unittest.group("obj-schema-CompatibleFields", () {
    unittest.test("to-json--from-json", () {
      var o = buildCompatibleFields();
      var od = new api.CompatibleFields.fromJson(o.toJson());
      checkCompatibleFields(od);
    });
  });

  unittest.group("obj-schema-ConnectionType", () {
    unittest.test("to-json--from-json", () {
      var o = buildConnectionType();
      var od = new api.ConnectionType.fromJson(o.toJson());
      checkConnectionType(od);
    });
  });

  unittest.group("obj-schema-ConnectionTypesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildConnectionTypesListResponse();
      var od = new api.ConnectionTypesListResponse.fromJson(o.toJson());
      checkConnectionTypesListResponse(od);
    });
  });

  unittest.group("obj-schema-ContentCategoriesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildContentCategoriesListResponse();
      var od = new api.ContentCategoriesListResponse.fromJson(o.toJson());
      checkContentCategoriesListResponse(od);
    });
  });

  unittest.group("obj-schema-ContentCategory", () {
    unittest.test("to-json--from-json", () {
      var o = buildContentCategory();
      var od = new api.ContentCategory.fromJson(o.toJson());
      checkContentCategory(od);
    });
  });

  unittest.group("obj-schema-Conversion", () {
    unittest.test("to-json--from-json", () {
      var o = buildConversion();
      var od = new api.Conversion.fromJson(o.toJson());
      checkConversion(od);
    });
  });

  unittest.group("obj-schema-ConversionError", () {
    unittest.test("to-json--from-json", () {
      var o = buildConversionError();
      var od = new api.ConversionError.fromJson(o.toJson());
      checkConversionError(od);
    });
  });

  unittest.group("obj-schema-ConversionStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildConversionStatus();
      var od = new api.ConversionStatus.fromJson(o.toJson());
      checkConversionStatus(od);
    });
  });

  unittest.group("obj-schema-ConversionsBatchInsertRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildConversionsBatchInsertRequest();
      var od = new api.ConversionsBatchInsertRequest.fromJson(o.toJson());
      checkConversionsBatchInsertRequest(od);
    });
  });

  unittest.group("obj-schema-ConversionsBatchInsertResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildConversionsBatchInsertResponse();
      var od = new api.ConversionsBatchInsertResponse.fromJson(o.toJson());
      checkConversionsBatchInsertResponse(od);
    });
  });

  unittest.group("obj-schema-ConversionsBatchUpdateRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildConversionsBatchUpdateRequest();
      var od = new api.ConversionsBatchUpdateRequest.fromJson(o.toJson());
      checkConversionsBatchUpdateRequest(od);
    });
  });

  unittest.group("obj-schema-ConversionsBatchUpdateResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildConversionsBatchUpdateResponse();
      var od = new api.ConversionsBatchUpdateResponse.fromJson(o.toJson());
      checkConversionsBatchUpdateResponse(od);
    });
  });

  unittest.group("obj-schema-CountriesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCountriesListResponse();
      var od = new api.CountriesListResponse.fromJson(o.toJson());
      checkCountriesListResponse(od);
    });
  });

  unittest.group("obj-schema-Country", () {
    unittest.test("to-json--from-json", () {
      var o = buildCountry();
      var od = new api.Country.fromJson(o.toJson());
      checkCountry(od);
    });
  });

  unittest.group("obj-schema-Creative", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreative();
      var od = new api.Creative.fromJson(o.toJson());
      checkCreative(od);
    });
  });

  unittest.group("obj-schema-CreativeAsset", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeAsset();
      var od = new api.CreativeAsset.fromJson(o.toJson());
      checkCreativeAsset(od);
    });
  });

  unittest.group("obj-schema-CreativeAssetId", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeAssetId();
      var od = new api.CreativeAssetId.fromJson(o.toJson());
      checkCreativeAssetId(od);
    });
  });

  unittest.group("obj-schema-CreativeAssetMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeAssetMetadata();
      var od = new api.CreativeAssetMetadata.fromJson(o.toJson());
      checkCreativeAssetMetadata(od);
    });
  });

  unittest.group("obj-schema-CreativeAssetSelection", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeAssetSelection();
      var od = new api.CreativeAssetSelection.fromJson(o.toJson());
      checkCreativeAssetSelection(od);
    });
  });

  unittest.group("obj-schema-CreativeAssignment", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeAssignment();
      var od = new api.CreativeAssignment.fromJson(o.toJson());
      checkCreativeAssignment(od);
    });
  });

  unittest.group("obj-schema-CreativeClickThroughUrl", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeClickThroughUrl();
      var od = new api.CreativeClickThroughUrl.fromJson(o.toJson());
      checkCreativeClickThroughUrl(od);
    });
  });

  unittest.group("obj-schema-CreativeCustomEvent", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeCustomEvent();
      var od = new api.CreativeCustomEvent.fromJson(o.toJson());
      checkCreativeCustomEvent(od);
    });
  });

  unittest.group("obj-schema-CreativeField", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeField();
      var od = new api.CreativeField.fromJson(o.toJson());
      checkCreativeField(od);
    });
  });

  unittest.group("obj-schema-CreativeFieldAssignment", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeFieldAssignment();
      var od = new api.CreativeFieldAssignment.fromJson(o.toJson());
      checkCreativeFieldAssignment(od);
    });
  });

  unittest.group("obj-schema-CreativeFieldValue", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeFieldValue();
      var od = new api.CreativeFieldValue.fromJson(o.toJson());
      checkCreativeFieldValue(od);
    });
  });

  unittest.group("obj-schema-CreativeFieldValuesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeFieldValuesListResponse();
      var od = new api.CreativeFieldValuesListResponse.fromJson(o.toJson());
      checkCreativeFieldValuesListResponse(od);
    });
  });

  unittest.group("obj-schema-CreativeFieldsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeFieldsListResponse();
      var od = new api.CreativeFieldsListResponse.fromJson(o.toJson());
      checkCreativeFieldsListResponse(od);
    });
  });

  unittest.group("obj-schema-CreativeGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeGroup();
      var od = new api.CreativeGroup.fromJson(o.toJson());
      checkCreativeGroup(od);
    });
  });

  unittest.group("obj-schema-CreativeGroupAssignment", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeGroupAssignment();
      var od = new api.CreativeGroupAssignment.fromJson(o.toJson());
      checkCreativeGroupAssignment(od);
    });
  });

  unittest.group("obj-schema-CreativeGroupsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeGroupsListResponse();
      var od = new api.CreativeGroupsListResponse.fromJson(o.toJson());
      checkCreativeGroupsListResponse(od);
    });
  });

  unittest.group("obj-schema-CreativeOptimizationConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeOptimizationConfiguration();
      var od = new api.CreativeOptimizationConfiguration.fromJson(o.toJson());
      checkCreativeOptimizationConfiguration(od);
    });
  });

  unittest.group("obj-schema-CreativeRotation", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeRotation();
      var od = new api.CreativeRotation.fromJson(o.toJson());
      checkCreativeRotation(od);
    });
  });

  unittest.group("obj-schema-CreativesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativesListResponse();
      var od = new api.CreativesListResponse.fromJson(o.toJson());
      checkCreativesListResponse(od);
    });
  });

  unittest.group("obj-schema-CrossDimensionReachReportCompatibleFields", () {
    unittest.test("to-json--from-json", () {
      var o = buildCrossDimensionReachReportCompatibleFields();
      var od = new api.CrossDimensionReachReportCompatibleFields.fromJson(
          o.toJson());
      checkCrossDimensionReachReportCompatibleFields(od);
    });
  });

  unittest.group("obj-schema-CustomEvent", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomEvent();
      var od = new api.CustomEvent.fromJson(o.toJson());
      checkCustomEvent(od);
    });
  });

  unittest.group("obj-schema-CustomEventClickAnnotation", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomEventClickAnnotation();
      var od = new api.CustomEventClickAnnotation.fromJson(o.toJson());
      checkCustomEventClickAnnotation(od);
    });
  });

  unittest.group("obj-schema-CustomEventError", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomEventError();
      var od = new api.CustomEventError.fromJson(o.toJson());
      checkCustomEventError(od);
    });
  });

  unittest.group("obj-schema-CustomEventImpressionAnnotation", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomEventImpressionAnnotation();
      var od = new api.CustomEventImpressionAnnotation.fromJson(o.toJson());
      checkCustomEventImpressionAnnotation(od);
    });
  });

  unittest.group("obj-schema-CustomEventInsert", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomEventInsert();
      var od = new api.CustomEventInsert.fromJson(o.toJson());
      checkCustomEventInsert(od);
    });
  });

  unittest.group("obj-schema-CustomEventStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomEventStatus();
      var od = new api.CustomEventStatus.fromJson(o.toJson());
      checkCustomEventStatus(od);
    });
  });

  unittest.group("obj-schema-CustomEventsBatchInsertRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomEventsBatchInsertRequest();
      var od = new api.CustomEventsBatchInsertRequest.fromJson(o.toJson());
      checkCustomEventsBatchInsertRequest(od);
    });
  });

  unittest.group("obj-schema-CustomEventsBatchInsertResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomEventsBatchInsertResponse();
      var od = new api.CustomEventsBatchInsertResponse.fromJson(o.toJson());
      checkCustomEventsBatchInsertResponse(od);
    });
  });

  unittest.group("obj-schema-CustomFloodlightVariable", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomFloodlightVariable();
      var od = new api.CustomFloodlightVariable.fromJson(o.toJson());
      checkCustomFloodlightVariable(od);
    });
  });

  unittest.group("obj-schema-CustomRichMediaEvents", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomRichMediaEvents();
      var od = new api.CustomRichMediaEvents.fromJson(o.toJson());
      checkCustomRichMediaEvents(od);
    });
  });

  unittest.group("obj-schema-CustomVariable", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomVariable();
      var od = new api.CustomVariable.fromJson(o.toJson());
      checkCustomVariable(od);
    });
  });

  unittest.group("obj-schema-CustomViewabilityMetric", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomViewabilityMetric();
      var od = new api.CustomViewabilityMetric.fromJson(o.toJson());
      checkCustomViewabilityMetric(od);
    });
  });

  unittest.group("obj-schema-CustomViewabilityMetricConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomViewabilityMetricConfiguration();
      var od =
          new api.CustomViewabilityMetricConfiguration.fromJson(o.toJson());
      checkCustomViewabilityMetricConfiguration(od);
    });
  });

  unittest.group("obj-schema-DV3Ids", () {
    unittest.test("to-json--from-json", () {
      var o = buildDV3Ids();
      var od = new api.DV3Ids.fromJson(o.toJson());
      checkDV3Ids(od);
    });
  });

  unittest.group("obj-schema-DateRange", () {
    unittest.test("to-json--from-json", () {
      var o = buildDateRange();
      var od = new api.DateRange.fromJson(o.toJson());
      checkDateRange(od);
    });
  });

  unittest.group("obj-schema-DayPartTargeting", () {
    unittest.test("to-json--from-json", () {
      var o = buildDayPartTargeting();
      var od = new api.DayPartTargeting.fromJson(o.toJson());
      checkDayPartTargeting(od);
    });
  });

  unittest.group("obj-schema-DeepLink", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeepLink();
      var od = new api.DeepLink.fromJson(o.toJson());
      checkDeepLink(od);
    });
  });

  unittest.group("obj-schema-DefaultClickThroughEventTagProperties", () {
    unittest.test("to-json--from-json", () {
      var o = buildDefaultClickThroughEventTagProperties();
      var od =
          new api.DefaultClickThroughEventTagProperties.fromJson(o.toJson());
      checkDefaultClickThroughEventTagProperties(od);
    });
  });

  unittest.group("obj-schema-DeliverySchedule", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeliverySchedule();
      var od = new api.DeliverySchedule.fromJson(o.toJson());
      checkDeliverySchedule(od);
    });
  });

  unittest.group("obj-schema-DfpSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildDfpSettings();
      var od = new api.DfpSettings.fromJson(o.toJson());
      checkDfpSettings(od);
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

  unittest.group("obj-schema-DimensionValue", () {
    unittest.test("to-json--from-json", () {
      var o = buildDimensionValue();
      var od = new api.DimensionValue.fromJson(o.toJson());
      checkDimensionValue(od);
    });
  });

  unittest.group("obj-schema-DimensionValueList", () {
    unittest.test("to-json--from-json", () {
      var o = buildDimensionValueList();
      var od = new api.DimensionValueList.fromJson(o.toJson());
      checkDimensionValueList(od);
    });
  });

  unittest.group("obj-schema-DimensionValueRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildDimensionValueRequest();
      var od = new api.DimensionValueRequest.fromJson(o.toJson());
      checkDimensionValueRequest(od);
    });
  });

  unittest.group("obj-schema-DirectorySite", () {
    unittest.test("to-json--from-json", () {
      var o = buildDirectorySite();
      var od = new api.DirectorySite.fromJson(o.toJson());
      checkDirectorySite(od);
    });
  });

  unittest.group("obj-schema-DirectorySiteSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildDirectorySiteSettings();
      var od = new api.DirectorySiteSettings.fromJson(o.toJson());
      checkDirectorySiteSettings(od);
    });
  });

  unittest.group("obj-schema-DirectorySitesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildDirectorySitesListResponse();
      var od = new api.DirectorySitesListResponse.fromJson(o.toJson());
      checkDirectorySitesListResponse(od);
    });
  });

  unittest.group("obj-schema-DynamicTargetingKey", () {
    unittest.test("to-json--from-json", () {
      var o = buildDynamicTargetingKey();
      var od = new api.DynamicTargetingKey.fromJson(o.toJson());
      checkDynamicTargetingKey(od);
    });
  });

  unittest.group("obj-schema-DynamicTargetingKeysListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildDynamicTargetingKeysListResponse();
      var od = new api.DynamicTargetingKeysListResponse.fromJson(o.toJson());
      checkDynamicTargetingKeysListResponse(od);
    });
  });

  unittest.group("obj-schema-EncryptionInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildEncryptionInfo();
      var od = new api.EncryptionInfo.fromJson(o.toJson());
      checkEncryptionInfo(od);
    });
  });

  unittest.group("obj-schema-EventTag", () {
    unittest.test("to-json--from-json", () {
      var o = buildEventTag();
      var od = new api.EventTag.fromJson(o.toJson());
      checkEventTag(od);
    });
  });

  unittest.group("obj-schema-EventTagOverride", () {
    unittest.test("to-json--from-json", () {
      var o = buildEventTagOverride();
      var od = new api.EventTagOverride.fromJson(o.toJson());
      checkEventTagOverride(od);
    });
  });

  unittest.group("obj-schema-EventTagsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildEventTagsListResponse();
      var od = new api.EventTagsListResponse.fromJson(o.toJson());
      checkEventTagsListResponse(od);
    });
  });

  unittest.group("obj-schema-FileUrls", () {
    unittest.test("to-json--from-json", () {
      var o = buildFileUrls();
      var od = new api.FileUrls.fromJson(o.toJson());
      checkFileUrls(od);
    });
  });

  unittest.group("obj-schema-File", () {
    unittest.test("to-json--from-json", () {
      var o = buildFile();
      var od = new api.File.fromJson(o.toJson());
      checkFile(od);
    });
  });

  unittest.group("obj-schema-FileList", () {
    unittest.test("to-json--from-json", () {
      var o = buildFileList();
      var od = new api.FileList.fromJson(o.toJson());
      checkFileList(od);
    });
  });

  unittest.group("obj-schema-Flight", () {
    unittest.test("to-json--from-json", () {
      var o = buildFlight();
      var od = new api.Flight.fromJson(o.toJson());
      checkFlight(od);
    });
  });

  unittest.group("obj-schema-FloodlightActivitiesGenerateTagResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightActivitiesGenerateTagResponse();
      var od =
          new api.FloodlightActivitiesGenerateTagResponse.fromJson(o.toJson());
      checkFloodlightActivitiesGenerateTagResponse(od);
    });
  });

  unittest.group("obj-schema-FloodlightActivitiesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightActivitiesListResponse();
      var od = new api.FloodlightActivitiesListResponse.fromJson(o.toJson());
      checkFloodlightActivitiesListResponse(od);
    });
  });

  unittest.group("obj-schema-FloodlightActivity", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightActivity();
      var od = new api.FloodlightActivity.fromJson(o.toJson());
      checkFloodlightActivity(od);
    });
  });

  unittest.group("obj-schema-FloodlightActivityDynamicTag", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightActivityDynamicTag();
      var od = new api.FloodlightActivityDynamicTag.fromJson(o.toJson());
      checkFloodlightActivityDynamicTag(od);
    });
  });

  unittest.group("obj-schema-FloodlightActivityGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightActivityGroup();
      var od = new api.FloodlightActivityGroup.fromJson(o.toJson());
      checkFloodlightActivityGroup(od);
    });
  });

  unittest.group("obj-schema-FloodlightActivityGroupsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightActivityGroupsListResponse();
      var od =
          new api.FloodlightActivityGroupsListResponse.fromJson(o.toJson());
      checkFloodlightActivityGroupsListResponse(od);
    });
  });

  unittest.group("obj-schema-FloodlightActivityPublisherDynamicTag", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightActivityPublisherDynamicTag();
      var od =
          new api.FloodlightActivityPublisherDynamicTag.fromJson(o.toJson());
      checkFloodlightActivityPublisherDynamicTag(od);
    });
  });

  unittest.group("obj-schema-FloodlightConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightConfiguration();
      var od = new api.FloodlightConfiguration.fromJson(o.toJson());
      checkFloodlightConfiguration(od);
    });
  });

  unittest.group("obj-schema-FloodlightConfigurationsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightConfigurationsListResponse();
      var od =
          new api.FloodlightConfigurationsListResponse.fromJson(o.toJson());
      checkFloodlightConfigurationsListResponse(od);
    });
  });

  unittest.group("obj-schema-FloodlightReportCompatibleFields", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightReportCompatibleFields();
      var od = new api.FloodlightReportCompatibleFields.fromJson(o.toJson());
      checkFloodlightReportCompatibleFields(od);
    });
  });

  unittest.group("obj-schema-FrequencyCap", () {
    unittest.test("to-json--from-json", () {
      var o = buildFrequencyCap();
      var od = new api.FrequencyCap.fromJson(o.toJson());
      checkFrequencyCap(od);
    });
  });

  unittest.group("obj-schema-FsCommand", () {
    unittest.test("to-json--from-json", () {
      var o = buildFsCommand();
      var od = new api.FsCommand.fromJson(o.toJson());
      checkFsCommand(od);
    });
  });

  unittest.group("obj-schema-GeoTargeting", () {
    unittest.test("to-json--from-json", () {
      var o = buildGeoTargeting();
      var od = new api.GeoTargeting.fromJson(o.toJson());
      checkGeoTargeting(od);
    });
  });

  unittest.group("obj-schema-InventoryItem", () {
    unittest.test("to-json--from-json", () {
      var o = buildInventoryItem();
      var od = new api.InventoryItem.fromJson(o.toJson());
      checkInventoryItem(od);
    });
  });

  unittest.group("obj-schema-InventoryItemsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildInventoryItemsListResponse();
      var od = new api.InventoryItemsListResponse.fromJson(o.toJson());
      checkInventoryItemsListResponse(od);
    });
  });

  unittest.group("obj-schema-KeyValueTargetingExpression", () {
    unittest.test("to-json--from-json", () {
      var o = buildKeyValueTargetingExpression();
      var od = new api.KeyValueTargetingExpression.fromJson(o.toJson());
      checkKeyValueTargetingExpression(od);
    });
  });

  unittest.group("obj-schema-LandingPage", () {
    unittest.test("to-json--from-json", () {
      var o = buildLandingPage();
      var od = new api.LandingPage.fromJson(o.toJson());
      checkLandingPage(od);
    });
  });

  unittest.group("obj-schema-Language", () {
    unittest.test("to-json--from-json", () {
      var o = buildLanguage();
      var od = new api.Language.fromJson(o.toJson());
      checkLanguage(od);
    });
  });

  unittest.group("obj-schema-LanguageTargeting", () {
    unittest.test("to-json--from-json", () {
      var o = buildLanguageTargeting();
      var od = new api.LanguageTargeting.fromJson(o.toJson());
      checkLanguageTargeting(od);
    });
  });

  unittest.group("obj-schema-LanguagesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildLanguagesListResponse();
      var od = new api.LanguagesListResponse.fromJson(o.toJson());
      checkLanguagesListResponse(od);
    });
  });

  unittest.group("obj-schema-LastModifiedInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildLastModifiedInfo();
      var od = new api.LastModifiedInfo.fromJson(o.toJson());
      checkLastModifiedInfo(od);
    });
  });

  unittest.group("obj-schema-ListPopulationClause", () {
    unittest.test("to-json--from-json", () {
      var o = buildListPopulationClause();
      var od = new api.ListPopulationClause.fromJson(o.toJson());
      checkListPopulationClause(od);
    });
  });

  unittest.group("obj-schema-ListPopulationRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildListPopulationRule();
      var od = new api.ListPopulationRule.fromJson(o.toJson());
      checkListPopulationRule(od);
    });
  });

  unittest.group("obj-schema-ListPopulationTerm", () {
    unittest.test("to-json--from-json", () {
      var o = buildListPopulationTerm();
      var od = new api.ListPopulationTerm.fromJson(o.toJson());
      checkListPopulationTerm(od);
    });
  });

  unittest.group("obj-schema-ListTargetingExpression", () {
    unittest.test("to-json--from-json", () {
      var o = buildListTargetingExpression();
      var od = new api.ListTargetingExpression.fromJson(o.toJson());
      checkListTargetingExpression(od);
    });
  });

  unittest.group("obj-schema-LookbackConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildLookbackConfiguration();
      var od = new api.LookbackConfiguration.fromJson(o.toJson());
      checkLookbackConfiguration(od);
    });
  });

  unittest.group("obj-schema-Metric", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetric();
      var od = new api.Metric.fromJson(o.toJson());
      checkMetric(od);
    });
  });

  unittest.group("obj-schema-Metro", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetro();
      var od = new api.Metro.fromJson(o.toJson());
      checkMetro(od);
    });
  });

  unittest.group("obj-schema-MetrosListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetrosListResponse();
      var od = new api.MetrosListResponse.fromJson(o.toJson());
      checkMetrosListResponse(od);
    });
  });

  unittest.group("obj-schema-MobileApp", () {
    unittest.test("to-json--from-json", () {
      var o = buildMobileApp();
      var od = new api.MobileApp.fromJson(o.toJson());
      checkMobileApp(od);
    });
  });

  unittest.group("obj-schema-MobileAppsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildMobileAppsListResponse();
      var od = new api.MobileAppsListResponse.fromJson(o.toJson());
      checkMobileAppsListResponse(od);
    });
  });

  unittest.group("obj-schema-MobileCarrier", () {
    unittest.test("to-json--from-json", () {
      var o = buildMobileCarrier();
      var od = new api.MobileCarrier.fromJson(o.toJson());
      checkMobileCarrier(od);
    });
  });

  unittest.group("obj-schema-MobileCarriersListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildMobileCarriersListResponse();
      var od = new api.MobileCarriersListResponse.fromJson(o.toJson());
      checkMobileCarriersListResponse(od);
    });
  });

  unittest.group("obj-schema-ObaIcon", () {
    unittest.test("to-json--from-json", () {
      var o = buildObaIcon();
      var od = new api.ObaIcon.fromJson(o.toJson());
      checkObaIcon(od);
    });
  });

  unittest.group("obj-schema-ObjectFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildObjectFilter();
      var od = new api.ObjectFilter.fromJson(o.toJson());
      checkObjectFilter(od);
    });
  });

  unittest.group("obj-schema-OffsetPosition", () {
    unittest.test("to-json--from-json", () {
      var o = buildOffsetPosition();
      var od = new api.OffsetPosition.fromJson(o.toJson());
      checkOffsetPosition(od);
    });
  });

  unittest.group("obj-schema-OmnitureSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildOmnitureSettings();
      var od = new api.OmnitureSettings.fromJson(o.toJson());
      checkOmnitureSettings(od);
    });
  });

  unittest.group("obj-schema-OperatingSystem", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperatingSystem();
      var od = new api.OperatingSystem.fromJson(o.toJson());
      checkOperatingSystem(od);
    });
  });

  unittest.group("obj-schema-OperatingSystemVersion", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperatingSystemVersion();
      var od = new api.OperatingSystemVersion.fromJson(o.toJson());
      checkOperatingSystemVersion(od);
    });
  });

  unittest.group("obj-schema-OperatingSystemVersionsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperatingSystemVersionsListResponse();
      var od = new api.OperatingSystemVersionsListResponse.fromJson(o.toJson());
      checkOperatingSystemVersionsListResponse(od);
    });
  });

  unittest.group("obj-schema-OperatingSystemsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperatingSystemsListResponse();
      var od = new api.OperatingSystemsListResponse.fromJson(o.toJson());
      checkOperatingSystemsListResponse(od);
    });
  });

  unittest.group("obj-schema-OptimizationActivity", () {
    unittest.test("to-json--from-json", () {
      var o = buildOptimizationActivity();
      var od = new api.OptimizationActivity.fromJson(o.toJson());
      checkOptimizationActivity(od);
    });
  });

  unittest.group("obj-schema-Order", () {
    unittest.test("to-json--from-json", () {
      var o = buildOrder();
      var od = new api.Order.fromJson(o.toJson());
      checkOrder(od);
    });
  });

  unittest.group("obj-schema-OrderContact", () {
    unittest.test("to-json--from-json", () {
      var o = buildOrderContact();
      var od = new api.OrderContact.fromJson(o.toJson());
      checkOrderContact(od);
    });
  });

  unittest.group("obj-schema-OrderDocument", () {
    unittest.test("to-json--from-json", () {
      var o = buildOrderDocument();
      var od = new api.OrderDocument.fromJson(o.toJson());
      checkOrderDocument(od);
    });
  });

  unittest.group("obj-schema-OrderDocumentsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildOrderDocumentsListResponse();
      var od = new api.OrderDocumentsListResponse.fromJson(o.toJson());
      checkOrderDocumentsListResponse(od);
    });
  });

  unittest.group("obj-schema-OrdersListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildOrdersListResponse();
      var od = new api.OrdersListResponse.fromJson(o.toJson());
      checkOrdersListResponse(od);
    });
  });

  unittest.group("obj-schema-PathToConversionReportCompatibleFields", () {
    unittest.test("to-json--from-json", () {
      var o = buildPathToConversionReportCompatibleFields();
      var od =
          new api.PathToConversionReportCompatibleFields.fromJson(o.toJson());
      checkPathToConversionReportCompatibleFields(od);
    });
  });

  unittest.group("obj-schema-Placement", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlacement();
      var od = new api.Placement.fromJson(o.toJson());
      checkPlacement(od);
    });
  });

  unittest.group("obj-schema-PlacementAssignment", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlacementAssignment();
      var od = new api.PlacementAssignment.fromJson(o.toJson());
      checkPlacementAssignment(od);
    });
  });

  unittest.group("obj-schema-PlacementGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlacementGroup();
      var od = new api.PlacementGroup.fromJson(o.toJson());
      checkPlacementGroup(od);
    });
  });

  unittest.group("obj-schema-PlacementGroupsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlacementGroupsListResponse();
      var od = new api.PlacementGroupsListResponse.fromJson(o.toJson());
      checkPlacementGroupsListResponse(od);
    });
  });

  unittest.group("obj-schema-PlacementStrategiesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlacementStrategiesListResponse();
      var od = new api.PlacementStrategiesListResponse.fromJson(o.toJson());
      checkPlacementStrategiesListResponse(od);
    });
  });

  unittest.group("obj-schema-PlacementStrategy", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlacementStrategy();
      var od = new api.PlacementStrategy.fromJson(o.toJson());
      checkPlacementStrategy(od);
    });
  });

  unittest.group("obj-schema-PlacementTag", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlacementTag();
      var od = new api.PlacementTag.fromJson(o.toJson());
      checkPlacementTag(od);
    });
  });

  unittest.group("obj-schema-PlacementsGenerateTagsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlacementsGenerateTagsResponse();
      var od = new api.PlacementsGenerateTagsResponse.fromJson(o.toJson());
      checkPlacementsGenerateTagsResponse(od);
    });
  });

  unittest.group("obj-schema-PlacementsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlacementsListResponse();
      var od = new api.PlacementsListResponse.fromJson(o.toJson());
      checkPlacementsListResponse(od);
    });
  });

  unittest.group("obj-schema-PlatformType", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlatformType();
      var od = new api.PlatformType.fromJson(o.toJson());
      checkPlatformType(od);
    });
  });

  unittest.group("obj-schema-PlatformTypesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPlatformTypesListResponse();
      var od = new api.PlatformTypesListResponse.fromJson(o.toJson());
      checkPlatformTypesListResponse(od);
    });
  });

  unittest.group("obj-schema-PopupWindowProperties", () {
    unittest.test("to-json--from-json", () {
      var o = buildPopupWindowProperties();
      var od = new api.PopupWindowProperties.fromJson(o.toJson());
      checkPopupWindowProperties(od);
    });
  });

  unittest.group("obj-schema-PostalCode", () {
    unittest.test("to-json--from-json", () {
      var o = buildPostalCode();
      var od = new api.PostalCode.fromJson(o.toJson());
      checkPostalCode(od);
    });
  });

  unittest.group("obj-schema-PostalCodesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPostalCodesListResponse();
      var od = new api.PostalCodesListResponse.fromJson(o.toJson());
      checkPostalCodesListResponse(od);
    });
  });

  unittest.group("obj-schema-Pricing", () {
    unittest.test("to-json--from-json", () {
      var o = buildPricing();
      var od = new api.Pricing.fromJson(o.toJson());
      checkPricing(od);
    });
  });

  unittest.group("obj-schema-PricingSchedule", () {
    unittest.test("to-json--from-json", () {
      var o = buildPricingSchedule();
      var od = new api.PricingSchedule.fromJson(o.toJson());
      checkPricingSchedule(od);
    });
  });

  unittest.group("obj-schema-PricingSchedulePricingPeriod", () {
    unittest.test("to-json--from-json", () {
      var o = buildPricingSchedulePricingPeriod();
      var od = new api.PricingSchedulePricingPeriod.fromJson(o.toJson());
      checkPricingSchedulePricingPeriod(od);
    });
  });

  unittest.group("obj-schema-Project", () {
    unittest.test("to-json--from-json", () {
      var o = buildProject();
      var od = new api.Project.fromJson(o.toJson());
      checkProject(od);
    });
  });

  unittest.group("obj-schema-ProjectsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildProjectsListResponse();
      var od = new api.ProjectsListResponse.fromJson(o.toJson());
      checkProjectsListResponse(od);
    });
  });

  unittest.group("obj-schema-ReachReportCompatibleFields", () {
    unittest.test("to-json--from-json", () {
      var o = buildReachReportCompatibleFields();
      var od = new api.ReachReportCompatibleFields.fromJson(o.toJson());
      checkReachReportCompatibleFields(od);
    });
  });

  unittest.group("obj-schema-Recipient", () {
    unittest.test("to-json--from-json", () {
      var o = buildRecipient();
      var od = new api.Recipient.fromJson(o.toJson());
      checkRecipient(od);
    });
  });

  unittest.group("obj-schema-Region", () {
    unittest.test("to-json--from-json", () {
      var o = buildRegion();
      var od = new api.Region.fromJson(o.toJson());
      checkRegion(od);
    });
  });

  unittest.group("obj-schema-RegionsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildRegionsListResponse();
      var od = new api.RegionsListResponse.fromJson(o.toJson());
      checkRegionsListResponse(od);
    });
  });

  unittest.group("obj-schema-RemarketingList", () {
    unittest.test("to-json--from-json", () {
      var o = buildRemarketingList();
      var od = new api.RemarketingList.fromJson(o.toJson());
      checkRemarketingList(od);
    });
  });

  unittest.group("obj-schema-RemarketingListShare", () {
    unittest.test("to-json--from-json", () {
      var o = buildRemarketingListShare();
      var od = new api.RemarketingListShare.fromJson(o.toJson());
      checkRemarketingListShare(od);
    });
  });

  unittest.group("obj-schema-RemarketingListsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildRemarketingListsListResponse();
      var od = new api.RemarketingListsListResponse.fromJson(o.toJson());
      checkRemarketingListsListResponse(od);
    });
  });

  unittest.group("obj-schema-ReportCriteria", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportCriteria();
      var od = new api.ReportCriteria.fromJson(o.toJson());
      checkReportCriteria(od);
    });
  });

  unittest.group("obj-schema-ReportCrossDimensionReachCriteria", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportCrossDimensionReachCriteria();
      var od = new api.ReportCrossDimensionReachCriteria.fromJson(o.toJson());
      checkReportCrossDimensionReachCriteria(od);
    });
  });

  unittest.group("obj-schema-ReportDelivery", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportDelivery();
      var od = new api.ReportDelivery.fromJson(o.toJson());
      checkReportDelivery(od);
    });
  });

  unittest.group("obj-schema-ReportFloodlightCriteriaReportProperties", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportFloodlightCriteriaReportProperties();
      var od =
          new api.ReportFloodlightCriteriaReportProperties.fromJson(o.toJson());
      checkReportFloodlightCriteriaReportProperties(od);
    });
  });

  unittest.group("obj-schema-ReportFloodlightCriteria", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportFloodlightCriteria();
      var od = new api.ReportFloodlightCriteria.fromJson(o.toJson());
      checkReportFloodlightCriteria(od);
    });
  });

  unittest.group("obj-schema-ReportPathToConversionCriteriaReportProperties",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildReportPathToConversionCriteriaReportProperties();
      var od = new api.ReportPathToConversionCriteriaReportProperties.fromJson(
          o.toJson());
      checkReportPathToConversionCriteriaReportProperties(od);
    });
  });

  unittest.group("obj-schema-ReportPathToConversionCriteria", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportPathToConversionCriteria();
      var od = new api.ReportPathToConversionCriteria.fromJson(o.toJson());
      checkReportPathToConversionCriteria(od);
    });
  });

  unittest.group("obj-schema-ReportReachCriteria", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportReachCriteria();
      var od = new api.ReportReachCriteria.fromJson(o.toJson());
      checkReportReachCriteria(od);
    });
  });

  unittest.group("obj-schema-ReportSchedule", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportSchedule();
      var od = new api.ReportSchedule.fromJson(o.toJson());
      checkReportSchedule(od);
    });
  });

  unittest.group("obj-schema-Report", () {
    unittest.test("to-json--from-json", () {
      var o = buildReport();
      var od = new api.Report.fromJson(o.toJson());
      checkReport(od);
    });
  });

  unittest.group("obj-schema-ReportCompatibleFields", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportCompatibleFields();
      var od = new api.ReportCompatibleFields.fromJson(o.toJson());
      checkReportCompatibleFields(od);
    });
  });

  unittest.group("obj-schema-ReportList", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportList();
      var od = new api.ReportList.fromJson(o.toJson());
      checkReportList(od);
    });
  });

  unittest.group("obj-schema-ReportsConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportsConfiguration();
      var od = new api.ReportsConfiguration.fromJson(o.toJson());
      checkReportsConfiguration(od);
    });
  });

  unittest.group("obj-schema-RichMediaExitOverride", () {
    unittest.test("to-json--from-json", () {
      var o = buildRichMediaExitOverride();
      var od = new api.RichMediaExitOverride.fromJson(o.toJson());
      checkRichMediaExitOverride(od);
    });
  });

  unittest.group("obj-schema-Rule", () {
    unittest.test("to-json--from-json", () {
      var o = buildRule();
      var od = new api.Rule.fromJson(o.toJson());
      checkRule(od);
    });
  });

  unittest.group("obj-schema-Site", () {
    unittest.test("to-json--from-json", () {
      var o = buildSite();
      var od = new api.Site.fromJson(o.toJson());
      checkSite(od);
    });
  });

  unittest.group("obj-schema-SiteCompanionSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildSiteCompanionSetting();
      var od = new api.SiteCompanionSetting.fromJson(o.toJson());
      checkSiteCompanionSetting(od);
    });
  });

  unittest.group("obj-schema-SiteContact", () {
    unittest.test("to-json--from-json", () {
      var o = buildSiteContact();
      var od = new api.SiteContact.fromJson(o.toJson());
      checkSiteContact(od);
    });
  });

  unittest.group("obj-schema-SiteSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildSiteSettings();
      var od = new api.SiteSettings.fromJson(o.toJson());
      checkSiteSettings(od);
    });
  });

  unittest.group("obj-schema-SiteSkippableSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildSiteSkippableSetting();
      var od = new api.SiteSkippableSetting.fromJson(o.toJson());
      checkSiteSkippableSetting(od);
    });
  });

  unittest.group("obj-schema-SiteTranscodeSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildSiteTranscodeSetting();
      var od = new api.SiteTranscodeSetting.fromJson(o.toJson());
      checkSiteTranscodeSetting(od);
    });
  });

  unittest.group("obj-schema-SiteVideoSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildSiteVideoSettings();
      var od = new api.SiteVideoSettings.fromJson(o.toJson());
      checkSiteVideoSettings(od);
    });
  });

  unittest.group("obj-schema-SitesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSitesListResponse();
      var od = new api.SitesListResponse.fromJson(o.toJson());
      checkSitesListResponse(od);
    });
  });

  unittest.group("obj-schema-Size", () {
    unittest.test("to-json--from-json", () {
      var o = buildSize();
      var od = new api.Size.fromJson(o.toJson());
      checkSize(od);
    });
  });

  unittest.group("obj-schema-SizesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSizesListResponse();
      var od = new api.SizesListResponse.fromJson(o.toJson());
      checkSizesListResponse(od);
    });
  });

  unittest.group("obj-schema-SkippableSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildSkippableSetting();
      var od = new api.SkippableSetting.fromJson(o.toJson());
      checkSkippableSetting(od);
    });
  });

  unittest.group("obj-schema-SortedDimension", () {
    unittest.test("to-json--from-json", () {
      var o = buildSortedDimension();
      var od = new api.SortedDimension.fromJson(o.toJson());
      checkSortedDimension(od);
    });
  });

  unittest.group("obj-schema-Subaccount", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubaccount();
      var od = new api.Subaccount.fromJson(o.toJson());
      checkSubaccount(od);
    });
  });

  unittest.group("obj-schema-SubaccountsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubaccountsListResponse();
      var od = new api.SubaccountsListResponse.fromJson(o.toJson());
      checkSubaccountsListResponse(od);
    });
  });

  unittest.group("obj-schema-TagData", () {
    unittest.test("to-json--from-json", () {
      var o = buildTagData();
      var od = new api.TagData.fromJson(o.toJson());
      checkTagData(od);
    });
  });

  unittest.group("obj-schema-TagSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildTagSetting();
      var od = new api.TagSetting.fromJson(o.toJson());
      checkTagSetting(od);
    });
  });

  unittest.group("obj-schema-TagSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildTagSettings();
      var od = new api.TagSettings.fromJson(o.toJson());
      checkTagSettings(od);
    });
  });

  unittest.group("obj-schema-TargetWindow", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetWindow();
      var od = new api.TargetWindow.fromJson(o.toJson());
      checkTargetWindow(od);
    });
  });

  unittest.group("obj-schema-TargetableRemarketingList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetableRemarketingList();
      var od = new api.TargetableRemarketingList.fromJson(o.toJson());
      checkTargetableRemarketingList(od);
    });
  });

  unittest.group("obj-schema-TargetableRemarketingListsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetableRemarketingListsListResponse();
      var od =
          new api.TargetableRemarketingListsListResponse.fromJson(o.toJson());
      checkTargetableRemarketingListsListResponse(od);
    });
  });

  unittest.group("obj-schema-TargetingTemplate", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetingTemplate();
      var od = new api.TargetingTemplate.fromJson(o.toJson());
      checkTargetingTemplate(od);
    });
  });

  unittest.group("obj-schema-TargetingTemplatesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetingTemplatesListResponse();
      var od = new api.TargetingTemplatesListResponse.fromJson(o.toJson());
      checkTargetingTemplatesListResponse(od);
    });
  });

  unittest.group("obj-schema-TechnologyTargeting", () {
    unittest.test("to-json--from-json", () {
      var o = buildTechnologyTargeting();
      var od = new api.TechnologyTargeting.fromJson(o.toJson());
      checkTechnologyTargeting(od);
    });
  });

  unittest.group("obj-schema-ThirdPartyAuthenticationToken", () {
    unittest.test("to-json--from-json", () {
      var o = buildThirdPartyAuthenticationToken();
      var od = new api.ThirdPartyAuthenticationToken.fromJson(o.toJson());
      checkThirdPartyAuthenticationToken(od);
    });
  });

  unittest.group("obj-schema-ThirdPartyTrackingUrl", () {
    unittest.test("to-json--from-json", () {
      var o = buildThirdPartyTrackingUrl();
      var od = new api.ThirdPartyTrackingUrl.fromJson(o.toJson());
      checkThirdPartyTrackingUrl(od);
    });
  });

  unittest.group("obj-schema-TranscodeSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildTranscodeSetting();
      var od = new api.TranscodeSetting.fromJson(o.toJson());
      checkTranscodeSetting(od);
    });
  });

  unittest.group("obj-schema-UniversalAdId", () {
    unittest.test("to-json--from-json", () {
      var o = buildUniversalAdId();
      var od = new api.UniversalAdId.fromJson(o.toJson());
      checkUniversalAdId(od);
    });
  });

  unittest.group("obj-schema-UserDefinedVariableConfiguration", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserDefinedVariableConfiguration();
      var od = new api.UserDefinedVariableConfiguration.fromJson(o.toJson());
      checkUserDefinedVariableConfiguration(od);
    });
  });

  unittest.group("obj-schema-UserProfile", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserProfile();
      var od = new api.UserProfile.fromJson(o.toJson());
      checkUserProfile(od);
    });
  });

  unittest.group("obj-schema-UserProfileList", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserProfileList();
      var od = new api.UserProfileList.fromJson(o.toJson());
      checkUserProfileList(od);
    });
  });

  unittest.group("obj-schema-UserRole", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserRole();
      var od = new api.UserRole.fromJson(o.toJson());
      checkUserRole(od);
    });
  });

  unittest.group("obj-schema-UserRolePermission", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserRolePermission();
      var od = new api.UserRolePermission.fromJson(o.toJson());
      checkUserRolePermission(od);
    });
  });

  unittest.group("obj-schema-UserRolePermissionGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserRolePermissionGroup();
      var od = new api.UserRolePermissionGroup.fromJson(o.toJson());
      checkUserRolePermissionGroup(od);
    });
  });

  unittest.group("obj-schema-UserRolePermissionGroupsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserRolePermissionGroupsListResponse();
      var od =
          new api.UserRolePermissionGroupsListResponse.fromJson(o.toJson());
      checkUserRolePermissionGroupsListResponse(od);
    });
  });

  unittest.group("obj-schema-UserRolePermissionsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserRolePermissionsListResponse();
      var od = new api.UserRolePermissionsListResponse.fromJson(o.toJson());
      checkUserRolePermissionsListResponse(od);
    });
  });

  unittest.group("obj-schema-UserRolesListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserRolesListResponse();
      var od = new api.UserRolesListResponse.fromJson(o.toJson());
      checkUserRolesListResponse(od);
    });
  });

  unittest.group("obj-schema-VideoFormat", () {
    unittest.test("to-json--from-json", () {
      var o = buildVideoFormat();
      var od = new api.VideoFormat.fromJson(o.toJson());
      checkVideoFormat(od);
    });
  });

  unittest.group("obj-schema-VideoFormatsListResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildVideoFormatsListResponse();
      var od = new api.VideoFormatsListResponse.fromJson(o.toJson());
      checkVideoFormatsListResponse(od);
    });
  });

  unittest.group("obj-schema-VideoOffset", () {
    unittest.test("to-json--from-json", () {
      var o = buildVideoOffset();
      var od = new api.VideoOffset.fromJson(o.toJson());
      checkVideoOffset(od);
    });
  });

  unittest.group("obj-schema-VideoSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildVideoSettings();
      var od = new api.VideoSettings.fromJson(o.toJson());
      checkVideoSettings(od);
    });
  });

  unittest.group("resource-AccountActiveAdSummariesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountActiveAdSummariesResourceApi res =
          new api.DfareportingApi(mock).accountActiveAdSummaries;
      var arg_profileId = "foo";
      var arg_summaryAccountId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountActiveAdSummaries/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 26),
            unittest.equals("/accountActiveAdSummaries/"));
        pathOffset += 26;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_summaryAccountId"));

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
        var resp = convert.json.encode(buildAccountActiveAdSummary());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_summaryAccountId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountActiveAdSummary(response);
      })));
    });
  });

  unittest.group("resource-AccountPermissionGroupsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountPermissionGroupsResourceApi res =
          new api.DfareportingApi(mock).accountPermissionGroups;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountPermissionGroups/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/accountPermissionGroups/"));
        pathOffset += 25;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildAccountPermissionGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountPermissionGroup(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountPermissionGroupsResourceApi res =
          new api.DfareportingApi(mock).accountPermissionGroups;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountPermissionGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 24),
            unittest.equals("/accountPermissionGroups"));
        pathOffset += 24;

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
        var resp =
            convert.json.encode(buildAccountPermissionGroupsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountPermissionGroupsListResponse(response);
      })));
    });
  });

  unittest.group("resource-AccountPermissionsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountPermissionsResourceApi res =
          new api.DfareportingApi(mock).accountPermissions;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountPermissions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/accountPermissions/"));
        pathOffset += 20;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildAccountPermission());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountPermission(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountPermissionsResourceApi res =
          new api.DfareportingApi(mock).accountPermissions;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountPermissions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("/accountPermissions"));
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
        var resp = convert.json.encode(buildAccountPermissionsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountPermissionsListResponse(response);
      })));
    });
  });

  unittest.group("resource-AccountUserProfilesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountUserProfilesResourceApi res =
          new api.DfareportingApi(mock).accountUserProfiles;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountUserProfiles/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/accountUserProfiles/"));
        pathOffset += 21;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildAccountUserProfile());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountUserProfile(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.AccountUserProfilesResourceApi res =
          new api.DfareportingApi(mock).accountUserProfiles;
      var arg_request = buildAccountUserProfile();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.AccountUserProfile.fromJson(json);
        checkAccountUserProfile(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountUserProfiles", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/accountUserProfiles"));
        pathOffset += 20;

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
        var resp = convert.json.encode(buildAccountUserProfile());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountUserProfile(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountUserProfilesResourceApi res =
          new api.DfareportingApi(mock).accountUserProfiles;
      var arg_profileId = "foo";
      var arg_active = true;
      var arg_ids = buildUnnamed5247();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_subaccountId = "foo";
      var arg_userRoleId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountUserProfiles", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/accountUserProfiles"));
        pathOffset += 20;

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
            queryMap["active"].first, unittest.equals("$arg_active"));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(
            queryMap["subaccountId"].first, unittest.equals(arg_subaccountId));
        unittest.expect(
            queryMap["userRoleId"].first, unittest.equals(arg_userRoleId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAccountUserProfilesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              active: arg_active,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              subaccountId: arg_subaccountId,
              userRoleId: arg_userRoleId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountUserProfilesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AccountUserProfilesResourceApi res =
          new api.DfareportingApi(mock).accountUserProfiles;
      var arg_request = buildAccountUserProfile();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.AccountUserProfile.fromJson(json);
        checkAccountUserProfile(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountUserProfiles", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/accountUserProfiles"));
        pathOffset += 20;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAccountUserProfile());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountUserProfile(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountUserProfilesResourceApi res =
          new api.DfareportingApi(mock).accountUserProfiles;
      var arg_request = buildAccountUserProfile();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.AccountUserProfile.fromJson(json);
        checkAccountUserProfile(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accountUserProfiles", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/accountUserProfiles"));
        pathOffset += 20;

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
        var resp = convert.json.encode(buildAccountUserProfile());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountUserProfile(response);
      })));
    });
  });

  unittest.group("resource-AccountsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.DfareportingApi(mock).accounts;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accounts/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/accounts/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccount(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.DfareportingApi(mock).accounts;
      var arg_profileId = "foo";
      var arg_active = true;
      var arg_ids = buildUnnamed5248();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accounts", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/accounts"));
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
        unittest.expect(
            queryMap["active"].first, unittest.equals("$arg_active"));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAccountsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              active: arg_active,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccountsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.DfareportingApi(mock).accounts;
      var arg_request = buildAccount();
      var arg_profileId = "foo";
      var arg_id = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accounts", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/accounts"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccount(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.DfareportingApi(mock).accounts;
      var arg_request = buildAccount();
      var arg_profileId = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/accounts", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/accounts"));
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
        var resp = convert.json.encode(buildAccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAccount(response);
      })));
    });
  });

  unittest.group("resource-AdsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdsResourceApi res = new api.DfareportingApi(mock).ads;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/ads/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5),
            unittest.equals("/ads/"));
        pathOffset += 5;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildAd());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAd(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.AdsResourceApi res = new api.DfareportingApi(mock).ads;
      var arg_request = buildAd();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Ad.fromJson(json);
        checkAd(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/ads", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 4),
            unittest.equals("/ads"));
        pathOffset += 4;

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
        var resp = convert.json.encode(buildAd());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAd(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdsResourceApi res = new api.DfareportingApi(mock).ads;
      var arg_profileId = "foo";
      var arg_active = true;
      var arg_advertiserId = "foo";
      var arg_archived = true;
      var arg_audienceSegmentIds = buildUnnamed5249();
      var arg_campaignIds = buildUnnamed5250();
      var arg_compatibility = "foo";
      var arg_creativeIds = buildUnnamed5251();
      var arg_creativeOptimizationConfigurationIds = buildUnnamed5252();
      var arg_dynamicClickTracker = true;
      var arg_ids = buildUnnamed5253();
      var arg_landingPageIds = buildUnnamed5254();
      var arg_maxResults = 42;
      var arg_overriddenEventTagId = "foo";
      var arg_pageToken = "foo";
      var arg_placementIds = buildUnnamed5255();
      var arg_remarketingListIds = buildUnnamed5256();
      var arg_searchString = "foo";
      var arg_sizeIds = buildUnnamed5257();
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_sslCompliant = true;
      var arg_sslRequired = true;
      var arg_type = buildUnnamed5258();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/ads", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 4),
            unittest.equals("/ads"));
        pathOffset += 4;

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
            queryMap["active"].first, unittest.equals("$arg_active"));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["archived"].first, unittest.equals("$arg_archived"));
        unittest.expect(queryMap["audienceSegmentIds"],
            unittest.equals(arg_audienceSegmentIds));
        unittest.expect(
            queryMap["campaignIds"], unittest.equals(arg_campaignIds));
        unittest.expect(queryMap["compatibility"].first,
            unittest.equals(arg_compatibility));
        unittest.expect(
            queryMap["creativeIds"], unittest.equals(arg_creativeIds));
        unittest.expect(queryMap["creativeOptimizationConfigurationIds"],
            unittest.equals(arg_creativeOptimizationConfigurationIds));
        unittest.expect(queryMap["dynamicClickTracker"].first,
            unittest.equals("$arg_dynamicClickTracker"));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(
            queryMap["landingPageIds"], unittest.equals(arg_landingPageIds));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(queryMap["overriddenEventTagId"].first,
            unittest.equals(arg_overriddenEventTagId));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["placementIds"], unittest.equals(arg_placementIds));
        unittest.expect(queryMap["remarketingListIds"],
            unittest.equals(arg_remarketingListIds));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(queryMap["sizeIds"], unittest.equals(arg_sizeIds));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["sslCompliant"].first,
            unittest.equals("$arg_sslCompliant"));
        unittest.expect(
            queryMap["sslRequired"].first, unittest.equals("$arg_sslRequired"));
        unittest.expect(queryMap["type"], unittest.equals(arg_type));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAdsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              active: arg_active,
              advertiserId: arg_advertiserId,
              archived: arg_archived,
              audienceSegmentIds: arg_audienceSegmentIds,
              campaignIds: arg_campaignIds,
              compatibility: arg_compatibility,
              creativeIds: arg_creativeIds,
              creativeOptimizationConfigurationIds:
                  arg_creativeOptimizationConfigurationIds,
              dynamicClickTracker: arg_dynamicClickTracker,
              ids: arg_ids,
              landingPageIds: arg_landingPageIds,
              maxResults: arg_maxResults,
              overriddenEventTagId: arg_overriddenEventTagId,
              pageToken: arg_pageToken,
              placementIds: arg_placementIds,
              remarketingListIds: arg_remarketingListIds,
              searchString: arg_searchString,
              sizeIds: arg_sizeIds,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              sslCompliant: arg_sslCompliant,
              sslRequired: arg_sslRequired,
              type: arg_type,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AdsResourceApi res = new api.DfareportingApi(mock).ads;
      var arg_request = buildAd();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Ad.fromJson(json);
        checkAd(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/ads", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 4),
            unittest.equals("/ads"));
        pathOffset += 4;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAd());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAd(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AdsResourceApi res = new api.DfareportingApi(mock).ads;
      var arg_request = buildAd();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Ad.fromJson(json);
        checkAd(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/ads", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 4),
            unittest.equals("/ads"));
        pathOffset += 4;

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
        var resp = convert.json.encode(buildAd());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAd(response);
      })));
    });
  });

  unittest.group("resource-AdvertiserGroupsResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AdvertiserGroupsResourceApi res =
          new api.DfareportingApi(mock).advertiserGroups;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserGroups/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("/advertiserGroups/"));
        pathOffset += 18;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
          .delete(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertiserGroupsResourceApi res =
          new api.DfareportingApi(mock).advertiserGroups;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserGroups/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("/advertiserGroups/"));
        pathOffset += 18;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildAdvertiserGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiserGroup(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.AdvertiserGroupsResourceApi res =
          new api.DfareportingApi(mock).advertiserGroups;
      var arg_request = buildAdvertiserGroup();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.AdvertiserGroup.fromJson(json);
        checkAdvertiserGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/advertiserGroups"));
        pathOffset += 17;

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
        var resp = convert.json.encode(buildAdvertiserGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiserGroup(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertiserGroupsResourceApi res =
          new api.DfareportingApi(mock).advertiserGroups;
      var arg_profileId = "foo";
      var arg_ids = buildUnnamed5259();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/advertiserGroups"));
        pathOffset += 17;

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
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAdvertiserGroupsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiserGroupsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AdvertiserGroupsResourceApi res =
          new api.DfareportingApi(mock).advertiserGroups;
      var arg_request = buildAdvertiserGroup();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.AdvertiserGroup.fromJson(json);
        checkAdvertiserGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/advertiserGroups"));
        pathOffset += 17;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAdvertiserGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiserGroup(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AdvertiserGroupsResourceApi res =
          new api.DfareportingApi(mock).advertiserGroups;
      var arg_request = buildAdvertiserGroup();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.AdvertiserGroup.fromJson(json);
        checkAdvertiserGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/advertiserGroups"));
        pathOffset += 17;

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
        var resp = convert.json.encode(buildAdvertiserGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiserGroup(response);
      })));
    });
  });

  unittest.group("resource-AdvertiserLandingPagesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertiserLandingPagesResourceApi res =
          new api.DfareportingApi(mock).advertiserLandingPages;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserLandingPages/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 24),
            unittest.equals("/advertiserLandingPages/"));
        pathOffset += 24;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildLandingPage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkLandingPage(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.AdvertiserLandingPagesResourceApi res =
          new api.DfareportingApi(mock).advertiserLandingPages;
      var arg_request = buildLandingPage();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.LandingPage.fromJson(json);
        checkLandingPage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserLandingPages", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("/advertiserLandingPages"));
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
        var resp = convert.json.encode(buildLandingPage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkLandingPage(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertiserLandingPagesResourceApi res =
          new api.DfareportingApi(mock).advertiserLandingPages;
      var arg_profileId = "foo";
      var arg_advertiserIds = buildUnnamed5260();
      var arg_archived = true;
      var arg_campaignIds = buildUnnamed5261();
      var arg_ids = buildUnnamed5262();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_subaccountId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserLandingPages", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("/advertiserLandingPages"));
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
            queryMap["advertiserIds"], unittest.equals(arg_advertiserIds));
        unittest.expect(
            queryMap["archived"].first, unittest.equals("$arg_archived"));
        unittest.expect(
            queryMap["campaignIds"], unittest.equals(arg_campaignIds));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(
            queryMap["subaccountId"].first, unittest.equals(arg_subaccountId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp =
            convert.json.encode(buildAdvertiserLandingPagesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserIds: arg_advertiserIds,
              archived: arg_archived,
              campaignIds: arg_campaignIds,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              subaccountId: arg_subaccountId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiserLandingPagesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AdvertiserLandingPagesResourceApi res =
          new api.DfareportingApi(mock).advertiserLandingPages;
      var arg_request = buildLandingPage();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.LandingPage.fromJson(json);
        checkLandingPage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserLandingPages", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("/advertiserLandingPages"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildLandingPage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkLandingPage(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AdvertiserLandingPagesResourceApi res =
          new api.DfareportingApi(mock).advertiserLandingPages;
      var arg_request = buildLandingPage();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.LandingPage.fromJson(json);
        checkLandingPage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertiserLandingPages", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("/advertiserLandingPages"));
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
        var resp = convert.json.encode(buildLandingPage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkLandingPage(response);
      })));
    });
  });

  unittest.group("resource-AdvertisersResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DfareportingApi(mock).advertisers;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertisers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("/advertisers/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildAdvertiser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiser(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DfareportingApi(mock).advertisers;
      var arg_request = buildAdvertiser();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Advertiser.fromJson(json);
        checkAdvertiser(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertisers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/advertisers"));
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
        var resp = convert.json.encode(buildAdvertiser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiser(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DfareportingApi(mock).advertisers;
      var arg_profileId = "foo";
      var arg_advertiserGroupIds = buildUnnamed5263();
      var arg_floodlightConfigurationIds = buildUnnamed5264();
      var arg_ids = buildUnnamed5265();
      var arg_includeAdvertisersWithoutGroupsOnly = true;
      var arg_maxResults = 42;
      var arg_onlyParent = true;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_status = "foo";
      var arg_subaccountId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertisers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/advertisers"));
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
        unittest.expect(queryMap["advertiserGroupIds"],
            unittest.equals(arg_advertiserGroupIds));
        unittest.expect(queryMap["floodlightConfigurationIds"],
            unittest.equals(arg_floodlightConfigurationIds));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(queryMap["includeAdvertisersWithoutGroupsOnly"].first,
            unittest.equals("$arg_includeAdvertisersWithoutGroupsOnly"));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["onlyParent"].first, unittest.equals("$arg_onlyParent"));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["status"].first, unittest.equals(arg_status));
        unittest.expect(
            queryMap["subaccountId"].first, unittest.equals(arg_subaccountId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAdvertisersListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserGroupIds: arg_advertiserGroupIds,
              floodlightConfigurationIds: arg_floodlightConfigurationIds,
              ids: arg_ids,
              includeAdvertisersWithoutGroupsOnly:
                  arg_includeAdvertisersWithoutGroupsOnly,
              maxResults: arg_maxResults,
              onlyParent: arg_onlyParent,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              status: arg_status,
              subaccountId: arg_subaccountId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertisersListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DfareportingApi(mock).advertisers;
      var arg_request = buildAdvertiser();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Advertiser.fromJson(json);
        checkAdvertiser(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertisers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/advertisers"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAdvertiser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiser(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DfareportingApi(mock).advertisers;
      var arg_request = buildAdvertiser();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Advertiser.fromJson(json);
        checkAdvertiser(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/advertisers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/advertisers"));
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
        var resp = convert.json.encode(buildAdvertiser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiser(response);
      })));
    });
  });

  unittest.group("resource-BrowsersResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.BrowsersResourceApi res = new api.DfareportingApi(mock).browsers;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/browsers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/browsers"));
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
        var resp = convert.json.encode(buildBrowsersListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkBrowsersListResponse(response);
      })));
    });
  });

  unittest.group("resource-CampaignCreativeAssociationsResourceApi", () {
    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.CampaignCreativeAssociationsResourceApi res =
          new api.DfareportingApi(mock).campaignCreativeAssociations;
      var arg_request = buildCampaignCreativeAssociation();
      var arg_profileId = "foo";
      var arg_campaignId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CampaignCreativeAssociation.fromJson(json);
        checkCampaignCreativeAssociation(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/campaigns/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/campaigns/"));
        pathOffset += 11;
        index = path.indexOf("/campaignCreativeAssociations", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_campaignId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 29),
            unittest.equals("/campaignCreativeAssociations"));
        pathOffset += 29;

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
        var resp = convert.json.encode(buildCampaignCreativeAssociation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, arg_campaignId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaignCreativeAssociation(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CampaignCreativeAssociationsResourceApi res =
          new api.DfareportingApi(mock).campaignCreativeAssociations;
      var arg_profileId = "foo";
      var arg_campaignId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/campaigns/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/campaigns/"));
        pathOffset += 11;
        index = path.indexOf("/campaignCreativeAssociations", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_campaignId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 29),
            unittest.equals("/campaignCreativeAssociations"));
        pathOffset += 29;

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
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json
            .encode(buildCampaignCreativeAssociationsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, arg_campaignId,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaignCreativeAssociationsListResponse(response);
      })));
    });
  });

  unittest.group("resource-CampaignsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.CampaignsResourceApi res = new api.DfareportingApi(mock).campaigns;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/campaigns/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/campaigns/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildCampaign());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaign(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.CampaignsResourceApi res = new api.DfareportingApi(mock).campaigns;
      var arg_request = buildCampaign();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Campaign.fromJson(json);
        checkCampaign(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/campaigns", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/campaigns"));
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
        var resp = convert.json.encode(buildCampaign());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaign(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CampaignsResourceApi res = new api.DfareportingApi(mock).campaigns;
      var arg_profileId = "foo";
      var arg_advertiserGroupIds = buildUnnamed5266();
      var arg_advertiserIds = buildUnnamed5267();
      var arg_archived = true;
      var arg_atLeastOneOptimizationActivity = true;
      var arg_excludedIds = buildUnnamed5268();
      var arg_ids = buildUnnamed5269();
      var arg_maxResults = 42;
      var arg_overriddenEventTagId = "foo";
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_subaccountId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/campaigns", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/campaigns"));
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
        unittest.expect(queryMap["advertiserGroupIds"],
            unittest.equals(arg_advertiserGroupIds));
        unittest.expect(
            queryMap["advertiserIds"], unittest.equals(arg_advertiserIds));
        unittest.expect(
            queryMap["archived"].first, unittest.equals("$arg_archived"));
        unittest.expect(queryMap["atLeastOneOptimizationActivity"].first,
            unittest.equals("$arg_atLeastOneOptimizationActivity"));
        unittest.expect(
            queryMap["excludedIds"], unittest.equals(arg_excludedIds));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(queryMap["overriddenEventTagId"].first,
            unittest.equals(arg_overriddenEventTagId));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(
            queryMap["subaccountId"].first, unittest.equals(arg_subaccountId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCampaignsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserGroupIds: arg_advertiserGroupIds,
              advertiserIds: arg_advertiserIds,
              archived: arg_archived,
              atLeastOneOptimizationActivity:
                  arg_atLeastOneOptimizationActivity,
              excludedIds: arg_excludedIds,
              ids: arg_ids,
              maxResults: arg_maxResults,
              overriddenEventTagId: arg_overriddenEventTagId,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              subaccountId: arg_subaccountId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaignsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.CampaignsResourceApi res = new api.DfareportingApi(mock).campaigns;
      var arg_request = buildCampaign();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Campaign.fromJson(json);
        checkCampaign(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/campaigns", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/campaigns"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCampaign());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaign(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.CampaignsResourceApi res = new api.DfareportingApi(mock).campaigns;
      var arg_request = buildCampaign();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Campaign.fromJson(json);
        checkCampaign(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/campaigns", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/campaigns"));
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
        var resp = convert.json.encode(buildCampaign());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaign(response);
      })));
    });
  });

  unittest.group("resource-ChangeLogsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ChangeLogsResourceApi res = new api.DfareportingApi(mock).changeLogs;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/changeLogs/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/changeLogs/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildChangeLog());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkChangeLog(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ChangeLogsResourceApi res = new api.DfareportingApi(mock).changeLogs;
      var arg_profileId = "foo";
      var arg_action = "foo";
      var arg_ids = buildUnnamed5270();
      var arg_maxChangeTime = "foo";
      var arg_maxResults = 42;
      var arg_minChangeTime = "foo";
      var arg_objectIds = buildUnnamed5271();
      var arg_objectType = "foo";
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_userProfileIds = buildUnnamed5272();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/changeLogs", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/changeLogs"));
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
        unittest.expect(queryMap["action"].first, unittest.equals(arg_action));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(queryMap["maxChangeTime"].first,
            unittest.equals(arg_maxChangeTime));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(queryMap["minChangeTime"].first,
            unittest.equals(arg_minChangeTime));
        unittest.expect(queryMap["objectIds"], unittest.equals(arg_objectIds));
        unittest.expect(
            queryMap["objectType"].first, unittest.equals(arg_objectType));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["userProfileIds"], unittest.equals(arg_userProfileIds));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildChangeLogsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              action: arg_action,
              ids: arg_ids,
              maxChangeTime: arg_maxChangeTime,
              maxResults: arg_maxResults,
              minChangeTime: arg_minChangeTime,
              objectIds: arg_objectIds,
              objectType: arg_objectType,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              userProfileIds: arg_userProfileIds,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkChangeLogsListResponse(response);
      })));
    });
  });

  unittest.group("resource-CitiesResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CitiesResourceApi res = new api.DfareportingApi(mock).cities;
      var arg_profileId = "foo";
      var arg_countryDartIds = buildUnnamed5273();
      var arg_dartIds = buildUnnamed5274();
      var arg_namePrefix = "foo";
      var arg_regionDartIds = buildUnnamed5275();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/cities", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/cities"));
        pathOffset += 7;

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
            queryMap["countryDartIds"], unittest.equals(arg_countryDartIds));
        unittest.expect(queryMap["dartIds"], unittest.equals(arg_dartIds));
        unittest.expect(
            queryMap["namePrefix"].first, unittest.equals(arg_namePrefix));
        unittest.expect(
            queryMap["regionDartIds"], unittest.equals(arg_regionDartIds));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCitiesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              countryDartIds: arg_countryDartIds,
              dartIds: arg_dartIds,
              namePrefix: arg_namePrefix,
              regionDartIds: arg_regionDartIds,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCitiesListResponse(response);
      })));
    });
  });

  unittest.group("resource-ConnectionTypesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ConnectionTypesResourceApi res =
          new api.DfareportingApi(mock).connectionTypes;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/connectionTypes/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/connectionTypes/"));
        pathOffset += 17;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildConnectionType());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkConnectionType(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ConnectionTypesResourceApi res =
          new api.DfareportingApi(mock).connectionTypes;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/connectionTypes", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/connectionTypes"));
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
        var resp = convert.json.encode(buildConnectionTypesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkConnectionTypesListResponse(response);
      })));
    });
  });

  unittest.group("resource-ContentCategoriesResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.ContentCategoriesResourceApi res =
          new api.DfareportingApi(mock).contentCategories;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/contentCategories/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("/contentCategories/"));
        pathOffset += 19;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
          .delete(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ContentCategoriesResourceApi res =
          new api.DfareportingApi(mock).contentCategories;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/contentCategories/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("/contentCategories/"));
        pathOffset += 19;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildContentCategory());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContentCategory(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.ContentCategoriesResourceApi res =
          new api.DfareportingApi(mock).contentCategories;
      var arg_request = buildContentCategory();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ContentCategory.fromJson(json);
        checkContentCategory(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/contentCategories", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("/contentCategories"));
        pathOffset += 18;

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
        var resp = convert.json.encode(buildContentCategory());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContentCategory(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ContentCategoriesResourceApi res =
          new api.DfareportingApi(mock).contentCategories;
      var arg_profileId = "foo";
      var arg_ids = buildUnnamed5276();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/contentCategories", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("/contentCategories"));
        pathOffset += 18;

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
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildContentCategoriesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContentCategoriesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.ContentCategoriesResourceApi res =
          new api.DfareportingApi(mock).contentCategories;
      var arg_request = buildContentCategory();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ContentCategory.fromJson(json);
        checkContentCategory(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/contentCategories", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("/contentCategories"));
        pathOffset += 18;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildContentCategory());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContentCategory(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.ContentCategoriesResourceApi res =
          new api.DfareportingApi(mock).contentCategories;
      var arg_request = buildContentCategory();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ContentCategory.fromJson(json);
        checkContentCategory(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/contentCategories", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("/contentCategories"));
        pathOffset += 18;

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
        var resp = convert.json.encode(buildContentCategory());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkContentCategory(response);
      })));
    });
  });

  unittest.group("resource-ConversionsResourceApi", () {
    unittest.test("method--batchinsert", () {
      var mock = new HttpServerMock();
      api.ConversionsResourceApi res =
          new api.DfareportingApi(mock).conversions;
      var arg_request = buildConversionsBatchInsertRequest();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ConversionsBatchInsertRequest.fromJson(json);
        checkConversionsBatchInsertRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/conversions/batchinsert", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 24),
            unittest.equals("/conversions/batchinsert"));
        pathOffset += 24;

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
        var resp = convert.json.encode(buildConversionsBatchInsertResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .batchinsert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkConversionsBatchInsertResponse(response);
      })));
    });

    unittest.test("method--batchupdate", () {
      var mock = new HttpServerMock();
      api.ConversionsResourceApi res =
          new api.DfareportingApi(mock).conversions;
      var arg_request = buildConversionsBatchUpdateRequest();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ConversionsBatchUpdateRequest.fromJson(json);
        checkConversionsBatchUpdateRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/conversions/batchupdate", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 24),
            unittest.equals("/conversions/batchupdate"));
        pathOffset += 24;

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
        var resp = convert.json.encode(buildConversionsBatchUpdateResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .batchupdate(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkConversionsBatchUpdateResponse(response);
      })));
    });
  });

  unittest.group("resource-CountriesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.CountriesResourceApi res = new api.DfareportingApi(mock).countries;
      var arg_profileId = "foo";
      var arg_dartId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/countries/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/countries/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_dartId"));

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
        var resp = convert.json.encode(buildCountry());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_dartId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCountry(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CountriesResourceApi res = new api.DfareportingApi(mock).countries;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/countries", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/countries"));
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
        var resp = convert.json.encode(buildCountriesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCountriesListResponse(response);
      })));
    });
  });

  unittest.group("resource-CreativeAssetsResourceApi", () {
    unittest.test("method--insert", () {
      // TODO: Implement tests for media upload;
      // TODO: Implement tests for media download;

      var mock = new HttpServerMock();
      api.CreativeAssetsResourceApi res =
          new api.DfareportingApi(mock).creativeAssets;
      var arg_request = buildCreativeAssetMetadata();
      var arg_profileId = "foo";
      var arg_advertiserId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeAssetMetadata.fromJson(json);
        checkCreativeAssetMetadata(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeAssets/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeAssets/"));
        pathOffset += 16;
        index = path.indexOf("/creativeAssets", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_advertiserId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/creativeAssets"));
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
        var resp = convert.json.encode(buildCreativeAssetMetadata());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, arg_advertiserId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeAssetMetadata(response);
      })));
    });
  });

  unittest.group("resource-CreativeFieldValuesResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.CreativeFieldValuesResourceApi res =
          new api.DfareportingApi(mock).creativeFieldValues;
      var arg_profileId = "foo";
      var arg_creativeFieldId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeFields/"));
        pathOffset += 16;
        index = path.indexOf("/creativeFieldValues/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_creativeFieldId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/creativeFieldValues/"));
        pathOffset += 21;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
          .delete(arg_profileId, arg_creativeFieldId, arg_id,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.CreativeFieldValuesResourceApi res =
          new api.DfareportingApi(mock).creativeFieldValues;
      var arg_profileId = "foo";
      var arg_creativeFieldId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeFields/"));
        pathOffset += 16;
        index = path.indexOf("/creativeFieldValues/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_creativeFieldId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/creativeFieldValues/"));
        pathOffset += 21;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildCreativeFieldValue());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_creativeFieldId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeFieldValue(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.CreativeFieldValuesResourceApi res =
          new api.DfareportingApi(mock).creativeFieldValues;
      var arg_request = buildCreativeFieldValue();
      var arg_profileId = "foo";
      var arg_creativeFieldId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeFieldValue.fromJson(json);
        checkCreativeFieldValue(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeFields/"));
        pathOffset += 16;
        index = path.indexOf("/creativeFieldValues", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_creativeFieldId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/creativeFieldValues"));
        pathOffset += 20;

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
        var resp = convert.json.encode(buildCreativeFieldValue());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, arg_creativeFieldId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeFieldValue(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CreativeFieldValuesResourceApi res =
          new api.DfareportingApi(mock).creativeFieldValues;
      var arg_profileId = "foo";
      var arg_creativeFieldId = "foo";
      var arg_ids = buildUnnamed5277();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeFields/"));
        pathOffset += 16;
        index = path.indexOf("/creativeFieldValues", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_creativeFieldId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/creativeFieldValues"));
        pathOffset += 20;

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
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreativeFieldValuesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, arg_creativeFieldId,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeFieldValuesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.CreativeFieldValuesResourceApi res =
          new api.DfareportingApi(mock).creativeFieldValues;
      var arg_request = buildCreativeFieldValue();
      var arg_profileId = "foo";
      var arg_creativeFieldId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeFieldValue.fromJson(json);
        checkCreativeFieldValue(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeFields/"));
        pathOffset += 16;
        index = path.indexOf("/creativeFieldValues", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_creativeFieldId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/creativeFieldValues"));
        pathOffset += 20;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreativeFieldValue());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_creativeFieldId, arg_id,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeFieldValue(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.CreativeFieldValuesResourceApi res =
          new api.DfareportingApi(mock).creativeFieldValues;
      var arg_request = buildCreativeFieldValue();
      var arg_profileId = "foo";
      var arg_creativeFieldId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeFieldValue.fromJson(json);
        checkCreativeFieldValue(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeFields/"));
        pathOffset += 16;
        index = path.indexOf("/creativeFieldValues", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_creativeFieldId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/creativeFieldValues"));
        pathOffset += 20;

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
        var resp = convert.json.encode(buildCreativeFieldValue());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, arg_creativeFieldId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeFieldValue(response);
      })));
    });
  });

  unittest.group("resource-CreativeFieldsResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.CreativeFieldsResourceApi res =
          new api.DfareportingApi(mock).creativeFields;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeFields/"));
        pathOffset += 16;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
          .delete(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.CreativeFieldsResourceApi res =
          new api.DfareportingApi(mock).creativeFields;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeFields/"));
        pathOffset += 16;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildCreativeField());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeField(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.CreativeFieldsResourceApi res =
          new api.DfareportingApi(mock).creativeFields;
      var arg_request = buildCreativeField();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeField.fromJson(json);
        checkCreativeField(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/creativeFields"));
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
        var resp = convert.json.encode(buildCreativeField());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeField(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CreativeFieldsResourceApi res =
          new api.DfareportingApi(mock).creativeFields;
      var arg_profileId = "foo";
      var arg_advertiserIds = buildUnnamed5278();
      var arg_ids = buildUnnamed5279();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/creativeFields"));
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
        unittest.expect(
            queryMap["advertiserIds"], unittest.equals(arg_advertiserIds));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreativeFieldsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserIds: arg_advertiserIds,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeFieldsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.CreativeFieldsResourceApi res =
          new api.DfareportingApi(mock).creativeFields;
      var arg_request = buildCreativeField();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeField.fromJson(json);
        checkCreativeField(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/creativeFields"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreativeField());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeField(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.CreativeFieldsResourceApi res =
          new api.DfareportingApi(mock).creativeFields;
      var arg_request = buildCreativeField();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeField.fromJson(json);
        checkCreativeField(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeFields", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/creativeFields"));
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
        var resp = convert.json.encode(buildCreativeField());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeField(response);
      })));
    });
  });

  unittest.group("resource-CreativeGroupsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.CreativeGroupsResourceApi res =
          new api.DfareportingApi(mock).creativeGroups;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeGroups/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/creativeGroups/"));
        pathOffset += 16;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildCreativeGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeGroup(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.CreativeGroupsResourceApi res =
          new api.DfareportingApi(mock).creativeGroups;
      var arg_request = buildCreativeGroup();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeGroup.fromJson(json);
        checkCreativeGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/creativeGroups"));
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
        var resp = convert.json.encode(buildCreativeGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeGroup(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CreativeGroupsResourceApi res =
          new api.DfareportingApi(mock).creativeGroups;
      var arg_profileId = "foo";
      var arg_advertiserIds = buildUnnamed5280();
      var arg_groupNumber = 42;
      var arg_ids = buildUnnamed5281();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/creativeGroups"));
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
        unittest.expect(
            queryMap["advertiserIds"], unittest.equals(arg_advertiserIds));
        unittest.expect(core.int.parse(queryMap["groupNumber"].first),
            unittest.equals(arg_groupNumber));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreativeGroupsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserIds: arg_advertiserIds,
              groupNumber: arg_groupNumber,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeGroupsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.CreativeGroupsResourceApi res =
          new api.DfareportingApi(mock).creativeGroups;
      var arg_request = buildCreativeGroup();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeGroup.fromJson(json);
        checkCreativeGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/creativeGroups"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreativeGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeGroup(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.CreativeGroupsResourceApi res =
          new api.DfareportingApi(mock).creativeGroups;
      var arg_request = buildCreativeGroup();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreativeGroup.fromJson(json);
        checkCreativeGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creativeGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/creativeGroups"));
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
        var resp = convert.json.encode(buildCreativeGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativeGroup(response);
      })));
    });
  });

  unittest.group("resource-CreativesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.CreativesResourceApi res = new api.DfareportingApi(mock).creatives;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creatives/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/creatives/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildCreative());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreative(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.CreativesResourceApi res = new api.DfareportingApi(mock).creatives;
      var arg_request = buildCreative();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Creative.fromJson(json);
        checkCreative(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creatives", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/creatives"));
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
        var resp = convert.json.encode(buildCreative());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreative(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CreativesResourceApi res = new api.DfareportingApi(mock).creatives;
      var arg_profileId = "foo";
      var arg_active = true;
      var arg_advertiserId = "foo";
      var arg_archived = true;
      var arg_campaignId = "foo";
      var arg_companionCreativeIds = buildUnnamed5282();
      var arg_creativeFieldIds = buildUnnamed5283();
      var arg_ids = buildUnnamed5284();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_renderingIds = buildUnnamed5285();
      var arg_searchString = "foo";
      var arg_sizeIds = buildUnnamed5286();
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_studioCreativeId = "foo";
      var arg_types = buildUnnamed5287();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creatives", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/creatives"));
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
        unittest.expect(
            queryMap["active"].first, unittest.equals("$arg_active"));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["archived"].first, unittest.equals("$arg_archived"));
        unittest.expect(
            queryMap["campaignId"].first, unittest.equals(arg_campaignId));
        unittest.expect(queryMap["companionCreativeIds"],
            unittest.equals(arg_companionCreativeIds));
        unittest.expect(queryMap["creativeFieldIds"],
            unittest.equals(arg_creativeFieldIds));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["renderingIds"], unittest.equals(arg_renderingIds));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(queryMap["sizeIds"], unittest.equals(arg_sizeIds));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["studioCreativeId"].first,
            unittest.equals(arg_studioCreativeId));
        unittest.expect(queryMap["types"], unittest.equals(arg_types));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreativesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              active: arg_active,
              advertiserId: arg_advertiserId,
              archived: arg_archived,
              campaignId: arg_campaignId,
              companionCreativeIds: arg_companionCreativeIds,
              creativeFieldIds: arg_creativeFieldIds,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              renderingIds: arg_renderingIds,
              searchString: arg_searchString,
              sizeIds: arg_sizeIds,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              studioCreativeId: arg_studioCreativeId,
              types: arg_types,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreativesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.CreativesResourceApi res = new api.DfareportingApi(mock).creatives;
      var arg_request = buildCreative();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Creative.fromJson(json);
        checkCreative(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creatives", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/creatives"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreative());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreative(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.CreativesResourceApi res = new api.DfareportingApi(mock).creatives;
      var arg_request = buildCreative();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Creative.fromJson(json);
        checkCreative(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/creatives", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/creatives"));
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
        var resp = convert.json.encode(buildCreative());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreative(response);
      })));
    });
  });

  unittest.group("resource-CustomEventsResourceApi", () {
    unittest.test("method--batchinsert", () {
      var mock = new HttpServerMock();
      api.CustomEventsResourceApi res =
          new api.DfareportingApi(mock).customEvents;
      var arg_request = buildCustomEventsBatchInsertRequest();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CustomEventsBatchInsertRequest.fromJson(json);
        checkCustomEventsBatchInsertRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/customEvents/batchinsert", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/customEvents/batchinsert"));
        pathOffset += 25;

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
        var resp = convert.json.encode(buildCustomEventsBatchInsertResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .batchinsert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCustomEventsBatchInsertResponse(response);
      })));
    });
  });

  unittest.group("resource-DimensionValuesResourceApi", () {
    unittest.test("method--query", () {
      var mock = new HttpServerMock();
      api.DimensionValuesResourceApi res =
          new api.DfareportingApi(mock).dimensionValues;
      var arg_request = buildDimensionValueRequest();
      var arg_profileId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.DimensionValueRequest.fromJson(json);
        checkDimensionValueRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/dimensionvalues/query", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 22),
            unittest.equals("/dimensionvalues/query"));
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
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildDimensionValueList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .query(arg_request, arg_profileId,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkDimensionValueList(response);
      })));
    });
  });

  unittest.group("resource-DirectorySitesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.DirectorySitesResourceApi res =
          new api.DfareportingApi(mock).directorySites;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/directorySites/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/directorySites/"));
        pathOffset += 16;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildDirectorySite());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkDirectorySite(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.DirectorySitesResourceApi res =
          new api.DfareportingApi(mock).directorySites;
      var arg_request = buildDirectorySite();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.DirectorySite.fromJson(json);
        checkDirectorySite(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/directorySites", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/directorySites"));
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
        var resp = convert.json.encode(buildDirectorySite());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkDirectorySite(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.DirectorySitesResourceApi res =
          new api.DfareportingApi(mock).directorySites;
      var arg_profileId = "foo";
      var arg_acceptsInStreamVideoPlacements = true;
      var arg_acceptsInterstitialPlacements = true;
      var arg_acceptsPublisherPaidPlacements = true;
      var arg_active = true;
      var arg_dfpNetworkCode = "foo";
      var arg_ids = buildUnnamed5288();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/directorySites", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/directorySites"));
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
        unittest.expect(queryMap["acceptsInStreamVideoPlacements"].first,
            unittest.equals("$arg_acceptsInStreamVideoPlacements"));
        unittest.expect(queryMap["acceptsInterstitialPlacements"].first,
            unittest.equals("$arg_acceptsInterstitialPlacements"));
        unittest.expect(queryMap["acceptsPublisherPaidPlacements"].first,
            unittest.equals("$arg_acceptsPublisherPaidPlacements"));
        unittest.expect(
            queryMap["active"].first, unittest.equals("$arg_active"));
        unittest.expect(queryMap["dfpNetworkCode"].first,
            unittest.equals(arg_dfpNetworkCode));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildDirectorySitesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              acceptsInStreamVideoPlacements:
                  arg_acceptsInStreamVideoPlacements,
              acceptsInterstitialPlacements: arg_acceptsInterstitialPlacements,
              acceptsPublisherPaidPlacements:
                  arg_acceptsPublisherPaidPlacements,
              active: arg_active,
              dfpNetworkCode: arg_dfpNetworkCode,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkDirectorySitesListResponse(response);
      })));
    });
  });

  unittest.group("resource-DynamicTargetingKeysResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.DynamicTargetingKeysResourceApi res =
          new api.DfareportingApi(mock).dynamicTargetingKeys;
      var arg_profileId = "foo";
      var arg_objectId = "foo";
      var arg_name = "foo";
      var arg_objectType = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/dynamicTargetingKeys/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 22),
            unittest.equals("/dynamicTargetingKeys/"));
        pathOffset += 22;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_objectId"));

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
        unittest.expect(queryMap["name"].first, unittest.equals(arg_name));
        unittest.expect(
            queryMap["objectType"].first, unittest.equals(arg_objectType));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_profileId, arg_objectId, arg_name, arg_objectType,
              $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.DynamicTargetingKeysResourceApi res =
          new api.DfareportingApi(mock).dynamicTargetingKeys;
      var arg_request = buildDynamicTargetingKey();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.DynamicTargetingKey.fromJson(json);
        checkDynamicTargetingKey(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/dynamicTargetingKeys", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/dynamicTargetingKeys"));
        pathOffset += 21;

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
        var resp = convert.json.encode(buildDynamicTargetingKey());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkDynamicTargetingKey(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.DynamicTargetingKeysResourceApi res =
          new api.DfareportingApi(mock).dynamicTargetingKeys;
      var arg_profileId = "foo";
      var arg_advertiserId = "foo";
      var arg_names = buildUnnamed5289();
      var arg_objectId = "foo";
      var arg_objectType = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/dynamicTargetingKeys", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/dynamicTargetingKeys"));
        pathOffset += 21;

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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["names"], unittest.equals(arg_names));
        unittest.expect(
            queryMap["objectId"].first, unittest.equals(arg_objectId));
        unittest.expect(
            queryMap["objectType"].first, unittest.equals(arg_objectType));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildDynamicTargetingKeysListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserId: arg_advertiserId,
              names: arg_names,
              objectId: arg_objectId,
              objectType: arg_objectType,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkDynamicTargetingKeysListResponse(response);
      })));
    });
  });

  unittest.group("resource-EventTagsResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.EventTagsResourceApi res = new api.DfareportingApi(mock).eventTags;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/eventTags/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/eventTags/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
          .delete(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.EventTagsResourceApi res = new api.DfareportingApi(mock).eventTags;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/eventTags/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/eventTags/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildEventTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEventTag(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.EventTagsResourceApi res = new api.DfareportingApi(mock).eventTags;
      var arg_request = buildEventTag();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.EventTag.fromJson(json);
        checkEventTag(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/eventTags", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/eventTags"));
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
        var resp = convert.json.encode(buildEventTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEventTag(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.EventTagsResourceApi res = new api.DfareportingApi(mock).eventTags;
      var arg_profileId = "foo";
      var arg_adId = "foo";
      var arg_advertiserId = "foo";
      var arg_campaignId = "foo";
      var arg_definitionsOnly = true;
      var arg_enabled = true;
      var arg_eventTagTypes = buildUnnamed5290();
      var arg_ids = buildUnnamed5291();
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/eventTags", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/eventTags"));
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
        unittest.expect(queryMap["adId"].first, unittest.equals(arg_adId));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["campaignId"].first, unittest.equals(arg_campaignId));
        unittest.expect(queryMap["definitionsOnly"].first,
            unittest.equals("$arg_definitionsOnly"));
        unittest.expect(
            queryMap["enabled"].first, unittest.equals("$arg_enabled"));
        unittest.expect(
            queryMap["eventTagTypes"], unittest.equals(arg_eventTagTypes));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEventTagsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              adId: arg_adId,
              advertiserId: arg_advertiserId,
              campaignId: arg_campaignId,
              definitionsOnly: arg_definitionsOnly,
              enabled: arg_enabled,
              eventTagTypes: arg_eventTagTypes,
              ids: arg_ids,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEventTagsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.EventTagsResourceApi res = new api.DfareportingApi(mock).eventTags;
      var arg_request = buildEventTag();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.EventTag.fromJson(json);
        checkEventTag(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/eventTags", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/eventTags"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEventTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEventTag(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.EventTagsResourceApi res = new api.DfareportingApi(mock).eventTags;
      var arg_request = buildEventTag();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.EventTag.fromJson(json);
        checkEventTag(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/eventTags", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/eventTags"));
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
        var resp = convert.json.encode(buildEventTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEventTag(response);
      })));
    });
  });

  unittest.group("resource-FilesResourceApi", () {
    unittest.test("method--get", () {
      // TODO: Implement tests for media upload;
      // TODO: Implement tests for media download;

      var mock = new HttpServerMock();
      api.FilesResourceApi res = new api.DfareportingApi(mock).files;
      var arg_reportId = "foo";
      var arg_fileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("reports/"));
        pathOffset += 8;
        index = path.indexOf("/files/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_reportId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/files/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_fileId"));

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
        var resp = convert.json.encode(buildFile());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_reportId, arg_fileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFile(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.FilesResourceApi res = new api.DfareportingApi(mock).files;
      var arg_profileId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_scope = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/files", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/files"));
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
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["scope"].first, unittest.equals(arg_scope));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFileList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              scope: arg_scope,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFileList(response);
      })));
    });
  });

  unittest.group("resource-FloodlightActivitiesResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.FloodlightActivitiesResourceApi res =
          new api.DfareportingApi(mock).floodlightActivities;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivities/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 22),
            unittest.equals("/floodlightActivities/"));
        pathOffset += 22;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
          .delete(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--generatetag", () {
      var mock = new HttpServerMock();
      api.FloodlightActivitiesResourceApi res =
          new api.DfareportingApi(mock).floodlightActivities;
      var arg_profileId = "foo";
      var arg_floodlightActivityId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivities/generatetag", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 33),
            unittest.equals("/floodlightActivities/generatetag"));
        pathOffset += 33;

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
        unittest.expect(queryMap["floodlightActivityId"].first,
            unittest.equals(arg_floodlightActivityId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp =
            convert.json.encode(buildFloodlightActivitiesGenerateTagResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .generatetag(arg_profileId,
              floodlightActivityId: arg_floodlightActivityId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivitiesGenerateTagResponse(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.FloodlightActivitiesResourceApi res =
          new api.DfareportingApi(mock).floodlightActivities;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivities/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 22),
            unittest.equals("/floodlightActivities/"));
        pathOffset += 22;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildFloodlightActivity());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivity(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.FloodlightActivitiesResourceApi res =
          new api.DfareportingApi(mock).floodlightActivities;
      var arg_request = buildFloodlightActivity();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.FloodlightActivity.fromJson(json);
        checkFloodlightActivity(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivities", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/floodlightActivities"));
        pathOffset += 21;

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
        var resp = convert.json.encode(buildFloodlightActivity());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivity(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.FloodlightActivitiesResourceApi res =
          new api.DfareportingApi(mock).floodlightActivities;
      var arg_profileId = "foo";
      var arg_advertiserId = "foo";
      var arg_floodlightActivityGroupIds = buildUnnamed5292();
      var arg_floodlightActivityGroupName = "foo";
      var arg_floodlightActivityGroupTagString = "foo";
      var arg_floodlightActivityGroupType = "foo";
      var arg_floodlightConfigurationId = "foo";
      var arg_ids = buildUnnamed5293();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_tagString = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivities", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/floodlightActivities"));
        pathOffset += 21;

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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["floodlightActivityGroupIds"],
            unittest.equals(arg_floodlightActivityGroupIds));
        unittest.expect(queryMap["floodlightActivityGroupName"].first,
            unittest.equals(arg_floodlightActivityGroupName));
        unittest.expect(queryMap["floodlightActivityGroupTagString"].first,
            unittest.equals(arg_floodlightActivityGroupTagString));
        unittest.expect(queryMap["floodlightActivityGroupType"].first,
            unittest.equals(arg_floodlightActivityGroupType));
        unittest.expect(queryMap["floodlightConfigurationId"].first,
            unittest.equals(arg_floodlightConfigurationId));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(
            queryMap["tagString"].first, unittest.equals(arg_tagString));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFloodlightActivitiesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserId: arg_advertiserId,
              floodlightActivityGroupIds: arg_floodlightActivityGroupIds,
              floodlightActivityGroupName: arg_floodlightActivityGroupName,
              floodlightActivityGroupTagString:
                  arg_floodlightActivityGroupTagString,
              floodlightActivityGroupType: arg_floodlightActivityGroupType,
              floodlightConfigurationId: arg_floodlightConfigurationId,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              tagString: arg_tagString,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivitiesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.FloodlightActivitiesResourceApi res =
          new api.DfareportingApi(mock).floodlightActivities;
      var arg_request = buildFloodlightActivity();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.FloodlightActivity.fromJson(json);
        checkFloodlightActivity(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivities", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/floodlightActivities"));
        pathOffset += 21;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFloodlightActivity());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivity(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.FloodlightActivitiesResourceApi res =
          new api.DfareportingApi(mock).floodlightActivities;
      var arg_request = buildFloodlightActivity();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.FloodlightActivity.fromJson(json);
        checkFloodlightActivity(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivities", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/floodlightActivities"));
        pathOffset += 21;

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
        var resp = convert.json.encode(buildFloodlightActivity());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivity(response);
      })));
    });
  });

  unittest.group("resource-FloodlightActivityGroupsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.FloodlightActivityGroupsResourceApi res =
          new api.DfareportingApi(mock).floodlightActivityGroups;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivityGroups/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 26),
            unittest.equals("/floodlightActivityGroups/"));
        pathOffset += 26;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildFloodlightActivityGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivityGroup(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.FloodlightActivityGroupsResourceApi res =
          new api.DfareportingApi(mock).floodlightActivityGroups;
      var arg_request = buildFloodlightActivityGroup();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.FloodlightActivityGroup.fromJson(json);
        checkFloodlightActivityGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivityGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/floodlightActivityGroups"));
        pathOffset += 25;

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
        var resp = convert.json.encode(buildFloodlightActivityGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivityGroup(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.FloodlightActivityGroupsResourceApi res =
          new api.DfareportingApi(mock).floodlightActivityGroups;
      var arg_profileId = "foo";
      var arg_advertiserId = "foo";
      var arg_floodlightConfigurationId = "foo";
      var arg_ids = buildUnnamed5294();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_type = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivityGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/floodlightActivityGroups"));
        pathOffset += 25;

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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["floodlightConfigurationId"].first,
            unittest.equals(arg_floodlightConfigurationId));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["type"].first, unittest.equals(arg_type));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp =
            convert.json.encode(buildFloodlightActivityGroupsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserId: arg_advertiserId,
              floodlightConfigurationId: arg_floodlightConfigurationId,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              type: arg_type,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivityGroupsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.FloodlightActivityGroupsResourceApi res =
          new api.DfareportingApi(mock).floodlightActivityGroups;
      var arg_request = buildFloodlightActivityGroup();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.FloodlightActivityGroup.fromJson(json);
        checkFloodlightActivityGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivityGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/floodlightActivityGroups"));
        pathOffset += 25;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFloodlightActivityGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivityGroup(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.FloodlightActivityGroupsResourceApi res =
          new api.DfareportingApi(mock).floodlightActivityGroups;
      var arg_request = buildFloodlightActivityGroup();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.FloodlightActivityGroup.fromJson(json);
        checkFloodlightActivityGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightActivityGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/floodlightActivityGroups"));
        pathOffset += 25;

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
        var resp = convert.json.encode(buildFloodlightActivityGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightActivityGroup(response);
      })));
    });
  });

  unittest.group("resource-FloodlightConfigurationsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.FloodlightConfigurationsResourceApi res =
          new api.DfareportingApi(mock).floodlightConfigurations;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightConfigurations/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 26),
            unittest.equals("/floodlightConfigurations/"));
        pathOffset += 26;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildFloodlightConfiguration());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightConfiguration(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.FloodlightConfigurationsResourceApi res =
          new api.DfareportingApi(mock).floodlightConfigurations;
      var arg_profileId = "foo";
      var arg_ids = buildUnnamed5295();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightConfigurations", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/floodlightConfigurations"));
        pathOffset += 25;

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
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp =
            convert.json.encode(buildFloodlightConfigurationsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, ids: arg_ids, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightConfigurationsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.FloodlightConfigurationsResourceApi res =
          new api.DfareportingApi(mock).floodlightConfigurations;
      var arg_request = buildFloodlightConfiguration();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.FloodlightConfiguration.fromJson(json);
        checkFloodlightConfiguration(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightConfigurations", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/floodlightConfigurations"));
        pathOffset += 25;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFloodlightConfiguration());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightConfiguration(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.FloodlightConfigurationsResourceApi res =
          new api.DfareportingApi(mock).floodlightConfigurations;
      var arg_request = buildFloodlightConfiguration();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.FloodlightConfiguration.fromJson(json);
        checkFloodlightConfiguration(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/floodlightConfigurations", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/floodlightConfigurations"));
        pathOffset += 25;

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
        var resp = convert.json.encode(buildFloodlightConfiguration());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightConfiguration(response);
      })));
    });
  });

  unittest.group("resource-InventoryItemsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.InventoryItemsResourceApi res =
          new api.DfareportingApi(mock).inventoryItems;
      var arg_profileId = "foo";
      var arg_projectId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/projects/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/projects/"));
        pathOffset += 10;
        index = path.indexOf("/inventoryItems/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/inventoryItems/"));
        pathOffset += 16;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildInventoryItem());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_projectId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkInventoryItem(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.InventoryItemsResourceApi res =
          new api.DfareportingApi(mock).inventoryItems;
      var arg_profileId = "foo";
      var arg_projectId = "foo";
      var arg_ids = buildUnnamed5296();
      var arg_inPlan = true;
      var arg_maxResults = 42;
      var arg_orderId = buildUnnamed5297();
      var arg_pageToken = "foo";
      var arg_siteId = buildUnnamed5298();
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_type = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/projects/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/projects/"));
        pathOffset += 10;
        index = path.indexOf("/inventoryItems", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/inventoryItems"));
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
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(
            queryMap["inPlan"].first, unittest.equals("$arg_inPlan"));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(queryMap["orderId"], unittest.equals(arg_orderId));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["siteId"], unittest.equals(arg_siteId));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["type"].first, unittest.equals(arg_type));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildInventoryItemsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, arg_projectId,
              ids: arg_ids,
              inPlan: arg_inPlan,
              maxResults: arg_maxResults,
              orderId: arg_orderId,
              pageToken: arg_pageToken,
              siteId: arg_siteId,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              type: arg_type,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkInventoryItemsListResponse(response);
      })));
    });
  });

  unittest.group("resource-LanguagesResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.LanguagesResourceApi res = new api.DfareportingApi(mock).languages;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/languages", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/languages"));
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
        var resp = convert.json.encode(buildLanguagesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkLanguagesListResponse(response);
      })));
    });
  });

  unittest.group("resource-MetrosResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.MetrosResourceApi res = new api.DfareportingApi(mock).metros;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/metros", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/metros"));
        pathOffset += 7;

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
        var resp = convert.json.encode(buildMetrosListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkMetrosListResponse(response);
      })));
    });
  });

  unittest.group("resource-MobileAppsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.MobileAppsResourceApi res = new api.DfareportingApi(mock).mobileApps;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/mobileApps/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/mobileApps/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildMobileApp());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkMobileApp(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.MobileAppsResourceApi res = new api.DfareportingApi(mock).mobileApps;
      var arg_profileId = "foo";
      var arg_directories = buildUnnamed5299();
      var arg_ids = buildUnnamed5300();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/mobileApps", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/mobileApps"));
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
        unittest.expect(
            queryMap["directories"], unittest.equals(arg_directories));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildMobileAppsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              directories: arg_directories,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkMobileAppsListResponse(response);
      })));
    });
  });

  unittest.group("resource-MobileCarriersResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.MobileCarriersResourceApi res =
          new api.DfareportingApi(mock).mobileCarriers;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/mobileCarriers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/mobileCarriers/"));
        pathOffset += 16;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildMobileCarrier());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkMobileCarrier(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.MobileCarriersResourceApi res =
          new api.DfareportingApi(mock).mobileCarriers;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/mobileCarriers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/mobileCarriers"));
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
        var resp = convert.json.encode(buildMobileCarriersListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkMobileCarriersListResponse(response);
      })));
    });
  });

  unittest.group("resource-OperatingSystemVersionsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.OperatingSystemVersionsResourceApi res =
          new api.DfareportingApi(mock).operatingSystemVersions;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/operatingSystemVersions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/operatingSystemVersions/"));
        pathOffset += 25;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildOperatingSystemVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperatingSystemVersion(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.OperatingSystemVersionsResourceApi res =
          new api.DfareportingApi(mock).operatingSystemVersions;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/operatingSystemVersions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 24),
            unittest.equals("/operatingSystemVersions"));
        pathOffset += 24;

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
        var resp =
            convert.json.encode(buildOperatingSystemVersionsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperatingSystemVersionsListResponse(response);
      })));
    });
  });

  unittest.group("resource-OperatingSystemsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.OperatingSystemsResourceApi res =
          new api.DfareportingApi(mock).operatingSystems;
      var arg_profileId = "foo";
      var arg_dartId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/operatingSystems/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("/operatingSystems/"));
        pathOffset += 18;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_dartId"));

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
        var resp = convert.json.encode(buildOperatingSystem());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_dartId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperatingSystem(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.OperatingSystemsResourceApi res =
          new api.DfareportingApi(mock).operatingSystems;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/operatingSystems", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/operatingSystems"));
        pathOffset += 17;

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
        var resp = convert.json.encode(buildOperatingSystemsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperatingSystemsListResponse(response);
      })));
    });
  });

  unittest.group("resource-OrderDocumentsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.OrderDocumentsResourceApi res =
          new api.DfareportingApi(mock).orderDocuments;
      var arg_profileId = "foo";
      var arg_projectId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/projects/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/projects/"));
        pathOffset += 10;
        index = path.indexOf("/orderDocuments/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/orderDocuments/"));
        pathOffset += 16;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildOrderDocument());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_projectId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOrderDocument(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.OrderDocumentsResourceApi res =
          new api.DfareportingApi(mock).orderDocuments;
      var arg_profileId = "foo";
      var arg_projectId = "foo";
      var arg_approved = true;
      var arg_ids = buildUnnamed5301();
      var arg_maxResults = 42;
      var arg_orderId = buildUnnamed5302();
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_siteId = buildUnnamed5303();
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/projects/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/projects/"));
        pathOffset += 10;
        index = path.indexOf("/orderDocuments", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/orderDocuments"));
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
        unittest.expect(
            queryMap["approved"].first, unittest.equals("$arg_approved"));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(queryMap["orderId"], unittest.equals(arg_orderId));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(queryMap["siteId"], unittest.equals(arg_siteId));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOrderDocumentsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, arg_projectId,
              approved: arg_approved,
              ids: arg_ids,
              maxResults: arg_maxResults,
              orderId: arg_orderId,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              siteId: arg_siteId,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOrderDocumentsListResponse(response);
      })));
    });
  });

  unittest.group("resource-OrdersResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.OrdersResourceApi res = new api.DfareportingApi(mock).orders;
      var arg_profileId = "foo";
      var arg_projectId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/projects/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/projects/"));
        pathOffset += 10;
        index = path.indexOf("/orders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/orders/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildOrder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_projectId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOrder(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.OrdersResourceApi res = new api.DfareportingApi(mock).orders;
      var arg_profileId = "foo";
      var arg_projectId = "foo";
      var arg_ids = buildUnnamed5304();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_siteId = buildUnnamed5305();
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/projects/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/projects/"));
        pathOffset += 10;
        index = path.indexOf("/orders", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_projectId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/orders"));
        pathOffset += 7;

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
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(queryMap["siteId"], unittest.equals(arg_siteId));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildOrdersListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, arg_projectId,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              siteId: arg_siteId,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOrdersListResponse(response);
      })));
    });
  });

  unittest.group("resource-PlacementGroupsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.PlacementGroupsResourceApi res =
          new api.DfareportingApi(mock).placementGroups;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementGroups/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/placementGroups/"));
        pathOffset += 17;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildPlacementGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementGroup(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.PlacementGroupsResourceApi res =
          new api.DfareportingApi(mock).placementGroups;
      var arg_request = buildPlacementGroup();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.PlacementGroup.fromJson(json);
        checkPlacementGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/placementGroups"));
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
        var resp = convert.json.encode(buildPlacementGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementGroup(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.PlacementGroupsResourceApi res =
          new api.DfareportingApi(mock).placementGroups;
      var arg_profileId = "foo";
      var arg_advertiserIds = buildUnnamed5306();
      var arg_archived = true;
      var arg_campaignIds = buildUnnamed5307();
      var arg_contentCategoryIds = buildUnnamed5308();
      var arg_directorySiteIds = buildUnnamed5309();
      var arg_ids = buildUnnamed5310();
      var arg_maxEndDate = "foo";
      var arg_maxResults = 42;
      var arg_maxStartDate = "foo";
      var arg_minEndDate = "foo";
      var arg_minStartDate = "foo";
      var arg_pageToken = "foo";
      var arg_placementGroupType = "foo";
      var arg_placementStrategyIds = buildUnnamed5311();
      var arg_pricingTypes = buildUnnamed5312();
      var arg_searchString = "foo";
      var arg_siteIds = buildUnnamed5313();
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/placementGroups"));
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
        unittest.expect(
            queryMap["advertiserIds"], unittest.equals(arg_advertiserIds));
        unittest.expect(
            queryMap["archived"].first, unittest.equals("$arg_archived"));
        unittest.expect(
            queryMap["campaignIds"], unittest.equals(arg_campaignIds));
        unittest.expect(queryMap["contentCategoryIds"],
            unittest.equals(arg_contentCategoryIds));
        unittest.expect(queryMap["directorySiteIds"],
            unittest.equals(arg_directorySiteIds));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(
            queryMap["maxEndDate"].first, unittest.equals(arg_maxEndDate));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["maxStartDate"].first, unittest.equals(arg_maxStartDate));
        unittest.expect(
            queryMap["minEndDate"].first, unittest.equals(arg_minEndDate));
        unittest.expect(
            queryMap["minStartDate"].first, unittest.equals(arg_minStartDate));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["placementGroupType"].first,
            unittest.equals(arg_placementGroupType));
        unittest.expect(queryMap["placementStrategyIds"],
            unittest.equals(arg_placementStrategyIds));
        unittest.expect(
            queryMap["pricingTypes"], unittest.equals(arg_pricingTypes));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(queryMap["siteIds"], unittest.equals(arg_siteIds));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildPlacementGroupsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserIds: arg_advertiserIds,
              archived: arg_archived,
              campaignIds: arg_campaignIds,
              contentCategoryIds: arg_contentCategoryIds,
              directorySiteIds: arg_directorySiteIds,
              ids: arg_ids,
              maxEndDate: arg_maxEndDate,
              maxResults: arg_maxResults,
              maxStartDate: arg_maxStartDate,
              minEndDate: arg_minEndDate,
              minStartDate: arg_minStartDate,
              pageToken: arg_pageToken,
              placementGroupType: arg_placementGroupType,
              placementStrategyIds: arg_placementStrategyIds,
              pricingTypes: arg_pricingTypes,
              searchString: arg_searchString,
              siteIds: arg_siteIds,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementGroupsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.PlacementGroupsResourceApi res =
          new api.DfareportingApi(mock).placementGroups;
      var arg_request = buildPlacementGroup();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.PlacementGroup.fromJson(json);
        checkPlacementGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/placementGroups"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildPlacementGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementGroup(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.PlacementGroupsResourceApi res =
          new api.DfareportingApi(mock).placementGroups;
      var arg_request = buildPlacementGroup();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.PlacementGroup.fromJson(json);
        checkPlacementGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16),
            unittest.equals("/placementGroups"));
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
        var resp = convert.json.encode(buildPlacementGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementGroup(response);
      })));
    });
  });

  unittest.group("resource-PlacementStrategiesResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.PlacementStrategiesResourceApi res =
          new api.DfareportingApi(mock).placementStrategies;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementStrategies/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/placementStrategies/"));
        pathOffset += 21;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
          .delete(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.PlacementStrategiesResourceApi res =
          new api.DfareportingApi(mock).placementStrategies;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementStrategies/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/placementStrategies/"));
        pathOffset += 21;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildPlacementStrategy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementStrategy(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.PlacementStrategiesResourceApi res =
          new api.DfareportingApi(mock).placementStrategies;
      var arg_request = buildPlacementStrategy();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.PlacementStrategy.fromJson(json);
        checkPlacementStrategy(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementStrategies", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/placementStrategies"));
        pathOffset += 20;

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
        var resp = convert.json.encode(buildPlacementStrategy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementStrategy(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.PlacementStrategiesResourceApi res =
          new api.DfareportingApi(mock).placementStrategies;
      var arg_profileId = "foo";
      var arg_ids = buildUnnamed5314();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementStrategies", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/placementStrategies"));
        pathOffset += 20;

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
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildPlacementStrategiesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementStrategiesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.PlacementStrategiesResourceApi res =
          new api.DfareportingApi(mock).placementStrategies;
      var arg_request = buildPlacementStrategy();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.PlacementStrategy.fromJson(json);
        checkPlacementStrategy(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementStrategies", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/placementStrategies"));
        pathOffset += 20;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildPlacementStrategy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementStrategy(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.PlacementStrategiesResourceApi res =
          new api.DfareportingApi(mock).placementStrategies;
      var arg_request = buildPlacementStrategy();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.PlacementStrategy.fromJson(json);
        checkPlacementStrategy(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placementStrategies", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/placementStrategies"));
        pathOffset += 20;

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
        var resp = convert.json.encode(buildPlacementStrategy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementStrategy(response);
      })));
    });
  });

  unittest.group("resource-PlacementsResourceApi", () {
    unittest.test("method--generatetags", () {
      var mock = new HttpServerMock();
      api.PlacementsResourceApi res = new api.DfareportingApi(mock).placements;
      var arg_profileId = "foo";
      var arg_campaignId = "foo";
      var arg_placementIds = buildUnnamed5315();
      var arg_tagFormats = buildUnnamed5316();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placements/generatetags", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 24),
            unittest.equals("/placements/generatetags"));
        pathOffset += 24;

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
            queryMap["campaignId"].first, unittest.equals(arg_campaignId));
        unittest.expect(
            queryMap["placementIds"], unittest.equals(arg_placementIds));
        unittest.expect(
            queryMap["tagFormats"], unittest.equals(arg_tagFormats));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildPlacementsGenerateTagsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .generatetags(arg_profileId,
              campaignId: arg_campaignId,
              placementIds: arg_placementIds,
              tagFormats: arg_tagFormats,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementsGenerateTagsResponse(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.PlacementsResourceApi res = new api.DfareportingApi(mock).placements;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placements/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/placements/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildPlacement());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacement(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.PlacementsResourceApi res = new api.DfareportingApi(mock).placements;
      var arg_request = buildPlacement();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Placement.fromJson(json);
        checkPlacement(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placements", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/placements"));
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
        var resp = convert.json.encode(buildPlacement());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacement(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.PlacementsResourceApi res = new api.DfareportingApi(mock).placements;
      var arg_profileId = "foo";
      var arg_advertiserIds = buildUnnamed5317();
      var arg_archived = true;
      var arg_campaignIds = buildUnnamed5318();
      var arg_compatibilities = buildUnnamed5319();
      var arg_contentCategoryIds = buildUnnamed5320();
      var arg_directorySiteIds = buildUnnamed5321();
      var arg_groupIds = buildUnnamed5322();
      var arg_ids = buildUnnamed5323();
      var arg_maxEndDate = "foo";
      var arg_maxResults = 42;
      var arg_maxStartDate = "foo";
      var arg_minEndDate = "foo";
      var arg_minStartDate = "foo";
      var arg_pageToken = "foo";
      var arg_paymentSource = "foo";
      var arg_placementStrategyIds = buildUnnamed5324();
      var arg_pricingTypes = buildUnnamed5325();
      var arg_searchString = "foo";
      var arg_siteIds = buildUnnamed5326();
      var arg_sizeIds = buildUnnamed5327();
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placements", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/placements"));
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
        unittest.expect(
            queryMap["advertiserIds"], unittest.equals(arg_advertiserIds));
        unittest.expect(
            queryMap["archived"].first, unittest.equals("$arg_archived"));
        unittest.expect(
            queryMap["campaignIds"], unittest.equals(arg_campaignIds));
        unittest.expect(
            queryMap["compatibilities"], unittest.equals(arg_compatibilities));
        unittest.expect(queryMap["contentCategoryIds"],
            unittest.equals(arg_contentCategoryIds));
        unittest.expect(queryMap["directorySiteIds"],
            unittest.equals(arg_directorySiteIds));
        unittest.expect(queryMap["groupIds"], unittest.equals(arg_groupIds));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(
            queryMap["maxEndDate"].first, unittest.equals(arg_maxEndDate));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["maxStartDate"].first, unittest.equals(arg_maxStartDate));
        unittest.expect(
            queryMap["minEndDate"].first, unittest.equals(arg_minEndDate));
        unittest.expect(
            queryMap["minStartDate"].first, unittest.equals(arg_minStartDate));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["paymentSource"].first,
            unittest.equals(arg_paymentSource));
        unittest.expect(queryMap["placementStrategyIds"],
            unittest.equals(arg_placementStrategyIds));
        unittest.expect(
            queryMap["pricingTypes"], unittest.equals(arg_pricingTypes));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(queryMap["siteIds"], unittest.equals(arg_siteIds));
        unittest.expect(queryMap["sizeIds"], unittest.equals(arg_sizeIds));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildPlacementsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserIds: arg_advertiserIds,
              archived: arg_archived,
              campaignIds: arg_campaignIds,
              compatibilities: arg_compatibilities,
              contentCategoryIds: arg_contentCategoryIds,
              directorySiteIds: arg_directorySiteIds,
              groupIds: arg_groupIds,
              ids: arg_ids,
              maxEndDate: arg_maxEndDate,
              maxResults: arg_maxResults,
              maxStartDate: arg_maxStartDate,
              minEndDate: arg_minEndDate,
              minStartDate: arg_minStartDate,
              pageToken: arg_pageToken,
              paymentSource: arg_paymentSource,
              placementStrategyIds: arg_placementStrategyIds,
              pricingTypes: arg_pricingTypes,
              searchString: arg_searchString,
              siteIds: arg_siteIds,
              sizeIds: arg_sizeIds,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacementsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.PlacementsResourceApi res = new api.DfareportingApi(mock).placements;
      var arg_request = buildPlacement();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Placement.fromJson(json);
        checkPlacement(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placements", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/placements"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildPlacement());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacement(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.PlacementsResourceApi res = new api.DfareportingApi(mock).placements;
      var arg_request = buildPlacement();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Placement.fromJson(json);
        checkPlacement(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/placements", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/placements"));
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
        var resp = convert.json.encode(buildPlacement());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlacement(response);
      })));
    });
  });

  unittest.group("resource-PlatformTypesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.PlatformTypesResourceApi res =
          new api.DfareportingApi(mock).platformTypes;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/platformTypes/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("/platformTypes/"));
        pathOffset += 15;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildPlatformType());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlatformType(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.PlatformTypesResourceApi res =
          new api.DfareportingApi(mock).platformTypes;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/platformTypes", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("/platformTypes"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildPlatformTypesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPlatformTypesListResponse(response);
      })));
    });
  });

  unittest.group("resource-PostalCodesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.PostalCodesResourceApi res =
          new api.DfareportingApi(mock).postalCodes;
      var arg_profileId = "foo";
      var arg_code = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/postalCodes/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("/postalCodes/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_code"));

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
        var resp = convert.json.encode(buildPostalCode());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_code, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPostalCode(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.PostalCodesResourceApi res =
          new api.DfareportingApi(mock).postalCodes;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/postalCodes", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/postalCodes"));
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
        var resp = convert.json.encode(buildPostalCodesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkPostalCodesListResponse(response);
      })));
    });
  });

  unittest.group("resource-ProjectsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.DfareportingApi(mock).projects;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/projects/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/projects/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildProject());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkProject(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.DfareportingApi(mock).projects;
      var arg_profileId = "foo";
      var arg_advertiserIds = buildUnnamed5328();
      var arg_ids = buildUnnamed5329();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/projects", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/projects"));
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
        unittest.expect(
            queryMap["advertiserIds"], unittest.equals(arg_advertiserIds));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildProjectsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserIds: arg_advertiserIds,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkProjectsListResponse(response);
      })));
    });
  });

  unittest.group("resource-RegionsResourceApi", () {
    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.RegionsResourceApi res = new api.DfareportingApi(mock).regions;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/regions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/regions"));
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
        var resp = convert.json.encode(buildRegionsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRegionsListResponse(response);
      })));
    });
  });

  unittest.group("resource-RemarketingListSharesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.RemarketingListSharesResourceApi res =
          new api.DfareportingApi(mock).remarketingListShares;
      var arg_profileId = "foo";
      var arg_remarketingListId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/remarketingListShares/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 23),
            unittest.equals("/remarketingListShares/"));
        pathOffset += 23;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_remarketingListId"));

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
        var resp = convert.json.encode(buildRemarketingListShare());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_remarketingListId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemarketingListShare(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.RemarketingListSharesResourceApi res =
          new api.DfareportingApi(mock).remarketingListShares;
      var arg_request = buildRemarketingListShare();
      var arg_profileId = "foo";
      var arg_remarketingListId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.RemarketingListShare.fromJson(json);
        checkRemarketingListShare(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/remarketingListShares", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 22),
            unittest.equals("/remarketingListShares"));
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
        unittest.expect(queryMap["remarketingListId"].first,
            unittest.equals(arg_remarketingListId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildRemarketingListShare());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_remarketingListId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemarketingListShare(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.RemarketingListSharesResourceApi res =
          new api.DfareportingApi(mock).remarketingListShares;
      var arg_request = buildRemarketingListShare();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.RemarketingListShare.fromJson(json);
        checkRemarketingListShare(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/remarketingListShares", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 22),
            unittest.equals("/remarketingListShares"));
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
        var resp = convert.json.encode(buildRemarketingListShare());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemarketingListShare(response);
      })));
    });
  });

  unittest.group("resource-RemarketingListsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.RemarketingListsResourceApi res =
          new api.DfareportingApi(mock).remarketingLists;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/remarketingLists/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("/remarketingLists/"));
        pathOffset += 18;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildRemarketingList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemarketingList(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.RemarketingListsResourceApi res =
          new api.DfareportingApi(mock).remarketingLists;
      var arg_request = buildRemarketingList();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.RemarketingList.fromJson(json);
        checkRemarketingList(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/remarketingLists", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/remarketingLists"));
        pathOffset += 17;

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
        var resp = convert.json.encode(buildRemarketingList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemarketingList(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.RemarketingListsResourceApi res =
          new api.DfareportingApi(mock).remarketingLists;
      var arg_profileId = "foo";
      var arg_advertiserId = "foo";
      var arg_active = true;
      var arg_floodlightActivityId = "foo";
      var arg_maxResults = 42;
      var arg_name = "foo";
      var arg_pageToken = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/remarketingLists", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/remarketingLists"));
        pathOffset += 17;

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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["active"].first, unittest.equals("$arg_active"));
        unittest.expect(queryMap["floodlightActivityId"].first,
            unittest.equals(arg_floodlightActivityId));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(queryMap["name"].first, unittest.equals(arg_name));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildRemarketingListsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, arg_advertiserId,
              active: arg_active,
              floodlightActivityId: arg_floodlightActivityId,
              maxResults: arg_maxResults,
              name: arg_name,
              pageToken: arg_pageToken,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemarketingListsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.RemarketingListsResourceApi res =
          new api.DfareportingApi(mock).remarketingLists;
      var arg_request = buildRemarketingList();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.RemarketingList.fromJson(json);
        checkRemarketingList(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/remarketingLists", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/remarketingLists"));
        pathOffset += 17;

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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildRemarketingList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemarketingList(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.RemarketingListsResourceApi res =
          new api.DfareportingApi(mock).remarketingLists;
      var arg_request = buildRemarketingList();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.RemarketingList.fromJson(json);
        checkRemarketingList(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/remarketingLists", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 17),
            unittest.equals("/remarketingLists"));
        pathOffset += 17;

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
        var resp = convert.json.encode(buildRemarketingList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkRemarketingList(response);
      })));
    });
  });

  unittest.group("resource-ReportsResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.ReportsResourceApi res = new api.DfareportingApi(mock).reports;
      var arg_profileId = "foo";
      var arg_reportId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/reports/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/reports/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_reportId"));

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
          .delete(arg_profileId, arg_reportId, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.ReportsResourceApi res = new api.DfareportingApi(mock).reports;
      var arg_profileId = "foo";
      var arg_reportId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/reports/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/reports/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_reportId"));

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
        var resp = convert.json.encode(buildReport());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_reportId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkReport(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.ReportsResourceApi res = new api.DfareportingApi(mock).reports;
      var arg_request = buildReport();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Report.fromJson(json);
        checkReport(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/reports", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/reports"));
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
        var resp = convert.json.encode(buildReport());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkReport(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ReportsResourceApi res = new api.DfareportingApi(mock).reports;
      var arg_profileId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_scope = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/reports", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/reports"));
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
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["scope"].first, unittest.equals(arg_scope));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildReportList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              scope: arg_scope,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkReportList(response);
      })));
    });

    unittest.test("method--run", () {
      var mock = new HttpServerMock();
      api.ReportsResourceApi res = new api.DfareportingApi(mock).reports;
      var arg_profileId = "foo";
      var arg_reportId = "foo";
      var arg_synchronous = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/reports/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/reports/"));
        pathOffset += 9;
        index = path.indexOf("/run", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_reportId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 4),
            unittest.equals("/run"));
        pathOffset += 4;

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
            queryMap["synchronous"].first, unittest.equals("$arg_synchronous"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFile());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .run(arg_profileId, arg_reportId,
              synchronous: arg_synchronous, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFile(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.ReportsResourceApi res = new api.DfareportingApi(mock).reports;
      var arg_request = buildReport();
      var arg_profileId = "foo";
      var arg_reportId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Report.fromJson(json);
        checkReport(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/reports/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/reports/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_reportId"));

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
        var resp = convert.json.encode(buildReport());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, arg_reportId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkReport(response);
      })));
    });
  });

  unittest.group("resource-ReportsCompatibleFieldsResourceApi", () {
    unittest.test("method--query", () {
      var mock = new HttpServerMock();
      api.ReportsCompatibleFieldsResourceApi res =
          new api.DfareportingApi(mock).reports.compatibleFields;
      var arg_request = buildReport();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Report.fromJson(json);
        checkReport(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/reports/compatiblefields/query", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 31),
            unittest.equals("/reports/compatiblefields/query"));
        pathOffset += 31;

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
        var resp = convert.json.encode(buildCompatibleFields());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .query(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCompatibleFields(response);
      })));
    });
  });

  unittest.group("resource-ReportsFilesResourceApi", () {
    unittest.test("method--get", () {
      // TODO: Implement tests for media upload;
      // TODO: Implement tests for media download;

      var mock = new HttpServerMock();
      api.ReportsFilesResourceApi res =
          new api.DfareportingApi(mock).reports.files;
      var arg_profileId = "foo";
      var arg_reportId = "foo";
      var arg_fileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/reports/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/reports/"));
        pathOffset += 9;
        index = path.indexOf("/files/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_reportId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/files/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_fileId"));

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
        var resp = convert.json.encode(buildFile());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_reportId, arg_fileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFile(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.ReportsFilesResourceApi res =
          new api.DfareportingApi(mock).reports.files;
      var arg_profileId = "foo";
      var arg_reportId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/reports/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/reports/"));
        pathOffset += 9;
        index = path.indexOf("/files", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_reportId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/files"));
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
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFileList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, arg_reportId,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFileList(response);
      })));
    });
  });

  unittest.group("resource-SitesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.SitesResourceApi res = new api.DfareportingApi(mock).sites;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/sites/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/sites/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildSite());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSite(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.SitesResourceApi res = new api.DfareportingApi(mock).sites;
      var arg_request = buildSite();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Site.fromJson(json);
        checkSite(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/sites", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/sites"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSite());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSite(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.SitesResourceApi res = new api.DfareportingApi(mock).sites;
      var arg_profileId = "foo";
      var arg_acceptsInStreamVideoPlacements = true;
      var arg_acceptsInterstitialPlacements = true;
      var arg_acceptsPublisherPaidPlacements = true;
      var arg_adWordsSite = true;
      var arg_approved = true;
      var arg_campaignIds = buildUnnamed5330();
      var arg_directorySiteIds = buildUnnamed5331();
      var arg_ids = buildUnnamed5332();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_subaccountId = "foo";
      var arg_unmappedSite = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/sites", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/sites"));
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
        unittest.expect(queryMap["acceptsInStreamVideoPlacements"].first,
            unittest.equals("$arg_acceptsInStreamVideoPlacements"));
        unittest.expect(queryMap["acceptsInterstitialPlacements"].first,
            unittest.equals("$arg_acceptsInterstitialPlacements"));
        unittest.expect(queryMap["acceptsPublisherPaidPlacements"].first,
            unittest.equals("$arg_acceptsPublisherPaidPlacements"));
        unittest.expect(
            queryMap["adWordsSite"].first, unittest.equals("$arg_adWordsSite"));
        unittest.expect(
            queryMap["approved"].first, unittest.equals("$arg_approved"));
        unittest.expect(
            queryMap["campaignIds"], unittest.equals(arg_campaignIds));
        unittest.expect(queryMap["directorySiteIds"],
            unittest.equals(arg_directorySiteIds));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(
            queryMap["subaccountId"].first, unittest.equals(arg_subaccountId));
        unittest.expect(queryMap["unmappedSite"].first,
            unittest.equals("$arg_unmappedSite"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSitesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              acceptsInStreamVideoPlacements:
                  arg_acceptsInStreamVideoPlacements,
              acceptsInterstitialPlacements: arg_acceptsInterstitialPlacements,
              acceptsPublisherPaidPlacements:
                  arg_acceptsPublisherPaidPlacements,
              adWordsSite: arg_adWordsSite,
              approved: arg_approved,
              campaignIds: arg_campaignIds,
              directorySiteIds: arg_directorySiteIds,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              subaccountId: arg_subaccountId,
              unmappedSite: arg_unmappedSite,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSitesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.SitesResourceApi res = new api.DfareportingApi(mock).sites;
      var arg_request = buildSite();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Site.fromJson(json);
        checkSite(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/sites", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/sites"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSite());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSite(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.SitesResourceApi res = new api.DfareportingApi(mock).sites;
      var arg_request = buildSite();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Site.fromJson(json);
        checkSite(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/sites", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/sites"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSite());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSite(response);
      })));
    });
  });

  unittest.group("resource-SizesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.SizesResourceApi res = new api.DfareportingApi(mock).sizes;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/sizes/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/sizes/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildSize());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSize(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.SizesResourceApi res = new api.DfareportingApi(mock).sizes;
      var arg_request = buildSize();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Size.fromJson(json);
        checkSize(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/sizes", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/sizes"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSize());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSize(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.SizesResourceApi res = new api.DfareportingApi(mock).sizes;
      var arg_profileId = "foo";
      var arg_height = 42;
      var arg_iabStandard = true;
      var arg_ids = buildUnnamed5333();
      var arg_width = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/sizes", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/sizes"));
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
        unittest.expect(core.int.parse(queryMap["height"].first),
            unittest.equals(arg_height));
        unittest.expect(
            queryMap["iabStandard"].first, unittest.equals("$arg_iabStandard"));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["width"].first),
            unittest.equals(arg_width));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSizesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              height: arg_height,
              iabStandard: arg_iabStandard,
              ids: arg_ids,
              width: arg_width,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSizesListResponse(response);
      })));
    });
  });

  unittest.group("resource-SubaccountsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.SubaccountsResourceApi res =
          new api.DfareportingApi(mock).subaccounts;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/subaccounts/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("/subaccounts/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildSubaccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSubaccount(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.SubaccountsResourceApi res =
          new api.DfareportingApi(mock).subaccounts;
      var arg_request = buildSubaccount();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Subaccount.fromJson(json);
        checkSubaccount(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/subaccounts", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/subaccounts"));
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
        var resp = convert.json.encode(buildSubaccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSubaccount(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.SubaccountsResourceApi res =
          new api.DfareportingApi(mock).subaccounts;
      var arg_profileId = "foo";
      var arg_ids = buildUnnamed5334();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/subaccounts", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/subaccounts"));
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
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSubaccountsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSubaccountsListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.SubaccountsResourceApi res =
          new api.DfareportingApi(mock).subaccounts;
      var arg_request = buildSubaccount();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Subaccount.fromJson(json);
        checkSubaccount(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/subaccounts", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/subaccounts"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildSubaccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSubaccount(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.SubaccountsResourceApi res =
          new api.DfareportingApi(mock).subaccounts;
      var arg_request = buildSubaccount();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.Subaccount.fromJson(json);
        checkSubaccount(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/subaccounts", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("/subaccounts"));
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
        var resp = convert.json.encode(buildSubaccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkSubaccount(response);
      })));
    });
  });

  unittest.group("resource-TargetableRemarketingListsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.TargetableRemarketingListsResourceApi res =
          new api.DfareportingApi(mock).targetableRemarketingLists;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/targetableRemarketingLists/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 28),
            unittest.equals("/targetableRemarketingLists/"));
        pathOffset += 28;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildTargetableRemarketingList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTargetableRemarketingList(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.TargetableRemarketingListsResourceApi res =
          new api.DfareportingApi(mock).targetableRemarketingLists;
      var arg_profileId = "foo";
      var arg_advertiserId = "foo";
      var arg_active = true;
      var arg_maxResults = 42;
      var arg_name = "foo";
      var arg_pageToken = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/targetableRemarketingLists", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 27),
            unittest.equals("/targetableRemarketingLists"));
        pathOffset += 27;

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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["active"].first, unittest.equals("$arg_active"));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(queryMap["name"].first, unittest.equals(arg_name));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp =
            convert.json.encode(buildTargetableRemarketingListsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, arg_advertiserId,
              active: arg_active,
              maxResults: arg_maxResults,
              name: arg_name,
              pageToken: arg_pageToken,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTargetableRemarketingListsListResponse(response);
      })));
    });
  });

  unittest.group("resource-TargetingTemplatesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.TargetingTemplatesResourceApi res =
          new api.DfareportingApi(mock).targetingTemplates;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/targetingTemplates/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/targetingTemplates/"));
        pathOffset += 20;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildTargetingTemplate());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTargetingTemplate(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.TargetingTemplatesResourceApi res =
          new api.DfareportingApi(mock).targetingTemplates;
      var arg_request = buildTargetingTemplate();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.TargetingTemplate.fromJson(json);
        checkTargetingTemplate(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/targetingTemplates", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("/targetingTemplates"));
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
        var resp = convert.json.encode(buildTargetingTemplate());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTargetingTemplate(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.TargetingTemplatesResourceApi res =
          new api.DfareportingApi(mock).targetingTemplates;
      var arg_profileId = "foo";
      var arg_advertiserId = "foo";
      var arg_ids = buildUnnamed5335();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/targetingTemplates", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("/targetingTemplates"));
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
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildTargetingTemplatesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              advertiserId: arg_advertiserId,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTargetingTemplatesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.TargetingTemplatesResourceApi res =
          new api.DfareportingApi(mock).targetingTemplates;
      var arg_request = buildTargetingTemplate();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.TargetingTemplate.fromJson(json);
        checkTargetingTemplate(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/targetingTemplates", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("/targetingTemplates"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildTargetingTemplate());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTargetingTemplate(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.TargetingTemplatesResourceApi res =
          new api.DfareportingApi(mock).targetingTemplates;
      var arg_request = buildTargetingTemplate();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.TargetingTemplate.fromJson(json);
        checkTargetingTemplate(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/targetingTemplates", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("/targetingTemplates"));
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
        var resp = convert.json.encode(buildTargetingTemplate());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTargetingTemplate(response);
      })));
    });
  });

  unittest.group("resource-UserProfilesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.UserProfilesResourceApi res =
          new api.DfareportingApi(mock).userProfiles;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));

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
        var resp = convert.json.encode(buildUserProfile());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserProfile(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.UserProfilesResourceApi res =
          new api.DfareportingApi(mock).userProfiles;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("userprofiles"));
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
        var resp = convert.json.encode(buildUserProfileList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list($fields: arg_$fields).then(unittest.expectAsync1(((response) {
        checkUserProfileList(response);
      })));
    });
  });

  unittest.group("resource-UserRolePermissionGroupsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.UserRolePermissionGroupsResourceApi res =
          new api.DfareportingApi(mock).userRolePermissionGroups;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRolePermissionGroups/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 26),
            unittest.equals("/userRolePermissionGroups/"));
        pathOffset += 26;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildUserRolePermissionGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserRolePermissionGroup(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.UserRolePermissionGroupsResourceApi res =
          new api.DfareportingApi(mock).userRolePermissionGroups;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRolePermissionGroups", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("/userRolePermissionGroups"));
        pathOffset += 25;

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
        var resp =
            convert.json.encode(buildUserRolePermissionGroupsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserRolePermissionGroupsListResponse(response);
      })));
    });
  });

  unittest.group("resource-UserRolePermissionsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.UserRolePermissionsResourceApi res =
          new api.DfareportingApi(mock).userRolePermissions;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRolePermissions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("/userRolePermissions/"));
        pathOffset += 21;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildUserRolePermission());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserRolePermission(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.UserRolePermissionsResourceApi res =
          new api.DfareportingApi(mock).userRolePermissions;
      var arg_profileId = "foo";
      var arg_ids = buildUnnamed5336();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRolePermissions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("/userRolePermissions"));
        pathOffset += 20;

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
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildUserRolePermissionsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, ids: arg_ids, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserRolePermissionsListResponse(response);
      })));
    });
  });

  unittest.group("resource-UserRolesResourceApi", () {
    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.UserRolesResourceApi res = new api.DfareportingApi(mock).userRoles;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRoles/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/userRoles/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
          .delete(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.UserRolesResourceApi res = new api.DfareportingApi(mock).userRoles;
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRoles/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11),
            unittest.equals("/userRoles/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildUserRole());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserRole(response);
      })));
    });

    unittest.test("method--insert", () {
      var mock = new HttpServerMock();
      api.UserRolesResourceApi res = new api.DfareportingApi(mock).userRoles;
      var arg_request = buildUserRole();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.UserRole.fromJson(json);
        checkUserRole(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRoles", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/userRoles"));
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
        var resp = convert.json.encode(buildUserRole());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .insert(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserRole(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.UserRolesResourceApi res = new api.DfareportingApi(mock).userRoles;
      var arg_profileId = "foo";
      var arg_accountUserRoleOnly = true;
      var arg_ids = buildUnnamed5337();
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      var arg_searchString = "foo";
      var arg_sortField = "foo";
      var arg_sortOrder = "foo";
      var arg_subaccountId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRoles", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/userRoles"));
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
        unittest.expect(queryMap["accountUserRoleOnly"].first,
            unittest.equals("$arg_accountUserRoleOnly"));
        unittest.expect(queryMap["ids"], unittest.equals(arg_ids));
        unittest.expect(core.int.parse(queryMap["maxResults"].first),
            unittest.equals(arg_maxResults));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(
            queryMap["searchString"].first, unittest.equals(arg_searchString));
        unittest.expect(
            queryMap["sortField"].first, unittest.equals(arg_sortField));
        unittest.expect(
            queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(
            queryMap["subaccountId"].first, unittest.equals(arg_subaccountId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildUserRolesListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId,
              accountUserRoleOnly: arg_accountUserRoleOnly,
              ids: arg_ids,
              maxResults: arg_maxResults,
              pageToken: arg_pageToken,
              searchString: arg_searchString,
              sortField: arg_sortField,
              sortOrder: arg_sortOrder,
              subaccountId: arg_subaccountId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserRolesListResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.UserRolesResourceApi res = new api.DfareportingApi(mock).userRoles;
      var arg_request = buildUserRole();
      var arg_profileId = "foo";
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.UserRole.fromJson(json);
        checkUserRole(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRoles", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/userRoles"));
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
        unittest.expect(queryMap["id"].first, unittest.equals(arg_id));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildUserRole());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserRole(response);
      })));
    });

    unittest.test("method--update", () {
      var mock = new HttpServerMock();
      api.UserRolesResourceApi res = new api.DfareportingApi(mock).userRoles;
      var arg_request = buildUserRole();
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.UserRole.fromJson(json);
        checkUserRole(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/userRoles", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/userRoles"));
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
        var resp = convert.json.encode(buildUserRole());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .update(arg_request, arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkUserRole(response);
      })));
    });
  });

  unittest.group("resource-VideoFormatsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.VideoFormatsResourceApi res =
          new api.DfareportingApi(mock).videoFormats;
      var arg_profileId = "foo";
      var arg_id = 42;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/videoFormats/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("/videoFormats/"));
        pathOffset += 14;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.json.encode(buildVideoFormat());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_profileId, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkVideoFormat(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.VideoFormatsResourceApi res =
          new api.DfareportingApi(mock).videoFormats;
      var arg_profileId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("dfareporting/v3.4/"));
        pathOffset += 18;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("userprofiles/"));
        pathOffset += 13;
        index = path.indexOf("/videoFormats", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_profileId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("/videoFormats"));
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
        var resp = convert.json.encode(buildVideoFormatsListResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_profileId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkVideoFormatsListResponse(response);
      })));
    });
  });
}
