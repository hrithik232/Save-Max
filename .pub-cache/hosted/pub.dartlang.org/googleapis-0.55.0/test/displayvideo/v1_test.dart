library googleapis.displayvideo.v1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:googleapis/displayvideo/v1.dart' as api;

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

core.int buildCounterActiveViewVideoViewabilityMetricConfig = 0;
buildActiveViewVideoViewabilityMetricConfig() {
  var o = new api.ActiveViewVideoViewabilityMetricConfig();
  buildCounterActiveViewVideoViewabilityMetricConfig++;
  if (buildCounterActiveViewVideoViewabilityMetricConfig < 3) {
    o.displayName = "foo";
    o.minimumDuration = "foo";
    o.minimumQuartile = "foo";
    o.minimumViewability = "foo";
    o.minimumVolume = "foo";
  }
  buildCounterActiveViewVideoViewabilityMetricConfig--;
  return o;
}

checkActiveViewVideoViewabilityMetricConfig(
    api.ActiveViewVideoViewabilityMetricConfig o) {
  buildCounterActiveViewVideoViewabilityMetricConfig++;
  if (buildCounterActiveViewVideoViewabilityMetricConfig < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.minimumDuration, unittest.equals('foo'));
    unittest.expect(o.minimumQuartile, unittest.equals('foo'));
    unittest.expect(o.minimumViewability, unittest.equals('foo'));
    unittest.expect(o.minimumVolume, unittest.equals('foo'));
  }
  buildCounterActiveViewVideoViewabilityMetricConfig--;
}

buildUnnamed3998() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3998(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAdloox = 0;
buildAdloox() {
  var o = new api.Adloox();
  buildCounterAdloox++;
  if (buildCounterAdloox < 3) {
    o.excludedAdlooxCategories = buildUnnamed3998();
  }
  buildCounterAdloox--;
  return o;
}

checkAdloox(api.Adloox o) {
  buildCounterAdloox++;
  if (buildCounterAdloox < 3) {
    checkUnnamed3998(o.excludedAdlooxCategories);
  }
  buildCounterAdloox--;
}

core.int buildCounterAdvertiser = 0;
buildAdvertiser() {
  var o = new api.Advertiser();
  buildCounterAdvertiser++;
  if (buildCounterAdvertiser < 3) {
    o.adServerConfig = buildAdvertiserAdServerConfig();
    o.advertiserId = "foo";
    o.creativeConfig = buildAdvertiserCreativeConfig();
    o.dataAccessConfig = buildAdvertiserDataAccessConfig();
    o.displayName = "foo";
    o.entityStatus = "foo";
    o.generalConfig = buildAdvertiserGeneralConfig();
    o.integrationDetails = buildIntegrationDetails();
    o.name = "foo";
    o.partnerId = "foo";
    o.updateTime = "foo";
  }
  buildCounterAdvertiser--;
  return o;
}

checkAdvertiser(api.Advertiser o) {
  buildCounterAdvertiser++;
  if (buildCounterAdvertiser < 3) {
    checkAdvertiserAdServerConfig(o.adServerConfig);
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkAdvertiserCreativeConfig(o.creativeConfig);
    checkAdvertiserDataAccessConfig(o.dataAccessConfig);
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.entityStatus, unittest.equals('foo'));
    checkAdvertiserGeneralConfig(o.generalConfig);
    checkIntegrationDetails(o.integrationDetails);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.partnerId, unittest.equals('foo'));
    unittest.expect(o.updateTime, unittest.equals('foo'));
  }
  buildCounterAdvertiser--;
}

core.int buildCounterAdvertiserAdServerConfig = 0;
buildAdvertiserAdServerConfig() {
  var o = new api.AdvertiserAdServerConfig();
  buildCounterAdvertiserAdServerConfig++;
  if (buildCounterAdvertiserAdServerConfig < 3) {
    o.cmHybridConfig = buildCmHybridConfig();
    o.thirdPartyOnlyConfig = buildThirdPartyOnlyConfig();
  }
  buildCounterAdvertiserAdServerConfig--;
  return o;
}

checkAdvertiserAdServerConfig(api.AdvertiserAdServerConfig o) {
  buildCounterAdvertiserAdServerConfig++;
  if (buildCounterAdvertiserAdServerConfig < 3) {
    checkCmHybridConfig(o.cmHybridConfig);
    checkThirdPartyOnlyConfig(o.thirdPartyOnlyConfig);
  }
  buildCounterAdvertiserAdServerConfig--;
}

core.int buildCounterAdvertiserCreativeConfig = 0;
buildAdvertiserCreativeConfig() {
  var o = new api.AdvertiserCreativeConfig();
  buildCounterAdvertiserCreativeConfig++;
  if (buildCounterAdvertiserCreativeConfig < 3) {
    o.dynamicCreativeEnabled = true;
    o.iasClientId = "foo";
    o.obaComplianceDisabled = true;
    o.videoCreativeDataSharingAuthorized = true;
  }
  buildCounterAdvertiserCreativeConfig--;
  return o;
}

checkAdvertiserCreativeConfig(api.AdvertiserCreativeConfig o) {
  buildCounterAdvertiserCreativeConfig++;
  if (buildCounterAdvertiserCreativeConfig < 3) {
    unittest.expect(o.dynamicCreativeEnabled, unittest.isTrue);
    unittest.expect(o.iasClientId, unittest.equals('foo'));
    unittest.expect(o.obaComplianceDisabled, unittest.isTrue);
    unittest.expect(o.videoCreativeDataSharingAuthorized, unittest.isTrue);
  }
  buildCounterAdvertiserCreativeConfig--;
}

core.int buildCounterAdvertiserDataAccessConfig = 0;
buildAdvertiserDataAccessConfig() {
  var o = new api.AdvertiserDataAccessConfig();
  buildCounterAdvertiserDataAccessConfig++;
  if (buildCounterAdvertiserDataAccessConfig < 3) {
    o.sdfConfig = buildAdvertiserSdfConfig();
  }
  buildCounterAdvertiserDataAccessConfig--;
  return o;
}

checkAdvertiserDataAccessConfig(api.AdvertiserDataAccessConfig o) {
  buildCounterAdvertiserDataAccessConfig++;
  if (buildCounterAdvertiserDataAccessConfig < 3) {
    checkAdvertiserSdfConfig(o.sdfConfig);
  }
  buildCounterAdvertiserDataAccessConfig--;
}

core.int buildCounterAdvertiserGeneralConfig = 0;
buildAdvertiserGeneralConfig() {
  var o = new api.AdvertiserGeneralConfig();
  buildCounterAdvertiserGeneralConfig++;
  if (buildCounterAdvertiserGeneralConfig < 3) {
    o.currencyCode = "foo";
    o.domainUrl = "foo";
    o.timeZone = "foo";
  }
  buildCounterAdvertiserGeneralConfig--;
  return o;
}

checkAdvertiserGeneralConfig(api.AdvertiserGeneralConfig o) {
  buildCounterAdvertiserGeneralConfig++;
  if (buildCounterAdvertiserGeneralConfig < 3) {
    unittest.expect(o.currencyCode, unittest.equals('foo'));
    unittest.expect(o.domainUrl, unittest.equals('foo'));
    unittest.expect(o.timeZone, unittest.equals('foo'));
  }
  buildCounterAdvertiserGeneralConfig--;
}

core.int buildCounterAdvertiserSdfConfig = 0;
buildAdvertiserSdfConfig() {
  var o = new api.AdvertiserSdfConfig();
  buildCounterAdvertiserSdfConfig++;
  if (buildCounterAdvertiserSdfConfig < 3) {
    o.overridePartnerSdfConfig = true;
    o.sdfConfig = buildSdfConfig();
  }
  buildCounterAdvertiserSdfConfig--;
  return o;
}

checkAdvertiserSdfConfig(api.AdvertiserSdfConfig o) {
  buildCounterAdvertiserSdfConfig++;
  if (buildCounterAdvertiserSdfConfig < 3) {
    unittest.expect(o.overridePartnerSdfConfig, unittest.isTrue);
    checkSdfConfig(o.sdfConfig);
  }
  buildCounterAdvertiserSdfConfig--;
}

core.int buildCounterAgeRangeAssignedTargetingOptionDetails = 0;
buildAgeRangeAssignedTargetingOptionDetails() {
  var o = new api.AgeRangeAssignedTargetingOptionDetails();
  buildCounterAgeRangeAssignedTargetingOptionDetails++;
  if (buildCounterAgeRangeAssignedTargetingOptionDetails < 3) {
    o.ageRange = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterAgeRangeAssignedTargetingOptionDetails--;
  return o;
}

checkAgeRangeAssignedTargetingOptionDetails(
    api.AgeRangeAssignedTargetingOptionDetails o) {
  buildCounterAgeRangeAssignedTargetingOptionDetails++;
  if (buildCounterAgeRangeAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.ageRange, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterAgeRangeAssignedTargetingOptionDetails--;
}

core.int buildCounterAgeRangeTargetingOptionDetails = 0;
buildAgeRangeTargetingOptionDetails() {
  var o = new api.AgeRangeTargetingOptionDetails();
  buildCounterAgeRangeTargetingOptionDetails++;
  if (buildCounterAgeRangeTargetingOptionDetails < 3) {
    o.ageRange = "foo";
  }
  buildCounterAgeRangeTargetingOptionDetails--;
  return o;
}

checkAgeRangeTargetingOptionDetails(api.AgeRangeTargetingOptionDetails o) {
  buildCounterAgeRangeTargetingOptionDetails++;
  if (buildCounterAgeRangeTargetingOptionDetails < 3) {
    unittest.expect(o.ageRange, unittest.equals('foo'));
  }
  buildCounterAgeRangeTargetingOptionDetails--;
}

core.int buildCounterAppAssignedTargetingOptionDetails = 0;
buildAppAssignedTargetingOptionDetails() {
  var o = new api.AppAssignedTargetingOptionDetails();
  buildCounterAppAssignedTargetingOptionDetails++;
  if (buildCounterAppAssignedTargetingOptionDetails < 3) {
    o.appId = "foo";
    o.displayName = "foo";
    o.negative = true;
  }
  buildCounterAppAssignedTargetingOptionDetails--;
  return o;
}

checkAppAssignedTargetingOptionDetails(
    api.AppAssignedTargetingOptionDetails o) {
  buildCounterAppAssignedTargetingOptionDetails++;
  if (buildCounterAppAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.appId, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
  }
  buildCounterAppAssignedTargetingOptionDetails--;
}

core.int buildCounterAppCategoryAssignedTargetingOptionDetails = 0;
buildAppCategoryAssignedTargetingOptionDetails() {
  var o = new api.AppCategoryAssignedTargetingOptionDetails();
  buildCounterAppCategoryAssignedTargetingOptionDetails++;
  if (buildCounterAppCategoryAssignedTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.negative = true;
    o.targetingOptionId = "foo";
  }
  buildCounterAppCategoryAssignedTargetingOptionDetails--;
  return o;
}

checkAppCategoryAssignedTargetingOptionDetails(
    api.AppCategoryAssignedTargetingOptionDetails o) {
  buildCounterAppCategoryAssignedTargetingOptionDetails++;
  if (buildCounterAppCategoryAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterAppCategoryAssignedTargetingOptionDetails--;
}

core.int buildCounterAppCategoryTargetingOptionDetails = 0;
buildAppCategoryTargetingOptionDetails() {
  var o = new api.AppCategoryTargetingOptionDetails();
  buildCounterAppCategoryTargetingOptionDetails++;
  if (buildCounterAppCategoryTargetingOptionDetails < 3) {
    o.displayName = "foo";
  }
  buildCounterAppCategoryTargetingOptionDetails--;
  return o;
}

checkAppCategoryTargetingOptionDetails(
    api.AppCategoryTargetingOptionDetails o) {
  buildCounterAppCategoryTargetingOptionDetails++;
  if (buildCounterAppCategoryTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
  }
  buildCounterAppCategoryTargetingOptionDetails--;
}

core.int buildCounterAsset = 0;
buildAsset() {
  var o = new api.Asset();
  buildCounterAsset++;
  if (buildCounterAsset < 3) {
    o.content = "foo";
    o.mediaId = "foo";
  }
  buildCounterAsset--;
  return o;
}

checkAsset(api.Asset o) {
  buildCounterAsset++;
  if (buildCounterAsset < 3) {
    unittest.expect(o.content, unittest.equals('foo'));
    unittest.expect(o.mediaId, unittest.equals('foo'));
  }
  buildCounterAsset--;
}

core.int buildCounterAssetAssociation = 0;
buildAssetAssociation() {
  var o = new api.AssetAssociation();
  buildCounterAssetAssociation++;
  if (buildCounterAssetAssociation < 3) {
    o.asset = buildAsset();
    o.role = "foo";
  }
  buildCounterAssetAssociation--;
  return o;
}

checkAssetAssociation(api.AssetAssociation o) {
  buildCounterAssetAssociation++;
  if (buildCounterAssetAssociation < 3) {
    checkAsset(o.asset);
    unittest.expect(o.role, unittest.equals('foo'));
  }
  buildCounterAssetAssociation--;
}

core.int buildCounterAssignedTargetingOption = 0;
buildAssignedTargetingOption() {
  var o = new api.AssignedTargetingOption();
  buildCounterAssignedTargetingOption++;
  if (buildCounterAssignedTargetingOption < 3) {
    o.ageRangeDetails = buildAgeRangeAssignedTargetingOptionDetails();
    o.appCategoryDetails = buildAppCategoryAssignedTargetingOptionDetails();
    o.appDetails = buildAppAssignedTargetingOptionDetails();
    o.assignedTargetingOptionId = "foo";
    o.audienceGroupDetails = buildAudienceGroupAssignedTargetingOptionDetails();
    o.authorizedSellerStatusDetails =
        buildAuthorizedSellerStatusAssignedTargetingOptionDetails();
    o.browserDetails = buildBrowserAssignedTargetingOptionDetails();
    o.carrierAndIspDetails = buildCarrierAndIspAssignedTargetingOptionDetails();
    o.categoryDetails = buildCategoryAssignedTargetingOptionDetails();
    o.channelDetails = buildChannelAssignedTargetingOptionDetails();
    o.contentInstreamPositionDetails =
        buildContentInstreamPositionAssignedTargetingOptionDetails();
    o.contentOutstreamPositionDetails =
        buildContentOutstreamPositionAssignedTargetingOptionDetails();
    o.dayAndTimeDetails = buildDayAndTimeAssignedTargetingOptionDetails();
    o.deviceMakeModelDetails =
        buildDeviceMakeModelAssignedTargetingOptionDetails();
    o.deviceTypeDetails = buildDeviceTypeAssignedTargetingOptionDetails();
    o.digitalContentLabelExclusionDetails =
        buildDigitalContentLabelAssignedTargetingOptionDetails();
    o.environmentDetails = buildEnvironmentAssignedTargetingOptionDetails();
    o.exchangeDetails = buildExchangeAssignedTargetingOptionDetails();
    o.genderDetails = buildGenderAssignedTargetingOptionDetails();
    o.geoRegionDetails = buildGeoRegionAssignedTargetingOptionDetails();
    o.householdIncomeDetails =
        buildHouseholdIncomeAssignedTargetingOptionDetails();
    o.inheritance = "foo";
    o.inventorySourceDetails =
        buildInventorySourceAssignedTargetingOptionDetails();
    o.inventorySourceGroupDetails =
        buildInventorySourceGroupAssignedTargetingOptionDetails();
    o.keywordDetails = buildKeywordAssignedTargetingOptionDetails();
    o.languageDetails = buildLanguageAssignedTargetingOptionDetails();
    o.name = "foo";
    o.negativeKeywordListDetails =
        buildNegativeKeywordListAssignedTargetingOptionDetails();
    o.onScreenPositionDetails =
        buildOnScreenPositionAssignedTargetingOptionDetails();
    o.operatingSystemDetails =
        buildOperatingSystemAssignedTargetingOptionDetails();
    o.parentalStatusDetails =
        buildParentalStatusAssignedTargetingOptionDetails();
    o.proximityLocationListDetails =
        buildProximityLocationListAssignedTargetingOptionDetails();
    o.regionalLocationListDetails =
        buildRegionalLocationListAssignedTargetingOptionDetails();
    o.sensitiveCategoryExclusionDetails =
        buildSensitiveCategoryAssignedTargetingOptionDetails();
    o.subExchangeDetails = buildSubExchangeAssignedTargetingOptionDetails();
    o.targetingType = "foo";
    o.thirdPartyVerifierDetails =
        buildThirdPartyVerifierAssignedTargetingOptionDetails();
    o.urlDetails = buildUrlAssignedTargetingOptionDetails();
    o.userRewardedContentDetails =
        buildUserRewardedContentAssignedTargetingOptionDetails();
    o.videoPlayerSizeDetails =
        buildVideoPlayerSizeAssignedTargetingOptionDetails();
    o.viewabilityDetails = buildViewabilityAssignedTargetingOptionDetails();
  }
  buildCounterAssignedTargetingOption--;
  return o;
}

checkAssignedTargetingOption(api.AssignedTargetingOption o) {
  buildCounterAssignedTargetingOption++;
  if (buildCounterAssignedTargetingOption < 3) {
    checkAgeRangeAssignedTargetingOptionDetails(o.ageRangeDetails);
    checkAppCategoryAssignedTargetingOptionDetails(o.appCategoryDetails);
    checkAppAssignedTargetingOptionDetails(o.appDetails);
    unittest.expect(o.assignedTargetingOptionId, unittest.equals('foo'));
    checkAudienceGroupAssignedTargetingOptionDetails(o.audienceGroupDetails);
    checkAuthorizedSellerStatusAssignedTargetingOptionDetails(
        o.authorizedSellerStatusDetails);
    checkBrowserAssignedTargetingOptionDetails(o.browserDetails);
    checkCarrierAndIspAssignedTargetingOptionDetails(o.carrierAndIspDetails);
    checkCategoryAssignedTargetingOptionDetails(o.categoryDetails);
    checkChannelAssignedTargetingOptionDetails(o.channelDetails);
    checkContentInstreamPositionAssignedTargetingOptionDetails(
        o.contentInstreamPositionDetails);
    checkContentOutstreamPositionAssignedTargetingOptionDetails(
        o.contentOutstreamPositionDetails);
    checkDayAndTimeAssignedTargetingOptionDetails(o.dayAndTimeDetails);
    checkDeviceMakeModelAssignedTargetingOptionDetails(
        o.deviceMakeModelDetails);
    checkDeviceTypeAssignedTargetingOptionDetails(o.deviceTypeDetails);
    checkDigitalContentLabelAssignedTargetingOptionDetails(
        o.digitalContentLabelExclusionDetails);
    checkEnvironmentAssignedTargetingOptionDetails(o.environmentDetails);
    checkExchangeAssignedTargetingOptionDetails(o.exchangeDetails);
    checkGenderAssignedTargetingOptionDetails(o.genderDetails);
    checkGeoRegionAssignedTargetingOptionDetails(o.geoRegionDetails);
    checkHouseholdIncomeAssignedTargetingOptionDetails(
        o.householdIncomeDetails);
    unittest.expect(o.inheritance, unittest.equals('foo'));
    checkInventorySourceAssignedTargetingOptionDetails(
        o.inventorySourceDetails);
    checkInventorySourceGroupAssignedTargetingOptionDetails(
        o.inventorySourceGroupDetails);
    checkKeywordAssignedTargetingOptionDetails(o.keywordDetails);
    checkLanguageAssignedTargetingOptionDetails(o.languageDetails);
    unittest.expect(o.name, unittest.equals('foo'));
    checkNegativeKeywordListAssignedTargetingOptionDetails(
        o.negativeKeywordListDetails);
    checkOnScreenPositionAssignedTargetingOptionDetails(
        o.onScreenPositionDetails);
    checkOperatingSystemAssignedTargetingOptionDetails(
        o.operatingSystemDetails);
    checkParentalStatusAssignedTargetingOptionDetails(o.parentalStatusDetails);
    checkProximityLocationListAssignedTargetingOptionDetails(
        o.proximityLocationListDetails);
    checkRegionalLocationListAssignedTargetingOptionDetails(
        o.regionalLocationListDetails);
    checkSensitiveCategoryAssignedTargetingOptionDetails(
        o.sensitiveCategoryExclusionDetails);
    checkSubExchangeAssignedTargetingOptionDetails(o.subExchangeDetails);
    unittest.expect(o.targetingType, unittest.equals('foo'));
    checkThirdPartyVerifierAssignedTargetingOptionDetails(
        o.thirdPartyVerifierDetails);
    checkUrlAssignedTargetingOptionDetails(o.urlDetails);
    checkUserRewardedContentAssignedTargetingOptionDetails(
        o.userRewardedContentDetails);
    checkVideoPlayerSizeAssignedTargetingOptionDetails(
        o.videoPlayerSizeDetails);
    checkViewabilityAssignedTargetingOptionDetails(o.viewabilityDetails);
  }
  buildCounterAssignedTargetingOption--;
}

buildUnnamed3999() {
  var o = new core.List<api.FirstAndThirdPartyAudienceGroup>();
  o.add(buildFirstAndThirdPartyAudienceGroup());
  o.add(buildFirstAndThirdPartyAudienceGroup());
  return o;
}

checkUnnamed3999(core.List<api.FirstAndThirdPartyAudienceGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFirstAndThirdPartyAudienceGroup(o[0]);
  checkFirstAndThirdPartyAudienceGroup(o[1]);
}

core.int buildCounterAudienceGroupAssignedTargetingOptionDetails = 0;
buildAudienceGroupAssignedTargetingOptionDetails() {
  var o = new api.AudienceGroupAssignedTargetingOptionDetails();
  buildCounterAudienceGroupAssignedTargetingOptionDetails++;
  if (buildCounterAudienceGroupAssignedTargetingOptionDetails < 3) {
    o.excludedFirstAndThirdPartyAudienceGroup =
        buildFirstAndThirdPartyAudienceGroup();
    o.excludedGoogleAudienceGroup = buildGoogleAudienceGroup();
    o.includedCombinedAudienceGroup = buildCombinedAudienceGroup();
    o.includedCustomListGroup = buildCustomListGroup();
    o.includedFirstAndThirdPartyAudienceGroups = buildUnnamed3999();
    o.includedGoogleAudienceGroup = buildGoogleAudienceGroup();
  }
  buildCounterAudienceGroupAssignedTargetingOptionDetails--;
  return o;
}

checkAudienceGroupAssignedTargetingOptionDetails(
    api.AudienceGroupAssignedTargetingOptionDetails o) {
  buildCounterAudienceGroupAssignedTargetingOptionDetails++;
  if (buildCounterAudienceGroupAssignedTargetingOptionDetails < 3) {
    checkFirstAndThirdPartyAudienceGroup(
        o.excludedFirstAndThirdPartyAudienceGroup);
    checkGoogleAudienceGroup(o.excludedGoogleAudienceGroup);
    checkCombinedAudienceGroup(o.includedCombinedAudienceGroup);
    checkCustomListGroup(o.includedCustomListGroup);
    checkUnnamed3999(o.includedFirstAndThirdPartyAudienceGroups);
    checkGoogleAudienceGroup(o.includedGoogleAudienceGroup);
  }
  buildCounterAudienceGroupAssignedTargetingOptionDetails--;
}

core.int buildCounterAudioVideoOffset = 0;
buildAudioVideoOffset() {
  var o = new api.AudioVideoOffset();
  buildCounterAudioVideoOffset++;
  if (buildCounterAudioVideoOffset < 3) {
    o.percentage = "foo";
    o.seconds = "foo";
  }
  buildCounterAudioVideoOffset--;
  return o;
}

checkAudioVideoOffset(api.AudioVideoOffset o) {
  buildCounterAudioVideoOffset++;
  if (buildCounterAudioVideoOffset < 3) {
    unittest.expect(o.percentage, unittest.equals('foo'));
    unittest.expect(o.seconds, unittest.equals('foo'));
  }
  buildCounterAudioVideoOffset--;
}

core.int buildCounterAuthorizedSellerStatusAssignedTargetingOptionDetails = 0;
buildAuthorizedSellerStatusAssignedTargetingOptionDetails() {
  var o = new api.AuthorizedSellerStatusAssignedTargetingOptionDetails();
  buildCounterAuthorizedSellerStatusAssignedTargetingOptionDetails++;
  if (buildCounterAuthorizedSellerStatusAssignedTargetingOptionDetails < 3) {
    o.authorizedSellerStatus = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterAuthorizedSellerStatusAssignedTargetingOptionDetails--;
  return o;
}

checkAuthorizedSellerStatusAssignedTargetingOptionDetails(
    api.AuthorizedSellerStatusAssignedTargetingOptionDetails o) {
  buildCounterAuthorizedSellerStatusAssignedTargetingOptionDetails++;
  if (buildCounterAuthorizedSellerStatusAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.authorizedSellerStatus, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterAuthorizedSellerStatusAssignedTargetingOptionDetails--;
}

core.int buildCounterAuthorizedSellerStatusTargetingOptionDetails = 0;
buildAuthorizedSellerStatusTargetingOptionDetails() {
  var o = new api.AuthorizedSellerStatusTargetingOptionDetails();
  buildCounterAuthorizedSellerStatusTargetingOptionDetails++;
  if (buildCounterAuthorizedSellerStatusTargetingOptionDetails < 3) {
    o.authorizedSellerStatus = "foo";
  }
  buildCounterAuthorizedSellerStatusTargetingOptionDetails--;
  return o;
}

checkAuthorizedSellerStatusTargetingOptionDetails(
    api.AuthorizedSellerStatusTargetingOptionDetails o) {
  buildCounterAuthorizedSellerStatusTargetingOptionDetails++;
  if (buildCounterAuthorizedSellerStatusTargetingOptionDetails < 3) {
    unittest.expect(o.authorizedSellerStatus, unittest.equals('foo'));
  }
  buildCounterAuthorizedSellerStatusTargetingOptionDetails--;
}

core.int buildCounterBiddingStrategy = 0;
buildBiddingStrategy() {
  var o = new api.BiddingStrategy();
  buildCounterBiddingStrategy++;
  if (buildCounterBiddingStrategy < 3) {
    o.fixedBid = buildFixedBidStrategy();
    o.maximizeSpendAutoBid = buildMaximizeSpendBidStrategy();
    o.performanceGoalAutoBid = buildPerformanceGoalBidStrategy();
  }
  buildCounterBiddingStrategy--;
  return o;
}

checkBiddingStrategy(api.BiddingStrategy o) {
  buildCounterBiddingStrategy++;
  if (buildCounterBiddingStrategy < 3) {
    checkFixedBidStrategy(o.fixedBid);
    checkMaximizeSpendBidStrategy(o.maximizeSpendAutoBid);
    checkPerformanceGoalBidStrategy(o.performanceGoalAutoBid);
  }
  buildCounterBiddingStrategy--;
}

core.int buildCounterBrowserAssignedTargetingOptionDetails = 0;
buildBrowserAssignedTargetingOptionDetails() {
  var o = new api.BrowserAssignedTargetingOptionDetails();
  buildCounterBrowserAssignedTargetingOptionDetails++;
  if (buildCounterBrowserAssignedTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.negative = true;
    o.targetingOptionId = "foo";
  }
  buildCounterBrowserAssignedTargetingOptionDetails--;
  return o;
}

checkBrowserAssignedTargetingOptionDetails(
    api.BrowserAssignedTargetingOptionDetails o) {
  buildCounterBrowserAssignedTargetingOptionDetails++;
  if (buildCounterBrowserAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterBrowserAssignedTargetingOptionDetails--;
}

core.int buildCounterBrowserTargetingOptionDetails = 0;
buildBrowserTargetingOptionDetails() {
  var o = new api.BrowserTargetingOptionDetails();
  buildCounterBrowserTargetingOptionDetails++;
  if (buildCounterBrowserTargetingOptionDetails < 3) {
    o.displayName = "foo";
  }
  buildCounterBrowserTargetingOptionDetails--;
  return o;
}

checkBrowserTargetingOptionDetails(api.BrowserTargetingOptionDetails o) {
  buildCounterBrowserTargetingOptionDetails++;
  if (buildCounterBrowserTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
  }
  buildCounterBrowserTargetingOptionDetails--;
}

buildUnnamed4000() {
  var o = new core.List<api.CreateAssignedTargetingOptionsRequest>();
  o.add(buildCreateAssignedTargetingOptionsRequest());
  o.add(buildCreateAssignedTargetingOptionsRequest());
  return o;
}

checkUnnamed4000(core.List<api.CreateAssignedTargetingOptionsRequest> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreateAssignedTargetingOptionsRequest(o[0]);
  checkCreateAssignedTargetingOptionsRequest(o[1]);
}

buildUnnamed4001() {
  var o = new core.List<api.DeleteAssignedTargetingOptionsRequest>();
  o.add(buildDeleteAssignedTargetingOptionsRequest());
  o.add(buildDeleteAssignedTargetingOptionsRequest());
  return o;
}

checkUnnamed4001(core.List<api.DeleteAssignedTargetingOptionsRequest> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDeleteAssignedTargetingOptionsRequest(o[0]);
  checkDeleteAssignedTargetingOptionsRequest(o[1]);
}

core.int buildCounterBulkEditLineItemAssignedTargetingOptionsRequest = 0;
buildBulkEditLineItemAssignedTargetingOptionsRequest() {
  var o = new api.BulkEditLineItemAssignedTargetingOptionsRequest();
  buildCounterBulkEditLineItemAssignedTargetingOptionsRequest++;
  if (buildCounterBulkEditLineItemAssignedTargetingOptionsRequest < 3) {
    o.createRequests = buildUnnamed4000();
    o.deleteRequests = buildUnnamed4001();
  }
  buildCounterBulkEditLineItemAssignedTargetingOptionsRequest--;
  return o;
}

checkBulkEditLineItemAssignedTargetingOptionsRequest(
    api.BulkEditLineItemAssignedTargetingOptionsRequest o) {
  buildCounterBulkEditLineItemAssignedTargetingOptionsRequest++;
  if (buildCounterBulkEditLineItemAssignedTargetingOptionsRequest < 3) {
    checkUnnamed4000(o.createRequests);
    checkUnnamed4001(o.deleteRequests);
  }
  buildCounterBulkEditLineItemAssignedTargetingOptionsRequest--;
}

buildUnnamed4002() {
  var o = new core.List<api.AssignedTargetingOption>();
  o.add(buildAssignedTargetingOption());
  o.add(buildAssignedTargetingOption());
  return o;
}

checkUnnamed4002(core.List<api.AssignedTargetingOption> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAssignedTargetingOption(o[0]);
  checkAssignedTargetingOption(o[1]);
}

core.int buildCounterBulkEditLineItemAssignedTargetingOptionsResponse = 0;
buildBulkEditLineItemAssignedTargetingOptionsResponse() {
  var o = new api.BulkEditLineItemAssignedTargetingOptionsResponse();
  buildCounterBulkEditLineItemAssignedTargetingOptionsResponse++;
  if (buildCounterBulkEditLineItemAssignedTargetingOptionsResponse < 3) {
    o.createdAssignedTargetingOptions = buildUnnamed4002();
  }
  buildCounterBulkEditLineItemAssignedTargetingOptionsResponse--;
  return o;
}

checkBulkEditLineItemAssignedTargetingOptionsResponse(
    api.BulkEditLineItemAssignedTargetingOptionsResponse o) {
  buildCounterBulkEditLineItemAssignedTargetingOptionsResponse++;
  if (buildCounterBulkEditLineItemAssignedTargetingOptionsResponse < 3) {
    checkUnnamed4002(o.createdAssignedTargetingOptions);
  }
  buildCounterBulkEditLineItemAssignedTargetingOptionsResponse--;
}

buildUnnamed4003() {
  var o = new core.List<api.AssignedTargetingOption>();
  o.add(buildAssignedTargetingOption());
  o.add(buildAssignedTargetingOption());
  return o;
}

checkUnnamed4003(core.List<api.AssignedTargetingOption> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAssignedTargetingOption(o[0]);
  checkAssignedTargetingOption(o[1]);
}

core.int buildCounterBulkListLineItemAssignedTargetingOptionsResponse = 0;
buildBulkListLineItemAssignedTargetingOptionsResponse() {
  var o = new api.BulkListLineItemAssignedTargetingOptionsResponse();
  buildCounterBulkListLineItemAssignedTargetingOptionsResponse++;
  if (buildCounterBulkListLineItemAssignedTargetingOptionsResponse < 3) {
    o.assignedTargetingOptions = buildUnnamed4003();
    o.nextPageToken = "foo";
  }
  buildCounterBulkListLineItemAssignedTargetingOptionsResponse--;
  return o;
}

checkBulkListLineItemAssignedTargetingOptionsResponse(
    api.BulkListLineItemAssignedTargetingOptionsResponse o) {
  buildCounterBulkListLineItemAssignedTargetingOptionsResponse++;
  if (buildCounterBulkListLineItemAssignedTargetingOptionsResponse < 3) {
    checkUnnamed4003(o.assignedTargetingOptions);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterBulkListLineItemAssignedTargetingOptionsResponse--;
}

core.int buildCounterCampaign = 0;
buildCampaign() {
  var o = new api.Campaign();
  buildCounterCampaign++;
  if (buildCounterCampaign < 3) {
    o.advertiserId = "foo";
    o.campaignFlight = buildCampaignFlight();
    o.campaignGoal = buildCampaignGoal();
    o.campaignId = "foo";
    o.displayName = "foo";
    o.entityStatus = "foo";
    o.frequencyCap = buildFrequencyCap();
    o.name = "foo";
    o.updateTime = "foo";
  }
  buildCounterCampaign--;
  return o;
}

checkCampaign(api.Campaign o) {
  buildCounterCampaign++;
  if (buildCounterCampaign < 3) {
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkCampaignFlight(o.campaignFlight);
    checkCampaignGoal(o.campaignGoal);
    unittest.expect(o.campaignId, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.entityStatus, unittest.equals('foo'));
    checkFrequencyCap(o.frequencyCap);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.updateTime, unittest.equals('foo'));
  }
  buildCounterCampaign--;
}

core.int buildCounterCampaignFlight = 0;
buildCampaignFlight() {
  var o = new api.CampaignFlight();
  buildCounterCampaignFlight++;
  if (buildCounterCampaignFlight < 3) {
    o.plannedDates = buildDateRange();
    o.plannedSpendAmountMicros = "foo";
  }
  buildCounterCampaignFlight--;
  return o;
}

checkCampaignFlight(api.CampaignFlight o) {
  buildCounterCampaignFlight++;
  if (buildCounterCampaignFlight < 3) {
    checkDateRange(o.plannedDates);
    unittest.expect(o.plannedSpendAmountMicros, unittest.equals('foo'));
  }
  buildCounterCampaignFlight--;
}

core.int buildCounterCampaignGoal = 0;
buildCampaignGoal() {
  var o = new api.CampaignGoal();
  buildCounterCampaignGoal++;
  if (buildCounterCampaignGoal < 3) {
    o.campaignGoalType = "foo";
    o.performanceGoal = buildPerformanceGoal();
  }
  buildCounterCampaignGoal--;
  return o;
}

checkCampaignGoal(api.CampaignGoal o) {
  buildCounterCampaignGoal++;
  if (buildCounterCampaignGoal < 3) {
    unittest.expect(o.campaignGoalType, unittest.equals('foo'));
    checkPerformanceGoal(o.performanceGoal);
  }
  buildCounterCampaignGoal--;
}

core.int buildCounterCarrierAndIspAssignedTargetingOptionDetails = 0;
buildCarrierAndIspAssignedTargetingOptionDetails() {
  var o = new api.CarrierAndIspAssignedTargetingOptionDetails();
  buildCounterCarrierAndIspAssignedTargetingOptionDetails++;
  if (buildCounterCarrierAndIspAssignedTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.negative = true;
    o.targetingOptionId = "foo";
  }
  buildCounterCarrierAndIspAssignedTargetingOptionDetails--;
  return o;
}

checkCarrierAndIspAssignedTargetingOptionDetails(
    api.CarrierAndIspAssignedTargetingOptionDetails o) {
  buildCounterCarrierAndIspAssignedTargetingOptionDetails++;
  if (buildCounterCarrierAndIspAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterCarrierAndIspAssignedTargetingOptionDetails--;
}

core.int buildCounterCarrierAndIspTargetingOptionDetails = 0;
buildCarrierAndIspTargetingOptionDetails() {
  var o = new api.CarrierAndIspTargetingOptionDetails();
  buildCounterCarrierAndIspTargetingOptionDetails++;
  if (buildCounterCarrierAndIspTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.type = "foo";
  }
  buildCounterCarrierAndIspTargetingOptionDetails--;
  return o;
}

checkCarrierAndIspTargetingOptionDetails(
    api.CarrierAndIspTargetingOptionDetails o) {
  buildCounterCarrierAndIspTargetingOptionDetails++;
  if (buildCounterCarrierAndIspTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterCarrierAndIspTargetingOptionDetails--;
}

core.int buildCounterCategoryAssignedTargetingOptionDetails = 0;
buildCategoryAssignedTargetingOptionDetails() {
  var o = new api.CategoryAssignedTargetingOptionDetails();
  buildCounterCategoryAssignedTargetingOptionDetails++;
  if (buildCounterCategoryAssignedTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.negative = true;
    o.targetingOptionId = "foo";
  }
  buildCounterCategoryAssignedTargetingOptionDetails--;
  return o;
}

checkCategoryAssignedTargetingOptionDetails(
    api.CategoryAssignedTargetingOptionDetails o) {
  buildCounterCategoryAssignedTargetingOptionDetails++;
  if (buildCounterCategoryAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterCategoryAssignedTargetingOptionDetails--;
}

core.int buildCounterCategoryTargetingOptionDetails = 0;
buildCategoryTargetingOptionDetails() {
  var o = new api.CategoryTargetingOptionDetails();
  buildCounterCategoryTargetingOptionDetails++;
  if (buildCounterCategoryTargetingOptionDetails < 3) {
    o.displayName = "foo";
  }
  buildCounterCategoryTargetingOptionDetails--;
  return o;
}

checkCategoryTargetingOptionDetails(api.CategoryTargetingOptionDetails o) {
  buildCounterCategoryTargetingOptionDetails++;
  if (buildCounterCategoryTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
  }
  buildCounterCategoryTargetingOptionDetails--;
}

core.int buildCounterChannel = 0;
buildChannel() {
  var o = new api.Channel();
  buildCounterChannel++;
  if (buildCounterChannel < 3) {
    o.advertiserId = "foo";
    o.channelId = "foo";
    o.displayName = "foo";
    o.name = "foo";
    o.partnerId = "foo";
  }
  buildCounterChannel--;
  return o;
}

checkChannel(api.Channel o) {
  buildCounterChannel++;
  if (buildCounterChannel < 3) {
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    unittest.expect(o.channelId, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.partnerId, unittest.equals('foo'));
  }
  buildCounterChannel--;
}

core.int buildCounterChannelAssignedTargetingOptionDetails = 0;
buildChannelAssignedTargetingOptionDetails() {
  var o = new api.ChannelAssignedTargetingOptionDetails();
  buildCounterChannelAssignedTargetingOptionDetails++;
  if (buildCounterChannelAssignedTargetingOptionDetails < 3) {
    o.channelId = "foo";
    o.negative = true;
  }
  buildCounterChannelAssignedTargetingOptionDetails--;
  return o;
}

checkChannelAssignedTargetingOptionDetails(
    api.ChannelAssignedTargetingOptionDetails o) {
  buildCounterChannelAssignedTargetingOptionDetails++;
  if (buildCounterChannelAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.channelId, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
  }
  buildCounterChannelAssignedTargetingOptionDetails--;
}

buildUnnamed4004() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4004(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterCmHybridConfig = 0;
buildCmHybridConfig() {
  var o = new api.CmHybridConfig();
  buildCounterCmHybridConfig++;
  if (buildCounterCmHybridConfig < 3) {
    o.cmAccountId = "foo";
    o.cmFloodlightConfigId = "foo";
    o.cmFloodlightLinkingAuthorized = true;
    o.cmSyncableSiteIds = buildUnnamed4004();
    o.dv360ToCmCostReportingEnabled = true;
    o.dv360ToCmDataSharingEnabled = true;
  }
  buildCounterCmHybridConfig--;
  return o;
}

checkCmHybridConfig(api.CmHybridConfig o) {
  buildCounterCmHybridConfig++;
  if (buildCounterCmHybridConfig < 3) {
    unittest.expect(o.cmAccountId, unittest.equals('foo'));
    unittest.expect(o.cmFloodlightConfigId, unittest.equals('foo'));
    unittest.expect(o.cmFloodlightLinkingAuthorized, unittest.isTrue);
    checkUnnamed4004(o.cmSyncableSiteIds);
    unittest.expect(o.dv360ToCmCostReportingEnabled, unittest.isTrue);
    unittest.expect(o.dv360ToCmDataSharingEnabled, unittest.isTrue);
  }
  buildCounterCmHybridConfig--;
}

core.int buildCounterCmTrackingAd = 0;
buildCmTrackingAd() {
  var o = new api.CmTrackingAd();
  buildCounterCmTrackingAd++;
  if (buildCounterCmTrackingAd < 3) {
    o.cmAdId = "foo";
    o.cmCreativeId = "foo";
    o.cmPlacementId = "foo";
  }
  buildCounterCmTrackingAd--;
  return o;
}

checkCmTrackingAd(api.CmTrackingAd o) {
  buildCounterCmTrackingAd++;
  if (buildCounterCmTrackingAd < 3) {
    unittest.expect(o.cmAdId, unittest.equals('foo'));
    unittest.expect(o.cmCreativeId, unittest.equals('foo'));
    unittest.expect(o.cmPlacementId, unittest.equals('foo'));
  }
  buildCounterCmTrackingAd--;
}

core.int buildCounterCombinedAudience = 0;
buildCombinedAudience() {
  var o = new api.CombinedAudience();
  buildCounterCombinedAudience++;
  if (buildCounterCombinedAudience < 3) {
    o.combinedAudienceId = "foo";
    o.displayName = "foo";
    o.name = "foo";
  }
  buildCounterCombinedAudience--;
  return o;
}

checkCombinedAudience(api.CombinedAudience o) {
  buildCounterCombinedAudience++;
  if (buildCounterCombinedAudience < 3) {
    unittest.expect(o.combinedAudienceId, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterCombinedAudience--;
}

buildUnnamed4005() {
  var o = new core.List<api.CombinedAudienceTargetingSetting>();
  o.add(buildCombinedAudienceTargetingSetting());
  o.add(buildCombinedAudienceTargetingSetting());
  return o;
}

checkUnnamed4005(core.List<api.CombinedAudienceTargetingSetting> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCombinedAudienceTargetingSetting(o[0]);
  checkCombinedAudienceTargetingSetting(o[1]);
}

core.int buildCounterCombinedAudienceGroup = 0;
buildCombinedAudienceGroup() {
  var o = new api.CombinedAudienceGroup();
  buildCounterCombinedAudienceGroup++;
  if (buildCounterCombinedAudienceGroup < 3) {
    o.settings = buildUnnamed4005();
  }
  buildCounterCombinedAudienceGroup--;
  return o;
}

checkCombinedAudienceGroup(api.CombinedAudienceGroup o) {
  buildCounterCombinedAudienceGroup++;
  if (buildCounterCombinedAudienceGroup < 3) {
    checkUnnamed4005(o.settings);
  }
  buildCounterCombinedAudienceGroup--;
}

core.int buildCounterCombinedAudienceTargetingSetting = 0;
buildCombinedAudienceTargetingSetting() {
  var o = new api.CombinedAudienceTargetingSetting();
  buildCounterCombinedAudienceTargetingSetting++;
  if (buildCounterCombinedAudienceTargetingSetting < 3) {
    o.combinedAudienceId = "foo";
  }
  buildCounterCombinedAudienceTargetingSetting--;
  return o;
}

checkCombinedAudienceTargetingSetting(api.CombinedAudienceTargetingSetting o) {
  buildCounterCombinedAudienceTargetingSetting++;
  if (buildCounterCombinedAudienceTargetingSetting < 3) {
    unittest.expect(o.combinedAudienceId, unittest.equals('foo'));
  }
  buildCounterCombinedAudienceTargetingSetting--;
}

core.int buildCounterContentInstreamPositionAssignedTargetingOptionDetails = 0;
buildContentInstreamPositionAssignedTargetingOptionDetails() {
  var o = new api.ContentInstreamPositionAssignedTargetingOptionDetails();
  buildCounterContentInstreamPositionAssignedTargetingOptionDetails++;
  if (buildCounterContentInstreamPositionAssignedTargetingOptionDetails < 3) {
    o.contentInstreamPosition = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterContentInstreamPositionAssignedTargetingOptionDetails--;
  return o;
}

checkContentInstreamPositionAssignedTargetingOptionDetails(
    api.ContentInstreamPositionAssignedTargetingOptionDetails o) {
  buildCounterContentInstreamPositionAssignedTargetingOptionDetails++;
  if (buildCounterContentInstreamPositionAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.contentInstreamPosition, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterContentInstreamPositionAssignedTargetingOptionDetails--;
}

core.int buildCounterContentInstreamPositionTargetingOptionDetails = 0;
buildContentInstreamPositionTargetingOptionDetails() {
  var o = new api.ContentInstreamPositionTargetingOptionDetails();
  buildCounterContentInstreamPositionTargetingOptionDetails++;
  if (buildCounterContentInstreamPositionTargetingOptionDetails < 3) {
    o.contentInstreamPosition = "foo";
  }
  buildCounterContentInstreamPositionTargetingOptionDetails--;
  return o;
}

checkContentInstreamPositionTargetingOptionDetails(
    api.ContentInstreamPositionTargetingOptionDetails o) {
  buildCounterContentInstreamPositionTargetingOptionDetails++;
  if (buildCounterContentInstreamPositionTargetingOptionDetails < 3) {
    unittest.expect(o.contentInstreamPosition, unittest.equals('foo'));
  }
  buildCounterContentInstreamPositionTargetingOptionDetails--;
}

core.int buildCounterContentOutstreamPositionAssignedTargetingOptionDetails = 0;
buildContentOutstreamPositionAssignedTargetingOptionDetails() {
  var o = new api.ContentOutstreamPositionAssignedTargetingOptionDetails();
  buildCounterContentOutstreamPositionAssignedTargetingOptionDetails++;
  if (buildCounterContentOutstreamPositionAssignedTargetingOptionDetails < 3) {
    o.contentOutstreamPosition = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterContentOutstreamPositionAssignedTargetingOptionDetails--;
  return o;
}

checkContentOutstreamPositionAssignedTargetingOptionDetails(
    api.ContentOutstreamPositionAssignedTargetingOptionDetails o) {
  buildCounterContentOutstreamPositionAssignedTargetingOptionDetails++;
  if (buildCounterContentOutstreamPositionAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.contentOutstreamPosition, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterContentOutstreamPositionAssignedTargetingOptionDetails--;
}

core.int buildCounterContentOutstreamPositionTargetingOptionDetails = 0;
buildContentOutstreamPositionTargetingOptionDetails() {
  var o = new api.ContentOutstreamPositionTargetingOptionDetails();
  buildCounterContentOutstreamPositionTargetingOptionDetails++;
  if (buildCounterContentOutstreamPositionTargetingOptionDetails < 3) {
    o.contentOutstreamPosition = "foo";
  }
  buildCounterContentOutstreamPositionTargetingOptionDetails--;
  return o;
}

checkContentOutstreamPositionTargetingOptionDetails(
    api.ContentOutstreamPositionTargetingOptionDetails o) {
  buildCounterContentOutstreamPositionTargetingOptionDetails++;
  if (buildCounterContentOutstreamPositionTargetingOptionDetails < 3) {
    unittest.expect(o.contentOutstreamPosition, unittest.equals('foo'));
  }
  buildCounterContentOutstreamPositionTargetingOptionDetails--;
}

buildUnnamed4006() {
  var o = new core.List<api.TrackingFloodlightActivityConfig>();
  o.add(buildTrackingFloodlightActivityConfig());
  o.add(buildTrackingFloodlightActivityConfig());
  return o;
}

checkUnnamed4006(core.List<api.TrackingFloodlightActivityConfig> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTrackingFloodlightActivityConfig(o[0]);
  checkTrackingFloodlightActivityConfig(o[1]);
}

core.int buildCounterConversionCountingConfig = 0;
buildConversionCountingConfig() {
  var o = new api.ConversionCountingConfig();
  buildCounterConversionCountingConfig++;
  if (buildCounterConversionCountingConfig < 3) {
    o.floodlightActivityConfigs = buildUnnamed4006();
    o.postViewCountPercentageMillis = "foo";
  }
  buildCounterConversionCountingConfig--;
  return o;
}

checkConversionCountingConfig(api.ConversionCountingConfig o) {
  buildCounterConversionCountingConfig++;
  if (buildCounterConversionCountingConfig < 3) {
    checkUnnamed4006(o.floodlightActivityConfigs);
    unittest.expect(o.postViewCountPercentageMillis, unittest.equals('foo'));
  }
  buildCounterConversionCountingConfig--;
}

core.int buildCounterCounterEvent = 0;
buildCounterEvent() {
  var o = new api.CounterEvent();
  buildCounterCounterEvent++;
  if (buildCounterCounterEvent < 3) {
    o.name = "foo";
    o.reportingName = "foo";
  }
  buildCounterCounterEvent--;
  return o;
}

checkCounterEvent(api.CounterEvent o) {
  buildCounterCounterEvent++;
  if (buildCounterCounterEvent < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.reportingName, unittest.equals('foo'));
  }
  buildCounterCounterEvent--;
}

core.int buildCounterCreateAssetRequest = 0;
buildCreateAssetRequest() {
  var o = new api.CreateAssetRequest();
  buildCounterCreateAssetRequest++;
  if (buildCounterCreateAssetRequest < 3) {
    o.filename = "foo";
  }
  buildCounterCreateAssetRequest--;
  return o;
}

checkCreateAssetRequest(api.CreateAssetRequest o) {
  buildCounterCreateAssetRequest++;
  if (buildCounterCreateAssetRequest < 3) {
    unittest.expect(o.filename, unittest.equals('foo'));
  }
  buildCounterCreateAssetRequest--;
}

core.int buildCounterCreateAssetResponse = 0;
buildCreateAssetResponse() {
  var o = new api.CreateAssetResponse();
  buildCounterCreateAssetResponse++;
  if (buildCounterCreateAssetResponse < 3) {
    o.asset = buildAsset();
  }
  buildCounterCreateAssetResponse--;
  return o;
}

checkCreateAssetResponse(api.CreateAssetResponse o) {
  buildCounterCreateAssetResponse++;
  if (buildCounterCreateAssetResponse < 3) {
    checkAsset(o.asset);
  }
  buildCounterCreateAssetResponse--;
}

buildUnnamed4007() {
  var o = new core.List<api.AssignedTargetingOption>();
  o.add(buildAssignedTargetingOption());
  o.add(buildAssignedTargetingOption());
  return o;
}

checkUnnamed4007(core.List<api.AssignedTargetingOption> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAssignedTargetingOption(o[0]);
  checkAssignedTargetingOption(o[1]);
}

core.int buildCounterCreateAssignedTargetingOptionsRequest = 0;
buildCreateAssignedTargetingOptionsRequest() {
  var o = new api.CreateAssignedTargetingOptionsRequest();
  buildCounterCreateAssignedTargetingOptionsRequest++;
  if (buildCounterCreateAssignedTargetingOptionsRequest < 3) {
    o.assignedTargetingOptions = buildUnnamed4007();
    o.targetingType = "foo";
  }
  buildCounterCreateAssignedTargetingOptionsRequest--;
  return o;
}

checkCreateAssignedTargetingOptionsRequest(
    api.CreateAssignedTargetingOptionsRequest o) {
  buildCounterCreateAssignedTargetingOptionsRequest++;
  if (buildCounterCreateAssignedTargetingOptionsRequest < 3) {
    checkUnnamed4007(o.assignedTargetingOptions);
    unittest.expect(o.targetingType, unittest.equals('foo'));
  }
  buildCounterCreateAssignedTargetingOptionsRequest--;
}

core.int buildCounterCreateSdfDownloadTaskRequest = 0;
buildCreateSdfDownloadTaskRequest() {
  var o = new api.CreateSdfDownloadTaskRequest();
  buildCounterCreateSdfDownloadTaskRequest++;
  if (buildCounterCreateSdfDownloadTaskRequest < 3) {
    o.advertiserId = "foo";
    o.idFilter = buildIdFilter();
    o.inventorySourceFilter = buildInventorySourceFilter();
    o.parentEntityFilter = buildParentEntityFilter();
    o.partnerId = "foo";
    o.version = "foo";
  }
  buildCounterCreateSdfDownloadTaskRequest--;
  return o;
}

checkCreateSdfDownloadTaskRequest(api.CreateSdfDownloadTaskRequest o) {
  buildCounterCreateSdfDownloadTaskRequest++;
  if (buildCounterCreateSdfDownloadTaskRequest < 3) {
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkIdFilter(o.idFilter);
    checkInventorySourceFilter(o.inventorySourceFilter);
    checkParentEntityFilter(o.parentEntityFilter);
    unittest.expect(o.partnerId, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals('foo'));
  }
  buildCounterCreateSdfDownloadTaskRequest--;
}

buildUnnamed4008() {
  var o = new core.List<api.Dimensions>();
  o.add(buildDimensions());
  o.add(buildDimensions());
  return o;
}

checkUnnamed4008(core.List<api.Dimensions> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDimensions(o[0]);
  checkDimensions(o[1]);
}

buildUnnamed4009() {
  var o = new core.List<api.AssetAssociation>();
  o.add(buildAssetAssociation());
  o.add(buildAssetAssociation());
  return o;
}

checkUnnamed4009(core.List<api.AssetAssociation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAssetAssociation(o[0]);
  checkAssetAssociation(o[1]);
}

buildUnnamed4010() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4010(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4011() {
  var o = new core.List<api.CounterEvent>();
  o.add(buildCounterEvent());
  o.add(buildCounterEvent());
  return o;
}

checkUnnamed4011(core.List<api.CounterEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCounterEvent(o[0]);
  checkCounterEvent(o[1]);
}

buildUnnamed4012() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4012(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4013() {
  var o = new core.List<api.ExitEvent>();
  o.add(buildExitEvent());
  o.add(buildExitEvent());
  return o;
}

checkUnnamed4013(core.List<api.ExitEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkExitEvent(o[0]);
  checkExitEvent(o[1]);
}

buildUnnamed4014() {
  var o = new core.List<api.ThirdPartyUrl>();
  o.add(buildThirdPartyUrl());
  o.add(buildThirdPartyUrl());
  return o;
}

checkUnnamed4014(core.List<api.ThirdPartyUrl> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkThirdPartyUrl(o[0]);
  checkThirdPartyUrl(o[1]);
}

buildUnnamed4015() {
  var o = new core.List<api.TimerEvent>();
  o.add(buildTimerEvent());
  o.add(buildTimerEvent());
  return o;
}

checkUnnamed4015(core.List<api.TimerEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTimerEvent(o[0]);
  checkTimerEvent(o[1]);
}

buildUnnamed4016() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4016(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4017() {
  var o = new core.List<api.Transcode>();
  o.add(buildTranscode());
  o.add(buildTranscode());
  return o;
}

checkUnnamed4017(core.List<api.Transcode> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTranscode(o[0]);
  checkTranscode(o[1]);
}

core.int buildCounterCreative = 0;
buildCreative() {
  var o = new api.Creative();
  buildCounterCreative++;
  if (buildCounterCreative < 3) {
    o.additionalDimensions = buildUnnamed4008();
    o.advertiserId = "foo";
    o.appendedTag = "foo";
    o.assets = buildUnnamed4009();
    o.cmPlacementId = "foo";
    o.cmTrackingAd = buildCmTrackingAd();
    o.companionCreativeIds = buildUnnamed4010();
    o.counterEvents = buildUnnamed4011();
    o.createTime = "foo";
    o.creativeAttributes = buildUnnamed4012();
    o.creativeId = "foo";
    o.creativeType = "foo";
    o.dimensions = buildDimensions();
    o.displayName = "foo";
    o.dynamic = true;
    o.entityStatus = "foo";
    o.exitEvents = buildUnnamed4013();
    o.expandOnHover = true;
    o.expandingDirection = "foo";
    o.hostingSource = "foo";
    o.html5Video = true;
    o.iasCampaignMonitoring = true;
    o.integrationCode = "foo";
    o.jsTrackerUrl = "foo";
    o.mediaDuration = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.obaIcon = buildObaIcon();
    o.progressOffset = buildAudioVideoOffset();
    o.requireHtml5 = true;
    o.requireMraid = true;
    o.requirePingForAttribution = true;
    o.reviewStatus = buildReviewStatusInfo();
    o.skipOffset = buildAudioVideoOffset();
    o.skippable = true;
    o.thirdPartyTag = "foo";
    o.thirdPartyUrls = buildUnnamed4014();
    o.timerEvents = buildUnnamed4015();
    o.trackerUrls = buildUnnamed4016();
    o.transcodes = buildUnnamed4017();
    o.universalAdId = buildUniversalAdId();
    o.updateTime = "foo";
    o.vastTagUrl = "foo";
    o.vpaid = true;
  }
  buildCounterCreative--;
  return o;
}

checkCreative(api.Creative o) {
  buildCounterCreative++;
  if (buildCounterCreative < 3) {
    checkUnnamed4008(o.additionalDimensions);
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    unittest.expect(o.appendedTag, unittest.equals('foo'));
    checkUnnamed4009(o.assets);
    unittest.expect(o.cmPlacementId, unittest.equals('foo'));
    checkCmTrackingAd(o.cmTrackingAd);
    checkUnnamed4010(o.companionCreativeIds);
    checkUnnamed4011(o.counterEvents);
    unittest.expect(o.createTime, unittest.equals('foo'));
    checkUnnamed4012(o.creativeAttributes);
    unittest.expect(o.creativeId, unittest.equals('foo'));
    unittest.expect(o.creativeType, unittest.equals('foo'));
    checkDimensions(o.dimensions);
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.dynamic, unittest.isTrue);
    unittest.expect(o.entityStatus, unittest.equals('foo'));
    checkUnnamed4013(o.exitEvents);
    unittest.expect(o.expandOnHover, unittest.isTrue);
    unittest.expect(o.expandingDirection, unittest.equals('foo'));
    unittest.expect(o.hostingSource, unittest.equals('foo'));
    unittest.expect(o.html5Video, unittest.isTrue);
    unittest.expect(o.iasCampaignMonitoring, unittest.isTrue);
    unittest.expect(o.integrationCode, unittest.equals('foo'));
    unittest.expect(o.jsTrackerUrl, unittest.equals('foo'));
    unittest.expect(o.mediaDuration, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkObaIcon(o.obaIcon);
    checkAudioVideoOffset(o.progressOffset);
    unittest.expect(o.requireHtml5, unittest.isTrue);
    unittest.expect(o.requireMraid, unittest.isTrue);
    unittest.expect(o.requirePingForAttribution, unittest.isTrue);
    checkReviewStatusInfo(o.reviewStatus);
    checkAudioVideoOffset(o.skipOffset);
    unittest.expect(o.skippable, unittest.isTrue);
    unittest.expect(o.thirdPartyTag, unittest.equals('foo'));
    checkUnnamed4014(o.thirdPartyUrls);
    checkUnnamed4015(o.timerEvents);
    checkUnnamed4016(o.trackerUrls);
    checkUnnamed4017(o.transcodes);
    checkUniversalAdId(o.universalAdId);
    unittest.expect(o.updateTime, unittest.equals('foo'));
    unittest.expect(o.vastTagUrl, unittest.equals('foo'));
    unittest.expect(o.vpaid, unittest.isTrue);
  }
  buildCounterCreative--;
}

core.int buildCounterCreativeConfig = 0;
buildCreativeConfig() {
  var o = new api.CreativeConfig();
  buildCounterCreativeConfig++;
  if (buildCounterCreativeConfig < 3) {
    o.creativeType = "foo";
    o.displayCreativeConfig = buildInventorySourceDisplayCreativeConfig();
    o.videoCreativeConfig = buildInventorySourceVideoCreativeConfig();
  }
  buildCounterCreativeConfig--;
  return o;
}

checkCreativeConfig(api.CreativeConfig o) {
  buildCounterCreativeConfig++;
  if (buildCounterCreativeConfig < 3) {
    unittest.expect(o.creativeType, unittest.equals('foo'));
    checkInventorySourceDisplayCreativeConfig(o.displayCreativeConfig);
    checkInventorySourceVideoCreativeConfig(o.videoCreativeConfig);
  }
  buildCounterCreativeConfig--;
}

core.int buildCounterCustomList = 0;
buildCustomList() {
  var o = new api.CustomList();
  buildCounterCustomList++;
  if (buildCounterCustomList < 3) {
    o.customListId = "foo";
    o.displayName = "foo";
    o.name = "foo";
  }
  buildCounterCustomList--;
  return o;
}

checkCustomList(api.CustomList o) {
  buildCounterCustomList++;
  if (buildCounterCustomList < 3) {
    unittest.expect(o.customListId, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterCustomList--;
}

buildUnnamed4018() {
  var o = new core.List<api.CustomListTargetingSetting>();
  o.add(buildCustomListTargetingSetting());
  o.add(buildCustomListTargetingSetting());
  return o;
}

checkUnnamed4018(core.List<api.CustomListTargetingSetting> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomListTargetingSetting(o[0]);
  checkCustomListTargetingSetting(o[1]);
}

core.int buildCounterCustomListGroup = 0;
buildCustomListGroup() {
  var o = new api.CustomListGroup();
  buildCounterCustomListGroup++;
  if (buildCounterCustomListGroup < 3) {
    o.settings = buildUnnamed4018();
  }
  buildCounterCustomListGroup--;
  return o;
}

checkCustomListGroup(api.CustomListGroup o) {
  buildCounterCustomListGroup++;
  if (buildCounterCustomListGroup < 3) {
    checkUnnamed4018(o.settings);
  }
  buildCounterCustomListGroup--;
}

core.int buildCounterCustomListTargetingSetting = 0;
buildCustomListTargetingSetting() {
  var o = new api.CustomListTargetingSetting();
  buildCounterCustomListTargetingSetting++;
  if (buildCounterCustomListTargetingSetting < 3) {
    o.customListId = "foo";
  }
  buildCounterCustomListTargetingSetting--;
  return o;
}

checkCustomListTargetingSetting(api.CustomListTargetingSetting o) {
  buildCounterCustomListTargetingSetting++;
  if (buildCounterCustomListTargetingSetting < 3) {
    unittest.expect(o.customListId, unittest.equals('foo'));
  }
  buildCounterCustomListTargetingSetting--;
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

core.int buildCounterDateRange = 0;
buildDateRange() {
  var o = new api.DateRange();
  buildCounterDateRange++;
  if (buildCounterDateRange < 3) {
    o.endDate = buildDate();
    o.startDate = buildDate();
  }
  buildCounterDateRange--;
  return o;
}

checkDateRange(api.DateRange o) {
  buildCounterDateRange++;
  if (buildCounterDateRange < 3) {
    checkDate(o.endDate);
    checkDate(o.startDate);
  }
  buildCounterDateRange--;
}

core.int buildCounterDayAndTimeAssignedTargetingOptionDetails = 0;
buildDayAndTimeAssignedTargetingOptionDetails() {
  var o = new api.DayAndTimeAssignedTargetingOptionDetails();
  buildCounterDayAndTimeAssignedTargetingOptionDetails++;
  if (buildCounterDayAndTimeAssignedTargetingOptionDetails < 3) {
    o.dayOfWeek = "foo";
    o.endHour = 42;
    o.startHour = 42;
    o.timeZoneResolution = "foo";
  }
  buildCounterDayAndTimeAssignedTargetingOptionDetails--;
  return o;
}

checkDayAndTimeAssignedTargetingOptionDetails(
    api.DayAndTimeAssignedTargetingOptionDetails o) {
  buildCounterDayAndTimeAssignedTargetingOptionDetails++;
  if (buildCounterDayAndTimeAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.dayOfWeek, unittest.equals('foo'));
    unittest.expect(o.endHour, unittest.equals(42));
    unittest.expect(o.startHour, unittest.equals(42));
    unittest.expect(o.timeZoneResolution, unittest.equals('foo'));
  }
  buildCounterDayAndTimeAssignedTargetingOptionDetails--;
}

buildUnnamed4019() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4019(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDeleteAssignedTargetingOptionsRequest = 0;
buildDeleteAssignedTargetingOptionsRequest() {
  var o = new api.DeleteAssignedTargetingOptionsRequest();
  buildCounterDeleteAssignedTargetingOptionsRequest++;
  if (buildCounterDeleteAssignedTargetingOptionsRequest < 3) {
    o.assignedTargetingOptionIds = buildUnnamed4019();
    o.targetingType = "foo";
  }
  buildCounterDeleteAssignedTargetingOptionsRequest--;
  return o;
}

checkDeleteAssignedTargetingOptionsRequest(
    api.DeleteAssignedTargetingOptionsRequest o) {
  buildCounterDeleteAssignedTargetingOptionsRequest++;
  if (buildCounterDeleteAssignedTargetingOptionsRequest < 3) {
    checkUnnamed4019(o.assignedTargetingOptionIds);
    unittest.expect(o.targetingType, unittest.equals('foo'));
  }
  buildCounterDeleteAssignedTargetingOptionsRequest--;
}

core.int buildCounterDeviceMakeModelAssignedTargetingOptionDetails = 0;
buildDeviceMakeModelAssignedTargetingOptionDetails() {
  var o = new api.DeviceMakeModelAssignedTargetingOptionDetails();
  buildCounterDeviceMakeModelAssignedTargetingOptionDetails++;
  if (buildCounterDeviceMakeModelAssignedTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.negative = true;
    o.targetingOptionId = "foo";
  }
  buildCounterDeviceMakeModelAssignedTargetingOptionDetails--;
  return o;
}

checkDeviceMakeModelAssignedTargetingOptionDetails(
    api.DeviceMakeModelAssignedTargetingOptionDetails o) {
  buildCounterDeviceMakeModelAssignedTargetingOptionDetails++;
  if (buildCounterDeviceMakeModelAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterDeviceMakeModelAssignedTargetingOptionDetails--;
}

core.int buildCounterDeviceMakeModelTargetingOptionDetails = 0;
buildDeviceMakeModelTargetingOptionDetails() {
  var o = new api.DeviceMakeModelTargetingOptionDetails();
  buildCounterDeviceMakeModelTargetingOptionDetails++;
  if (buildCounterDeviceMakeModelTargetingOptionDetails < 3) {
    o.displayName = "foo";
  }
  buildCounterDeviceMakeModelTargetingOptionDetails--;
  return o;
}

checkDeviceMakeModelTargetingOptionDetails(
    api.DeviceMakeModelTargetingOptionDetails o) {
  buildCounterDeviceMakeModelTargetingOptionDetails++;
  if (buildCounterDeviceMakeModelTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
  }
  buildCounterDeviceMakeModelTargetingOptionDetails--;
}

core.int buildCounterDeviceTypeAssignedTargetingOptionDetails = 0;
buildDeviceTypeAssignedTargetingOptionDetails() {
  var o = new api.DeviceTypeAssignedTargetingOptionDetails();
  buildCounterDeviceTypeAssignedTargetingOptionDetails++;
  if (buildCounterDeviceTypeAssignedTargetingOptionDetails < 3) {
    o.deviceType = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterDeviceTypeAssignedTargetingOptionDetails--;
  return o;
}

checkDeviceTypeAssignedTargetingOptionDetails(
    api.DeviceTypeAssignedTargetingOptionDetails o) {
  buildCounterDeviceTypeAssignedTargetingOptionDetails++;
  if (buildCounterDeviceTypeAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.deviceType, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterDeviceTypeAssignedTargetingOptionDetails--;
}

core.int buildCounterDeviceTypeTargetingOptionDetails = 0;
buildDeviceTypeTargetingOptionDetails() {
  var o = new api.DeviceTypeTargetingOptionDetails();
  buildCounterDeviceTypeTargetingOptionDetails++;
  if (buildCounterDeviceTypeTargetingOptionDetails < 3) {
    o.deviceType = "foo";
  }
  buildCounterDeviceTypeTargetingOptionDetails--;
  return o;
}

checkDeviceTypeTargetingOptionDetails(api.DeviceTypeTargetingOptionDetails o) {
  buildCounterDeviceTypeTargetingOptionDetails++;
  if (buildCounterDeviceTypeTargetingOptionDetails < 3) {
    unittest.expect(o.deviceType, unittest.equals('foo'));
  }
  buildCounterDeviceTypeTargetingOptionDetails--;
}

core.int buildCounterDigitalContentLabelAssignedTargetingOptionDetails = 0;
buildDigitalContentLabelAssignedTargetingOptionDetails() {
  var o = new api.DigitalContentLabelAssignedTargetingOptionDetails();
  buildCounterDigitalContentLabelAssignedTargetingOptionDetails++;
  if (buildCounterDigitalContentLabelAssignedTargetingOptionDetails < 3) {
    o.contentRatingTier = "foo";
    o.excludedTargetingOptionId = "foo";
  }
  buildCounterDigitalContentLabelAssignedTargetingOptionDetails--;
  return o;
}

checkDigitalContentLabelAssignedTargetingOptionDetails(
    api.DigitalContentLabelAssignedTargetingOptionDetails o) {
  buildCounterDigitalContentLabelAssignedTargetingOptionDetails++;
  if (buildCounterDigitalContentLabelAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.contentRatingTier, unittest.equals('foo'));
    unittest.expect(o.excludedTargetingOptionId, unittest.equals('foo'));
  }
  buildCounterDigitalContentLabelAssignedTargetingOptionDetails--;
}

core.int buildCounterDigitalContentLabelTargetingOptionDetails = 0;
buildDigitalContentLabelTargetingOptionDetails() {
  var o = new api.DigitalContentLabelTargetingOptionDetails();
  buildCounterDigitalContentLabelTargetingOptionDetails++;
  if (buildCounterDigitalContentLabelTargetingOptionDetails < 3) {
    o.contentRatingTier = "foo";
  }
  buildCounterDigitalContentLabelTargetingOptionDetails--;
  return o;
}

checkDigitalContentLabelTargetingOptionDetails(
    api.DigitalContentLabelTargetingOptionDetails o) {
  buildCounterDigitalContentLabelTargetingOptionDetails++;
  if (buildCounterDigitalContentLabelTargetingOptionDetails < 3) {
    unittest.expect(o.contentRatingTier, unittest.equals('foo'));
  }
  buildCounterDigitalContentLabelTargetingOptionDetails--;
}

core.int buildCounterDimensions = 0;
buildDimensions() {
  var o = new api.Dimensions();
  buildCounterDimensions++;
  if (buildCounterDimensions < 3) {
    o.heightPixels = 42;
    o.widthPixels = 42;
  }
  buildCounterDimensions--;
  return o;
}

checkDimensions(api.Dimensions o) {
  buildCounterDimensions++;
  if (buildCounterDimensions < 3) {
    unittest.expect(o.heightPixels, unittest.equals(42));
    unittest.expect(o.widthPixels, unittest.equals(42));
  }
  buildCounterDimensions--;
}

buildUnnamed4020() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4020(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDoubleVerify = 0;
buildDoubleVerify() {
  var o = new api.DoubleVerify();
  buildCounterDoubleVerify++;
  if (buildCounterDoubleVerify < 3) {
    o.appStarRating = buildDoubleVerifyAppStarRating();
    o.avoidedAgeRatings = buildUnnamed4020();
    o.brandSafetyCategories = buildDoubleVerifyBrandSafetyCategories();
    o.displayViewability = buildDoubleVerifyDisplayViewability();
    o.fraudInvalidTraffic = buildDoubleVerifyFraudInvalidTraffic();
    o.videoViewability = buildDoubleVerifyVideoViewability();
  }
  buildCounterDoubleVerify--;
  return o;
}

checkDoubleVerify(api.DoubleVerify o) {
  buildCounterDoubleVerify++;
  if (buildCounterDoubleVerify < 3) {
    checkDoubleVerifyAppStarRating(o.appStarRating);
    checkUnnamed4020(o.avoidedAgeRatings);
    checkDoubleVerifyBrandSafetyCategories(o.brandSafetyCategories);
    checkDoubleVerifyDisplayViewability(o.displayViewability);
    checkDoubleVerifyFraudInvalidTraffic(o.fraudInvalidTraffic);
    checkDoubleVerifyVideoViewability(o.videoViewability);
  }
  buildCounterDoubleVerify--;
}

core.int buildCounterDoubleVerifyAppStarRating = 0;
buildDoubleVerifyAppStarRating() {
  var o = new api.DoubleVerifyAppStarRating();
  buildCounterDoubleVerifyAppStarRating++;
  if (buildCounterDoubleVerifyAppStarRating < 3) {
    o.avoidInsufficientStarRating = true;
    o.avoidedStarRating = "foo";
  }
  buildCounterDoubleVerifyAppStarRating--;
  return o;
}

checkDoubleVerifyAppStarRating(api.DoubleVerifyAppStarRating o) {
  buildCounterDoubleVerifyAppStarRating++;
  if (buildCounterDoubleVerifyAppStarRating < 3) {
    unittest.expect(o.avoidInsufficientStarRating, unittest.isTrue);
    unittest.expect(o.avoidedStarRating, unittest.equals('foo'));
  }
  buildCounterDoubleVerifyAppStarRating--;
}

buildUnnamed4021() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4021(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4022() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4022(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDoubleVerifyBrandSafetyCategories = 0;
buildDoubleVerifyBrandSafetyCategories() {
  var o = new api.DoubleVerifyBrandSafetyCategories();
  buildCounterDoubleVerifyBrandSafetyCategories++;
  if (buildCounterDoubleVerifyBrandSafetyCategories < 3) {
    o.avoidUnknownBrandSafetyCategory = true;
    o.avoidedHighSeverityCategories = buildUnnamed4021();
    o.avoidedMediumSeverityCategories = buildUnnamed4022();
  }
  buildCounterDoubleVerifyBrandSafetyCategories--;
  return o;
}

checkDoubleVerifyBrandSafetyCategories(
    api.DoubleVerifyBrandSafetyCategories o) {
  buildCounterDoubleVerifyBrandSafetyCategories++;
  if (buildCounterDoubleVerifyBrandSafetyCategories < 3) {
    unittest.expect(o.avoidUnknownBrandSafetyCategory, unittest.isTrue);
    checkUnnamed4021(o.avoidedHighSeverityCategories);
    checkUnnamed4022(o.avoidedMediumSeverityCategories);
  }
  buildCounterDoubleVerifyBrandSafetyCategories--;
}

core.int buildCounterDoubleVerifyDisplayViewability = 0;
buildDoubleVerifyDisplayViewability() {
  var o = new api.DoubleVerifyDisplayViewability();
  buildCounterDoubleVerifyDisplayViewability++;
  if (buildCounterDoubleVerifyDisplayViewability < 3) {
    o.iab = "foo";
    o.viewableDuring = "foo";
  }
  buildCounterDoubleVerifyDisplayViewability--;
  return o;
}

checkDoubleVerifyDisplayViewability(api.DoubleVerifyDisplayViewability o) {
  buildCounterDoubleVerifyDisplayViewability++;
  if (buildCounterDoubleVerifyDisplayViewability < 3) {
    unittest.expect(o.iab, unittest.equals('foo'));
    unittest.expect(o.viewableDuring, unittest.equals('foo'));
  }
  buildCounterDoubleVerifyDisplayViewability--;
}

core.int buildCounterDoubleVerifyFraudInvalidTraffic = 0;
buildDoubleVerifyFraudInvalidTraffic() {
  var o = new api.DoubleVerifyFraudInvalidTraffic();
  buildCounterDoubleVerifyFraudInvalidTraffic++;
  if (buildCounterDoubleVerifyFraudInvalidTraffic < 3) {
    o.avoidInsufficientOption = true;
    o.avoidedFraudOption = "foo";
  }
  buildCounterDoubleVerifyFraudInvalidTraffic--;
  return o;
}

checkDoubleVerifyFraudInvalidTraffic(api.DoubleVerifyFraudInvalidTraffic o) {
  buildCounterDoubleVerifyFraudInvalidTraffic++;
  if (buildCounterDoubleVerifyFraudInvalidTraffic < 3) {
    unittest.expect(o.avoidInsufficientOption, unittest.isTrue);
    unittest.expect(o.avoidedFraudOption, unittest.equals('foo'));
  }
  buildCounterDoubleVerifyFraudInvalidTraffic--;
}

core.int buildCounterDoubleVerifyVideoViewability = 0;
buildDoubleVerifyVideoViewability() {
  var o = new api.DoubleVerifyVideoViewability();
  buildCounterDoubleVerifyVideoViewability++;
  if (buildCounterDoubleVerifyVideoViewability < 3) {
    o.playerImpressionRate = "foo";
    o.videoIab = "foo";
    o.videoViewableRate = "foo";
  }
  buildCounterDoubleVerifyVideoViewability--;
  return o;
}

checkDoubleVerifyVideoViewability(api.DoubleVerifyVideoViewability o) {
  buildCounterDoubleVerifyVideoViewability++;
  if (buildCounterDoubleVerifyVideoViewability < 3) {
    unittest.expect(o.playerImpressionRate, unittest.equals('foo'));
    unittest.expect(o.videoIab, unittest.equals('foo'));
    unittest.expect(o.videoViewableRate, unittest.equals('foo'));
  }
  buildCounterDoubleVerifyVideoViewability--;
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

core.int buildCounterEnvironmentAssignedTargetingOptionDetails = 0;
buildEnvironmentAssignedTargetingOptionDetails() {
  var o = new api.EnvironmentAssignedTargetingOptionDetails();
  buildCounterEnvironmentAssignedTargetingOptionDetails++;
  if (buildCounterEnvironmentAssignedTargetingOptionDetails < 3) {
    o.environment = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterEnvironmentAssignedTargetingOptionDetails--;
  return o;
}

checkEnvironmentAssignedTargetingOptionDetails(
    api.EnvironmentAssignedTargetingOptionDetails o) {
  buildCounterEnvironmentAssignedTargetingOptionDetails++;
  if (buildCounterEnvironmentAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.environment, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterEnvironmentAssignedTargetingOptionDetails--;
}

core.int buildCounterEnvironmentTargetingOptionDetails = 0;
buildEnvironmentTargetingOptionDetails() {
  var o = new api.EnvironmentTargetingOptionDetails();
  buildCounterEnvironmentTargetingOptionDetails++;
  if (buildCounterEnvironmentTargetingOptionDetails < 3) {
    o.environment = "foo";
  }
  buildCounterEnvironmentTargetingOptionDetails--;
  return o;
}

checkEnvironmentTargetingOptionDetails(
    api.EnvironmentTargetingOptionDetails o) {
  buildCounterEnvironmentTargetingOptionDetails++;
  if (buildCounterEnvironmentTargetingOptionDetails < 3) {
    unittest.expect(o.environment, unittest.equals('foo'));
  }
  buildCounterEnvironmentTargetingOptionDetails--;
}

core.int buildCounterExchangeAssignedTargetingOptionDetails = 0;
buildExchangeAssignedTargetingOptionDetails() {
  var o = new api.ExchangeAssignedTargetingOptionDetails();
  buildCounterExchangeAssignedTargetingOptionDetails++;
  if (buildCounterExchangeAssignedTargetingOptionDetails < 3) {
    o.targetingOptionId = "foo";
  }
  buildCounterExchangeAssignedTargetingOptionDetails--;
  return o;
}

checkExchangeAssignedTargetingOptionDetails(
    api.ExchangeAssignedTargetingOptionDetails o) {
  buildCounterExchangeAssignedTargetingOptionDetails++;
  if (buildCounterExchangeAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterExchangeAssignedTargetingOptionDetails--;
}

core.int buildCounterExchangeReviewStatus = 0;
buildExchangeReviewStatus() {
  var o = new api.ExchangeReviewStatus();
  buildCounterExchangeReviewStatus++;
  if (buildCounterExchangeReviewStatus < 3) {
    o.exchange = "foo";
    o.status = "foo";
  }
  buildCounterExchangeReviewStatus--;
  return o;
}

checkExchangeReviewStatus(api.ExchangeReviewStatus o) {
  buildCounterExchangeReviewStatus++;
  if (buildCounterExchangeReviewStatus < 3) {
    unittest.expect(o.exchange, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
  }
  buildCounterExchangeReviewStatus--;
}

core.int buildCounterExchangeTargetingOptionDetails = 0;
buildExchangeTargetingOptionDetails() {
  var o = new api.ExchangeTargetingOptionDetails();
  buildCounterExchangeTargetingOptionDetails++;
  if (buildCounterExchangeTargetingOptionDetails < 3) {
    o.exchange = "foo";
  }
  buildCounterExchangeTargetingOptionDetails--;
  return o;
}

checkExchangeTargetingOptionDetails(api.ExchangeTargetingOptionDetails o) {
  buildCounterExchangeTargetingOptionDetails++;
  if (buildCounterExchangeTargetingOptionDetails < 3) {
    unittest.expect(o.exchange, unittest.equals('foo'));
  }
  buildCounterExchangeTargetingOptionDetails--;
}

core.int buildCounterExitEvent = 0;
buildExitEvent() {
  var o = new api.ExitEvent();
  buildCounterExitEvent++;
  if (buildCounterExitEvent < 3) {
    o.name = "foo";
    o.reportingName = "foo";
    o.type = "foo";
    o.url = "foo";
  }
  buildCounterExitEvent--;
  return o;
}

checkExitEvent(api.ExitEvent o) {
  buildCounterExitEvent++;
  if (buildCounterExitEvent < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.reportingName, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterExitEvent--;
}

core.int buildCounterFirstAndThirdPartyAudience = 0;
buildFirstAndThirdPartyAudience() {
  var o = new api.FirstAndThirdPartyAudience();
  buildCounterFirstAndThirdPartyAudience++;
  if (buildCounterFirstAndThirdPartyAudience < 3) {
    o.displayName = "foo";
    o.firstAndThirdPartyAudienceId = "foo";
    o.firstAndThirdPartyAudienceType = "foo";
    o.name = "foo";
  }
  buildCounterFirstAndThirdPartyAudience--;
  return o;
}

checkFirstAndThirdPartyAudience(api.FirstAndThirdPartyAudience o) {
  buildCounterFirstAndThirdPartyAudience++;
  if (buildCounterFirstAndThirdPartyAudience < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.firstAndThirdPartyAudienceId, unittest.equals('foo'));
    unittest.expect(o.firstAndThirdPartyAudienceType, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterFirstAndThirdPartyAudience--;
}

buildUnnamed4023() {
  var o = new core.List<api.FirstAndThirdPartyAudienceTargetingSetting>();
  o.add(buildFirstAndThirdPartyAudienceTargetingSetting());
  o.add(buildFirstAndThirdPartyAudienceTargetingSetting());
  return o;
}

checkUnnamed4023(core.List<api.FirstAndThirdPartyAudienceTargetingSetting> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFirstAndThirdPartyAudienceTargetingSetting(o[0]);
  checkFirstAndThirdPartyAudienceTargetingSetting(o[1]);
}

core.int buildCounterFirstAndThirdPartyAudienceGroup = 0;
buildFirstAndThirdPartyAudienceGroup() {
  var o = new api.FirstAndThirdPartyAudienceGroup();
  buildCounterFirstAndThirdPartyAudienceGroup++;
  if (buildCounterFirstAndThirdPartyAudienceGroup < 3) {
    o.settings = buildUnnamed4023();
  }
  buildCounterFirstAndThirdPartyAudienceGroup--;
  return o;
}

checkFirstAndThirdPartyAudienceGroup(api.FirstAndThirdPartyAudienceGroup o) {
  buildCounterFirstAndThirdPartyAudienceGroup++;
  if (buildCounterFirstAndThirdPartyAudienceGroup < 3) {
    checkUnnamed4023(o.settings);
  }
  buildCounterFirstAndThirdPartyAudienceGroup--;
}

core.int buildCounterFirstAndThirdPartyAudienceTargetingSetting = 0;
buildFirstAndThirdPartyAudienceTargetingSetting() {
  var o = new api.FirstAndThirdPartyAudienceTargetingSetting();
  buildCounterFirstAndThirdPartyAudienceTargetingSetting++;
  if (buildCounterFirstAndThirdPartyAudienceTargetingSetting < 3) {
    o.firstAndThirdPartyAudienceId = "foo";
    o.recency = "foo";
  }
  buildCounterFirstAndThirdPartyAudienceTargetingSetting--;
  return o;
}

checkFirstAndThirdPartyAudienceTargetingSetting(
    api.FirstAndThirdPartyAudienceTargetingSetting o) {
  buildCounterFirstAndThirdPartyAudienceTargetingSetting++;
  if (buildCounterFirstAndThirdPartyAudienceTargetingSetting < 3) {
    unittest.expect(o.firstAndThirdPartyAudienceId, unittest.equals('foo'));
    unittest.expect(o.recency, unittest.equals('foo'));
  }
  buildCounterFirstAndThirdPartyAudienceTargetingSetting--;
}

core.int buildCounterFixedBidStrategy = 0;
buildFixedBidStrategy() {
  var o = new api.FixedBidStrategy();
  buildCounterFixedBidStrategy++;
  if (buildCounterFixedBidStrategy < 3) {
    o.bidAmountMicros = "foo";
  }
  buildCounterFixedBidStrategy--;
  return o;
}

checkFixedBidStrategy(api.FixedBidStrategy o) {
  buildCounterFixedBidStrategy++;
  if (buildCounterFixedBidStrategy < 3) {
    unittest.expect(o.bidAmountMicros, unittest.equals('foo'));
  }
  buildCounterFixedBidStrategy--;
}

buildUnnamed4024() {
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

checkUnnamed4024(core.Map<core.String, core.Object> o) {
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

core.int buildCounterFloodlightGroup = 0;
buildFloodlightGroup() {
  var o = new api.FloodlightGroup();
  buildCounterFloodlightGroup++;
  if (buildCounterFloodlightGroup < 3) {
    o.activeViewConfig = buildActiveViewVideoViewabilityMetricConfig();
    o.customVariables = buildUnnamed4024();
    o.displayName = "foo";
    o.floodlightGroupId = "foo";
    o.lookbackWindow = buildLookbackWindow();
    o.name = "foo";
    o.webTagType = "foo";
  }
  buildCounterFloodlightGroup--;
  return o;
}

checkFloodlightGroup(api.FloodlightGroup o) {
  buildCounterFloodlightGroup++;
  if (buildCounterFloodlightGroup < 3) {
    checkActiveViewVideoViewabilityMetricConfig(o.activeViewConfig);
    checkUnnamed4024(o.customVariables);
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.floodlightGroupId, unittest.equals('foo'));
    checkLookbackWindow(o.lookbackWindow);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.webTagType, unittest.equals('foo'));
  }
  buildCounterFloodlightGroup--;
}

core.int buildCounterFrequencyCap = 0;
buildFrequencyCap() {
  var o = new api.FrequencyCap();
  buildCounterFrequencyCap++;
  if (buildCounterFrequencyCap < 3) {
    o.maxImpressions = 42;
    o.timeUnit = "foo";
    o.timeUnitCount = 42;
    o.unlimited = true;
  }
  buildCounterFrequencyCap--;
  return o;
}

checkFrequencyCap(api.FrequencyCap o) {
  buildCounterFrequencyCap++;
  if (buildCounterFrequencyCap < 3) {
    unittest.expect(o.maxImpressions, unittest.equals(42));
    unittest.expect(o.timeUnit, unittest.equals('foo'));
    unittest.expect(o.timeUnitCount, unittest.equals(42));
    unittest.expect(o.unlimited, unittest.isTrue);
  }
  buildCounterFrequencyCap--;
}

core.int buildCounterGenderAssignedTargetingOptionDetails = 0;
buildGenderAssignedTargetingOptionDetails() {
  var o = new api.GenderAssignedTargetingOptionDetails();
  buildCounterGenderAssignedTargetingOptionDetails++;
  if (buildCounterGenderAssignedTargetingOptionDetails < 3) {
    o.gender = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterGenderAssignedTargetingOptionDetails--;
  return o;
}

checkGenderAssignedTargetingOptionDetails(
    api.GenderAssignedTargetingOptionDetails o) {
  buildCounterGenderAssignedTargetingOptionDetails++;
  if (buildCounterGenderAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.gender, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterGenderAssignedTargetingOptionDetails--;
}

core.int buildCounterGenderTargetingOptionDetails = 0;
buildGenderTargetingOptionDetails() {
  var o = new api.GenderTargetingOptionDetails();
  buildCounterGenderTargetingOptionDetails++;
  if (buildCounterGenderTargetingOptionDetails < 3) {
    o.gender = "foo";
  }
  buildCounterGenderTargetingOptionDetails--;
  return o;
}

checkGenderTargetingOptionDetails(api.GenderTargetingOptionDetails o) {
  buildCounterGenderTargetingOptionDetails++;
  if (buildCounterGenderTargetingOptionDetails < 3) {
    unittest.expect(o.gender, unittest.equals('foo'));
  }
  buildCounterGenderTargetingOptionDetails--;
}

core.int buildCounterGeoRegionAssignedTargetingOptionDetails = 0;
buildGeoRegionAssignedTargetingOptionDetails() {
  var o = new api.GeoRegionAssignedTargetingOptionDetails();
  buildCounterGeoRegionAssignedTargetingOptionDetails++;
  if (buildCounterGeoRegionAssignedTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.geoRegionType = "foo";
    o.negative = true;
    o.targetingOptionId = "foo";
  }
  buildCounterGeoRegionAssignedTargetingOptionDetails--;
  return o;
}

checkGeoRegionAssignedTargetingOptionDetails(
    api.GeoRegionAssignedTargetingOptionDetails o) {
  buildCounterGeoRegionAssignedTargetingOptionDetails++;
  if (buildCounterGeoRegionAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.geoRegionType, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterGeoRegionAssignedTargetingOptionDetails--;
}

core.int buildCounterGeoRegionTargetingOptionDetails = 0;
buildGeoRegionTargetingOptionDetails() {
  var o = new api.GeoRegionTargetingOptionDetails();
  buildCounterGeoRegionTargetingOptionDetails++;
  if (buildCounterGeoRegionTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.geoRegionType = "foo";
  }
  buildCounterGeoRegionTargetingOptionDetails--;
  return o;
}

checkGeoRegionTargetingOptionDetails(api.GeoRegionTargetingOptionDetails o) {
  buildCounterGeoRegionTargetingOptionDetails++;
  if (buildCounterGeoRegionTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.geoRegionType, unittest.equals('foo'));
  }
  buildCounterGeoRegionTargetingOptionDetails--;
}

core.int buildCounterGoogleAudience = 0;
buildGoogleAudience() {
  var o = new api.GoogleAudience();
  buildCounterGoogleAudience++;
  if (buildCounterGoogleAudience < 3) {
    o.displayName = "foo";
    o.googleAudienceId = "foo";
    o.googleAudienceType = "foo";
    o.name = "foo";
  }
  buildCounterGoogleAudience--;
  return o;
}

checkGoogleAudience(api.GoogleAudience o) {
  buildCounterGoogleAudience++;
  if (buildCounterGoogleAudience < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.googleAudienceId, unittest.equals('foo'));
    unittest.expect(o.googleAudienceType, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterGoogleAudience--;
}

buildUnnamed4025() {
  var o = new core.List<api.GoogleAudienceTargetingSetting>();
  o.add(buildGoogleAudienceTargetingSetting());
  o.add(buildGoogleAudienceTargetingSetting());
  return o;
}

checkUnnamed4025(core.List<api.GoogleAudienceTargetingSetting> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkGoogleAudienceTargetingSetting(o[0]);
  checkGoogleAudienceTargetingSetting(o[1]);
}

core.int buildCounterGoogleAudienceGroup = 0;
buildGoogleAudienceGroup() {
  var o = new api.GoogleAudienceGroup();
  buildCounterGoogleAudienceGroup++;
  if (buildCounterGoogleAudienceGroup < 3) {
    o.settings = buildUnnamed4025();
  }
  buildCounterGoogleAudienceGroup--;
  return o;
}

checkGoogleAudienceGroup(api.GoogleAudienceGroup o) {
  buildCounterGoogleAudienceGroup++;
  if (buildCounterGoogleAudienceGroup < 3) {
    checkUnnamed4025(o.settings);
  }
  buildCounterGoogleAudienceGroup--;
}

core.int buildCounterGoogleAudienceTargetingSetting = 0;
buildGoogleAudienceTargetingSetting() {
  var o = new api.GoogleAudienceTargetingSetting();
  buildCounterGoogleAudienceTargetingSetting++;
  if (buildCounterGoogleAudienceTargetingSetting < 3) {
    o.googleAudienceId = "foo";
  }
  buildCounterGoogleAudienceTargetingSetting--;
  return o;
}

checkGoogleAudienceTargetingSetting(api.GoogleAudienceTargetingSetting o) {
  buildCounterGoogleAudienceTargetingSetting++;
  if (buildCounterGoogleAudienceTargetingSetting < 3) {
    unittest.expect(o.googleAudienceId, unittest.equals('foo'));
  }
  buildCounterGoogleAudienceTargetingSetting--;
}

core.int buildCounterGoogleBytestreamMedia = 0;
buildGoogleBytestreamMedia() {
  var o = new api.GoogleBytestreamMedia();
  buildCounterGoogleBytestreamMedia++;
  if (buildCounterGoogleBytestreamMedia < 3) {
    o.resourceName = "foo";
  }
  buildCounterGoogleBytestreamMedia--;
  return o;
}

checkGoogleBytestreamMedia(api.GoogleBytestreamMedia o) {
  buildCounterGoogleBytestreamMedia++;
  if (buildCounterGoogleBytestreamMedia < 3) {
    unittest.expect(o.resourceName, unittest.equals('foo'));
  }
  buildCounterGoogleBytestreamMedia--;
}

core.int buildCounterHouseholdIncomeAssignedTargetingOptionDetails = 0;
buildHouseholdIncomeAssignedTargetingOptionDetails() {
  var o = new api.HouseholdIncomeAssignedTargetingOptionDetails();
  buildCounterHouseholdIncomeAssignedTargetingOptionDetails++;
  if (buildCounterHouseholdIncomeAssignedTargetingOptionDetails < 3) {
    o.householdIncome = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterHouseholdIncomeAssignedTargetingOptionDetails--;
  return o;
}

checkHouseholdIncomeAssignedTargetingOptionDetails(
    api.HouseholdIncomeAssignedTargetingOptionDetails o) {
  buildCounterHouseholdIncomeAssignedTargetingOptionDetails++;
  if (buildCounterHouseholdIncomeAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.householdIncome, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterHouseholdIncomeAssignedTargetingOptionDetails--;
}

core.int buildCounterHouseholdIncomeTargetingOptionDetails = 0;
buildHouseholdIncomeTargetingOptionDetails() {
  var o = new api.HouseholdIncomeTargetingOptionDetails();
  buildCounterHouseholdIncomeTargetingOptionDetails++;
  if (buildCounterHouseholdIncomeTargetingOptionDetails < 3) {
    o.householdIncome = "foo";
  }
  buildCounterHouseholdIncomeTargetingOptionDetails--;
  return o;
}

checkHouseholdIncomeTargetingOptionDetails(
    api.HouseholdIncomeTargetingOptionDetails o) {
  buildCounterHouseholdIncomeTargetingOptionDetails++;
  if (buildCounterHouseholdIncomeTargetingOptionDetails < 3) {
    unittest.expect(o.householdIncome, unittest.equals('foo'));
  }
  buildCounterHouseholdIncomeTargetingOptionDetails--;
}

buildUnnamed4026() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4026(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4027() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4027(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4028() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4028(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4029() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4029(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4030() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4030(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4031() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4031(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterIdFilter = 0;
buildIdFilter() {
  var o = new api.IdFilter();
  buildCounterIdFilter++;
  if (buildCounterIdFilter < 3) {
    o.adGroupAdIds = buildUnnamed4026();
    o.adGroupIds = buildUnnamed4027();
    o.campaignIds = buildUnnamed4028();
    o.insertionOrderIds = buildUnnamed4029();
    o.lineItemIds = buildUnnamed4030();
    o.mediaProductIds = buildUnnamed4031();
  }
  buildCounterIdFilter--;
  return o;
}

checkIdFilter(api.IdFilter o) {
  buildCounterIdFilter++;
  if (buildCounterIdFilter < 3) {
    checkUnnamed4026(o.adGroupAdIds);
    checkUnnamed4027(o.adGroupIds);
    checkUnnamed4028(o.campaignIds);
    checkUnnamed4029(o.insertionOrderIds);
    checkUnnamed4030(o.lineItemIds);
    checkUnnamed4031(o.mediaProductIds);
  }
  buildCounterIdFilter--;
}

buildUnnamed4032() {
  var o = new core.List<api.PartnerCost>();
  o.add(buildPartnerCost());
  o.add(buildPartnerCost());
  return o;
}

checkUnnamed4032(core.List<api.PartnerCost> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPartnerCost(o[0]);
  checkPartnerCost(o[1]);
}

core.int buildCounterInsertionOrder = 0;
buildInsertionOrder() {
  var o = new api.InsertionOrder();
  buildCounterInsertionOrder++;
  if (buildCounterInsertionOrder < 3) {
    o.advertiserId = "foo";
    o.bidStrategy = buildBiddingStrategy();
    o.budget = buildInsertionOrderBudget();
    o.campaignId = "foo";
    o.displayName = "foo";
    o.entityStatus = "foo";
    o.frequencyCap = buildFrequencyCap();
    o.insertionOrderId = "foo";
    o.integrationDetails = buildIntegrationDetails();
    o.name = "foo";
    o.pacing = buildPacing();
    o.partnerCosts = buildUnnamed4032();
    o.performanceGoal = buildPerformanceGoal();
    o.updateTime = "foo";
  }
  buildCounterInsertionOrder--;
  return o;
}

checkInsertionOrder(api.InsertionOrder o) {
  buildCounterInsertionOrder++;
  if (buildCounterInsertionOrder < 3) {
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkBiddingStrategy(o.bidStrategy);
    checkInsertionOrderBudget(o.budget);
    unittest.expect(o.campaignId, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.entityStatus, unittest.equals('foo'));
    checkFrequencyCap(o.frequencyCap);
    unittest.expect(o.insertionOrderId, unittest.equals('foo'));
    checkIntegrationDetails(o.integrationDetails);
    unittest.expect(o.name, unittest.equals('foo'));
    checkPacing(o.pacing);
    checkUnnamed4032(o.partnerCosts);
    checkPerformanceGoal(o.performanceGoal);
    unittest.expect(o.updateTime, unittest.equals('foo'));
  }
  buildCounterInsertionOrder--;
}

buildUnnamed4033() {
  var o = new core.List<api.InsertionOrderBudgetSegment>();
  o.add(buildInsertionOrderBudgetSegment());
  o.add(buildInsertionOrderBudgetSegment());
  return o;
}

checkUnnamed4033(core.List<api.InsertionOrderBudgetSegment> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInsertionOrderBudgetSegment(o[0]);
  checkInsertionOrderBudgetSegment(o[1]);
}

core.int buildCounterInsertionOrderBudget = 0;
buildInsertionOrderBudget() {
  var o = new api.InsertionOrderBudget();
  buildCounterInsertionOrderBudget++;
  if (buildCounterInsertionOrderBudget < 3) {
    o.automationType = "foo";
    o.budgetSegments = buildUnnamed4033();
    o.budgetUnit = "foo";
  }
  buildCounterInsertionOrderBudget--;
  return o;
}

checkInsertionOrderBudget(api.InsertionOrderBudget o) {
  buildCounterInsertionOrderBudget++;
  if (buildCounterInsertionOrderBudget < 3) {
    unittest.expect(o.automationType, unittest.equals('foo'));
    checkUnnamed4033(o.budgetSegments);
    unittest.expect(o.budgetUnit, unittest.equals('foo'));
  }
  buildCounterInsertionOrderBudget--;
}

core.int buildCounterInsertionOrderBudgetSegment = 0;
buildInsertionOrderBudgetSegment() {
  var o = new api.InsertionOrderBudgetSegment();
  buildCounterInsertionOrderBudgetSegment++;
  if (buildCounterInsertionOrderBudgetSegment < 3) {
    o.budgetAmountMicros = "foo";
    o.campaignBudgetId = "foo";
    o.dateRange = buildDateRange();
    o.description = "foo";
  }
  buildCounterInsertionOrderBudgetSegment--;
  return o;
}

checkInsertionOrderBudgetSegment(api.InsertionOrderBudgetSegment o) {
  buildCounterInsertionOrderBudgetSegment++;
  if (buildCounterInsertionOrderBudgetSegment < 3) {
    unittest.expect(o.budgetAmountMicros, unittest.equals('foo'));
    unittest.expect(o.campaignBudgetId, unittest.equals('foo'));
    checkDateRange(o.dateRange);
    unittest.expect(o.description, unittest.equals('foo'));
  }
  buildCounterInsertionOrderBudgetSegment--;
}

core.int buildCounterIntegralAdScience = 0;
buildIntegralAdScience() {
  var o = new api.IntegralAdScience();
  buildCounterIntegralAdScience++;
  if (buildCounterIntegralAdScience < 3) {
    o.displayViewability = "foo";
    o.excludeUnrateable = true;
    o.excludedAdFraudRisk = "foo";
    o.excludedAdultRisk = "foo";
    o.excludedAlcoholRisk = "foo";
    o.excludedDrugsRisk = "foo";
    o.excludedGamblingRisk = "foo";
    o.excludedHateSpeechRisk = "foo";
    o.excludedIllegalDownloadsRisk = "foo";
    o.excludedOffensiveLanguageRisk = "foo";
    o.excludedViolenceRisk = "foo";
    o.traqScoreOption = "foo";
    o.videoViewability = "foo";
  }
  buildCounterIntegralAdScience--;
  return o;
}

checkIntegralAdScience(api.IntegralAdScience o) {
  buildCounterIntegralAdScience++;
  if (buildCounterIntegralAdScience < 3) {
    unittest.expect(o.displayViewability, unittest.equals('foo'));
    unittest.expect(o.excludeUnrateable, unittest.isTrue);
    unittest.expect(o.excludedAdFraudRisk, unittest.equals('foo'));
    unittest.expect(o.excludedAdultRisk, unittest.equals('foo'));
    unittest.expect(o.excludedAlcoholRisk, unittest.equals('foo'));
    unittest.expect(o.excludedDrugsRisk, unittest.equals('foo'));
    unittest.expect(o.excludedGamblingRisk, unittest.equals('foo'));
    unittest.expect(o.excludedHateSpeechRisk, unittest.equals('foo'));
    unittest.expect(o.excludedIllegalDownloadsRisk, unittest.equals('foo'));
    unittest.expect(o.excludedOffensiveLanguageRisk, unittest.equals('foo'));
    unittest.expect(o.excludedViolenceRisk, unittest.equals('foo'));
    unittest.expect(o.traqScoreOption, unittest.equals('foo'));
    unittest.expect(o.videoViewability, unittest.equals('foo'));
  }
  buildCounterIntegralAdScience--;
}

core.int buildCounterIntegrationDetails = 0;
buildIntegrationDetails() {
  var o = new api.IntegrationDetails();
  buildCounterIntegrationDetails++;
  if (buildCounterIntegrationDetails < 3) {
    o.details = "foo";
    o.integrationCode = "foo";
  }
  buildCounterIntegrationDetails--;
  return o;
}

checkIntegrationDetails(api.IntegrationDetails o) {
  buildCounterIntegrationDetails++;
  if (buildCounterIntegrationDetails < 3) {
    unittest.expect(o.details, unittest.equals('foo'));
    unittest.expect(o.integrationCode, unittest.equals('foo'));
  }
  buildCounterIntegrationDetails--;
}

buildUnnamed4034() {
  var o = new core.List<api.CreativeConfig>();
  o.add(buildCreativeConfig());
  o.add(buildCreativeConfig());
  return o;
}

checkUnnamed4034(core.List<api.CreativeConfig> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreativeConfig(o[0]);
  checkCreativeConfig(o[1]);
}

core.int buildCounterInventorySource = 0;
buildInventorySource() {
  var o = new api.InventorySource();
  buildCounterInventorySource++;
  if (buildCounterInventorySource < 3) {
    o.commitment = "foo";
    o.creativeConfigs = buildUnnamed4034();
    o.dealId = "foo";
    o.deliveryMethod = "foo";
    o.displayName = "foo";
    o.exchange = "foo";
    o.inventorySourceId = "foo";
    o.inventorySourceType = "foo";
    o.name = "foo";
    o.publisherName = "foo";
    o.rateDetails = buildRateDetails();
    o.status = buildInventorySourceStatus();
    o.timeRange = buildTimeRange();
    o.updateTime = "foo";
  }
  buildCounterInventorySource--;
  return o;
}

checkInventorySource(api.InventorySource o) {
  buildCounterInventorySource++;
  if (buildCounterInventorySource < 3) {
    unittest.expect(o.commitment, unittest.equals('foo'));
    checkUnnamed4034(o.creativeConfigs);
    unittest.expect(o.dealId, unittest.equals('foo'));
    unittest.expect(o.deliveryMethod, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.exchange, unittest.equals('foo'));
    unittest.expect(o.inventorySourceId, unittest.equals('foo'));
    unittest.expect(o.inventorySourceType, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.publisherName, unittest.equals('foo'));
    checkRateDetails(o.rateDetails);
    checkInventorySourceStatus(o.status);
    checkTimeRange(o.timeRange);
    unittest.expect(o.updateTime, unittest.equals('foo'));
  }
  buildCounterInventorySource--;
}

core.int buildCounterInventorySourceAssignedTargetingOptionDetails = 0;
buildInventorySourceAssignedTargetingOptionDetails() {
  var o = new api.InventorySourceAssignedTargetingOptionDetails();
  buildCounterInventorySourceAssignedTargetingOptionDetails++;
  if (buildCounterInventorySourceAssignedTargetingOptionDetails < 3) {
    o.inventorySourceId = "foo";
  }
  buildCounterInventorySourceAssignedTargetingOptionDetails--;
  return o;
}

checkInventorySourceAssignedTargetingOptionDetails(
    api.InventorySourceAssignedTargetingOptionDetails o) {
  buildCounterInventorySourceAssignedTargetingOptionDetails++;
  if (buildCounterInventorySourceAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.inventorySourceId, unittest.equals('foo'));
  }
  buildCounterInventorySourceAssignedTargetingOptionDetails--;
}

core.int buildCounterInventorySourceDisplayCreativeConfig = 0;
buildInventorySourceDisplayCreativeConfig() {
  var o = new api.InventorySourceDisplayCreativeConfig();
  buildCounterInventorySourceDisplayCreativeConfig++;
  if (buildCounterInventorySourceDisplayCreativeConfig < 3) {
    o.creativeSize = buildDimensions();
  }
  buildCounterInventorySourceDisplayCreativeConfig--;
  return o;
}

checkInventorySourceDisplayCreativeConfig(
    api.InventorySourceDisplayCreativeConfig o) {
  buildCounterInventorySourceDisplayCreativeConfig++;
  if (buildCounterInventorySourceDisplayCreativeConfig < 3) {
    checkDimensions(o.creativeSize);
  }
  buildCounterInventorySourceDisplayCreativeConfig--;
}

buildUnnamed4035() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4035(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterInventorySourceFilter = 0;
buildInventorySourceFilter() {
  var o = new api.InventorySourceFilter();
  buildCounterInventorySourceFilter++;
  if (buildCounterInventorySourceFilter < 3) {
    o.inventorySourceIds = buildUnnamed4035();
  }
  buildCounterInventorySourceFilter--;
  return o;
}

checkInventorySourceFilter(api.InventorySourceFilter o) {
  buildCounterInventorySourceFilter++;
  if (buildCounterInventorySourceFilter < 3) {
    checkUnnamed4035(o.inventorySourceIds);
  }
  buildCounterInventorySourceFilter--;
}

core.int buildCounterInventorySourceGroup = 0;
buildInventorySourceGroup() {
  var o = new api.InventorySourceGroup();
  buildCounterInventorySourceGroup++;
  if (buildCounterInventorySourceGroup < 3) {
    o.displayName = "foo";
    o.inventorySourceGroupId = "foo";
    o.name = "foo";
  }
  buildCounterInventorySourceGroup--;
  return o;
}

checkInventorySourceGroup(api.InventorySourceGroup o) {
  buildCounterInventorySourceGroup++;
  if (buildCounterInventorySourceGroup < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.inventorySourceGroupId, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterInventorySourceGroup--;
}

core.int buildCounterInventorySourceGroupAssignedTargetingOptionDetails = 0;
buildInventorySourceGroupAssignedTargetingOptionDetails() {
  var o = new api.InventorySourceGroupAssignedTargetingOptionDetails();
  buildCounterInventorySourceGroupAssignedTargetingOptionDetails++;
  if (buildCounterInventorySourceGroupAssignedTargetingOptionDetails < 3) {
    o.inventorySourceGroupId = "foo";
  }
  buildCounterInventorySourceGroupAssignedTargetingOptionDetails--;
  return o;
}

checkInventorySourceGroupAssignedTargetingOptionDetails(
    api.InventorySourceGroupAssignedTargetingOptionDetails o) {
  buildCounterInventorySourceGroupAssignedTargetingOptionDetails++;
  if (buildCounterInventorySourceGroupAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.inventorySourceGroupId, unittest.equals('foo'));
  }
  buildCounterInventorySourceGroupAssignedTargetingOptionDetails--;
}

core.int buildCounterInventorySourceStatus = 0;
buildInventorySourceStatus() {
  var o = new api.InventorySourceStatus();
  buildCounterInventorySourceStatus++;
  if (buildCounterInventorySourceStatus < 3) {
    o.configStatus = "foo";
    o.entityPauseReason = "foo";
    o.entityStatus = "foo";
    o.sellerPauseReason = "foo";
    o.sellerStatus = "foo";
  }
  buildCounterInventorySourceStatus--;
  return o;
}

checkInventorySourceStatus(api.InventorySourceStatus o) {
  buildCounterInventorySourceStatus++;
  if (buildCounterInventorySourceStatus < 3) {
    unittest.expect(o.configStatus, unittest.equals('foo'));
    unittest.expect(o.entityPauseReason, unittest.equals('foo'));
    unittest.expect(o.entityStatus, unittest.equals('foo'));
    unittest.expect(o.sellerPauseReason, unittest.equals('foo'));
    unittest.expect(o.sellerStatus, unittest.equals('foo'));
  }
  buildCounterInventorySourceStatus--;
}

core.int buildCounterInventorySourceVideoCreativeConfig = 0;
buildInventorySourceVideoCreativeConfig() {
  var o = new api.InventorySourceVideoCreativeConfig();
  buildCounterInventorySourceVideoCreativeConfig++;
  if (buildCounterInventorySourceVideoCreativeConfig < 3) {
    o.duration = "foo";
  }
  buildCounterInventorySourceVideoCreativeConfig--;
  return o;
}

checkInventorySourceVideoCreativeConfig(
    api.InventorySourceVideoCreativeConfig o) {
  buildCounterInventorySourceVideoCreativeConfig++;
  if (buildCounterInventorySourceVideoCreativeConfig < 3) {
    unittest.expect(o.duration, unittest.equals('foo'));
  }
  buildCounterInventorySourceVideoCreativeConfig--;
}

core.int buildCounterKeywordAssignedTargetingOptionDetails = 0;
buildKeywordAssignedTargetingOptionDetails() {
  var o = new api.KeywordAssignedTargetingOptionDetails();
  buildCounterKeywordAssignedTargetingOptionDetails++;
  if (buildCounterKeywordAssignedTargetingOptionDetails < 3) {
    o.keyword = "foo";
    o.negative = true;
  }
  buildCounterKeywordAssignedTargetingOptionDetails--;
  return o;
}

checkKeywordAssignedTargetingOptionDetails(
    api.KeywordAssignedTargetingOptionDetails o) {
  buildCounterKeywordAssignedTargetingOptionDetails++;
  if (buildCounterKeywordAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.keyword, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
  }
  buildCounterKeywordAssignedTargetingOptionDetails--;
}

core.int buildCounterLanguageAssignedTargetingOptionDetails = 0;
buildLanguageAssignedTargetingOptionDetails() {
  var o = new api.LanguageAssignedTargetingOptionDetails();
  buildCounterLanguageAssignedTargetingOptionDetails++;
  if (buildCounterLanguageAssignedTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.negative = true;
    o.targetingOptionId = "foo";
  }
  buildCounterLanguageAssignedTargetingOptionDetails--;
  return o;
}

checkLanguageAssignedTargetingOptionDetails(
    api.LanguageAssignedTargetingOptionDetails o) {
  buildCounterLanguageAssignedTargetingOptionDetails++;
  if (buildCounterLanguageAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterLanguageAssignedTargetingOptionDetails--;
}

core.int buildCounterLanguageTargetingOptionDetails = 0;
buildLanguageTargetingOptionDetails() {
  var o = new api.LanguageTargetingOptionDetails();
  buildCounterLanguageTargetingOptionDetails++;
  if (buildCounterLanguageTargetingOptionDetails < 3) {
    o.displayName = "foo";
  }
  buildCounterLanguageTargetingOptionDetails--;
  return o;
}

checkLanguageTargetingOptionDetails(api.LanguageTargetingOptionDetails o) {
  buildCounterLanguageTargetingOptionDetails++;
  if (buildCounterLanguageTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
  }
  buildCounterLanguageTargetingOptionDetails--;
}

buildUnnamed4036() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4036(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4037() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4037(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4038() {
  var o = new core.List<api.PartnerCost>();
  o.add(buildPartnerCost());
  o.add(buildPartnerCost());
  return o;
}

checkUnnamed4038(core.List<api.PartnerCost> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPartnerCost(o[0]);
  checkPartnerCost(o[1]);
}

core.int buildCounterLineItem = 0;
buildLineItem() {
  var o = new api.LineItem();
  buildCounterLineItem++;
  if (buildCounterLineItem < 3) {
    o.advertiserId = "foo";
    o.bidStrategy = buildBiddingStrategy();
    o.budget = buildLineItemBudget();
    o.campaignId = "foo";
    o.conversionCounting = buildConversionCountingConfig();
    o.creativeIds = buildUnnamed4036();
    o.displayName = "foo";
    o.entityStatus = "foo";
    o.flight = buildLineItemFlight();
    o.frequencyCap = buildFrequencyCap();
    o.insertionOrderId = "foo";
    o.integrationDetails = buildIntegrationDetails();
    o.inventorySourceIds = buildUnnamed4037();
    o.lineItemId = "foo";
    o.lineItemType = "foo";
    o.name = "foo";
    o.pacing = buildPacing();
    o.partnerCosts = buildUnnamed4038();
    o.partnerRevenueModel = buildPartnerRevenueModel();
    o.updateTime = "foo";
  }
  buildCounterLineItem--;
  return o;
}

checkLineItem(api.LineItem o) {
  buildCounterLineItem++;
  if (buildCounterLineItem < 3) {
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    checkBiddingStrategy(o.bidStrategy);
    checkLineItemBudget(o.budget);
    unittest.expect(o.campaignId, unittest.equals('foo'));
    checkConversionCountingConfig(o.conversionCounting);
    checkUnnamed4036(o.creativeIds);
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.entityStatus, unittest.equals('foo'));
    checkLineItemFlight(o.flight);
    checkFrequencyCap(o.frequencyCap);
    unittest.expect(o.insertionOrderId, unittest.equals('foo'));
    checkIntegrationDetails(o.integrationDetails);
    checkUnnamed4037(o.inventorySourceIds);
    unittest.expect(o.lineItemId, unittest.equals('foo'));
    unittest.expect(o.lineItemType, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkPacing(o.pacing);
    checkUnnamed4038(o.partnerCosts);
    checkPartnerRevenueModel(o.partnerRevenueModel);
    unittest.expect(o.updateTime, unittest.equals('foo'));
  }
  buildCounterLineItem--;
}

core.int buildCounterLineItemBudget = 0;
buildLineItemBudget() {
  var o = new api.LineItemBudget();
  buildCounterLineItemBudget++;
  if (buildCounterLineItemBudget < 3) {
    o.budgetAllocationType = "foo";
    o.budgetUnit = "foo";
    o.maxAmount = "foo";
  }
  buildCounterLineItemBudget--;
  return o;
}

checkLineItemBudget(api.LineItemBudget o) {
  buildCounterLineItemBudget++;
  if (buildCounterLineItemBudget < 3) {
    unittest.expect(o.budgetAllocationType, unittest.equals('foo'));
    unittest.expect(o.budgetUnit, unittest.equals('foo'));
    unittest.expect(o.maxAmount, unittest.equals('foo'));
  }
  buildCounterLineItemBudget--;
}

core.int buildCounterLineItemFlight = 0;
buildLineItemFlight() {
  var o = new api.LineItemFlight();
  buildCounterLineItemFlight++;
  if (buildCounterLineItemFlight < 3) {
    o.dateRange = buildDateRange();
    o.flightDateType = "foo";
  }
  buildCounterLineItemFlight--;
  return o;
}

checkLineItemFlight(api.LineItemFlight o) {
  buildCounterLineItemFlight++;
  if (buildCounterLineItemFlight < 3) {
    checkDateRange(o.dateRange);
    unittest.expect(o.flightDateType, unittest.equals('foo'));
  }
  buildCounterLineItemFlight--;
}

buildUnnamed4039() {
  var o = new core.List<api.Advertiser>();
  o.add(buildAdvertiser());
  o.add(buildAdvertiser());
  return o;
}

checkUnnamed4039(core.List<api.Advertiser> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAdvertiser(o[0]);
  checkAdvertiser(o[1]);
}

core.int buildCounterListAdvertisersResponse = 0;
buildListAdvertisersResponse() {
  var o = new api.ListAdvertisersResponse();
  buildCounterListAdvertisersResponse++;
  if (buildCounterListAdvertisersResponse < 3) {
    o.advertisers = buildUnnamed4039();
    o.nextPageToken = "foo";
  }
  buildCounterListAdvertisersResponse--;
  return o;
}

checkListAdvertisersResponse(api.ListAdvertisersResponse o) {
  buildCounterListAdvertisersResponse++;
  if (buildCounterListAdvertisersResponse < 3) {
    checkUnnamed4039(o.advertisers);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListAdvertisersResponse--;
}

buildUnnamed4040() {
  var o = new core.List<api.Campaign>();
  o.add(buildCampaign());
  o.add(buildCampaign());
  return o;
}

checkUnnamed4040(core.List<api.Campaign> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCampaign(o[0]);
  checkCampaign(o[1]);
}

core.int buildCounterListCampaignsResponse = 0;
buildListCampaignsResponse() {
  var o = new api.ListCampaignsResponse();
  buildCounterListCampaignsResponse++;
  if (buildCounterListCampaignsResponse < 3) {
    o.campaigns = buildUnnamed4040();
    o.nextPageToken = "foo";
  }
  buildCounterListCampaignsResponse--;
  return o;
}

checkListCampaignsResponse(api.ListCampaignsResponse o) {
  buildCounterListCampaignsResponse++;
  if (buildCounterListCampaignsResponse < 3) {
    checkUnnamed4040(o.campaigns);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListCampaignsResponse--;
}

buildUnnamed4041() {
  var o = new core.List<api.Channel>();
  o.add(buildChannel());
  o.add(buildChannel());
  return o;
}

checkUnnamed4041(core.List<api.Channel> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkChannel(o[0]);
  checkChannel(o[1]);
}

core.int buildCounterListChannelsResponse = 0;
buildListChannelsResponse() {
  var o = new api.ListChannelsResponse();
  buildCounterListChannelsResponse++;
  if (buildCounterListChannelsResponse < 3) {
    o.channels = buildUnnamed4041();
    o.nextPageToken = "foo";
  }
  buildCounterListChannelsResponse--;
  return o;
}

checkListChannelsResponse(api.ListChannelsResponse o) {
  buildCounterListChannelsResponse++;
  if (buildCounterListChannelsResponse < 3) {
    checkUnnamed4041(o.channels);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListChannelsResponse--;
}

buildUnnamed4042() {
  var o = new core.List<api.CombinedAudience>();
  o.add(buildCombinedAudience());
  o.add(buildCombinedAudience());
  return o;
}

checkUnnamed4042(core.List<api.CombinedAudience> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCombinedAudience(o[0]);
  checkCombinedAudience(o[1]);
}

core.int buildCounterListCombinedAudiencesResponse = 0;
buildListCombinedAudiencesResponse() {
  var o = new api.ListCombinedAudiencesResponse();
  buildCounterListCombinedAudiencesResponse++;
  if (buildCounterListCombinedAudiencesResponse < 3) {
    o.combinedAudiences = buildUnnamed4042();
    o.nextPageToken = "foo";
  }
  buildCounterListCombinedAudiencesResponse--;
  return o;
}

checkListCombinedAudiencesResponse(api.ListCombinedAudiencesResponse o) {
  buildCounterListCombinedAudiencesResponse++;
  if (buildCounterListCombinedAudiencesResponse < 3) {
    checkUnnamed4042(o.combinedAudiences);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListCombinedAudiencesResponse--;
}

buildUnnamed4043() {
  var o = new core.List<api.Creative>();
  o.add(buildCreative());
  o.add(buildCreative());
  return o;
}

checkUnnamed4043(core.List<api.Creative> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCreative(o[0]);
  checkCreative(o[1]);
}

core.int buildCounterListCreativesResponse = 0;
buildListCreativesResponse() {
  var o = new api.ListCreativesResponse();
  buildCounterListCreativesResponse++;
  if (buildCounterListCreativesResponse < 3) {
    o.creatives = buildUnnamed4043();
    o.nextPageToken = "foo";
  }
  buildCounterListCreativesResponse--;
  return o;
}

checkListCreativesResponse(api.ListCreativesResponse o) {
  buildCounterListCreativesResponse++;
  if (buildCounterListCreativesResponse < 3) {
    checkUnnamed4043(o.creatives);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListCreativesResponse--;
}

buildUnnamed4044() {
  var o = new core.List<api.CustomList>();
  o.add(buildCustomList());
  o.add(buildCustomList());
  return o;
}

checkUnnamed4044(core.List<api.CustomList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomList(o[0]);
  checkCustomList(o[1]);
}

core.int buildCounterListCustomListsResponse = 0;
buildListCustomListsResponse() {
  var o = new api.ListCustomListsResponse();
  buildCounterListCustomListsResponse++;
  if (buildCounterListCustomListsResponse < 3) {
    o.customLists = buildUnnamed4044();
    o.nextPageToken = "foo";
  }
  buildCounterListCustomListsResponse--;
  return o;
}

checkListCustomListsResponse(api.ListCustomListsResponse o) {
  buildCounterListCustomListsResponse++;
  if (buildCounterListCustomListsResponse < 3) {
    checkUnnamed4044(o.customLists);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListCustomListsResponse--;
}

buildUnnamed4045() {
  var o = new core.List<api.FirstAndThirdPartyAudience>();
  o.add(buildFirstAndThirdPartyAudience());
  o.add(buildFirstAndThirdPartyAudience());
  return o;
}

checkUnnamed4045(core.List<api.FirstAndThirdPartyAudience> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFirstAndThirdPartyAudience(o[0]);
  checkFirstAndThirdPartyAudience(o[1]);
}

core.int buildCounterListFirstAndThirdPartyAudiencesResponse = 0;
buildListFirstAndThirdPartyAudiencesResponse() {
  var o = new api.ListFirstAndThirdPartyAudiencesResponse();
  buildCounterListFirstAndThirdPartyAudiencesResponse++;
  if (buildCounterListFirstAndThirdPartyAudiencesResponse < 3) {
    o.firstAndThirdPartyAudiences = buildUnnamed4045();
    o.nextPageToken = "foo";
  }
  buildCounterListFirstAndThirdPartyAudiencesResponse--;
  return o;
}

checkListFirstAndThirdPartyAudiencesResponse(
    api.ListFirstAndThirdPartyAudiencesResponse o) {
  buildCounterListFirstAndThirdPartyAudiencesResponse++;
  if (buildCounterListFirstAndThirdPartyAudiencesResponse < 3) {
    checkUnnamed4045(o.firstAndThirdPartyAudiences);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListFirstAndThirdPartyAudiencesResponse--;
}

buildUnnamed4046() {
  var o = new core.List<api.GoogleAudience>();
  o.add(buildGoogleAudience());
  o.add(buildGoogleAudience());
  return o;
}

checkUnnamed4046(core.List<api.GoogleAudience> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkGoogleAudience(o[0]);
  checkGoogleAudience(o[1]);
}

core.int buildCounterListGoogleAudiencesResponse = 0;
buildListGoogleAudiencesResponse() {
  var o = new api.ListGoogleAudiencesResponse();
  buildCounterListGoogleAudiencesResponse++;
  if (buildCounterListGoogleAudiencesResponse < 3) {
    o.googleAudiences = buildUnnamed4046();
    o.nextPageToken = "foo";
  }
  buildCounterListGoogleAudiencesResponse--;
  return o;
}

checkListGoogleAudiencesResponse(api.ListGoogleAudiencesResponse o) {
  buildCounterListGoogleAudiencesResponse++;
  if (buildCounterListGoogleAudiencesResponse < 3) {
    checkUnnamed4046(o.googleAudiences);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListGoogleAudiencesResponse--;
}

buildUnnamed4047() {
  var o = new core.List<api.InsertionOrder>();
  o.add(buildInsertionOrder());
  o.add(buildInsertionOrder());
  return o;
}

checkUnnamed4047(core.List<api.InsertionOrder> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInsertionOrder(o[0]);
  checkInsertionOrder(o[1]);
}

core.int buildCounterListInsertionOrdersResponse = 0;
buildListInsertionOrdersResponse() {
  var o = new api.ListInsertionOrdersResponse();
  buildCounterListInsertionOrdersResponse++;
  if (buildCounterListInsertionOrdersResponse < 3) {
    o.insertionOrders = buildUnnamed4047();
    o.nextPageToken = "foo";
  }
  buildCounterListInsertionOrdersResponse--;
  return o;
}

checkListInsertionOrdersResponse(api.ListInsertionOrdersResponse o) {
  buildCounterListInsertionOrdersResponse++;
  if (buildCounterListInsertionOrdersResponse < 3) {
    checkUnnamed4047(o.insertionOrders);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListInsertionOrdersResponse--;
}

buildUnnamed4048() {
  var o = new core.List<api.InventorySourceGroup>();
  o.add(buildInventorySourceGroup());
  o.add(buildInventorySourceGroup());
  return o;
}

checkUnnamed4048(core.List<api.InventorySourceGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInventorySourceGroup(o[0]);
  checkInventorySourceGroup(o[1]);
}

core.int buildCounterListInventorySourceGroupsResponse = 0;
buildListInventorySourceGroupsResponse() {
  var o = new api.ListInventorySourceGroupsResponse();
  buildCounterListInventorySourceGroupsResponse++;
  if (buildCounterListInventorySourceGroupsResponse < 3) {
    o.inventorySourceGroups = buildUnnamed4048();
    o.nextPageToken = "foo";
  }
  buildCounterListInventorySourceGroupsResponse--;
  return o;
}

checkListInventorySourceGroupsResponse(
    api.ListInventorySourceGroupsResponse o) {
  buildCounterListInventorySourceGroupsResponse++;
  if (buildCounterListInventorySourceGroupsResponse < 3) {
    checkUnnamed4048(o.inventorySourceGroups);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListInventorySourceGroupsResponse--;
}

buildUnnamed4049() {
  var o = new core.List<api.InventorySource>();
  o.add(buildInventorySource());
  o.add(buildInventorySource());
  return o;
}

checkUnnamed4049(core.List<api.InventorySource> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInventorySource(o[0]);
  checkInventorySource(o[1]);
}

core.int buildCounterListInventorySourcesResponse = 0;
buildListInventorySourcesResponse() {
  var o = new api.ListInventorySourcesResponse();
  buildCounterListInventorySourcesResponse++;
  if (buildCounterListInventorySourcesResponse < 3) {
    o.inventorySources = buildUnnamed4049();
    o.nextPageToken = "foo";
  }
  buildCounterListInventorySourcesResponse--;
  return o;
}

checkListInventorySourcesResponse(api.ListInventorySourcesResponse o) {
  buildCounterListInventorySourcesResponse++;
  if (buildCounterListInventorySourcesResponse < 3) {
    checkUnnamed4049(o.inventorySources);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListInventorySourcesResponse--;
}

buildUnnamed4050() {
  var o = new core.List<api.AssignedTargetingOption>();
  o.add(buildAssignedTargetingOption());
  o.add(buildAssignedTargetingOption());
  return o;
}

checkUnnamed4050(core.List<api.AssignedTargetingOption> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAssignedTargetingOption(o[0]);
  checkAssignedTargetingOption(o[1]);
}

core.int buildCounterListLineItemAssignedTargetingOptionsResponse = 0;
buildListLineItemAssignedTargetingOptionsResponse() {
  var o = new api.ListLineItemAssignedTargetingOptionsResponse();
  buildCounterListLineItemAssignedTargetingOptionsResponse++;
  if (buildCounterListLineItemAssignedTargetingOptionsResponse < 3) {
    o.assignedTargetingOptions = buildUnnamed4050();
    o.nextPageToken = "foo";
  }
  buildCounterListLineItemAssignedTargetingOptionsResponse--;
  return o;
}

checkListLineItemAssignedTargetingOptionsResponse(
    api.ListLineItemAssignedTargetingOptionsResponse o) {
  buildCounterListLineItemAssignedTargetingOptionsResponse++;
  if (buildCounterListLineItemAssignedTargetingOptionsResponse < 3) {
    checkUnnamed4050(o.assignedTargetingOptions);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListLineItemAssignedTargetingOptionsResponse--;
}

buildUnnamed4051() {
  var o = new core.List<api.LineItem>();
  o.add(buildLineItem());
  o.add(buildLineItem());
  return o;
}

checkUnnamed4051(core.List<api.LineItem> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLineItem(o[0]);
  checkLineItem(o[1]);
}

core.int buildCounterListLineItemsResponse = 0;
buildListLineItemsResponse() {
  var o = new api.ListLineItemsResponse();
  buildCounterListLineItemsResponse++;
  if (buildCounterListLineItemsResponse < 3) {
    o.lineItems = buildUnnamed4051();
    o.nextPageToken = "foo";
  }
  buildCounterListLineItemsResponse--;
  return o;
}

checkListLineItemsResponse(api.ListLineItemsResponse o) {
  buildCounterListLineItemsResponse++;
  if (buildCounterListLineItemsResponse < 3) {
    checkUnnamed4051(o.lineItems);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListLineItemsResponse--;
}

buildUnnamed4052() {
  var o = new core.List<api.LocationList>();
  o.add(buildLocationList());
  o.add(buildLocationList());
  return o;
}

checkUnnamed4052(core.List<api.LocationList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLocationList(o[0]);
  checkLocationList(o[1]);
}

core.int buildCounterListLocationListsResponse = 0;
buildListLocationListsResponse() {
  var o = new api.ListLocationListsResponse();
  buildCounterListLocationListsResponse++;
  if (buildCounterListLocationListsResponse < 3) {
    o.locationLists = buildUnnamed4052();
    o.nextPageToken = "foo";
  }
  buildCounterListLocationListsResponse--;
  return o;
}

checkListLocationListsResponse(api.ListLocationListsResponse o) {
  buildCounterListLocationListsResponse++;
  if (buildCounterListLocationListsResponse < 3) {
    checkUnnamed4052(o.locationLists);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListLocationListsResponse--;
}

buildUnnamed4053() {
  var o = new core.List<api.NegativeKeywordList>();
  o.add(buildNegativeKeywordList());
  o.add(buildNegativeKeywordList());
  return o;
}

checkUnnamed4053(core.List<api.NegativeKeywordList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNegativeKeywordList(o[0]);
  checkNegativeKeywordList(o[1]);
}

core.int buildCounterListNegativeKeywordListsResponse = 0;
buildListNegativeKeywordListsResponse() {
  var o = new api.ListNegativeKeywordListsResponse();
  buildCounterListNegativeKeywordListsResponse++;
  if (buildCounterListNegativeKeywordListsResponse < 3) {
    o.negativeKeywordLists = buildUnnamed4053();
    o.nextPageToken = "foo";
  }
  buildCounterListNegativeKeywordListsResponse--;
  return o;
}

checkListNegativeKeywordListsResponse(api.ListNegativeKeywordListsResponse o) {
  buildCounterListNegativeKeywordListsResponse++;
  if (buildCounterListNegativeKeywordListsResponse < 3) {
    checkUnnamed4053(o.negativeKeywordLists);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListNegativeKeywordListsResponse--;
}

buildUnnamed4054() {
  var o = new core.List<api.TargetingOption>();
  o.add(buildTargetingOption());
  o.add(buildTargetingOption());
  return o;
}

checkUnnamed4054(core.List<api.TargetingOption> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetingOption(o[0]);
  checkTargetingOption(o[1]);
}

core.int buildCounterListTargetingOptionsResponse = 0;
buildListTargetingOptionsResponse() {
  var o = new api.ListTargetingOptionsResponse();
  buildCounterListTargetingOptionsResponse++;
  if (buildCounterListTargetingOptionsResponse < 3) {
    o.nextPageToken = "foo";
    o.targetingOptions = buildUnnamed4054();
  }
  buildCounterListTargetingOptionsResponse--;
  return o;
}

checkListTargetingOptionsResponse(api.ListTargetingOptionsResponse o) {
  buildCounterListTargetingOptionsResponse++;
  if (buildCounterListTargetingOptionsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed4054(o.targetingOptions);
  }
  buildCounterListTargetingOptionsResponse--;
}

core.int buildCounterLocationList = 0;
buildLocationList() {
  var o = new api.LocationList();
  buildCounterLocationList++;
  if (buildCounterLocationList < 3) {
    o.advertiserId = "foo";
    o.displayName = "foo";
    o.locationListId = "foo";
    o.locationType = "foo";
    o.name = "foo";
  }
  buildCounterLocationList--;
  return o;
}

checkLocationList(api.LocationList o) {
  buildCounterLocationList++;
  if (buildCounterLocationList < 3) {
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.locationListId, unittest.equals('foo'));
    unittest.expect(o.locationType, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterLocationList--;
}

core.int buildCounterLookbackWindow = 0;
buildLookbackWindow() {
  var o = new api.LookbackWindow();
  buildCounterLookbackWindow++;
  if (buildCounterLookbackWindow < 3) {
    o.clickDays = 42;
    o.impressionDays = 42;
  }
  buildCounterLookbackWindow--;
  return o;
}

checkLookbackWindow(api.LookbackWindow o) {
  buildCounterLookbackWindow++;
  if (buildCounterLookbackWindow < 3) {
    unittest.expect(o.clickDays, unittest.equals(42));
    unittest.expect(o.impressionDays, unittest.equals(42));
  }
  buildCounterLookbackWindow--;
}

core.int buildCounterMaximizeSpendBidStrategy = 0;
buildMaximizeSpendBidStrategy() {
  var o = new api.MaximizeSpendBidStrategy();
  buildCounterMaximizeSpendBidStrategy++;
  if (buildCounterMaximizeSpendBidStrategy < 3) {
    o.maxAverageCpmBidAmountMicros = "foo";
    o.performanceGoalType = "foo";
  }
  buildCounterMaximizeSpendBidStrategy--;
  return o;
}

checkMaximizeSpendBidStrategy(api.MaximizeSpendBidStrategy o) {
  buildCounterMaximizeSpendBidStrategy++;
  if (buildCounterMaximizeSpendBidStrategy < 3) {
    unittest.expect(o.maxAverageCpmBidAmountMicros, unittest.equals('foo'));
    unittest.expect(o.performanceGoalType, unittest.equals('foo'));
  }
  buildCounterMaximizeSpendBidStrategy--;
}

core.int buildCounterMoney = 0;
buildMoney() {
  var o = new api.Money();
  buildCounterMoney++;
  if (buildCounterMoney < 3) {
    o.currencyCode = "foo";
    o.nanos = 42;
    o.units = "foo";
  }
  buildCounterMoney--;
  return o;
}

checkMoney(api.Money o) {
  buildCounterMoney++;
  if (buildCounterMoney < 3) {
    unittest.expect(o.currencyCode, unittest.equals('foo'));
    unittest.expect(o.nanos, unittest.equals(42));
    unittest.expect(o.units, unittest.equals('foo'));
  }
  buildCounterMoney--;
}

core.int buildCounterNegativeKeywordList = 0;
buildNegativeKeywordList() {
  var o = new api.NegativeKeywordList();
  buildCounterNegativeKeywordList++;
  if (buildCounterNegativeKeywordList < 3) {
    o.advertiserId = "foo";
    o.displayName = "foo";
    o.name = "foo";
    o.negativeKeywordListId = "foo";
  }
  buildCounterNegativeKeywordList--;
  return o;
}

checkNegativeKeywordList(api.NegativeKeywordList o) {
  buildCounterNegativeKeywordList++;
  if (buildCounterNegativeKeywordList < 3) {
    unittest.expect(o.advertiserId, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.negativeKeywordListId, unittest.equals('foo'));
  }
  buildCounterNegativeKeywordList--;
}

core.int buildCounterNegativeKeywordListAssignedTargetingOptionDetails = 0;
buildNegativeKeywordListAssignedTargetingOptionDetails() {
  var o = new api.NegativeKeywordListAssignedTargetingOptionDetails();
  buildCounterNegativeKeywordListAssignedTargetingOptionDetails++;
  if (buildCounterNegativeKeywordListAssignedTargetingOptionDetails < 3) {
    o.negativeKeywordListId = "foo";
  }
  buildCounterNegativeKeywordListAssignedTargetingOptionDetails--;
  return o;
}

checkNegativeKeywordListAssignedTargetingOptionDetails(
    api.NegativeKeywordListAssignedTargetingOptionDetails o) {
  buildCounterNegativeKeywordListAssignedTargetingOptionDetails++;
  if (buildCounterNegativeKeywordListAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.negativeKeywordListId, unittest.equals('foo'));
  }
  buildCounterNegativeKeywordListAssignedTargetingOptionDetails--;
}

core.int buildCounterObaIcon = 0;
buildObaIcon() {
  var o = new api.ObaIcon();
  buildCounterObaIcon++;
  if (buildCounterObaIcon < 3) {
    o.clickTrackingUrl = "foo";
    o.dimensions = buildDimensions();
    o.landingPageUrl = "foo";
    o.position = "foo";
    o.program = "foo";
    o.resourceMimeType = "foo";
    o.resourceUrl = "foo";
    o.viewTrackingUrl = "foo";
  }
  buildCounterObaIcon--;
  return o;
}

checkObaIcon(api.ObaIcon o) {
  buildCounterObaIcon++;
  if (buildCounterObaIcon < 3) {
    unittest.expect(o.clickTrackingUrl, unittest.equals('foo'));
    checkDimensions(o.dimensions);
    unittest.expect(o.landingPageUrl, unittest.equals('foo'));
    unittest.expect(o.position, unittest.equals('foo'));
    unittest.expect(o.program, unittest.equals('foo'));
    unittest.expect(o.resourceMimeType, unittest.equals('foo'));
    unittest.expect(o.resourceUrl, unittest.equals('foo'));
    unittest.expect(o.viewTrackingUrl, unittest.equals('foo'));
  }
  buildCounterObaIcon--;
}

core.int buildCounterOnScreenPositionAssignedTargetingOptionDetails = 0;
buildOnScreenPositionAssignedTargetingOptionDetails() {
  var o = new api.OnScreenPositionAssignedTargetingOptionDetails();
  buildCounterOnScreenPositionAssignedTargetingOptionDetails++;
  if (buildCounterOnScreenPositionAssignedTargetingOptionDetails < 3) {
    o.onScreenPosition = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterOnScreenPositionAssignedTargetingOptionDetails--;
  return o;
}

checkOnScreenPositionAssignedTargetingOptionDetails(
    api.OnScreenPositionAssignedTargetingOptionDetails o) {
  buildCounterOnScreenPositionAssignedTargetingOptionDetails++;
  if (buildCounterOnScreenPositionAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.onScreenPosition, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterOnScreenPositionAssignedTargetingOptionDetails--;
}

core.int buildCounterOnScreenPositionTargetingOptionDetails = 0;
buildOnScreenPositionTargetingOptionDetails() {
  var o = new api.OnScreenPositionTargetingOptionDetails();
  buildCounterOnScreenPositionTargetingOptionDetails++;
  if (buildCounterOnScreenPositionTargetingOptionDetails < 3) {
    o.onScreenPosition = "foo";
  }
  buildCounterOnScreenPositionTargetingOptionDetails--;
  return o;
}

checkOnScreenPositionTargetingOptionDetails(
    api.OnScreenPositionTargetingOptionDetails o) {
  buildCounterOnScreenPositionTargetingOptionDetails++;
  if (buildCounterOnScreenPositionTargetingOptionDetails < 3) {
    unittest.expect(o.onScreenPosition, unittest.equals('foo'));
  }
  buildCounterOnScreenPositionTargetingOptionDetails--;
}

core.int buildCounterOperatingSystemAssignedTargetingOptionDetails = 0;
buildOperatingSystemAssignedTargetingOptionDetails() {
  var o = new api.OperatingSystemAssignedTargetingOptionDetails();
  buildCounterOperatingSystemAssignedTargetingOptionDetails++;
  if (buildCounterOperatingSystemAssignedTargetingOptionDetails < 3) {
    o.displayName = "foo";
    o.negative = true;
    o.targetingOptionId = "foo";
  }
  buildCounterOperatingSystemAssignedTargetingOptionDetails--;
  return o;
}

checkOperatingSystemAssignedTargetingOptionDetails(
    api.OperatingSystemAssignedTargetingOptionDetails o) {
  buildCounterOperatingSystemAssignedTargetingOptionDetails++;
  if (buildCounterOperatingSystemAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterOperatingSystemAssignedTargetingOptionDetails--;
}

core.int buildCounterOperatingSystemTargetingOptionDetails = 0;
buildOperatingSystemTargetingOptionDetails() {
  var o = new api.OperatingSystemTargetingOptionDetails();
  buildCounterOperatingSystemTargetingOptionDetails++;
  if (buildCounterOperatingSystemTargetingOptionDetails < 3) {
    o.displayName = "foo";
  }
  buildCounterOperatingSystemTargetingOptionDetails--;
  return o;
}

checkOperatingSystemTargetingOptionDetails(
    api.OperatingSystemTargetingOptionDetails o) {
  buildCounterOperatingSystemTargetingOptionDetails++;
  if (buildCounterOperatingSystemTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
  }
  buildCounterOperatingSystemTargetingOptionDetails--;
}

buildUnnamed4055() {
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

checkUnnamed4055(core.Map<core.String, core.Object> o) {
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

buildUnnamed4056() {
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

checkUnnamed4056(core.Map<core.String, core.Object> o) {
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

core.int buildCounterOperation = 0;
buildOperation() {
  var o = new api.Operation();
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    o.done = true;
    o.error = buildStatus();
    o.metadata = buildUnnamed4055();
    o.name = "foo";
    o.response = buildUnnamed4056();
  }
  buildCounterOperation--;
  return o;
}

checkOperation(api.Operation o) {
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    unittest.expect(o.done, unittest.isTrue);
    checkStatus(o.error);
    checkUnnamed4055(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed4056(o.response);
  }
  buildCounterOperation--;
}

core.int buildCounterPacing = 0;
buildPacing() {
  var o = new api.Pacing();
  buildCounterPacing++;
  if (buildCounterPacing < 3) {
    o.dailyMaxImpressions = "foo";
    o.dailyMaxMicros = "foo";
    o.pacingPeriod = "foo";
    o.pacingType = "foo";
  }
  buildCounterPacing--;
  return o;
}

checkPacing(api.Pacing o) {
  buildCounterPacing++;
  if (buildCounterPacing < 3) {
    unittest.expect(o.dailyMaxImpressions, unittest.equals('foo'));
    unittest.expect(o.dailyMaxMicros, unittest.equals('foo'));
    unittest.expect(o.pacingPeriod, unittest.equals('foo'));
    unittest.expect(o.pacingType, unittest.equals('foo'));
  }
  buildCounterPacing--;
}

buildUnnamed4057() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4057(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed4058() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed4058(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterParentEntityFilter = 0;
buildParentEntityFilter() {
  var o = new api.ParentEntityFilter();
  buildCounterParentEntityFilter++;
  if (buildCounterParentEntityFilter < 3) {
    o.fileType = buildUnnamed4057();
    o.filterIds = buildUnnamed4058();
    o.filterType = "foo";
  }
  buildCounterParentEntityFilter--;
  return o;
}

checkParentEntityFilter(api.ParentEntityFilter o) {
  buildCounterParentEntityFilter++;
  if (buildCounterParentEntityFilter < 3) {
    checkUnnamed4057(o.fileType);
    checkUnnamed4058(o.filterIds);
    unittest.expect(o.filterType, unittest.equals('foo'));
  }
  buildCounterParentEntityFilter--;
}

core.int buildCounterParentalStatusAssignedTargetingOptionDetails = 0;
buildParentalStatusAssignedTargetingOptionDetails() {
  var o = new api.ParentalStatusAssignedTargetingOptionDetails();
  buildCounterParentalStatusAssignedTargetingOptionDetails++;
  if (buildCounterParentalStatusAssignedTargetingOptionDetails < 3) {
    o.parentalStatus = "foo";
    o.targetingOptionId = "foo";
  }
  buildCounterParentalStatusAssignedTargetingOptionDetails--;
  return o;
}

checkParentalStatusAssignedTargetingOptionDetails(
    api.ParentalStatusAssignedTargetingOptionDetails o) {
  buildCounterParentalStatusAssignedTargetingOptionDetails++;
  if (buildCounterParentalStatusAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.parentalStatus, unittest.equals('foo'));
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterParentalStatusAssignedTargetingOptionDetails--;
}

core.int buildCounterParentalStatusTargetingOptionDetails = 0;
buildParentalStatusTargetingOptionDetails() {
  var o = new api.ParentalStatusTargetingOptionDetails();
  buildCounterParentalStatusTargetingOptionDetails++;
  if (buildCounterParentalStatusTargetingOptionDetails < 3) {
    o.parentalStatus = "foo";
  }
  buildCounterParentalStatusTargetingOptionDetails--;
  return o;
}

checkParentalStatusTargetingOptionDetails(
    api.ParentalStatusTargetingOptionDetails o) {
  buildCounterParentalStatusTargetingOptionDetails++;
  if (buildCounterParentalStatusTargetingOptionDetails < 3) {
    unittest.expect(o.parentalStatus, unittest.equals('foo'));
  }
  buildCounterParentalStatusTargetingOptionDetails--;
}

core.int buildCounterPartnerCost = 0;
buildPartnerCost() {
  var o = new api.PartnerCost();
  buildCounterPartnerCost++;
  if (buildCounterPartnerCost < 3) {
    o.costType = "foo";
    o.feeAmount = "foo";
    o.feePercentageMillis = "foo";
    o.feeType = "foo";
    o.invoiceType = "foo";
  }
  buildCounterPartnerCost--;
  return o;
}

checkPartnerCost(api.PartnerCost o) {
  buildCounterPartnerCost++;
  if (buildCounterPartnerCost < 3) {
    unittest.expect(o.costType, unittest.equals('foo'));
    unittest.expect(o.feeAmount, unittest.equals('foo'));
    unittest.expect(o.feePercentageMillis, unittest.equals('foo'));
    unittest.expect(o.feeType, unittest.equals('foo'));
    unittest.expect(o.invoiceType, unittest.equals('foo'));
  }
  buildCounterPartnerCost--;
}

core.int buildCounterPartnerRevenueModel = 0;
buildPartnerRevenueModel() {
  var o = new api.PartnerRevenueModel();
  buildCounterPartnerRevenueModel++;
  if (buildCounterPartnerRevenueModel < 3) {
    o.markupAmount = "foo";
    o.markupType = "foo";
  }
  buildCounterPartnerRevenueModel--;
  return o;
}

checkPartnerRevenueModel(api.PartnerRevenueModel o) {
  buildCounterPartnerRevenueModel++;
  if (buildCounterPartnerRevenueModel < 3) {
    unittest.expect(o.markupAmount, unittest.equals('foo'));
    unittest.expect(o.markupType, unittest.equals('foo'));
  }
  buildCounterPartnerRevenueModel--;
}

core.int buildCounterPerformanceGoal = 0;
buildPerformanceGoal() {
  var o = new api.PerformanceGoal();
  buildCounterPerformanceGoal++;
  if (buildCounterPerformanceGoal < 3) {
    o.performanceGoalAmountMicros = "foo";
    o.performanceGoalPercentageMicros = "foo";
    o.performanceGoalString = "foo";
    o.performanceGoalType = "foo";
  }
  buildCounterPerformanceGoal--;
  return o;
}

checkPerformanceGoal(api.PerformanceGoal o) {
  buildCounterPerformanceGoal++;
  if (buildCounterPerformanceGoal < 3) {
    unittest.expect(o.performanceGoalAmountMicros, unittest.equals('foo'));
    unittest.expect(o.performanceGoalPercentageMicros, unittest.equals('foo'));
    unittest.expect(o.performanceGoalString, unittest.equals('foo'));
    unittest.expect(o.performanceGoalType, unittest.equals('foo'));
  }
  buildCounterPerformanceGoal--;
}

core.int buildCounterPerformanceGoalBidStrategy = 0;
buildPerformanceGoalBidStrategy() {
  var o = new api.PerformanceGoalBidStrategy();
  buildCounterPerformanceGoalBidStrategy++;
  if (buildCounterPerformanceGoalBidStrategy < 3) {
    o.maxAverageCpmBidAmountMicros = "foo";
    o.performanceGoalAmountMicros = "foo";
    o.performanceGoalType = "foo";
  }
  buildCounterPerformanceGoalBidStrategy--;
  return o;
}

checkPerformanceGoalBidStrategy(api.PerformanceGoalBidStrategy o) {
  buildCounterPerformanceGoalBidStrategy++;
  if (buildCounterPerformanceGoalBidStrategy < 3) {
    unittest.expect(o.maxAverageCpmBidAmountMicros, unittest.equals('foo'));
    unittest.expect(o.performanceGoalAmountMicros, unittest.equals('foo'));
    unittest.expect(o.performanceGoalType, unittest.equals('foo'));
  }
  buildCounterPerformanceGoalBidStrategy--;
}

core.int buildCounterProximityLocationListAssignedTargetingOptionDetails = 0;
buildProximityLocationListAssignedTargetingOptionDetails() {
  var o = new api.ProximityLocationListAssignedTargetingOptionDetails();
  buildCounterProximityLocationListAssignedTargetingOptionDetails++;
  if (buildCounterProximityLocationListAssignedTargetingOptionDetails < 3) {
    o.proximityLocationListId = "foo";
    o.proximityRadiusRange = "foo";
  }
  buildCounterProximityLocationListAssignedTargetingOptionDetails--;
  return o;
}

checkProximityLocationListAssignedTargetingOptionDetails(
    api.ProximityLocationListAssignedTargetingOptionDetails o) {
  buildCounterProximityLocationListAssignedTargetingOptionDetails++;
  if (buildCounterProximityLocationListAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.proximityLocationListId, unittest.equals('foo'));
    unittest.expect(o.proximityRadiusRange, unittest.equals('foo'));
  }
  buildCounterProximityLocationListAssignedTargetingOptionDetails--;
}

core.int buildCounterPublisherReviewStatus = 0;
buildPublisherReviewStatus() {
  var o = new api.PublisherReviewStatus();
  buildCounterPublisherReviewStatus++;
  if (buildCounterPublisherReviewStatus < 3) {
    o.publisherName = "foo";
    o.status = "foo";
  }
  buildCounterPublisherReviewStatus--;
  return o;
}

checkPublisherReviewStatus(api.PublisherReviewStatus o) {
  buildCounterPublisherReviewStatus++;
  if (buildCounterPublisherReviewStatus < 3) {
    unittest.expect(o.publisherName, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
  }
  buildCounterPublisherReviewStatus--;
}

core.int buildCounterRateDetails = 0;
buildRateDetails() {
  var o = new api.RateDetails();
  buildCounterRateDetails++;
  if (buildCounterRateDetails < 3) {
    o.inventorySourceRateType = "foo";
    o.minimumSpend = buildMoney();
    o.rate = buildMoney();
    o.unitsPurchased = "foo";
  }
  buildCounterRateDetails--;
  return o;
}

checkRateDetails(api.RateDetails o) {
  buildCounterRateDetails++;
  if (buildCounterRateDetails < 3) {
    unittest.expect(o.inventorySourceRateType, unittest.equals('foo'));
    checkMoney(o.minimumSpend);
    checkMoney(o.rate);
    unittest.expect(o.unitsPurchased, unittest.equals('foo'));
  }
  buildCounterRateDetails--;
}

core.int buildCounterRegionalLocationListAssignedTargetingOptionDetails = 0;
buildRegionalLocationListAssignedTargetingOptionDetails() {
  var o = new api.RegionalLocationListAssignedTargetingOptionDetails();
  buildCounterRegionalLocationListAssignedTargetingOptionDetails++;
  if (buildCounterRegionalLocationListAssignedTargetingOptionDetails < 3) {
    o.negative = true;
    o.regionalLocationListId = "foo";
  }
  buildCounterRegionalLocationListAssignedTargetingOptionDetails--;
  return o;
}

checkRegionalLocationListAssignedTargetingOptionDetails(
    api.RegionalLocationListAssignedTargetingOptionDetails o) {
  buildCounterRegionalLocationListAssignedTargetingOptionDetails++;
  if (buildCounterRegionalLocationListAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.regionalLocationListId, unittest.equals('foo'));
  }
  buildCounterRegionalLocationListAssignedTargetingOptionDetails--;
}

buildUnnamed4059() {
  var o = new core.List<api.ExchangeReviewStatus>();
  o.add(buildExchangeReviewStatus());
  o.add(buildExchangeReviewStatus());
  return o;
}

checkUnnamed4059(core.List<api.ExchangeReviewStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkExchangeReviewStatus(o[0]);
  checkExchangeReviewStatus(o[1]);
}

buildUnnamed4060() {
  var o = new core.List<api.PublisherReviewStatus>();
  o.add(buildPublisherReviewStatus());
  o.add(buildPublisherReviewStatus());
  return o;
}

checkUnnamed4060(core.List<api.PublisherReviewStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPublisherReviewStatus(o[0]);
  checkPublisherReviewStatus(o[1]);
}

core.int buildCounterReviewStatusInfo = 0;
buildReviewStatusInfo() {
  var o = new api.ReviewStatusInfo();
  buildCounterReviewStatusInfo++;
  if (buildCounterReviewStatusInfo < 3) {
    o.approvalStatus = "foo";
    o.contentAndPolicyReviewStatus = "foo";
    o.creativeAndLandingPageReviewStatus = "foo";
    o.exchangeReviewStatuses = buildUnnamed4059();
    o.publisherReviewStatuses = buildUnnamed4060();
  }
  buildCounterReviewStatusInfo--;
  return o;
}

checkReviewStatusInfo(api.ReviewStatusInfo o) {
  buildCounterReviewStatusInfo++;
  if (buildCounterReviewStatusInfo < 3) {
    unittest.expect(o.approvalStatus, unittest.equals('foo'));
    unittest.expect(o.contentAndPolicyReviewStatus, unittest.equals('foo'));
    unittest.expect(
        o.creativeAndLandingPageReviewStatus, unittest.equals('foo'));
    checkUnnamed4059(o.exchangeReviewStatuses);
    checkUnnamed4060(o.publisherReviewStatuses);
  }
  buildCounterReviewStatusInfo--;
}

core.int buildCounterSdfConfig = 0;
buildSdfConfig() {
  var o = new api.SdfConfig();
  buildCounterSdfConfig++;
  if (buildCounterSdfConfig < 3) {
    o.adminEmail = "foo";
    o.version = "foo";
  }
  buildCounterSdfConfig--;
  return o;
}

checkSdfConfig(api.SdfConfig o) {
  buildCounterSdfConfig++;
  if (buildCounterSdfConfig < 3) {
    unittest.expect(o.adminEmail, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals('foo'));
  }
  buildCounterSdfConfig--;
}

core.int buildCounterSdfDownloadTask = 0;
buildSdfDownloadTask() {
  var o = new api.SdfDownloadTask();
  buildCounterSdfDownloadTask++;
  if (buildCounterSdfDownloadTask < 3) {
    o.resourceName = "foo";
  }
  buildCounterSdfDownloadTask--;
  return o;
}

checkSdfDownloadTask(api.SdfDownloadTask o) {
  buildCounterSdfDownloadTask++;
  if (buildCounterSdfDownloadTask < 3) {
    unittest.expect(o.resourceName, unittest.equals('foo'));
  }
  buildCounterSdfDownloadTask--;
}

core.int buildCounterSdfDownloadTaskMetadata = 0;
buildSdfDownloadTaskMetadata() {
  var o = new api.SdfDownloadTaskMetadata();
  buildCounterSdfDownloadTaskMetadata++;
  if (buildCounterSdfDownloadTaskMetadata < 3) {
    o.createTime = "foo";
    o.endTime = "foo";
    o.version = "foo";
  }
  buildCounterSdfDownloadTaskMetadata--;
  return o;
}

checkSdfDownloadTaskMetadata(api.SdfDownloadTaskMetadata o) {
  buildCounterSdfDownloadTaskMetadata++;
  if (buildCounterSdfDownloadTaskMetadata < 3) {
    unittest.expect(o.createTime, unittest.equals('foo'));
    unittest.expect(o.endTime, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals('foo'));
  }
  buildCounterSdfDownloadTaskMetadata--;
}

core.int buildCounterSensitiveCategoryAssignedTargetingOptionDetails = 0;
buildSensitiveCategoryAssignedTargetingOptionDetails() {
  var o = new api.SensitiveCategoryAssignedTargetingOptionDetails();
  buildCounterSensitiveCategoryAssignedTargetingOptionDetails++;
  if (buildCounterSensitiveCategoryAssignedTargetingOptionDetails < 3) {
    o.excludedTargetingOptionId = "foo";
    o.sensitiveCategory = "foo";
  }
  buildCounterSensitiveCategoryAssignedTargetingOptionDetails--;
  return o;
}

checkSensitiveCategoryAssignedTargetingOptionDetails(
    api.SensitiveCategoryAssignedTargetingOptionDetails o) {
  buildCounterSensitiveCategoryAssignedTargetingOptionDetails++;
  if (buildCounterSensitiveCategoryAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.excludedTargetingOptionId, unittest.equals('foo'));
    unittest.expect(o.sensitiveCategory, unittest.equals('foo'));
  }
  buildCounterSensitiveCategoryAssignedTargetingOptionDetails--;
}

core.int buildCounterSensitiveCategoryTargetingOptionDetails = 0;
buildSensitiveCategoryTargetingOptionDetails() {
  var o = new api.SensitiveCategoryTargetingOptionDetails();
  buildCounterSensitiveCategoryTargetingOptionDetails++;
  if (buildCounterSensitiveCategoryTargetingOptionDetails < 3) {
    o.sensitiveCategory = "foo";
  }
  buildCounterSensitiveCategoryTargetingOptionDetails--;
  return o;
}

checkSensitiveCategoryTargetingOptionDetails(
    api.SensitiveCategoryTargetingOptionDetails o) {
  buildCounterSensitiveCategoryTargetingOptionDetails++;
  if (buildCounterSensitiveCategoryTargetingOptionDetails < 3) {
    unittest.expect(o.sensitiveCategory, unittest.equals('foo'));
  }
  buildCounterSensitiveCategoryTargetingOptionDetails--;
}

buildUnnamed4061() {
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

checkUnnamed4061(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted7 = (o["x"]) as core.Map;
  unittest.expect(casted7, unittest.hasLength(3));
  unittest.expect(casted7["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted7["bool"], unittest.equals(true));
  unittest.expect(casted7["string"], unittest.equals('foo'));
  var casted8 = (o["y"]) as core.Map;
  unittest.expect(casted8, unittest.hasLength(3));
  unittest.expect(casted8["list"], unittest.equals([1, 2, 3]));
  unittest.expect(casted8["bool"], unittest.equals(true));
  unittest.expect(casted8["string"], unittest.equals('foo'));
}

buildUnnamed4062() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed4061());
  o.add(buildUnnamed4061());
  return o;
}

checkUnnamed4062(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed4061(o[0]);
  checkUnnamed4061(o[1]);
}

core.int buildCounterStatus = 0;
buildStatus() {
  var o = new api.Status();
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    o.code = 42;
    o.details = buildUnnamed4062();
    o.message = "foo";
  }
  buildCounterStatus--;
  return o;
}

checkStatus(api.Status o) {
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    unittest.expect(o.code, unittest.equals(42));
    checkUnnamed4062(o.details);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterStatus--;
}

core.int buildCounterSubExchangeAssignedTargetingOptionDetails = 0;
buildSubExchangeAssignedTargetingOptionDetails() {
  var o = new api.SubExchangeAssignedTargetingOptionDetails();
  buildCounterSubExchangeAssignedTargetingOptionDetails++;
  if (buildCounterSubExchangeAssignedTargetingOptionDetails < 3) {
    o.targetingOptionId = "foo";
  }
  buildCounterSubExchangeAssignedTargetingOptionDetails--;
  return o;
}

checkSubExchangeAssignedTargetingOptionDetails(
    api.SubExchangeAssignedTargetingOptionDetails o) {
  buildCounterSubExchangeAssignedTargetingOptionDetails++;
  if (buildCounterSubExchangeAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
  }
  buildCounterSubExchangeAssignedTargetingOptionDetails--;
}

core.int buildCounterSubExchangeTargetingOptionDetails = 0;
buildSubExchangeTargetingOptionDetails() {
  var o = new api.SubExchangeTargetingOptionDetails();
  buildCounterSubExchangeTargetingOptionDetails++;
  if (buildCounterSubExchangeTargetingOptionDetails < 3) {
    o.displayName = "foo";
  }
  buildCounterSubExchangeTargetingOptionDetails--;
  return o;
}

checkSubExchangeTargetingOptionDetails(
    api.SubExchangeTargetingOptionDetails o) {
  buildCounterSubExchangeTargetingOptionDetails++;
  if (buildCounterSubExchangeTargetingOptionDetails < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
  }
  buildCounterSubExchangeTargetingOptionDetails--;
}

core.int buildCounterTargetingOption = 0;
buildTargetingOption() {
  var o = new api.TargetingOption();
  buildCounterTargetingOption++;
  if (buildCounterTargetingOption < 3) {
    o.ageRangeDetails = buildAgeRangeTargetingOptionDetails();
    o.appCategoryDetails = buildAppCategoryTargetingOptionDetails();
    o.authorizedSellerStatusDetails =
        buildAuthorizedSellerStatusTargetingOptionDetails();
    o.browserDetails = buildBrowserTargetingOptionDetails();
    o.carrierAndIspDetails = buildCarrierAndIspTargetingOptionDetails();
    o.categoryDetails = buildCategoryTargetingOptionDetails();
    o.contentInstreamPositionDetails =
        buildContentInstreamPositionTargetingOptionDetails();
    o.contentOutstreamPositionDetails =
        buildContentOutstreamPositionTargetingOptionDetails();
    o.deviceMakeModelDetails = buildDeviceMakeModelTargetingOptionDetails();
    o.deviceTypeDetails = buildDeviceTypeTargetingOptionDetails();
    o.digitalContentLabelDetails =
        buildDigitalContentLabelTargetingOptionDetails();
    o.environmentDetails = buildEnvironmentTargetingOptionDetails();
    o.exchangeDetails = buildExchangeTargetingOptionDetails();
    o.genderDetails = buildGenderTargetingOptionDetails();
    o.geoRegionDetails = buildGeoRegionTargetingOptionDetails();
    o.householdIncomeDetails = buildHouseholdIncomeTargetingOptionDetails();
    o.languageDetails = buildLanguageTargetingOptionDetails();
    o.name = "foo";
    o.onScreenPositionDetails = buildOnScreenPositionTargetingOptionDetails();
    o.operatingSystemDetails = buildOperatingSystemTargetingOptionDetails();
    o.parentalStatusDetails = buildParentalStatusTargetingOptionDetails();
    o.sensitiveCategoryDetails = buildSensitiveCategoryTargetingOptionDetails();
    o.subExchangeDetails = buildSubExchangeTargetingOptionDetails();
    o.targetingOptionId = "foo";
    o.targetingType = "foo";
    o.userRewardedContentDetails =
        buildUserRewardedContentTargetingOptionDetails();
    o.videoPlayerSizeDetails = buildVideoPlayerSizeTargetingOptionDetails();
    o.viewabilityDetails = buildViewabilityTargetingOptionDetails();
  }
  buildCounterTargetingOption--;
  return o;
}

checkTargetingOption(api.TargetingOption o) {
  buildCounterTargetingOption++;
  if (buildCounterTargetingOption < 3) {
    checkAgeRangeTargetingOptionDetails(o.ageRangeDetails);
    checkAppCategoryTargetingOptionDetails(o.appCategoryDetails);
    checkAuthorizedSellerStatusTargetingOptionDetails(
        o.authorizedSellerStatusDetails);
    checkBrowserTargetingOptionDetails(o.browserDetails);
    checkCarrierAndIspTargetingOptionDetails(o.carrierAndIspDetails);
    checkCategoryTargetingOptionDetails(o.categoryDetails);
    checkContentInstreamPositionTargetingOptionDetails(
        o.contentInstreamPositionDetails);
    checkContentOutstreamPositionTargetingOptionDetails(
        o.contentOutstreamPositionDetails);
    checkDeviceMakeModelTargetingOptionDetails(o.deviceMakeModelDetails);
    checkDeviceTypeTargetingOptionDetails(o.deviceTypeDetails);
    checkDigitalContentLabelTargetingOptionDetails(
        o.digitalContentLabelDetails);
    checkEnvironmentTargetingOptionDetails(o.environmentDetails);
    checkExchangeTargetingOptionDetails(o.exchangeDetails);
    checkGenderTargetingOptionDetails(o.genderDetails);
    checkGeoRegionTargetingOptionDetails(o.geoRegionDetails);
    checkHouseholdIncomeTargetingOptionDetails(o.householdIncomeDetails);
    checkLanguageTargetingOptionDetails(o.languageDetails);
    unittest.expect(o.name, unittest.equals('foo'));
    checkOnScreenPositionTargetingOptionDetails(o.onScreenPositionDetails);
    checkOperatingSystemTargetingOptionDetails(o.operatingSystemDetails);
    checkParentalStatusTargetingOptionDetails(o.parentalStatusDetails);
    checkSensitiveCategoryTargetingOptionDetails(o.sensitiveCategoryDetails);
    checkSubExchangeTargetingOptionDetails(o.subExchangeDetails);
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
    unittest.expect(o.targetingType, unittest.equals('foo'));
    checkUserRewardedContentTargetingOptionDetails(
        o.userRewardedContentDetails);
    checkVideoPlayerSizeTargetingOptionDetails(o.videoPlayerSizeDetails);
    checkViewabilityTargetingOptionDetails(o.viewabilityDetails);
  }
  buildCounterTargetingOption--;
}

core.int buildCounterThirdPartyOnlyConfig = 0;
buildThirdPartyOnlyConfig() {
  var o = new api.ThirdPartyOnlyConfig();
  buildCounterThirdPartyOnlyConfig++;
  if (buildCounterThirdPartyOnlyConfig < 3) {
    o.pixelOrderIdReportingEnabled = true;
  }
  buildCounterThirdPartyOnlyConfig--;
  return o;
}

checkThirdPartyOnlyConfig(api.ThirdPartyOnlyConfig o) {
  buildCounterThirdPartyOnlyConfig++;
  if (buildCounterThirdPartyOnlyConfig < 3) {
    unittest.expect(o.pixelOrderIdReportingEnabled, unittest.isTrue);
  }
  buildCounterThirdPartyOnlyConfig--;
}

core.int buildCounterThirdPartyUrl = 0;
buildThirdPartyUrl() {
  var o = new api.ThirdPartyUrl();
  buildCounterThirdPartyUrl++;
  if (buildCounterThirdPartyUrl < 3) {
    o.type = "foo";
    o.url = "foo";
  }
  buildCounterThirdPartyUrl--;
  return o;
}

checkThirdPartyUrl(api.ThirdPartyUrl o) {
  buildCounterThirdPartyUrl++;
  if (buildCounterThirdPartyUrl < 3) {
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterThirdPartyUrl--;
}

core.int buildCounterThirdPartyVerifierAssignedTargetingOptionDetails = 0;
buildThirdPartyVerifierAssignedTargetingOptionDetails() {
  var o = new api.ThirdPartyVerifierAssignedTargetingOptionDetails();
  buildCounterThirdPartyVerifierAssignedTargetingOptionDetails++;
  if (buildCounterThirdPartyVerifierAssignedTargetingOptionDetails < 3) {
    o.adloox = buildAdloox();
    o.doubleVerify = buildDoubleVerify();
    o.integralAdScience = buildIntegralAdScience();
  }
  buildCounterThirdPartyVerifierAssignedTargetingOptionDetails--;
  return o;
}

checkThirdPartyVerifierAssignedTargetingOptionDetails(
    api.ThirdPartyVerifierAssignedTargetingOptionDetails o) {
  buildCounterThirdPartyVerifierAssignedTargetingOptionDetails++;
  if (buildCounterThirdPartyVerifierAssignedTargetingOptionDetails < 3) {
    checkAdloox(o.adloox);
    checkDoubleVerify(o.doubleVerify);
    checkIntegralAdScience(o.integralAdScience);
  }
  buildCounterThirdPartyVerifierAssignedTargetingOptionDetails--;
}

core.int buildCounterTimeRange = 0;
buildTimeRange() {
  var o = new api.TimeRange();
  buildCounterTimeRange++;
  if (buildCounterTimeRange < 3) {
    o.endTime = "foo";
    o.startTime = "foo";
  }
  buildCounterTimeRange--;
  return o;
}

checkTimeRange(api.TimeRange o) {
  buildCounterTimeRange++;
  if (buildCounterTimeRange < 3) {
    unittest.expect(o.endTime, unittest.equals('foo'));
    unittest.expect(o.startTime, unittest.equals('foo'));
  }
  buildCounterTimeRange--;
}

core.int buildCounterTimerEvent = 0;
buildTimerEvent() {
  var o = new api.TimerEvent();
  buildCounterTimerEvent++;
  if (buildCounterTimerEvent < 3) {
    o.name = "foo";
    o.reportingName = "foo";
  }
  buildCounterTimerEvent--;
  return o;
}

checkTimerEvent(api.TimerEvent o) {
  buildCounterTimerEvent++;
  if (buildCounterTimerEvent < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.reportingName, unittest.equals('foo'));
  }
  buildCounterTimerEvent--;
}

core.int buildCounterTrackingFloodlightActivityConfig = 0;
buildTrackingFloodlightActivityConfig() {
  var o = new api.TrackingFloodlightActivityConfig();
  buildCounterTrackingFloodlightActivityConfig++;
  if (buildCounterTrackingFloodlightActivityConfig < 3) {
    o.floodlightActivityId = "foo";
    o.postClickLookbackWindowDays = 42;
    o.postViewLookbackWindowDays = 42;
  }
  buildCounterTrackingFloodlightActivityConfig--;
  return o;
}

checkTrackingFloodlightActivityConfig(api.TrackingFloodlightActivityConfig o) {
  buildCounterTrackingFloodlightActivityConfig++;
  if (buildCounterTrackingFloodlightActivityConfig < 3) {
    unittest.expect(o.floodlightActivityId, unittest.equals('foo'));
    unittest.expect(o.postClickLookbackWindowDays, unittest.equals(42));
    unittest.expect(o.postViewLookbackWindowDays, unittest.equals(42));
  }
  buildCounterTrackingFloodlightActivityConfig--;
}

core.int buildCounterTranscode = 0;
buildTranscode() {
  var o = new api.Transcode();
  buildCounterTranscode++;
  if (buildCounterTranscode < 3) {
    o.audioBitRateKbps = "foo";
    o.audioSampleRateHz = "foo";
    o.bitRateKbps = "foo";
    o.dimensions = buildDimensions();
    o.fileSizeBytes = "foo";
    o.frameRate = 42.0;
    o.mimeType = "foo";
    o.name = "foo";
    o.transcoded = true;
  }
  buildCounterTranscode--;
  return o;
}

checkTranscode(api.Transcode o) {
  buildCounterTranscode++;
  if (buildCounterTranscode < 3) {
    unittest.expect(o.audioBitRateKbps, unittest.equals('foo'));
    unittest.expect(o.audioSampleRateHz, unittest.equals('foo'));
    unittest.expect(o.bitRateKbps, unittest.equals('foo'));
    checkDimensions(o.dimensions);
    unittest.expect(o.fileSizeBytes, unittest.equals('foo'));
    unittest.expect(o.frameRate, unittest.equals(42.0));
    unittest.expect(o.mimeType, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.transcoded, unittest.isTrue);
  }
  buildCounterTranscode--;
}

core.int buildCounterUniversalAdId = 0;
buildUniversalAdId() {
  var o = new api.UniversalAdId();
  buildCounterUniversalAdId++;
  if (buildCounterUniversalAdId < 3) {
    o.id = "foo";
    o.registry = "foo";
  }
  buildCounterUniversalAdId--;
  return o;
}

checkUniversalAdId(api.UniversalAdId o) {
  buildCounterUniversalAdId++;
  if (buildCounterUniversalAdId < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.registry, unittest.equals('foo'));
  }
  buildCounterUniversalAdId--;
}

core.int buildCounterUrlAssignedTargetingOptionDetails = 0;
buildUrlAssignedTargetingOptionDetails() {
  var o = new api.UrlAssignedTargetingOptionDetails();
  buildCounterUrlAssignedTargetingOptionDetails++;
  if (buildCounterUrlAssignedTargetingOptionDetails < 3) {
    o.negative = true;
    o.url = "foo";
  }
  buildCounterUrlAssignedTargetingOptionDetails--;
  return o;
}

checkUrlAssignedTargetingOptionDetails(
    api.UrlAssignedTargetingOptionDetails o) {
  buildCounterUrlAssignedTargetingOptionDetails++;
  if (buildCounterUrlAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.negative, unittest.isTrue);
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterUrlAssignedTargetingOptionDetails--;
}

core.int buildCounterUserRewardedContentAssignedTargetingOptionDetails = 0;
buildUserRewardedContentAssignedTargetingOptionDetails() {
  var o = new api.UserRewardedContentAssignedTargetingOptionDetails();
  buildCounterUserRewardedContentAssignedTargetingOptionDetails++;
  if (buildCounterUserRewardedContentAssignedTargetingOptionDetails < 3) {
    o.targetingOptionId = "foo";
    o.userRewardedContent = "foo";
  }
  buildCounterUserRewardedContentAssignedTargetingOptionDetails--;
  return o;
}

checkUserRewardedContentAssignedTargetingOptionDetails(
    api.UserRewardedContentAssignedTargetingOptionDetails o) {
  buildCounterUserRewardedContentAssignedTargetingOptionDetails++;
  if (buildCounterUserRewardedContentAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
    unittest.expect(o.userRewardedContent, unittest.equals('foo'));
  }
  buildCounterUserRewardedContentAssignedTargetingOptionDetails--;
}

core.int buildCounterUserRewardedContentTargetingOptionDetails = 0;
buildUserRewardedContentTargetingOptionDetails() {
  var o = new api.UserRewardedContentTargetingOptionDetails();
  buildCounterUserRewardedContentTargetingOptionDetails++;
  if (buildCounterUserRewardedContentTargetingOptionDetails < 3) {
    o.userRewardedContent = "foo";
  }
  buildCounterUserRewardedContentTargetingOptionDetails--;
  return o;
}

checkUserRewardedContentTargetingOptionDetails(
    api.UserRewardedContentTargetingOptionDetails o) {
  buildCounterUserRewardedContentTargetingOptionDetails++;
  if (buildCounterUserRewardedContentTargetingOptionDetails < 3) {
    unittest.expect(o.userRewardedContent, unittest.equals('foo'));
  }
  buildCounterUserRewardedContentTargetingOptionDetails--;
}

core.int buildCounterVideoPlayerSizeAssignedTargetingOptionDetails = 0;
buildVideoPlayerSizeAssignedTargetingOptionDetails() {
  var o = new api.VideoPlayerSizeAssignedTargetingOptionDetails();
  buildCounterVideoPlayerSizeAssignedTargetingOptionDetails++;
  if (buildCounterVideoPlayerSizeAssignedTargetingOptionDetails < 3) {
    o.targetingOptionId = "foo";
    o.videoPlayerSize = "foo";
  }
  buildCounterVideoPlayerSizeAssignedTargetingOptionDetails--;
  return o;
}

checkVideoPlayerSizeAssignedTargetingOptionDetails(
    api.VideoPlayerSizeAssignedTargetingOptionDetails o) {
  buildCounterVideoPlayerSizeAssignedTargetingOptionDetails++;
  if (buildCounterVideoPlayerSizeAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
    unittest.expect(o.videoPlayerSize, unittest.equals('foo'));
  }
  buildCounterVideoPlayerSizeAssignedTargetingOptionDetails--;
}

core.int buildCounterVideoPlayerSizeTargetingOptionDetails = 0;
buildVideoPlayerSizeTargetingOptionDetails() {
  var o = new api.VideoPlayerSizeTargetingOptionDetails();
  buildCounterVideoPlayerSizeTargetingOptionDetails++;
  if (buildCounterVideoPlayerSizeTargetingOptionDetails < 3) {
    o.videoPlayerSize = "foo";
  }
  buildCounterVideoPlayerSizeTargetingOptionDetails--;
  return o;
}

checkVideoPlayerSizeTargetingOptionDetails(
    api.VideoPlayerSizeTargetingOptionDetails o) {
  buildCounterVideoPlayerSizeTargetingOptionDetails++;
  if (buildCounterVideoPlayerSizeTargetingOptionDetails < 3) {
    unittest.expect(o.videoPlayerSize, unittest.equals('foo'));
  }
  buildCounterVideoPlayerSizeTargetingOptionDetails--;
}

core.int buildCounterViewabilityAssignedTargetingOptionDetails = 0;
buildViewabilityAssignedTargetingOptionDetails() {
  var o = new api.ViewabilityAssignedTargetingOptionDetails();
  buildCounterViewabilityAssignedTargetingOptionDetails++;
  if (buildCounterViewabilityAssignedTargetingOptionDetails < 3) {
    o.targetingOptionId = "foo";
    o.viewability = "foo";
  }
  buildCounterViewabilityAssignedTargetingOptionDetails--;
  return o;
}

checkViewabilityAssignedTargetingOptionDetails(
    api.ViewabilityAssignedTargetingOptionDetails o) {
  buildCounterViewabilityAssignedTargetingOptionDetails++;
  if (buildCounterViewabilityAssignedTargetingOptionDetails < 3) {
    unittest.expect(o.targetingOptionId, unittest.equals('foo'));
    unittest.expect(o.viewability, unittest.equals('foo'));
  }
  buildCounterViewabilityAssignedTargetingOptionDetails--;
}

core.int buildCounterViewabilityTargetingOptionDetails = 0;
buildViewabilityTargetingOptionDetails() {
  var o = new api.ViewabilityTargetingOptionDetails();
  buildCounterViewabilityTargetingOptionDetails++;
  if (buildCounterViewabilityTargetingOptionDetails < 3) {
    o.viewability = "foo";
  }
  buildCounterViewabilityTargetingOptionDetails--;
  return o;
}

checkViewabilityTargetingOptionDetails(
    api.ViewabilityTargetingOptionDetails o) {
  buildCounterViewabilityTargetingOptionDetails++;
  if (buildCounterViewabilityTargetingOptionDetails < 3) {
    unittest.expect(o.viewability, unittest.equals('foo'));
  }
  buildCounterViewabilityTargetingOptionDetails--;
}

main() {
  unittest.group("obj-schema-ActiveViewVideoViewabilityMetricConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildActiveViewVideoViewabilityMetricConfig();
      var od =
          new api.ActiveViewVideoViewabilityMetricConfig.fromJson(o.toJson());
      checkActiveViewVideoViewabilityMetricConfig(od);
    });
  });

  unittest.group("obj-schema-Adloox", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdloox();
      var od = new api.Adloox.fromJson(o.toJson());
      checkAdloox(od);
    });
  });

  unittest.group("obj-schema-Advertiser", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiser();
      var od = new api.Advertiser.fromJson(o.toJson());
      checkAdvertiser(od);
    });
  });

  unittest.group("obj-schema-AdvertiserAdServerConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiserAdServerConfig();
      var od = new api.AdvertiserAdServerConfig.fromJson(o.toJson());
      checkAdvertiserAdServerConfig(od);
    });
  });

  unittest.group("obj-schema-AdvertiserCreativeConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiserCreativeConfig();
      var od = new api.AdvertiserCreativeConfig.fromJson(o.toJson());
      checkAdvertiserCreativeConfig(od);
    });
  });

  unittest.group("obj-schema-AdvertiserDataAccessConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiserDataAccessConfig();
      var od = new api.AdvertiserDataAccessConfig.fromJson(o.toJson());
      checkAdvertiserDataAccessConfig(od);
    });
  });

  unittest.group("obj-schema-AdvertiserGeneralConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiserGeneralConfig();
      var od = new api.AdvertiserGeneralConfig.fromJson(o.toJson());
      checkAdvertiserGeneralConfig(od);
    });
  });

  unittest.group("obj-schema-AdvertiserSdfConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdvertiserSdfConfig();
      var od = new api.AdvertiserSdfConfig.fromJson(o.toJson());
      checkAdvertiserSdfConfig(od);
    });
  });

  unittest.group("obj-schema-AgeRangeAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildAgeRangeAssignedTargetingOptionDetails();
      var od =
          new api.AgeRangeAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkAgeRangeAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-AgeRangeTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildAgeRangeTargetingOptionDetails();
      var od = new api.AgeRangeTargetingOptionDetails.fromJson(o.toJson());
      checkAgeRangeTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-AppAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildAppAssignedTargetingOptionDetails();
      var od = new api.AppAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkAppAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-AppCategoryAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildAppCategoryAssignedTargetingOptionDetails();
      var od = new api.AppCategoryAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkAppCategoryAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-AppCategoryTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildAppCategoryTargetingOptionDetails();
      var od = new api.AppCategoryTargetingOptionDetails.fromJson(o.toJson());
      checkAppCategoryTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-Asset", () {
    unittest.test("to-json--from-json", () {
      var o = buildAsset();
      var od = new api.Asset.fromJson(o.toJson());
      checkAsset(od);
    });
  });

  unittest.group("obj-schema-AssetAssociation", () {
    unittest.test("to-json--from-json", () {
      var o = buildAssetAssociation();
      var od = new api.AssetAssociation.fromJson(o.toJson());
      checkAssetAssociation(od);
    });
  });

  unittest.group("obj-schema-AssignedTargetingOption", () {
    unittest.test("to-json--from-json", () {
      var o = buildAssignedTargetingOption();
      var od = new api.AssignedTargetingOption.fromJson(o.toJson());
      checkAssignedTargetingOption(od);
    });
  });

  unittest.group("obj-schema-AudienceGroupAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildAudienceGroupAssignedTargetingOptionDetails();
      var od = new api.AudienceGroupAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkAudienceGroupAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-AudioVideoOffset", () {
    unittest.test("to-json--from-json", () {
      var o = buildAudioVideoOffset();
      var od = new api.AudioVideoOffset.fromJson(o.toJson());
      checkAudioVideoOffset(od);
    });
  });

  unittest.group(
      "obj-schema-AuthorizedSellerStatusAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuthorizedSellerStatusAssignedTargetingOptionDetails();
      var od =
          new api.AuthorizedSellerStatusAssignedTargetingOptionDetails.fromJson(
              o.toJson());
      checkAuthorizedSellerStatusAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-AuthorizedSellerStatusTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildAuthorizedSellerStatusTargetingOptionDetails();
      var od = new api.AuthorizedSellerStatusTargetingOptionDetails.fromJson(
          o.toJson());
      checkAuthorizedSellerStatusTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-BiddingStrategy", () {
    unittest.test("to-json--from-json", () {
      var o = buildBiddingStrategy();
      var od = new api.BiddingStrategy.fromJson(o.toJson());
      checkBiddingStrategy(od);
    });
  });

  unittest.group("obj-schema-BrowserAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildBrowserAssignedTargetingOptionDetails();
      var od =
          new api.BrowserAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkBrowserAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-BrowserTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildBrowserTargetingOptionDetails();
      var od = new api.BrowserTargetingOptionDetails.fromJson(o.toJson());
      checkBrowserTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-BulkEditLineItemAssignedTargetingOptionsRequest",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildBulkEditLineItemAssignedTargetingOptionsRequest();
      var od = new api.BulkEditLineItemAssignedTargetingOptionsRequest.fromJson(
          o.toJson());
      checkBulkEditLineItemAssignedTargetingOptionsRequest(od);
    });
  });

  unittest.group("obj-schema-BulkEditLineItemAssignedTargetingOptionsResponse",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildBulkEditLineItemAssignedTargetingOptionsResponse();
      var od =
          new api.BulkEditLineItemAssignedTargetingOptionsResponse.fromJson(
              o.toJson());
      checkBulkEditLineItemAssignedTargetingOptionsResponse(od);
    });
  });

  unittest.group("obj-schema-BulkListLineItemAssignedTargetingOptionsResponse",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildBulkListLineItemAssignedTargetingOptionsResponse();
      var od =
          new api.BulkListLineItemAssignedTargetingOptionsResponse.fromJson(
              o.toJson());
      checkBulkListLineItemAssignedTargetingOptionsResponse(od);
    });
  });

  unittest.group("obj-schema-Campaign", () {
    unittest.test("to-json--from-json", () {
      var o = buildCampaign();
      var od = new api.Campaign.fromJson(o.toJson());
      checkCampaign(od);
    });
  });

  unittest.group("obj-schema-CampaignFlight", () {
    unittest.test("to-json--from-json", () {
      var o = buildCampaignFlight();
      var od = new api.CampaignFlight.fromJson(o.toJson());
      checkCampaignFlight(od);
    });
  });

  unittest.group("obj-schema-CampaignGoal", () {
    unittest.test("to-json--from-json", () {
      var o = buildCampaignGoal();
      var od = new api.CampaignGoal.fromJson(o.toJson());
      checkCampaignGoal(od);
    });
  });

  unittest.group("obj-schema-CarrierAndIspAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildCarrierAndIspAssignedTargetingOptionDetails();
      var od = new api.CarrierAndIspAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkCarrierAndIspAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-CarrierAndIspTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildCarrierAndIspTargetingOptionDetails();
      var od = new api.CarrierAndIspTargetingOptionDetails.fromJson(o.toJson());
      checkCarrierAndIspTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-CategoryAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildCategoryAssignedTargetingOptionDetails();
      var od =
          new api.CategoryAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkCategoryAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-CategoryTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildCategoryTargetingOptionDetails();
      var od = new api.CategoryTargetingOptionDetails.fromJson(o.toJson());
      checkCategoryTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-Channel", () {
    unittest.test("to-json--from-json", () {
      var o = buildChannel();
      var od = new api.Channel.fromJson(o.toJson());
      checkChannel(od);
    });
  });

  unittest.group("obj-schema-ChannelAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildChannelAssignedTargetingOptionDetails();
      var od =
          new api.ChannelAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkChannelAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-CmHybridConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildCmHybridConfig();
      var od = new api.CmHybridConfig.fromJson(o.toJson());
      checkCmHybridConfig(od);
    });
  });

  unittest.group("obj-schema-CmTrackingAd", () {
    unittest.test("to-json--from-json", () {
      var o = buildCmTrackingAd();
      var od = new api.CmTrackingAd.fromJson(o.toJson());
      checkCmTrackingAd(od);
    });
  });

  unittest.group("obj-schema-CombinedAudience", () {
    unittest.test("to-json--from-json", () {
      var o = buildCombinedAudience();
      var od = new api.CombinedAudience.fromJson(o.toJson());
      checkCombinedAudience(od);
    });
  });

  unittest.group("obj-schema-CombinedAudienceGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildCombinedAudienceGroup();
      var od = new api.CombinedAudienceGroup.fromJson(o.toJson());
      checkCombinedAudienceGroup(od);
    });
  });

  unittest.group("obj-schema-CombinedAudienceTargetingSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildCombinedAudienceTargetingSetting();
      var od = new api.CombinedAudienceTargetingSetting.fromJson(o.toJson());
      checkCombinedAudienceTargetingSetting(od);
    });
  });

  unittest.group(
      "obj-schema-ContentInstreamPositionAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildContentInstreamPositionAssignedTargetingOptionDetails();
      var od = new api
              .ContentInstreamPositionAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkContentInstreamPositionAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ContentInstreamPositionTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildContentInstreamPositionTargetingOptionDetails();
      var od = new api.ContentInstreamPositionTargetingOptionDetails.fromJson(
          o.toJson());
      checkContentInstreamPositionTargetingOptionDetails(od);
    });
  });

  unittest.group(
      "obj-schema-ContentOutstreamPositionAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildContentOutstreamPositionAssignedTargetingOptionDetails();
      var od = new api
              .ContentOutstreamPositionAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkContentOutstreamPositionAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ContentOutstreamPositionTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildContentOutstreamPositionTargetingOptionDetails();
      var od = new api.ContentOutstreamPositionTargetingOptionDetails.fromJson(
          o.toJson());
      checkContentOutstreamPositionTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ConversionCountingConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildConversionCountingConfig();
      var od = new api.ConversionCountingConfig.fromJson(o.toJson());
      checkConversionCountingConfig(od);
    });
  });

  unittest.group("obj-schema-CounterEvent", () {
    unittest.test("to-json--from-json", () {
      var o = buildCounterEvent();
      var od = new api.CounterEvent.fromJson(o.toJson());
      checkCounterEvent(od);
    });
  });

  unittest.group("obj-schema-CreateAssetRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreateAssetRequest();
      var od = new api.CreateAssetRequest.fromJson(o.toJson());
      checkCreateAssetRequest(od);
    });
  });

  unittest.group("obj-schema-CreateAssetResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreateAssetResponse();
      var od = new api.CreateAssetResponse.fromJson(o.toJson());
      checkCreateAssetResponse(od);
    });
  });

  unittest.group("obj-schema-CreateAssignedTargetingOptionsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreateAssignedTargetingOptionsRequest();
      var od =
          new api.CreateAssignedTargetingOptionsRequest.fromJson(o.toJson());
      checkCreateAssignedTargetingOptionsRequest(od);
    });
  });

  unittest.group("obj-schema-CreateSdfDownloadTaskRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreateSdfDownloadTaskRequest();
      var od = new api.CreateSdfDownloadTaskRequest.fromJson(o.toJson());
      checkCreateSdfDownloadTaskRequest(od);
    });
  });

  unittest.group("obj-schema-Creative", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreative();
      var od = new api.Creative.fromJson(o.toJson());
      checkCreative(od);
    });
  });

  unittest.group("obj-schema-CreativeConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreativeConfig();
      var od = new api.CreativeConfig.fromJson(o.toJson());
      checkCreativeConfig(od);
    });
  });

  unittest.group("obj-schema-CustomList", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomList();
      var od = new api.CustomList.fromJson(o.toJson());
      checkCustomList(od);
    });
  });

  unittest.group("obj-schema-CustomListGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomListGroup();
      var od = new api.CustomListGroup.fromJson(o.toJson());
      checkCustomListGroup(od);
    });
  });

  unittest.group("obj-schema-CustomListTargetingSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomListTargetingSetting();
      var od = new api.CustomListTargetingSetting.fromJson(o.toJson());
      checkCustomListTargetingSetting(od);
    });
  });

  unittest.group("obj-schema-Date", () {
    unittest.test("to-json--from-json", () {
      var o = buildDate();
      var od = new api.Date.fromJson(o.toJson());
      checkDate(od);
    });
  });

  unittest.group("obj-schema-DateRange", () {
    unittest.test("to-json--from-json", () {
      var o = buildDateRange();
      var od = new api.DateRange.fromJson(o.toJson());
      checkDateRange(od);
    });
  });

  unittest.group("obj-schema-DayAndTimeAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildDayAndTimeAssignedTargetingOptionDetails();
      var od =
          new api.DayAndTimeAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkDayAndTimeAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-DeleteAssignedTargetingOptionsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeleteAssignedTargetingOptionsRequest();
      var od =
          new api.DeleteAssignedTargetingOptionsRequest.fromJson(o.toJson());
      checkDeleteAssignedTargetingOptionsRequest(od);
    });
  });

  unittest.group("obj-schema-DeviceMakeModelAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildDeviceMakeModelAssignedTargetingOptionDetails();
      var od = new api.DeviceMakeModelAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkDeviceMakeModelAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-DeviceMakeModelTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeviceMakeModelTargetingOptionDetails();
      var od =
          new api.DeviceMakeModelTargetingOptionDetails.fromJson(o.toJson());
      checkDeviceMakeModelTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-DeviceTypeAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeviceTypeAssignedTargetingOptionDetails();
      var od =
          new api.DeviceTypeAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkDeviceTypeAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-DeviceTypeTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeviceTypeTargetingOptionDetails();
      var od = new api.DeviceTypeTargetingOptionDetails.fromJson(o.toJson());
      checkDeviceTypeTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-DigitalContentLabelAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildDigitalContentLabelAssignedTargetingOptionDetails();
      var od =
          new api.DigitalContentLabelAssignedTargetingOptionDetails.fromJson(
              o.toJson());
      checkDigitalContentLabelAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-DigitalContentLabelTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildDigitalContentLabelTargetingOptionDetails();
      var od = new api.DigitalContentLabelTargetingOptionDetails.fromJson(
          o.toJson());
      checkDigitalContentLabelTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-Dimensions", () {
    unittest.test("to-json--from-json", () {
      var o = buildDimensions();
      var od = new api.Dimensions.fromJson(o.toJson());
      checkDimensions(od);
    });
  });

  unittest.group("obj-schema-DoubleVerify", () {
    unittest.test("to-json--from-json", () {
      var o = buildDoubleVerify();
      var od = new api.DoubleVerify.fromJson(o.toJson());
      checkDoubleVerify(od);
    });
  });

  unittest.group("obj-schema-DoubleVerifyAppStarRating", () {
    unittest.test("to-json--from-json", () {
      var o = buildDoubleVerifyAppStarRating();
      var od = new api.DoubleVerifyAppStarRating.fromJson(o.toJson());
      checkDoubleVerifyAppStarRating(od);
    });
  });

  unittest.group("obj-schema-DoubleVerifyBrandSafetyCategories", () {
    unittest.test("to-json--from-json", () {
      var o = buildDoubleVerifyBrandSafetyCategories();
      var od = new api.DoubleVerifyBrandSafetyCategories.fromJson(o.toJson());
      checkDoubleVerifyBrandSafetyCategories(od);
    });
  });

  unittest.group("obj-schema-DoubleVerifyDisplayViewability", () {
    unittest.test("to-json--from-json", () {
      var o = buildDoubleVerifyDisplayViewability();
      var od = new api.DoubleVerifyDisplayViewability.fromJson(o.toJson());
      checkDoubleVerifyDisplayViewability(od);
    });
  });

  unittest.group("obj-schema-DoubleVerifyFraudInvalidTraffic", () {
    unittest.test("to-json--from-json", () {
      var o = buildDoubleVerifyFraudInvalidTraffic();
      var od = new api.DoubleVerifyFraudInvalidTraffic.fromJson(o.toJson());
      checkDoubleVerifyFraudInvalidTraffic(od);
    });
  });

  unittest.group("obj-schema-DoubleVerifyVideoViewability", () {
    unittest.test("to-json--from-json", () {
      var o = buildDoubleVerifyVideoViewability();
      var od = new api.DoubleVerifyVideoViewability.fromJson(o.toJson());
      checkDoubleVerifyVideoViewability(od);
    });
  });

  unittest.group("obj-schema-Empty", () {
    unittest.test("to-json--from-json", () {
      var o = buildEmpty();
      var od = new api.Empty.fromJson(o.toJson());
      checkEmpty(od);
    });
  });

  unittest.group("obj-schema-EnvironmentAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnvironmentAssignedTargetingOptionDetails();
      var od = new api.EnvironmentAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkEnvironmentAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-EnvironmentTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildEnvironmentTargetingOptionDetails();
      var od = new api.EnvironmentTargetingOptionDetails.fromJson(o.toJson());
      checkEnvironmentTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ExchangeAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildExchangeAssignedTargetingOptionDetails();
      var od =
          new api.ExchangeAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkExchangeAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ExchangeReviewStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildExchangeReviewStatus();
      var od = new api.ExchangeReviewStatus.fromJson(o.toJson());
      checkExchangeReviewStatus(od);
    });
  });

  unittest.group("obj-schema-ExchangeTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildExchangeTargetingOptionDetails();
      var od = new api.ExchangeTargetingOptionDetails.fromJson(o.toJson());
      checkExchangeTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ExitEvent", () {
    unittest.test("to-json--from-json", () {
      var o = buildExitEvent();
      var od = new api.ExitEvent.fromJson(o.toJson());
      checkExitEvent(od);
    });
  });

  unittest.group("obj-schema-FirstAndThirdPartyAudience", () {
    unittest.test("to-json--from-json", () {
      var o = buildFirstAndThirdPartyAudience();
      var od = new api.FirstAndThirdPartyAudience.fromJson(o.toJson());
      checkFirstAndThirdPartyAudience(od);
    });
  });

  unittest.group("obj-schema-FirstAndThirdPartyAudienceGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildFirstAndThirdPartyAudienceGroup();
      var od = new api.FirstAndThirdPartyAudienceGroup.fromJson(o.toJson());
      checkFirstAndThirdPartyAudienceGroup(od);
    });
  });

  unittest.group("obj-schema-FirstAndThirdPartyAudienceTargetingSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildFirstAndThirdPartyAudienceTargetingSetting();
      var od = new api.FirstAndThirdPartyAudienceTargetingSetting.fromJson(
          o.toJson());
      checkFirstAndThirdPartyAudienceTargetingSetting(od);
    });
  });

  unittest.group("obj-schema-FixedBidStrategy", () {
    unittest.test("to-json--from-json", () {
      var o = buildFixedBidStrategy();
      var od = new api.FixedBidStrategy.fromJson(o.toJson());
      checkFixedBidStrategy(od);
    });
  });

  unittest.group("obj-schema-FloodlightGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildFloodlightGroup();
      var od = new api.FloodlightGroup.fromJson(o.toJson());
      checkFloodlightGroup(od);
    });
  });

  unittest.group("obj-schema-FrequencyCap", () {
    unittest.test("to-json--from-json", () {
      var o = buildFrequencyCap();
      var od = new api.FrequencyCap.fromJson(o.toJson());
      checkFrequencyCap(od);
    });
  });

  unittest.group("obj-schema-GenderAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildGenderAssignedTargetingOptionDetails();
      var od =
          new api.GenderAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkGenderAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-GenderTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildGenderTargetingOptionDetails();
      var od = new api.GenderTargetingOptionDetails.fromJson(o.toJson());
      checkGenderTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-GeoRegionAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildGeoRegionAssignedTargetingOptionDetails();
      var od =
          new api.GeoRegionAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkGeoRegionAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-GeoRegionTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildGeoRegionTargetingOptionDetails();
      var od = new api.GeoRegionTargetingOptionDetails.fromJson(o.toJson());
      checkGeoRegionTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-GoogleAudience", () {
    unittest.test("to-json--from-json", () {
      var o = buildGoogleAudience();
      var od = new api.GoogleAudience.fromJson(o.toJson());
      checkGoogleAudience(od);
    });
  });

  unittest.group("obj-schema-GoogleAudienceGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildGoogleAudienceGroup();
      var od = new api.GoogleAudienceGroup.fromJson(o.toJson());
      checkGoogleAudienceGroup(od);
    });
  });

  unittest.group("obj-schema-GoogleAudienceTargetingSetting", () {
    unittest.test("to-json--from-json", () {
      var o = buildGoogleAudienceTargetingSetting();
      var od = new api.GoogleAudienceTargetingSetting.fromJson(o.toJson());
      checkGoogleAudienceTargetingSetting(od);
    });
  });

  unittest.group("obj-schema-GoogleBytestreamMedia", () {
    unittest.test("to-json--from-json", () {
      var o = buildGoogleBytestreamMedia();
      var od = new api.GoogleBytestreamMedia.fromJson(o.toJson());
      checkGoogleBytestreamMedia(od);
    });
  });

  unittest.group("obj-schema-HouseholdIncomeAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildHouseholdIncomeAssignedTargetingOptionDetails();
      var od = new api.HouseholdIncomeAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkHouseholdIncomeAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-HouseholdIncomeTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildHouseholdIncomeTargetingOptionDetails();
      var od =
          new api.HouseholdIncomeTargetingOptionDetails.fromJson(o.toJson());
      checkHouseholdIncomeTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-IdFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildIdFilter();
      var od = new api.IdFilter.fromJson(o.toJson());
      checkIdFilter(od);
    });
  });

  unittest.group("obj-schema-InsertionOrder", () {
    unittest.test("to-json--from-json", () {
      var o = buildInsertionOrder();
      var od = new api.InsertionOrder.fromJson(o.toJson());
      checkInsertionOrder(od);
    });
  });

  unittest.group("obj-schema-InsertionOrderBudget", () {
    unittest.test("to-json--from-json", () {
      var o = buildInsertionOrderBudget();
      var od = new api.InsertionOrderBudget.fromJson(o.toJson());
      checkInsertionOrderBudget(od);
    });
  });

  unittest.group("obj-schema-InsertionOrderBudgetSegment", () {
    unittest.test("to-json--from-json", () {
      var o = buildInsertionOrderBudgetSegment();
      var od = new api.InsertionOrderBudgetSegment.fromJson(o.toJson());
      checkInsertionOrderBudgetSegment(od);
    });
  });

  unittest.group("obj-schema-IntegralAdScience", () {
    unittest.test("to-json--from-json", () {
      var o = buildIntegralAdScience();
      var od = new api.IntegralAdScience.fromJson(o.toJson());
      checkIntegralAdScience(od);
    });
  });

  unittest.group("obj-schema-IntegrationDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildIntegrationDetails();
      var od = new api.IntegrationDetails.fromJson(o.toJson());
      checkIntegrationDetails(od);
    });
  });

  unittest.group("obj-schema-InventorySource", () {
    unittest.test("to-json--from-json", () {
      var o = buildInventorySource();
      var od = new api.InventorySource.fromJson(o.toJson());
      checkInventorySource(od);
    });
  });

  unittest.group("obj-schema-InventorySourceAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildInventorySourceAssignedTargetingOptionDetails();
      var od = new api.InventorySourceAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkInventorySourceAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-InventorySourceDisplayCreativeConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildInventorySourceDisplayCreativeConfig();
      var od =
          new api.InventorySourceDisplayCreativeConfig.fromJson(o.toJson());
      checkInventorySourceDisplayCreativeConfig(od);
    });
  });

  unittest.group("obj-schema-InventorySourceFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildInventorySourceFilter();
      var od = new api.InventorySourceFilter.fromJson(o.toJson());
      checkInventorySourceFilter(od);
    });
  });

  unittest.group("obj-schema-InventorySourceGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildInventorySourceGroup();
      var od = new api.InventorySourceGroup.fromJson(o.toJson());
      checkInventorySourceGroup(od);
    });
  });

  unittest.group(
      "obj-schema-InventorySourceGroupAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildInventorySourceGroupAssignedTargetingOptionDetails();
      var od =
          new api.InventorySourceGroupAssignedTargetingOptionDetails.fromJson(
              o.toJson());
      checkInventorySourceGroupAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-InventorySourceStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildInventorySourceStatus();
      var od = new api.InventorySourceStatus.fromJson(o.toJson());
      checkInventorySourceStatus(od);
    });
  });

  unittest.group("obj-schema-InventorySourceVideoCreativeConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildInventorySourceVideoCreativeConfig();
      var od = new api.InventorySourceVideoCreativeConfig.fromJson(o.toJson());
      checkInventorySourceVideoCreativeConfig(od);
    });
  });

  unittest.group("obj-schema-KeywordAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildKeywordAssignedTargetingOptionDetails();
      var od =
          new api.KeywordAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkKeywordAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-LanguageAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildLanguageAssignedTargetingOptionDetails();
      var od =
          new api.LanguageAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkLanguageAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-LanguageTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildLanguageTargetingOptionDetails();
      var od = new api.LanguageTargetingOptionDetails.fromJson(o.toJson());
      checkLanguageTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-LineItem", () {
    unittest.test("to-json--from-json", () {
      var o = buildLineItem();
      var od = new api.LineItem.fromJson(o.toJson());
      checkLineItem(od);
    });
  });

  unittest.group("obj-schema-LineItemBudget", () {
    unittest.test("to-json--from-json", () {
      var o = buildLineItemBudget();
      var od = new api.LineItemBudget.fromJson(o.toJson());
      checkLineItemBudget(od);
    });
  });

  unittest.group("obj-schema-LineItemFlight", () {
    unittest.test("to-json--from-json", () {
      var o = buildLineItemFlight();
      var od = new api.LineItemFlight.fromJson(o.toJson());
      checkLineItemFlight(od);
    });
  });

  unittest.group("obj-schema-ListAdvertisersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListAdvertisersResponse();
      var od = new api.ListAdvertisersResponse.fromJson(o.toJson());
      checkListAdvertisersResponse(od);
    });
  });

  unittest.group("obj-schema-ListCampaignsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListCampaignsResponse();
      var od = new api.ListCampaignsResponse.fromJson(o.toJson());
      checkListCampaignsResponse(od);
    });
  });

  unittest.group("obj-schema-ListChannelsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListChannelsResponse();
      var od = new api.ListChannelsResponse.fromJson(o.toJson());
      checkListChannelsResponse(od);
    });
  });

  unittest.group("obj-schema-ListCombinedAudiencesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListCombinedAudiencesResponse();
      var od = new api.ListCombinedAudiencesResponse.fromJson(o.toJson());
      checkListCombinedAudiencesResponse(od);
    });
  });

  unittest.group("obj-schema-ListCreativesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListCreativesResponse();
      var od = new api.ListCreativesResponse.fromJson(o.toJson());
      checkListCreativesResponse(od);
    });
  });

  unittest.group("obj-schema-ListCustomListsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListCustomListsResponse();
      var od = new api.ListCustomListsResponse.fromJson(o.toJson());
      checkListCustomListsResponse(od);
    });
  });

  unittest.group("obj-schema-ListFirstAndThirdPartyAudiencesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListFirstAndThirdPartyAudiencesResponse();
      var od =
          new api.ListFirstAndThirdPartyAudiencesResponse.fromJson(o.toJson());
      checkListFirstAndThirdPartyAudiencesResponse(od);
    });
  });

  unittest.group("obj-schema-ListGoogleAudiencesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListGoogleAudiencesResponse();
      var od = new api.ListGoogleAudiencesResponse.fromJson(o.toJson());
      checkListGoogleAudiencesResponse(od);
    });
  });

  unittest.group("obj-schema-ListInsertionOrdersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListInsertionOrdersResponse();
      var od = new api.ListInsertionOrdersResponse.fromJson(o.toJson());
      checkListInsertionOrdersResponse(od);
    });
  });

  unittest.group("obj-schema-ListInventorySourceGroupsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListInventorySourceGroupsResponse();
      var od = new api.ListInventorySourceGroupsResponse.fromJson(o.toJson());
      checkListInventorySourceGroupsResponse(od);
    });
  });

  unittest.group("obj-schema-ListInventorySourcesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListInventorySourcesResponse();
      var od = new api.ListInventorySourcesResponse.fromJson(o.toJson());
      checkListInventorySourcesResponse(od);
    });
  });

  unittest.group("obj-schema-ListLineItemAssignedTargetingOptionsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListLineItemAssignedTargetingOptionsResponse();
      var od = new api.ListLineItemAssignedTargetingOptionsResponse.fromJson(
          o.toJson());
      checkListLineItemAssignedTargetingOptionsResponse(od);
    });
  });

  unittest.group("obj-schema-ListLineItemsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListLineItemsResponse();
      var od = new api.ListLineItemsResponse.fromJson(o.toJson());
      checkListLineItemsResponse(od);
    });
  });

  unittest.group("obj-schema-ListLocationListsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListLocationListsResponse();
      var od = new api.ListLocationListsResponse.fromJson(o.toJson());
      checkListLocationListsResponse(od);
    });
  });

  unittest.group("obj-schema-ListNegativeKeywordListsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListNegativeKeywordListsResponse();
      var od = new api.ListNegativeKeywordListsResponse.fromJson(o.toJson());
      checkListNegativeKeywordListsResponse(od);
    });
  });

  unittest.group("obj-schema-ListTargetingOptionsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListTargetingOptionsResponse();
      var od = new api.ListTargetingOptionsResponse.fromJson(o.toJson());
      checkListTargetingOptionsResponse(od);
    });
  });

  unittest.group("obj-schema-LocationList", () {
    unittest.test("to-json--from-json", () {
      var o = buildLocationList();
      var od = new api.LocationList.fromJson(o.toJson());
      checkLocationList(od);
    });
  });

  unittest.group("obj-schema-LookbackWindow", () {
    unittest.test("to-json--from-json", () {
      var o = buildLookbackWindow();
      var od = new api.LookbackWindow.fromJson(o.toJson());
      checkLookbackWindow(od);
    });
  });

  unittest.group("obj-schema-MaximizeSpendBidStrategy", () {
    unittest.test("to-json--from-json", () {
      var o = buildMaximizeSpendBidStrategy();
      var od = new api.MaximizeSpendBidStrategy.fromJson(o.toJson());
      checkMaximizeSpendBidStrategy(od);
    });
  });

  unittest.group("obj-schema-Money", () {
    unittest.test("to-json--from-json", () {
      var o = buildMoney();
      var od = new api.Money.fromJson(o.toJson());
      checkMoney(od);
    });
  });

  unittest.group("obj-schema-NegativeKeywordList", () {
    unittest.test("to-json--from-json", () {
      var o = buildNegativeKeywordList();
      var od = new api.NegativeKeywordList.fromJson(o.toJson());
      checkNegativeKeywordList(od);
    });
  });

  unittest.group("obj-schema-NegativeKeywordListAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildNegativeKeywordListAssignedTargetingOptionDetails();
      var od =
          new api.NegativeKeywordListAssignedTargetingOptionDetails.fromJson(
              o.toJson());
      checkNegativeKeywordListAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ObaIcon", () {
    unittest.test("to-json--from-json", () {
      var o = buildObaIcon();
      var od = new api.ObaIcon.fromJson(o.toJson());
      checkObaIcon(od);
    });
  });

  unittest.group("obj-schema-OnScreenPositionAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildOnScreenPositionAssignedTargetingOptionDetails();
      var od = new api.OnScreenPositionAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkOnScreenPositionAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-OnScreenPositionTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildOnScreenPositionTargetingOptionDetails();
      var od =
          new api.OnScreenPositionTargetingOptionDetails.fromJson(o.toJson());
      checkOnScreenPositionTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-OperatingSystemAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildOperatingSystemAssignedTargetingOptionDetails();
      var od = new api.OperatingSystemAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkOperatingSystemAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-OperatingSystemTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperatingSystemTargetingOptionDetails();
      var od =
          new api.OperatingSystemTargetingOptionDetails.fromJson(o.toJson());
      checkOperatingSystemTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-Operation", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperation();
      var od = new api.Operation.fromJson(o.toJson());
      checkOperation(od);
    });
  });

  unittest.group("obj-schema-Pacing", () {
    unittest.test("to-json--from-json", () {
      var o = buildPacing();
      var od = new api.Pacing.fromJson(o.toJson());
      checkPacing(od);
    });
  });

  unittest.group("obj-schema-ParentEntityFilter", () {
    unittest.test("to-json--from-json", () {
      var o = buildParentEntityFilter();
      var od = new api.ParentEntityFilter.fromJson(o.toJson());
      checkParentEntityFilter(od);
    });
  });

  unittest.group("obj-schema-ParentalStatusAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildParentalStatusAssignedTargetingOptionDetails();
      var od = new api.ParentalStatusAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkParentalStatusAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ParentalStatusTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildParentalStatusTargetingOptionDetails();
      var od =
          new api.ParentalStatusTargetingOptionDetails.fromJson(o.toJson());
      checkParentalStatusTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-PartnerCost", () {
    unittest.test("to-json--from-json", () {
      var o = buildPartnerCost();
      var od = new api.PartnerCost.fromJson(o.toJson());
      checkPartnerCost(od);
    });
  });

  unittest.group("obj-schema-PartnerRevenueModel", () {
    unittest.test("to-json--from-json", () {
      var o = buildPartnerRevenueModel();
      var od = new api.PartnerRevenueModel.fromJson(o.toJson());
      checkPartnerRevenueModel(od);
    });
  });

  unittest.group("obj-schema-PerformanceGoal", () {
    unittest.test("to-json--from-json", () {
      var o = buildPerformanceGoal();
      var od = new api.PerformanceGoal.fromJson(o.toJson());
      checkPerformanceGoal(od);
    });
  });

  unittest.group("obj-schema-PerformanceGoalBidStrategy", () {
    unittest.test("to-json--from-json", () {
      var o = buildPerformanceGoalBidStrategy();
      var od = new api.PerformanceGoalBidStrategy.fromJson(o.toJson());
      checkPerformanceGoalBidStrategy(od);
    });
  });

  unittest.group(
      "obj-schema-ProximityLocationListAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildProximityLocationListAssignedTargetingOptionDetails();
      var od =
          new api.ProximityLocationListAssignedTargetingOptionDetails.fromJson(
              o.toJson());
      checkProximityLocationListAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-PublisherReviewStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildPublisherReviewStatus();
      var od = new api.PublisherReviewStatus.fromJson(o.toJson());
      checkPublisherReviewStatus(od);
    });
  });

  unittest.group("obj-schema-RateDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildRateDetails();
      var od = new api.RateDetails.fromJson(o.toJson());
      checkRateDetails(od);
    });
  });

  unittest.group(
      "obj-schema-RegionalLocationListAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildRegionalLocationListAssignedTargetingOptionDetails();
      var od =
          new api.RegionalLocationListAssignedTargetingOptionDetails.fromJson(
              o.toJson());
      checkRegionalLocationListAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ReviewStatusInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildReviewStatusInfo();
      var od = new api.ReviewStatusInfo.fromJson(o.toJson());
      checkReviewStatusInfo(od);
    });
  });

  unittest.group("obj-schema-SdfConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildSdfConfig();
      var od = new api.SdfConfig.fromJson(o.toJson());
      checkSdfConfig(od);
    });
  });

  unittest.group("obj-schema-SdfDownloadTask", () {
    unittest.test("to-json--from-json", () {
      var o = buildSdfDownloadTask();
      var od = new api.SdfDownloadTask.fromJson(o.toJson());
      checkSdfDownloadTask(od);
    });
  });

  unittest.group("obj-schema-SdfDownloadTaskMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildSdfDownloadTaskMetadata();
      var od = new api.SdfDownloadTaskMetadata.fromJson(o.toJson());
      checkSdfDownloadTaskMetadata(od);
    });
  });

  unittest.group("obj-schema-SensitiveCategoryAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildSensitiveCategoryAssignedTargetingOptionDetails();
      var od = new api.SensitiveCategoryAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkSensitiveCategoryAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-SensitiveCategoryTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildSensitiveCategoryTargetingOptionDetails();
      var od =
          new api.SensitiveCategoryTargetingOptionDetails.fromJson(o.toJson());
      checkSensitiveCategoryTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-Status", () {
    unittest.test("to-json--from-json", () {
      var o = buildStatus();
      var od = new api.Status.fromJson(o.toJson());
      checkStatus(od);
    });
  });

  unittest.group("obj-schema-SubExchangeAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubExchangeAssignedTargetingOptionDetails();
      var od = new api.SubExchangeAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkSubExchangeAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-SubExchangeTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubExchangeTargetingOptionDetails();
      var od = new api.SubExchangeTargetingOptionDetails.fromJson(o.toJson());
      checkSubExchangeTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-TargetingOption", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetingOption();
      var od = new api.TargetingOption.fromJson(o.toJson());
      checkTargetingOption(od);
    });
  });

  unittest.group("obj-schema-ThirdPartyOnlyConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildThirdPartyOnlyConfig();
      var od = new api.ThirdPartyOnlyConfig.fromJson(o.toJson());
      checkThirdPartyOnlyConfig(od);
    });
  });

  unittest.group("obj-schema-ThirdPartyUrl", () {
    unittest.test("to-json--from-json", () {
      var o = buildThirdPartyUrl();
      var od = new api.ThirdPartyUrl.fromJson(o.toJson());
      checkThirdPartyUrl(od);
    });
  });

  unittest.group("obj-schema-ThirdPartyVerifierAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildThirdPartyVerifierAssignedTargetingOptionDetails();
      var od =
          new api.ThirdPartyVerifierAssignedTargetingOptionDetails.fromJson(
              o.toJson());
      checkThirdPartyVerifierAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-TimeRange", () {
    unittest.test("to-json--from-json", () {
      var o = buildTimeRange();
      var od = new api.TimeRange.fromJson(o.toJson());
      checkTimeRange(od);
    });
  });

  unittest.group("obj-schema-TimerEvent", () {
    unittest.test("to-json--from-json", () {
      var o = buildTimerEvent();
      var od = new api.TimerEvent.fromJson(o.toJson());
      checkTimerEvent(od);
    });
  });

  unittest.group("obj-schema-TrackingFloodlightActivityConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildTrackingFloodlightActivityConfig();
      var od = new api.TrackingFloodlightActivityConfig.fromJson(o.toJson());
      checkTrackingFloodlightActivityConfig(od);
    });
  });

  unittest.group("obj-schema-Transcode", () {
    unittest.test("to-json--from-json", () {
      var o = buildTranscode();
      var od = new api.Transcode.fromJson(o.toJson());
      checkTranscode(od);
    });
  });

  unittest.group("obj-schema-UniversalAdId", () {
    unittest.test("to-json--from-json", () {
      var o = buildUniversalAdId();
      var od = new api.UniversalAdId.fromJson(o.toJson());
      checkUniversalAdId(od);
    });
  });

  unittest.group("obj-schema-UrlAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlAssignedTargetingOptionDetails();
      var od = new api.UrlAssignedTargetingOptionDetails.fromJson(o.toJson());
      checkUrlAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-UserRewardedContentAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildUserRewardedContentAssignedTargetingOptionDetails();
      var od =
          new api.UserRewardedContentAssignedTargetingOptionDetails.fromJson(
              o.toJson());
      checkUserRewardedContentAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-UserRewardedContentTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserRewardedContentTargetingOptionDetails();
      var od = new api.UserRewardedContentTargetingOptionDetails.fromJson(
          o.toJson());
      checkUserRewardedContentTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-VideoPlayerSizeAssignedTargetingOptionDetails",
      () {
    unittest.test("to-json--from-json", () {
      var o = buildVideoPlayerSizeAssignedTargetingOptionDetails();
      var od = new api.VideoPlayerSizeAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkVideoPlayerSizeAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-VideoPlayerSizeTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildVideoPlayerSizeTargetingOptionDetails();
      var od =
          new api.VideoPlayerSizeTargetingOptionDetails.fromJson(o.toJson());
      checkVideoPlayerSizeTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ViewabilityAssignedTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildViewabilityAssignedTargetingOptionDetails();
      var od = new api.ViewabilityAssignedTargetingOptionDetails.fromJson(
          o.toJson());
      checkViewabilityAssignedTargetingOptionDetails(od);
    });
  });

  unittest.group("obj-schema-ViewabilityTargetingOptionDetails", () {
    unittest.test("to-json--from-json", () {
      var o = buildViewabilityTargetingOptionDetails();
      var od = new api.ViewabilityTargetingOptionDetails.fromJson(o.toJson());
      checkViewabilityTargetingOptionDetails(od);
    });
  });

  unittest.group("resource-AdvertisersResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers;
      var arg_request = buildAdvertiser();
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
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("v1/advertisers"));
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
        var resp = convert.json.encode(buildAdvertiser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiser(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers;
      var arg_advertiserId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers;
      var arg_advertiserId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAdvertiser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiser(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers;
      var arg_filter = "foo";
      var arg_orderBy = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_partnerId = "foo";
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
            unittest.equals("v1/advertisers"));
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListAdvertisersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              filter: arg_filter,
              orderBy: arg_orderBy,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              partnerId: arg_partnerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListAdvertisersResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AdvertisersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers;
      var arg_request = buildAdvertiser();
      var arg_advertiserId = "foo";
      var arg_updateMask = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["updateMask"].first, unittest.equals(arg_updateMask));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAdvertiser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_advertiserId,
              updateMask: arg_updateMask, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAdvertiser(response);
      })));
    });
  });

  unittest.group("resource-AdvertisersAssetsResourceApi", () {
    unittest.test("method--upload", () {
      // TODO: Implement tests for media upload;
      // TODO: Implement tests for media download;

      var mock = new HttpServerMock();
      api.AdvertisersAssetsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.assets;
      var arg_request = buildCreateAssetRequest();
      var arg_advertiserId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreateAssetRequest.fromJson(json);
        checkCreateAssetRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreateAssetResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .upload(arg_request, arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreateAssetResponse(response);
      })));
    });
  });

  unittest.group("resource-AdvertisersCampaignsResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AdvertisersCampaignsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.campaigns;
      var arg_request = buildCampaign();
      var arg_advertiserId = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCampaign());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaign(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AdvertisersCampaignsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.campaigns;
      var arg_advertiserId = "foo";
      var arg_campaignId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_advertiserId, arg_campaignId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersCampaignsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.campaigns;
      var arg_advertiserId = "foo";
      var arg_campaignId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCampaign());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_advertiserId, arg_campaignId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaign(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersCampaignsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.campaigns;
      var arg_advertiserId = "foo";
      var arg_filter = "foo";
      var arg_orderBy = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListCampaignsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_advertiserId,
              filter: arg_filter,
              orderBy: arg_orderBy,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListCampaignsResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AdvertisersCampaignsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.campaigns;
      var arg_request = buildCampaign();
      var arg_advertiserId = "foo";
      var arg_campaignId = "foo";
      var arg_updateMask = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["updateMask"].first, unittest.equals(arg_updateMask));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCampaign());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_advertiserId, arg_campaignId,
              updateMask: arg_updateMask, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCampaign(response);
      })));
    });
  });

  unittest.group("resource-AdvertisersChannelsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersChannelsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.channels;
      var arg_advertiserId = "foo";
      var arg_channelId = "foo";
      var arg_partnerId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_advertiserId, arg_channelId,
              partnerId: arg_partnerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkChannel(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersChannelsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.channels;
      var arg_advertiserId = "foo";
      var arg_partnerId = "foo";
      var arg_filter = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_orderBy = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListChannelsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_advertiserId,
              partnerId: arg_partnerId,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              orderBy: arg_orderBy,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListChannelsResponse(response);
      })));
    });
  });

  unittest.group("resource-AdvertisersCreativesResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AdvertisersCreativesResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.creatives;
      var arg_request = buildCreative();
      var arg_advertiserId = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreative());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreative(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AdvertisersCreativesResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.creatives;
      var arg_advertiserId = "foo";
      var arg_creativeId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_advertiserId, arg_creativeId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersCreativesResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.creatives;
      var arg_advertiserId = "foo";
      var arg_creativeId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreative());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_advertiserId, arg_creativeId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreative(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersCreativesResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.creatives;
      var arg_advertiserId = "foo";
      var arg_orderBy = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListCreativesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_advertiserId,
              orderBy: arg_orderBy,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              filter: arg_filter,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListCreativesResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AdvertisersCreativesResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.creatives;
      var arg_request = buildCreative();
      var arg_advertiserId = "foo";
      var arg_creativeId = "foo";
      var arg_updateMask = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["updateMask"].first, unittest.equals(arg_updateMask));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCreative());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_advertiserId, arg_creativeId,
              updateMask: arg_updateMask, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCreative(response);
      })));
    });
  });

  unittest.group("resource-AdvertisersInsertionOrdersResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AdvertisersInsertionOrdersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.insertionOrders;
      var arg_request = buildInsertionOrder();
      var arg_advertiserId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.InsertionOrder.fromJson(json);
        checkInsertionOrder(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildInsertionOrder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkInsertionOrder(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AdvertisersInsertionOrdersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.insertionOrders;
      var arg_advertiserId = "foo";
      var arg_insertionOrderId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_advertiserId, arg_insertionOrderId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersInsertionOrdersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.insertionOrders;
      var arg_advertiserId = "foo";
      var arg_insertionOrderId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildInsertionOrder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_advertiserId, arg_insertionOrderId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkInsertionOrder(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersInsertionOrdersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.insertionOrders;
      var arg_advertiserId = "foo";
      var arg_orderBy = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListInsertionOrdersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_advertiserId,
              orderBy: arg_orderBy,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              filter: arg_filter,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListInsertionOrdersResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AdvertisersInsertionOrdersResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.insertionOrders;
      var arg_request = buildInsertionOrder();
      var arg_advertiserId = "foo";
      var arg_insertionOrderId = "foo";
      var arg_updateMask = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.InsertionOrder.fromJson(json);
        checkInsertionOrder(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["updateMask"].first, unittest.equals(arg_updateMask));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildInsertionOrder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_advertiserId, arg_insertionOrderId,
              updateMask: arg_updateMask, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkInsertionOrder(response);
      })));
    });
  });

  unittest.group("resource-AdvertisersLineItemsResourceApi", () {
    unittest.test("method--bulkEditLineItemAssignedTargetingOptions", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.lineItems;
      var arg_request = buildBulkEditLineItemAssignedTargetingOptionsRequest();
      var arg_advertiserId = "foo";
      var arg_lineItemId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj =
            new api.BulkEditLineItemAssignedTargetingOptionsRequest.fromJson(
                json);
        checkBulkEditLineItemAssignedTargetingOptionsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json
            .encode(buildBulkEditLineItemAssignedTargetingOptionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .bulkEditLineItemAssignedTargetingOptions(
              arg_request, arg_advertiserId, arg_lineItemId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkBulkEditLineItemAssignedTargetingOptionsResponse(response);
      })));
    });

    unittest.test("method--bulkListLineItemAssignedTargetingOptions", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.lineItems;
      var arg_advertiserId = "foo";
      var arg_lineItemId = "foo";
      var arg_orderBy = "foo";
      var arg_filter = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json
            .encode(buildBulkListLineItemAssignedTargetingOptionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .bulkListLineItemAssignedTargetingOptions(
              arg_advertiserId, arg_lineItemId,
              orderBy: arg_orderBy,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkBulkListLineItemAssignedTargetingOptionsResponse(response);
      })));
    });

    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.lineItems;
      var arg_request = buildLineItem();
      var arg_advertiserId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.LineItem.fromJson(json);
        checkLineItem(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildLineItem());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkLineItem(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.lineItems;
      var arg_advertiserId = "foo";
      var arg_lineItemId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_advertiserId, arg_lineItemId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.lineItems;
      var arg_advertiserId = "foo";
      var arg_lineItemId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildLineItem());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_advertiserId, arg_lineItemId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkLineItem(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.lineItems;
      var arg_advertiserId = "foo";
      var arg_filter = "foo";
      var arg_orderBy = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListLineItemsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_advertiserId,
              filter: arg_filter,
              orderBy: arg_orderBy,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListLineItemsResponse(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.lineItems;
      var arg_request = buildLineItem();
      var arg_advertiserId = "foo";
      var arg_lineItemId = "foo";
      var arg_updateMask = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.LineItem.fromJson(json);
        checkLineItem(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["updateMask"].first, unittest.equals(arg_updateMask));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildLineItem());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_advertiserId, arg_lineItemId,
              updateMask: arg_updateMask, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkLineItem(response);
      })));
    });
  });

  unittest.group(
      "resource-AdvertisersLineItemsTargetingTypesAssignedTargetingOptionsResourceApi",
      () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsTargetingTypesAssignedTargetingOptionsResourceApi
          res = new api.DisplayvideoApi(mock)
              .advertisers
              .lineItems
              .targetingTypes
              .assignedTargetingOptions;
      var arg_request = buildAssignedTargetingOption();
      var arg_advertiserId = "foo";
      var arg_lineItemId = "foo";
      var arg_targetingType = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.AssignedTargetingOption.fromJson(json);
        checkAssignedTargetingOption(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAssignedTargetingOption());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(
              arg_request, arg_advertiserId, arg_lineItemId, arg_targetingType,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAssignedTargetingOption(response);
      })));
    });

    unittest.test("method--delete", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsTargetingTypesAssignedTargetingOptionsResourceApi
          res = new api.DisplayvideoApi(mock)
              .advertisers
              .lineItems
              .targetingTypes
              .assignedTargetingOptions;
      var arg_advertiserId = "foo";
      var arg_lineItemId = "foo";
      var arg_targetingType = "foo";
      var arg_assignedTargetingOptionId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .delete(arg_advertiserId, arg_lineItemId, arg_targetingType,
              arg_assignedTargetingOptionId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsTargetingTypesAssignedTargetingOptionsResourceApi
          res = new api.DisplayvideoApi(mock)
              .advertisers
              .lineItems
              .targetingTypes
              .assignedTargetingOptions;
      var arg_advertiserId = "foo";
      var arg_lineItemId = "foo";
      var arg_targetingType = "foo";
      var arg_assignedTargetingOptionId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildAssignedTargetingOption());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_advertiserId, arg_lineItemId, arg_targetingType,
              arg_assignedTargetingOptionId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkAssignedTargetingOption(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersLineItemsTargetingTypesAssignedTargetingOptionsResourceApi
          res = new api.DisplayvideoApi(mock)
              .advertisers
              .lineItems
              .targetingTypes
              .assignedTargetingOptions;
      var arg_advertiserId = "foo";
      var arg_lineItemId = "foo";
      var arg_targetingType = "foo";
      var arg_orderBy = "foo";
      var arg_filter = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json
            .encode(buildListLineItemAssignedTargetingOptionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_advertiserId, arg_lineItemId, arg_targetingType,
              orderBy: arg_orderBy,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListLineItemAssignedTargetingOptionsResponse(response);
      })));
    });
  });

  unittest.group("resource-AdvertisersLocationListsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersLocationListsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.locationLists;
      var arg_advertiserId = "foo";
      var arg_locationListId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildLocationList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_advertiserId, arg_locationListId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkLocationList(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersLocationListsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.locationLists;
      var arg_advertiserId = "foo";
      var arg_filter = "foo";
      var arg_orderBy = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListLocationListsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_advertiserId,
              filter: arg_filter,
              orderBy: arg_orderBy,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListLocationListsResponse(response);
      })));
    });
  });

  unittest.group("resource-AdvertisersNegativeKeywordListsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.AdvertisersNegativeKeywordListsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.negativeKeywordLists;
      var arg_advertiserId = "foo";
      var arg_negativeKeywordListId = "foo";
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
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildNegativeKeywordList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_advertiserId, arg_negativeKeywordListId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkNegativeKeywordList(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.AdvertisersNegativeKeywordListsResourceApi res =
          new api.DisplayvideoApi(mock).advertisers.negativeKeywordLists;
      var arg_advertiserId = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("v1/advertisers/"));
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
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListNegativeKeywordListsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_advertiserId,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListNegativeKeywordListsResponse(response);
      })));
    });
  });

  unittest.group("resource-CombinedAudiencesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.CombinedAudiencesResourceApi res =
          new api.DisplayvideoApi(mock).combinedAudiences;
      var arg_combinedAudienceId = "foo";
      var arg_advertiserId = "foo";
      var arg_partnerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 21),
            unittest.equals("v1/combinedAudiences/"));
        pathOffset += 21;
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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCombinedAudience());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_combinedAudienceId,
              advertiserId: arg_advertiserId,
              partnerId: arg_partnerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCombinedAudience(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CombinedAudiencesResourceApi res =
          new api.DisplayvideoApi(mock).combinedAudiences;
      var arg_advertiserId = "foo";
      var arg_orderBy = "foo";
      var arg_partnerId = "foo";
      var arg_filter = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("v1/combinedAudiences"));
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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListCombinedAudiencesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              advertiserId: arg_advertiserId,
              orderBy: arg_orderBy,
              partnerId: arg_partnerId,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListCombinedAudiencesResponse(response);
      })));
    });
  });

  unittest.group("resource-CustomListsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.CustomListsResourceApi res =
          new api.DisplayvideoApi(mock).customLists;
      var arg_customListId = "foo";
      var arg_advertiserId = "foo";
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
            unittest.equals("v1/customLists/"));
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
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildCustomList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_customListId,
              advertiserId: arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkCustomList(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.CustomListsResourceApi res =
          new api.DisplayvideoApi(mock).customLists;
      var arg_filter = "foo";
      var arg_advertiserId = "foo";
      var arg_orderBy = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 14),
            unittest.equals("v1/customLists"));
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListCustomListsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              filter: arg_filter,
              advertiserId: arg_advertiserId,
              orderBy: arg_orderBy,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListCustomListsResponse(response);
      })));
    });
  });

  unittest.group("resource-FirstAndThirdPartyAudiencesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.FirstAndThirdPartyAudiencesResourceApi res =
          new api.DisplayvideoApi(mock).firstAndThirdPartyAudiences;
      var arg_firstAndThirdPartyAudienceId = "foo";
      var arg_partnerId = "foo";
      var arg_advertiserId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 31),
            unittest.equals("v1/firstAndThirdPartyAudiences/"));
        pathOffset += 31;
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
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFirstAndThirdPartyAudience());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_firstAndThirdPartyAudienceId,
              partnerId: arg_partnerId,
              advertiserId: arg_advertiserId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFirstAndThirdPartyAudience(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.FirstAndThirdPartyAudiencesResourceApi res =
          new api.DisplayvideoApi(mock).firstAndThirdPartyAudiences;
      var arg_orderBy = "foo";
      var arg_partnerId = "foo";
      var arg_filter = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_advertiserId = "foo";
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
            unittest.equals("v1/firstAndThirdPartyAudiences"));
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
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp =
            convert.json.encode(buildListFirstAndThirdPartyAudiencesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              orderBy: arg_orderBy,
              partnerId: arg_partnerId,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              advertiserId: arg_advertiserId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListFirstAndThirdPartyAudiencesResponse(response);
      })));
    });
  });

  unittest.group("resource-FloodlightGroupsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.FloodlightGroupsResourceApi res =
          new api.DisplayvideoApi(mock).floodlightGroups;
      var arg_floodlightGroupId = "foo";
      var arg_partnerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("v1/floodlightGroups/"));
        pathOffset += 20;
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
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFloodlightGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_floodlightGroupId,
              partnerId: arg_partnerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightGroup(response);
      })));
    });

    unittest.test("method--patch", () {
      var mock = new HttpServerMock();
      api.FloodlightGroupsResourceApi res =
          new api.DisplayvideoApi(mock).floodlightGroups;
      var arg_request = buildFloodlightGroup();
      var arg_floodlightGroupId = "foo";
      var arg_partnerId = "foo";
      var arg_updateMask = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.FloodlightGroup.fromJson(json);
        checkFloodlightGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("v1/floodlightGroups/"));
        pathOffset += 20;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_floodlightGroupId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = <core.String, core.List<core.String>>{};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
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
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(
            queryMap["updateMask"].first, unittest.equals(arg_updateMask));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildFloodlightGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .patch(arg_request, arg_floodlightGroupId,
              partnerId: arg_partnerId,
              updateMask: arg_updateMask,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkFloodlightGroup(response);
      })));
    });
  });

  unittest.group("resource-GoogleAudiencesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.GoogleAudiencesResourceApi res =
          new api.DisplayvideoApi(mock).googleAudiences;
      var arg_googleAudienceId = "foo";
      var arg_partnerId = "foo";
      var arg_advertiserId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("v1/googleAudiences/"));
        pathOffset += 19;
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
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildGoogleAudience());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_googleAudienceId,
              partnerId: arg_partnerId,
              advertiserId: arg_advertiserId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGoogleAudience(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.GoogleAudiencesResourceApi res =
          new api.DisplayvideoApi(mock).googleAudiences;
      var arg_filter = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_advertiserId = "foo";
      var arg_orderBy = "foo";
      var arg_partnerId = "foo";
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
            unittest.equals("v1/googleAudiences"));
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListGoogleAudiencesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              advertiserId: arg_advertiserId,
              orderBy: arg_orderBy,
              partnerId: arg_partnerId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListGoogleAudiencesResponse(response);
      })));
    });
  });

  unittest.group("resource-InventorySourceGroupsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.InventorySourceGroupsResourceApi res =
          new api.DisplayvideoApi(mock).inventorySourceGroups;
      var arg_inventorySourceGroupId = "foo";
      var arg_partnerId = "foo";
      var arg_advertiserId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 25),
            unittest.equals("v1/inventorySourceGroups/"));
        pathOffset += 25;
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
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildInventorySourceGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_inventorySourceGroupId,
              partnerId: arg_partnerId,
              advertiserId: arg_advertiserId,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkInventorySourceGroup(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.InventorySourceGroupsResourceApi res =
          new api.DisplayvideoApi(mock).inventorySourceGroups;
      var arg_advertiserId = "foo";
      var arg_orderBy = "foo";
      var arg_partnerId = "foo";
      var arg_filter = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 24),
            unittest.equals("v1/inventorySourceGroups"));
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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp =
            convert.json.encode(buildListInventorySourceGroupsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              advertiserId: arg_advertiserId,
              orderBy: arg_orderBy,
              partnerId: arg_partnerId,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListInventorySourceGroupsResponse(response);
      })));
    });
  });

  unittest.group("resource-InventorySourcesResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.InventorySourcesResourceApi res =
          new api.DisplayvideoApi(mock).inventorySources;
      var arg_inventorySourceId = "foo";
      var arg_partnerId = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 20),
            unittest.equals("v1/inventorySources/"));
        pathOffset += 20;
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
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildInventorySource());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_inventorySourceId,
              partnerId: arg_partnerId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkInventorySource(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.InventorySourcesResourceApi res =
          new api.DisplayvideoApi(mock).inventorySources;
      var arg_advertiserId = "foo";
      var arg_orderBy = "foo";
      var arg_partnerId = "foo";
      var arg_filter = "foo";
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
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("v1/inventorySources"));
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
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(
            queryMap["partnerId"].first, unittest.equals(arg_partnerId));
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListInventorySourcesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(
              advertiserId: arg_advertiserId,
              orderBy: arg_orderBy,
              partnerId: arg_partnerId,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListInventorySourcesResponse(response);
      })));
    });
  });

  unittest.group("resource-MediaResourceApi", () {
    unittest.test("method--download", () {
      // TODO: Implement tests for media upload;
      // TODO: Implement tests for media download;

      var mock = new HttpServerMock();
      api.MediaResourceApi res = new api.DisplayvideoApi(mock).media;
      var arg_resourceName = "foo";
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
            unittest.equals("download/"));
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
        var resp = convert.json.encode(buildGoogleBytestreamMedia());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .download(arg_resourceName, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkGoogleBytestreamMedia(response);
      })));
    });
  });

  unittest.group("resource-PartnersChannelsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.PartnersChannelsResourceApi res =
          new api.DisplayvideoApi(mock).partners.channels;
      var arg_partnerId = "foo";
      var arg_channelId = "foo";
      var arg_advertiserId = "foo";
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
            unittest.equals("v1/partners/"));
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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_partnerId, arg_channelId,
              advertiserId: arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkChannel(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.PartnersChannelsResourceApi res =
          new api.DisplayvideoApi(mock).partners.channels;
      var arg_partnerId = "foo";
      var arg_filter = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_advertiserId = "foo";
      var arg_orderBy = "foo";
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
            unittest.equals("v1/partners/"));
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListChannelsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_partnerId,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              advertiserId: arg_advertiserId,
              orderBy: arg_orderBy,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListChannelsResponse(response);
      })));
    });
  });

  unittest.group("resource-SdfdownloadtasksResourceApi", () {
    unittest.test("method--create", () {
      var mock = new HttpServerMock();
      api.SdfdownloadtasksResourceApi res =
          new api.DisplayvideoApi(mock).sdfdownloadtasks;
      var arg_request = buildCreateSdfDownloadTaskRequest();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.CreateSdfDownloadTaskRequest.fromJson(json);
        checkCreateSdfDownloadTaskRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(
            path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 19),
            unittest.equals("v1/sdfdownloadtasks"));
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
        var resp = convert.json.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .create(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkOperation(response);
      })));
    });
  });

  unittest.group("resource-SdfdownloadtasksOperationsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.SdfdownloadtasksOperationsResourceApi res =
          new api.DisplayvideoApi(mock).sdfdownloadtasks.operations;
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

  unittest.group("resource-TargetingTypesTargetingOptionsResourceApi", () {
    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.TargetingTypesTargetingOptionsResourceApi res =
          new api.DisplayvideoApi(mock).targetingTypes.targetingOptions;
      var arg_targetingType = "foo";
      var arg_targetingOptionId = "foo";
      var arg_advertiserId = "foo";
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
            unittest.equals("v1/targetingTypes/"));
        pathOffset += 18;
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
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildTargetingOption());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_targetingType, arg_targetingOptionId,
              advertiserId: arg_advertiserId, $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkTargetingOption(response);
      })));
    });

    unittest.test("method--list", () {
      var mock = new HttpServerMock();
      api.TargetingTypesTargetingOptionsResourceApi res =
          new api.DisplayvideoApi(mock).targetingTypes.targetingOptions;
      var arg_targetingType = "foo";
      var arg_filter = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_advertiserId = "foo";
      var arg_orderBy = "foo";
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
            unittest.equals("v1/targetingTypes/"));
        pathOffset += 18;
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(
            queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first),
            unittest.equals(arg_pageSize));
        unittest.expect(
            queryMap["advertiserId"].first, unittest.equals(arg_advertiserId));
        unittest.expect(
            queryMap["orderBy"].first, unittest.equals(arg_orderBy));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.json.encode(buildListTargetingOptionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .list(arg_targetingType,
              filter: arg_filter,
              pageToken: arg_pageToken,
              pageSize: arg_pageSize,
              advertiserId: arg_advertiserId,
              orderBy: arg_orderBy,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((response) {
        checkListTargetingOptionsResponse(response);
      })));
    });
  });
}
