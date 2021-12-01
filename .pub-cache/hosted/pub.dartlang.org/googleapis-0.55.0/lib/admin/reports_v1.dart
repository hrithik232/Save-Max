// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: unused_import, unnecessary_cast

library googleapis.admin.reports_v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client admin/reports_v1';

/// Fetches reports for the administrators of G Suite customers about the usage,
/// collaboration, security, and risk for their users.
class AdminApi {
  /// View audit reports for your G Suite domain
  static const AdminReportsAuditReadonlyScope =
      "https://www.googleapis.com/auth/admin.reports.audit.readonly";

  /// View usage reports for your G Suite domain
  static const AdminReportsUsageReadonlyScope =
      "https://www.googleapis.com/auth/admin.reports.usage.readonly";

  final commons.ApiRequester _requester;

  ActivitiesResourceApi get activities => new ActivitiesResourceApi(_requester);
  ChannelsResourceApi get channels => new ChannelsResourceApi(_requester);
  CustomerUsageReportsResourceApi get customerUsageReports =>
      new CustomerUsageReportsResourceApi(_requester);
  EntityUsageReportsResourceApi get entityUsageReports =>
      new EntityUsageReportsResourceApi(_requester);
  UserUsageReportResourceApi get userUsageReport =>
      new UserUsageReportResourceApi(_requester);

  AdminApi(http.Client client,
      {core.String rootUrl = "https://www.googleapis.com/",
      core.String servicePath = "admin/reports/v1/"})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class ActivitiesResourceApi {
  final commons.ApiRequester _requester;

  ActivitiesResourceApi(commons.ApiRequester client) : _requester = client;

  /// Retrieves a list of activities for a specific customer's account and
  /// application such as the Admin console application or the Google Drive
  /// application. For more information, see the guides for administrator and
  /// Google Drive activity reports. For more information about the activity
  /// report's parameters, see the activity parameters reference guides.
  ///
  /// Request parameters:
  ///
  /// [userKey] - Represents the profile ID or the user email for which the data
  /// should be filtered. Can be all for all information, or userKey for a
  /// user's unique G Suite profile ID or their primary email address.
  ///
  /// [applicationName] - Application name for which the events are to be
  /// retrieved.
  /// Value must have pattern
  /// "(admin)|(calendar)|(drive)|(login)|(mobile)|(token)|(groups)|(saml)|(chat)|(gplus)|(rules)|(jamboard)|(meet)|(user_accounts)|(access_transparency)|(groups_enterprise)|(gcp)".
  /// Possible string values are:
  /// - "access_transparency" : The G Suite Access Transparency activity reports
  /// return information about different types of Access Transparency activity
  /// events.
  /// - "admin" : The Admin console application's activity reports return
  /// account information about different types of administrator activity
  /// events.
  /// - "calendar" : The G Suite Calendar application's activity reports return
  /// information about various Calendar activity events.
  /// - "chat" : The Chat activity reports return information about various Chat
  /// activity events.
  /// - "drive" : The Google Drive application's activity reports return
  /// information about various Google Drive activity events. The Drive activity
  /// report is only available for G Suite Business customers.
  /// - "gcp" : The Google Cloud Platform application's activity reports return
  /// information about various GCP activity events.
  /// - "gplus" : The Google+ application's activity reports return information
  /// about various Google+ activity events.
  /// - "groups" : The Google Groups application's activity reports return
  /// information about various Groups activity events.
  /// - "groups_enterprise" : The Enterprise Groups activity reports return
  /// information about various Enterprise group activity events.
  /// - "jamboard" : The Jamboard activity reports return information about
  /// various Jamboard activity events.
  /// - "login" : The Login application's activity reports return account
  /// information about different types of Login activity events.
  /// - "meet" : The Meet Audit activity report return information about
  /// different types of Meet Audit activity events.
  /// - "mobile" : The Mobile Audit activity report return information about
  /// different types of Mobile Audit activity events.
  /// - "rules" : The Rules activity report return information about different
  /// types of Rules activity events.
  /// - "saml" : The SAML activity report return information about different
  /// types of SAML activity events.
  /// - "token" : The Token application's activity reports return account
  /// information about different types of Token activity events.
  /// - "user_accounts" : The User Accounts application's activity reports
  /// return account information about different types of User Accounts activity
  /// events.
  ///
  /// [actorIpAddress] - The Internet Protocol (IP) Address of host where the
  /// event was performed. This is an additional way to filter a report's
  /// summary using the IP address of the user whose activity is being reported.
  /// This IP address may or may not reflect the user's physical location. For
  /// example, the IP address can be the user's proxy server's address or a
  /// virtual private network (VPN) address. This parameter supports both IPv4
  /// and IPv6 address versions.
  ///
  /// [customerId] - The unique ID of the customer to retrieve data for.
  /// Value must have pattern "C.+".
  ///
  /// [endTime] - Sets the end of the range of time shown in the report. The
  /// date is in the RFC 3339 format, for example 2010-10-28T10:26:35.000Z. The
  /// default value is the approximate time of the API request. An API report
  /// has three basic time concepts:
  /// - Date of the API's request for a report: When the API created and
  /// retrieved the report.
  /// - Report's start time: The beginning of the timespan shown in the report.
  /// The startTime must be before the endTime (if specified) and the current
  /// time when the request is made, or the API returns an error.
  /// - Report's end time: The end of the timespan shown in the report. For
  /// example, the timespan of events summarized in a report can start in April
  /// and end in May. The report itself can be requested in August.  If the
  /// endTime is not specified, the report returns all activities from the
  /// startTime until the current time or the most recent 180 days if the
  /// startTime is more than 180 days in the past.
  /// Value must have pattern
  /// "(\d\d\d\d)-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)(?:\.(\d+))?(?:(Z)|([-+])(\d\d):(\d\d))".
  ///
  /// [eventName] - The name of the event being queried by the API. Each
  /// eventName is related to a specific G Suite service or feature which the
  /// API organizes into types of events. An example is the Google Calendar
  /// events in the Admin console application's reports. The Calendar Settings
  /// type structure has all of the Calendar eventName activities reported by
  /// the API. When an administrator changes a Calendar setting, the API reports
  /// this activity in the Calendar Settings type and eventName parameters. For
  /// more information about eventName query strings and parameters, see the
  /// list of event names for various applications above in applicationName.
  ///
  /// [filters] - The filters query string is a comma-separated list. The list
  /// is composed of event parameters that are manipulated by relational
  /// operators. Event parameters are in the form [parameter1 name][relational
  /// operator][parameter1 value],[parameter2 name][relational
  /// operator][parameter2 value],...
  /// These event parameters are associated with a specific eventName. An empty
  /// report is returned if the filtered request's parameter does not belong to
  /// the eventName. For more information about eventName parameters, see the
  /// list of event names for various applications above in applicationName.
  ///
  /// In the following Admin Activity example, the <> operator is URL-encoded in
  /// the request's query string (%3C%3E):
  /// GET...&eventName=CHANGE_CALENDAR_SETTING
  /// &filters=NEW_VALUE%3C%3EREAD_ONLY_ACCESS
  ///
  /// In the following Drive example, the list can be a view or edit event's
  /// doc_id parameter with a value that is manipulated by an 'equal to' (==) or
  /// 'not equal to' (<>) relational operator. In the first example, the report
  /// returns each edited document's doc_id. In the second example, the report
  /// returns each viewed document's doc_id that equals the value 12345 and does
  /// not return any viewed document's which have a doc_id value of 98765. The
  /// <> operator is URL-encoded in the request's query string (%3C%3E):
  ///
  /// GET...&eventName=edit&filters=doc_id
  /// GET...&eventName=view&filters=doc_id==12345,doc_id%3C%3E98765
  ///
  /// The relational operators include:
  /// - == - 'equal to'.
  /// - <> - 'not equal to'. It is URL-encoded (%3C%3E).
  /// - < - 'less than'. It is URL-encoded (%3C).
  /// - <= - 'less than or equal to'. It is URL-encoded (%3C=).
  /// - > - 'greater than'. It is URL-encoded (%3E).
  /// - >= - 'greater than or equal to'. It is URL-encoded (%3E=).
  /// Note: The API doesn't accept multiple values of a parameter. If a
  /// particular parameter is supplied more than once in the API request, the
  /// API only accepts the last value of that request parameter.
  /// In addition, if an invalid request parameter is supplied in the API
  /// request, the API ignores that request parameter and returns the response
  /// corresponding to the remaining valid request parameters. If no parameters
  /// are requested, all parameters are returned.
  /// Value must have pattern
  /// "(.+[<,<=,==,>=,>,<>].+,)*(.+[<,<=,==,>=,>,<>].+)".
  ///
  /// [maxResults] - Determines how many activity records are shown on each
  /// response page. For example, if the request sets maxResults=1 and the
  /// report has two activities, the report has two pages. The response's
  /// nextPageToken property has the token to the second page. The maxResults
  /// query string is optional in the request. The default value is 1000.
  /// Value must be between "1" and "1000".
  ///
  /// [orgUnitID] - ID of the organizational unit to report on. Activity records
  /// will be shown only for users who belong to the specified organizational
  /// unit. Data before Dec 17, 2018 doesn't appear in the filtered results.
  /// Value must have pattern "(id:[a-z0-9]+)".
  ///
  /// [pageToken] - The token to specify next page. A report with multiple pages
  /// has a nextPageToken property in the response. In your follow-on request
  /// getting the next page of the report, enter the nextPageToken value in the
  /// pageToken query string.
  ///
  /// [startTime] - Sets the beginning of the range of time shown in the report.
  /// The date is in the RFC 3339 format, for example 2010-10-28T10:26:35.000Z.
  /// The report returns all activities from startTime until endTime. The
  /// startTime must be before the endTime (if specified) and the current time
  /// when the request is made, or the API returns an error.
  /// Value must have pattern
  /// "(\d\d\d\d)-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)(?:\.(\d+))?(?:(Z)|([-+])(\d\d):(\d\d))".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Activities].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Activities> list(
      core.String userKey, core.String applicationName,
      {core.String actorIpAddress,
      core.String customerId,
      core.String endTime,
      core.String eventName,
      core.String filters,
      core.int maxResults,
      core.String orgUnitID,
      core.String pageToken,
      core.String startTime,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (userKey == null) {
      throw new core.ArgumentError("Parameter userKey is required.");
    }
    if (applicationName == null) {
      throw new core.ArgumentError("Parameter applicationName is required.");
    }
    if (actorIpAddress != null) {
      _queryParams["actorIpAddress"] = [actorIpAddress];
    }
    if (customerId != null) {
      _queryParams["customerId"] = [customerId];
    }
    if (endTime != null) {
      _queryParams["endTime"] = [endTime];
    }
    if (eventName != null) {
      _queryParams["eventName"] = [eventName];
    }
    if (filters != null) {
      _queryParams["filters"] = [filters];
    }
    if (maxResults != null) {
      _queryParams["maxResults"] = ["${maxResults}"];
    }
    if (orgUnitID != null) {
      _queryParams["orgUnitID"] = [orgUnitID];
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (startTime != null) {
      _queryParams["startTime"] = [startTime];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'activity/users/' +
        commons.Escaper.ecapeVariable('$userKey') +
        '/applications/' +
        commons.Escaper.ecapeVariable('$applicationName');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Activities.fromJson(data));
  }

  /// Start receiving notifications for account activities. For more
  /// information, see Receiving Push Notifications.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [userKey] - Represents the profile ID or the user email for which the data
  /// should be filtered. Can be all for all information, or userKey for a
  /// user's unique G Suite profile ID or their primary email address.
  ///
  /// [applicationName] - Application name for which the events are to be
  /// retrieved.
  /// Value must have pattern
  /// "(admin)|(calendar)|(drive)|(login)|(mobile)|(token)|(groups)|(saml)|(chat)|(gplus)|(rules)|(jamboard)|(meet)|(user_accounts)|(access_transparency)|(groups_enterprise)|(gcp)".
  /// Possible string values are:
  /// - "access_transparency" : The G Suite Access Transparency activity reports
  /// return information about different types of Access Transparency activity
  /// events.
  /// - "admin" : The Admin console application's activity reports return
  /// account information about different types of administrator activity
  /// events.
  /// - "calendar" : The G Suite Calendar application's activity reports return
  /// information about various Calendar activity events.
  /// - "chat" : The Chat activity reports return information about various Chat
  /// activity events.
  /// - "drive" : The Google Drive application's activity reports return
  /// information about various Google Drive activity events. The Drive activity
  /// report is only available for G Suite Business customers.
  /// - "gcp" : The Google Cloud Platform application's activity reports return
  /// information about various GCP activity events.
  /// - "gplus" : The Google+ application's activity reports return information
  /// about various Google+ activity events.
  /// - "groups" : The Google Groups application's activity reports return
  /// information about various Groups activity events.
  /// - "groups_enterprise" : The Enterprise Groups activity reports return
  /// information about various Enterprise group activity events.
  /// - "jamboard" : The Jamboard activity reports return information about
  /// various Jamboard activity events.
  /// - "login" : The Login application's activity reports return account
  /// information about different types of Login activity events.
  /// - "meet" : The Meet Audit activity report return information about
  /// different types of Meet Audit activity events.
  /// - "mobile" : The Mobile Audit activity report return information about
  /// different types of Mobile Audit activity events.
  /// - "rules" : The Rules activity report return information about different
  /// types of Rules activity events.
  /// - "saml" : The SAML activity report return information about different
  /// types of SAML activity events.
  /// - "token" : The Token application's activity reports return account
  /// information about different types of Token activity events.
  /// - "user_accounts" : The User Accounts application's activity reports
  /// return account information about different types of User Accounts activity
  /// events.
  ///
  /// [actorIpAddress] - The Internet Protocol (IP) Address of host where the
  /// event was performed. This is an additional way to filter a report's
  /// summary using the IP address of the user whose activity is being reported.
  /// This IP address may or may not reflect the user's physical location. For
  /// example, the IP address can be the user's proxy server's address or a
  /// virtual private network (VPN) address. This parameter supports both IPv4
  /// and IPv6 address versions.
  ///
  /// [customerId] - The unique ID of the customer to retrieve data for.
  /// Value must have pattern "C.+".
  ///
  /// [endTime] - Sets the end of the range of time shown in the report. The
  /// date is in the RFC 3339 format, for example 2010-10-28T10:26:35.000Z. The
  /// default value is the approximate time of the API request. An API report
  /// has three basic time concepts:
  /// - Date of the API's request for a report: When the API created and
  /// retrieved the report.
  /// - Report's start time: The beginning of the timespan shown in the report.
  /// The startTime must be before the endTime (if specified) and the current
  /// time when the request is made, or the API returns an error.
  /// - Report's end time: The end of the timespan shown in the report. For
  /// example, the timespan of events summarized in a report can start in April
  /// and end in May. The report itself can be requested in August.  If the
  /// endTime is not specified, the report returns all activities from the
  /// startTime until the current time or the most recent 180 days if the
  /// startTime is more than 180 days in the past.
  /// Value must have pattern
  /// "(\d\d\d\d)-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)(?:\.(\d+))?(?:(Z)|([-+])(\d\d):(\d\d))".
  ///
  /// [eventName] - The name of the event being queried by the API. Each
  /// eventName is related to a specific G Suite service or feature which the
  /// API organizes into types of events. An example is the Google Calendar
  /// events in the Admin console application's reports. The Calendar Settings
  /// type structure has all of the Calendar eventName activities reported by
  /// the API. When an administrator changes a Calendar setting, the API reports
  /// this activity in the Calendar Settings type and eventName parameters. For
  /// more information about eventName query strings and parameters, see the
  /// list of event names for various applications above in applicationName.
  ///
  /// [filters] - The filters query string is a comma-separated list. The list
  /// is composed of event parameters that are manipulated by relational
  /// operators. Event parameters are in the form [parameter1 name][relational
  /// operator][parameter1 value],[parameter2 name][relational
  /// operator][parameter2 value],...
  /// These event parameters are associated with a specific eventName. An empty
  /// report is returned if the filtered request's parameter does not belong to
  /// the eventName. For more information about eventName parameters, see the
  /// list of event names for various applications above in applicationName.
  ///
  /// In the following Admin Activity example, the <> operator is URL-encoded in
  /// the request's query string (%3C%3E):
  /// GET...&eventName=CHANGE_CALENDAR_SETTING
  /// &filters=NEW_VALUE%3C%3EREAD_ONLY_ACCESS
  ///
  /// In the following Drive example, the list can be a view or edit event's
  /// doc_id parameter with a value that is manipulated by an 'equal to' (==) or
  /// 'not equal to' (<>) relational operator. In the first example, the report
  /// returns each edited document's doc_id. In the second example, the report
  /// returns each viewed document's doc_id that equals the value 12345 and does
  /// not return any viewed document's which have a doc_id value of 98765. The
  /// <> operator is URL-encoded in the request's query string (%3C%3E):
  ///
  /// GET...&eventName=edit&filters=doc_id
  /// GET...&eventName=view&filters=doc_id==12345,doc_id%3C%3E98765
  ///
  /// The relational operators include:
  /// - == - 'equal to'.
  /// - <> - 'not equal to'. It is URL-encoded (%3C%3E).
  /// - < - 'less than'. It is URL-encoded (%3C).
  /// - <= - 'less than or equal to'. It is URL-encoded (%3C=).
  /// - > - 'greater than'. It is URL-encoded (%3E).
  /// - >= - 'greater than or equal to'. It is URL-encoded (%3E=).
  /// Note: The API doesn't accept multiple values of a parameter. If a
  /// particular parameter is supplied more than once in the API request, the
  /// API only accepts the last value of that request parameter.
  /// In addition, if an invalid request parameter is supplied in the API
  /// request, the API ignores that request parameter and returns the response
  /// corresponding to the remaining valid request parameters. If no parameters
  /// are requested, all parameters are returned.
  /// Value must have pattern
  /// "(.+[<,<=,==,>=,>,<>].+,)*(.+[<,<=,==,>=,>,<>].+)".
  ///
  /// [maxResults] - Determines how many activity records are shown on each
  /// response page. For example, if the request sets maxResults=1 and the
  /// report has two activities, the report has two pages. The response's
  /// nextPageToken property has the token to the second page. The maxResults
  /// query string is optional in the request. The default value is 1000.
  /// Value must be between "1" and "1000".
  ///
  /// [orgUnitID] - ID of the organizational unit to report on. Activity records
  /// will be shown only for users who belong to the specified organizational
  /// unit. Data before Dec 17, 2018 doesn't appear in the filtered results.
  /// Value must have pattern "(id:[a-z0-9]+)".
  ///
  /// [pageToken] - The token to specify next page. A report with multiple pages
  /// has a nextPageToken property in the response. In your follow-on request
  /// getting the next page of the report, enter the nextPageToken value in the
  /// pageToken query string.
  ///
  /// [startTime] - Sets the beginning of the range of time shown in the report.
  /// The date is in the RFC 3339 format, for example 2010-10-28T10:26:35.000Z.
  /// The report returns all activities from startTime until endTime. The
  /// startTime must be before the endTime (if specified) and the current time
  /// when the request is made, or the API returns an error.
  /// Value must have pattern
  /// "(\d\d\d\d)-(\d\d)-(\d\d)T(\d\d):(\d\d):(\d\d)(?:\.(\d+))?(?:(Z)|([-+])(\d\d):(\d\d))".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Channel].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Channel> watch(
      Channel request, core.String userKey, core.String applicationName,
      {core.String actorIpAddress,
      core.String customerId,
      core.String endTime,
      core.String eventName,
      core.String filters,
      core.int maxResults,
      core.String orgUnitID,
      core.String pageToken,
      core.String startTime,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (request != null) {
      _body = convert.json.encode((request).toJson());
    }
    if (userKey == null) {
      throw new core.ArgumentError("Parameter userKey is required.");
    }
    if (applicationName == null) {
      throw new core.ArgumentError("Parameter applicationName is required.");
    }
    if (actorIpAddress != null) {
      _queryParams["actorIpAddress"] = [actorIpAddress];
    }
    if (customerId != null) {
      _queryParams["customerId"] = [customerId];
    }
    if (endTime != null) {
      _queryParams["endTime"] = [endTime];
    }
    if (eventName != null) {
      _queryParams["eventName"] = [eventName];
    }
    if (filters != null) {
      _queryParams["filters"] = [filters];
    }
    if (maxResults != null) {
      _queryParams["maxResults"] = ["${maxResults}"];
    }
    if (orgUnitID != null) {
      _queryParams["orgUnitID"] = [orgUnitID];
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (startTime != null) {
      _queryParams["startTime"] = [startTime];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'activity/users/' +
        commons.Escaper.ecapeVariable('$userKey') +
        '/applications/' +
        commons.Escaper.ecapeVariable('$applicationName') +
        '/watch';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Channel.fromJson(data));
  }
}

class ChannelsResourceApi {
  final commons.ApiRequester _requester;

  ChannelsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Stop watching resources through this channel
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future stop(Channel request, {core.String $fields}) {
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

    _downloadOptions = null;

    _url = '/admin/reports_v1/channels/stop';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => null);
  }
}

class CustomerUsageReportsResourceApi {
  final commons.ApiRequester _requester;

  CustomerUsageReportsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Retrieves a report which is a collection of properties and statistics for
  /// a specific customer's account. For more information, see the Customers
  /// Usage Report guide. For more information about the customer report's
  /// parameters, see the Customers Usage parameters reference guides.
  ///
  /// Request parameters:
  ///
  /// [date] - Represents the date the usage occurred. The timestamp is in the
  /// ISO 8601 format, yyyy-mm-dd. We recommend you use your account's time zone
  /// for this.
  /// Value must have pattern "(\d){4}-(\d){2}-(\d){2}".
  ///
  /// [customerId] - The unique ID of the customer to retrieve data for.
  /// Value must have pattern "C.+".
  ///
  /// [pageToken] - Token to specify next page. A report with multiple pages has
  /// a nextPageToken property in the response. For your follow-on requests
  /// getting all of the report's pages, enter the nextPageToken value in the
  /// pageToken query string.
  ///
  /// [parameters] - The parameters query string is a comma-separated list of
  /// event parameters that refine a report's results. The parameter is
  /// associated with a specific application. The application values for the
  /// Customers usage report include accounts, app_maker, apps_scripts,
  /// calendar, classroom, cros, docs, gmail, gplus, device_management, meet,
  /// and sites.
  /// A parameters query string is in the CSV form of app_name1:param_name1,
  /// app_name2:param_name2.
  /// Note: The API doesn't accept multiple values of a parameter. If a
  /// particular parameter is supplied more than once in the API request, the
  /// API only accepts the last value of that request parameter.
  /// In addition, if an invalid request parameter is supplied in the API
  /// request, the API ignores that request parameter and returns the response
  /// corresponding to the remaining valid request parameters.
  ///
  /// An example of an invalid request parameter is one that does not belong to
  /// the application. If no parameters are requested, all parameters are
  /// returned.
  /// Value must have pattern
  /// "(((accounts)|(app_maker)|(apps_scripts)|(classroom)|(cros)|(gmail)|(calendar)|(docs)|(gplus)|(sites)|(device_management)|(drive)|(meet)):[^,]+,)*(((accounts)|(app_maker)|(apps_scripts)|(classroom)|(cros)|(gmail)|(calendar)|(docs)|(gplus)|(sites)|(device_management)|(drive)|(meet)):[^,]+)".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [UsageReports].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<UsageReports> get(core.String date,
      {core.String customerId,
      core.String pageToken,
      core.String parameters,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (date == null) {
      throw new core.ArgumentError("Parameter date is required.");
    }
    if (customerId != null) {
      _queryParams["customerId"] = [customerId];
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (parameters != null) {
      _queryParams["parameters"] = [parameters];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'usage/dates/' + commons.Escaper.ecapeVariable('$date');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new UsageReports.fromJson(data));
  }
}

class EntityUsageReportsResourceApi {
  final commons.ApiRequester _requester;

  EntityUsageReportsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Retrieves a report which is a collection of properties and statistics for
  /// entities used by users within the account. For more information, see the
  /// Entities Usage Report guide. For more information about the entities
  /// report's parameters, see the Entities Usage parameters reference guides.
  ///
  /// Request parameters:
  ///
  /// [entityType] - Represents the type of entity for the report.
  /// Value must have pattern "(gplus_communities)".
  /// Possible string values are:
  /// - "gplus_communities" : Returns a report on Google+ communities.
  ///
  /// [entityKey] - Represents the key of the object to filter the data with.
  /// Possible string values are:
  /// - "all" : Returns activity events for all users.
  /// - "entityKey" : Represents an app-specific identifier for the entity. For
  /// details on how to obtain the entityKey for a particular entityType, see
  /// the Entities Usage parameters reference guides.
  ///
  /// [date] - Represents the date the usage occurred. The timestamp is in the
  /// ISO 8601 format, yyyy-mm-dd. We recommend you use your account's time zone
  /// for this.
  /// Value must have pattern "(\d){4}-(\d){2}-(\d){2}".
  ///
  /// [customerId] - The unique ID of the customer to retrieve data for.
  /// Value must have pattern "C.+".
  ///
  /// [filters] - The filters query string is a comma-separated list of an
  /// application's event parameters where the parameter's value is manipulated
  /// by a relational operator. The filters query string includes the name of
  /// the application whose usage is returned in the report. The application
  /// values for the Entities usage report include accounts, docs, and gmail.
  /// Filters are in the form [application name]:[parameter name][relational
  /// operator][parameter value],....
  ///
  /// In this example, the <> 'not equal to' operator is URL-encoded in the
  /// request's query string (%3C%3E):
  /// GET
  /// https://www.googleapis.com/admin/reports/v1/usage/gplus_communities/all/dates/2017-12-01
  /// ?parameters=gplus:community_name,gplus:num_total_members
  /// &filters=gplus:num_total_members>0
  ///
  ///
  /// The relational operators include:
  /// - == - 'equal to'.
  /// - <> - 'not equal to'. It is URL-encoded (%3C%3E).
  /// - < - 'less than'. It is URL-encoded (%3C).
  /// - <= - 'less than or equal to'. It is URL-encoded (%3C=).
  /// - > - 'greater than'. It is URL-encoded (%3E).
  /// - >= - 'greater than or equal to'. It is URL-encoded (%3E=).  Filters can
  /// only be applied to numeric parameters.
  /// Value must have pattern
  /// "(((gplus)):[a-z0-9_]+[<,<=,==,>=,>,!=][^,]+,)*(((gplus)):[a-z0-9_]+[<,<=,==,>=,>,!=][^,]+)".
  ///
  /// [maxResults] - Determines how many activity records are shown on each
  /// response page. For example, if the request sets maxResults=1 and the
  /// report has two activities, the report has two pages. The response's
  /// nextPageToken property has the token to the second page.
  /// Value must be between "1" and "1000".
  ///
  /// [pageToken] - Token to specify next page. A report with multiple pages has
  /// a nextPageToken property in the response. In your follow-on request
  /// getting the next page of the report, enter the nextPageToken value in the
  /// pageToken query string.
  ///
  /// [parameters] - The parameters query string is a comma-separated list of
  /// event parameters that refine a report's results. The parameter is
  /// associated with a specific application. The application values for the
  /// Entities usage report are only gplus.
  /// A parameter query string is in the CSV form of [app_name1:param_name1],
  /// [app_name2:param_name2]....
  /// Note: The API doesn't accept multiple values of a parameter. If a
  /// particular parameter is supplied more than once in the API request, the
  /// API only accepts the last value of that request parameter.
  /// In addition, if an invalid request parameter is supplied in the API
  /// request, the API ignores that request parameter and returns the response
  /// corresponding to the remaining valid request parameters.
  ///
  /// An example of an invalid request parameter is one that does not belong to
  /// the application. If no parameters are requested, all parameters are
  /// returned.
  /// Value must have pattern "(((gplus)):[^,]+,)*(((gplus)):[^,]+)".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [UsageReports].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<UsageReports> get(
      core.String entityType, core.String entityKey, core.String date,
      {core.String customerId,
      core.String filters,
      core.int maxResults,
      core.String pageToken,
      core.String parameters,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (entityType == null) {
      throw new core.ArgumentError("Parameter entityType is required.");
    }
    if (entityKey == null) {
      throw new core.ArgumentError("Parameter entityKey is required.");
    }
    if (date == null) {
      throw new core.ArgumentError("Parameter date is required.");
    }
    if (customerId != null) {
      _queryParams["customerId"] = [customerId];
    }
    if (filters != null) {
      _queryParams["filters"] = [filters];
    }
    if (maxResults != null) {
      _queryParams["maxResults"] = ["${maxResults}"];
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (parameters != null) {
      _queryParams["parameters"] = [parameters];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'usage/' +
        commons.Escaper.ecapeVariable('$entityType') +
        '/' +
        commons.Escaper.ecapeVariable('$entityKey') +
        '/dates/' +
        commons.Escaper.ecapeVariable('$date');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new UsageReports.fromJson(data));
  }
}

class UserUsageReportResourceApi {
  final commons.ApiRequester _requester;

  UserUsageReportResourceApi(commons.ApiRequester client) : _requester = client;

  /// Retrieves a report which is a collection of properties and statistics for
  /// a set of users with the account. For more information, see the User Usage
  /// Report guide. For more information about the user report's parameters, see
  /// the Users Usage parameters reference guides.
  ///
  /// Request parameters:
  ///
  /// [userKey] - Represents the profile ID or the user email for which the data
  /// should be filtered. Can be all for all information, or userKey for a
  /// user's unique G Suite profile ID or their primary email address.
  ///
  /// [date] - Represents the date the usage occurred. The timestamp is in the
  /// ISO 8601 format, yyyy-mm-dd. We recommend you use your account's time zone
  /// for this.
  /// Value must have pattern "(\d){4}-(\d){2}-(\d){2}".
  ///
  /// [customerId] - The unique ID of the customer to retrieve data for.
  /// Value must have pattern "C.+".
  ///
  /// [filters] - The filters query string is a comma-separated list of an
  /// application's event parameters where the parameter's value is manipulated
  /// by a relational operator. The filters query string includes the name of
  /// the application whose usage is returned in the report. The application
  /// values for the Users Usage Report include accounts, docs, and gmail.
  /// Filters are in the form [application name]:[parameter name][relational
  /// operator][parameter value],....
  ///
  /// In this example, the <> 'not equal to' operator is URL-encoded in the
  /// request's query string (%3C%3E):
  /// GET
  /// https://www.googleapis.com/admin/reports/v1/usage/users/all/dates/2013-03-03
  /// ?parameters=accounts:last_login_time
  /// &filters=accounts:last_login_time>2010-10-28T10:26:35.000Z
  ///
  ///
  /// The relational operators include:
  /// - == - 'equal to'.
  /// - <> - 'not equal to'. It is URL-encoded (%3C%3E).
  /// - < - 'less than'. It is URL-encoded (%3C).
  /// - <= - 'less than or equal to'. It is URL-encoded (%3C=).
  /// - > - 'greater than'. It is URL-encoded (%3E).
  /// - >= - 'greater than or equal to'. It is URL-encoded (%3E=).
  /// Value must have pattern
  /// "(((accounts)|(classroom)|(cros)|(gmail)|(calendar)|(docs)|(gplus)|(sites)|(device_management)|(drive)):[a-z0-9_]+[<,<=,==,>=,>,!=][^,]+,)*(((accounts)|(classroom)|(cros)|(gmail)|(calendar)|(docs)|(gplus)|(sites)|(device_management)|(drive)):[a-z0-9_]+[<,<=,==,>=,>,!=][^,]+)".
  ///
  /// [maxResults] - Determines how many activity records are shown on each
  /// response page. For example, if the request sets maxResults=1 and the
  /// report has two activities, the report has two pages. The response's
  /// nextPageToken property has the token to the second page.
  /// The maxResults query string is optional.
  /// Value must be between "1" and "1000".
  ///
  /// [orgUnitID] - ID of the organizational unit to report on. User activity
  /// will be shown only for users who belong to the specified organizational
  /// unit. Data before Dec 17, 2018 doesn't appear in the filtered results.
  /// Value must have pattern "(id:[a-z0-9]+)".
  ///
  /// [pageToken] - Token to specify next page. A report with multiple pages has
  /// a nextPageToken property in the response. In your follow-on request
  /// getting the next page of the report, enter the nextPageToken value in the
  /// pageToken query string.
  ///
  /// [parameters] - The parameters query string is a comma-separated list of
  /// event parameters that refine a report's results. The parameter is
  /// associated with a specific application. The application values for the
  /// Customers usage report include accounts, app_maker, apps_scripts,
  /// calendar, classroom, cros, docs, gmail, gplus, device_management, meet,
  /// and sites.
  /// A parameters query string is in the CSV form of app_name1:param_name1,
  /// app_name2:param_name2.
  /// Note: The API doesn't accept multiple values of a parameter.
  /// If a particular parameter is supplied more than once in the API request,
  /// the API only accepts the last value of that request parameter. In
  /// addition, if an invalid request parameter is supplied in the API request,
  /// the API ignores that request parameter and returns the response
  /// corresponding to the remaining valid request parameters.
  ///
  /// An example of an invalid request parameter is one that does not belong to
  /// the application. If no parameters are requested, all parameters are
  /// returned.
  /// Value must have pattern
  /// "(((accounts)|(classroom)|(cros)|(gmail)|(calendar)|(docs)|(gplus)|(sites)|(device_management)|(drive)):[^,]+,)*(((accounts)|(classroom)|(cros)|(gmail)|(calendar)|(docs)|(gplus)|(sites)|(device_management)|(drive)):[^,]+)".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [UsageReports].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<UsageReports> get(core.String userKey, core.String date,
      {core.String customerId,
      core.String filters,
      core.int maxResults,
      core.String orgUnitID,
      core.String pageToken,
      core.String parameters,
      core.String $fields}) {
    var _url;
    var _queryParams = new core.Map<core.String, core.List<core.String>>();
    var _uploadMedia;
    var _uploadOptions;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body;

    if (userKey == null) {
      throw new core.ArgumentError("Parameter userKey is required.");
    }
    if (date == null) {
      throw new core.ArgumentError("Parameter date is required.");
    }
    if (customerId != null) {
      _queryParams["customerId"] = [customerId];
    }
    if (filters != null) {
      _queryParams["filters"] = [filters];
    }
    if (maxResults != null) {
      _queryParams["maxResults"] = ["${maxResults}"];
    }
    if (orgUnitID != null) {
      _queryParams["orgUnitID"] = [orgUnitID];
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (parameters != null) {
      _queryParams["parameters"] = [parameters];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'usage/users/' +
        commons.Escaper.ecapeVariable('$userKey') +
        '/dates/' +
        commons.Escaper.ecapeVariable('$date');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new UsageReports.fromJson(data));
  }
}

/// JSON template for a collection of activites.
class Activities {
  /// ETag of the resource.
  core.String etag;

  /// Each activity record in the response.
  core.List<Activity> items;

  /// The type of API resource. For an activity report, the value is
  /// reports#activities.
  core.String kind;

  /// Token for retrieving the follow-on next page of the report. The
  /// nextPageToken value is used in the request's pageToken query string.
  core.String nextPageToken;

  Activities();

  Activities.fromJson(core.Map _json) {
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("items")) {
      items = (_json["items"] as core.List)
          .map<Activity>((value) => new Activity.fromJson(value))
          .toList();
    }
    if (_json.containsKey("kind")) {
      kind = _json["kind"];
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (items != null) {
      _json["items"] = items.map((value) => (value).toJson()).toList();
    }
    if (kind != null) {
      _json["kind"] = kind;
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// User doing the action.
class ActivityActor {
  /// The type of actor.
  core.String callerType;

  /// The primary email address of the actor. May be absent if there is no email
  /// address associated with the actor.
  core.String email;

  /// Only present when callerType is KEY. Can be the consumer_key of the
  /// requestor for OAuth 2LO API requests or an identifier for robot accounts.
  core.String key;

  /// The unique G Suite profile ID of the actor. May be absent if the actor is
  /// not a G Suite user.
  core.String profileId;

  ActivityActor();

  ActivityActor.fromJson(core.Map _json) {
    if (_json.containsKey("callerType")) {
      callerType = _json["callerType"];
    }
    if (_json.containsKey("email")) {
      email = _json["email"];
    }
    if (_json.containsKey("key")) {
      key = _json["key"];
    }
    if (_json.containsKey("profileId")) {
      profileId = _json["profileId"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (callerType != null) {
      _json["callerType"] = callerType;
    }
    if (email != null) {
      _json["email"] = email;
    }
    if (key != null) {
      _json["key"] = key;
    }
    if (profileId != null) {
      _json["profileId"] = profileId;
    }
    return _json;
  }
}

/// Nested parameter value pairs associated with this parameter. Complex value
/// type for a parameter are returned as a list of parameter values. For
/// example, the address parameter may have a value as [{parameter: [{name:
/// city, value: abc}]}]
class ActivityEventsParametersMessageValue {
  /// Parameter values
  core.List<NestedParameter> parameter;

  ActivityEventsParametersMessageValue();

  ActivityEventsParametersMessageValue.fromJson(core.Map _json) {
    if (_json.containsKey("parameter")) {
      parameter = (_json["parameter"] as core.List)
          .map<NestedParameter>((value) => new NestedParameter.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (parameter != null) {
      _json["parameter"] = parameter.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class ActivityEventsParametersMultiMessageValue {
  /// Parameter values
  core.List<NestedParameter> parameter;

  ActivityEventsParametersMultiMessageValue();

  ActivityEventsParametersMultiMessageValue.fromJson(core.Map _json) {
    if (_json.containsKey("parameter")) {
      parameter = (_json["parameter"] as core.List)
          .map<NestedParameter>((value) => new NestedParameter.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (parameter != null) {
      _json["parameter"] = parameter.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class ActivityEventsParameters {
  /// Boolean value of the parameter.
  core.bool boolValue;

  /// Integer value of the parameter.
  core.String intValue;

  /// Nested parameter value pairs associated with this parameter. Complex value
  /// type for a parameter are returned as a list of parameter values. For
  /// example, the address parameter may have a value as [{parameter: [{name:
  /// city, value: abc}]}]
  ActivityEventsParametersMessageValue messageValue;

  /// Integer values of the parameter.
  core.List<core.String> multiIntValue;

  /// List of messageValue objects.
  core.List<ActivityEventsParametersMultiMessageValue> multiMessageValue;

  /// String values of the parameter.
  core.List<core.String> multiValue;

  /// The name of the parameter.
  core.String name;

  /// String value of the parameter.
  core.String value;

  ActivityEventsParameters();

  ActivityEventsParameters.fromJson(core.Map _json) {
    if (_json.containsKey("boolValue")) {
      boolValue = _json["boolValue"];
    }
    if (_json.containsKey("intValue")) {
      intValue = _json["intValue"];
    }
    if (_json.containsKey("messageValue")) {
      messageValue = new ActivityEventsParametersMessageValue.fromJson(
          _json["messageValue"]);
    }
    if (_json.containsKey("multiIntValue")) {
      multiIntValue = (_json["multiIntValue"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("multiMessageValue")) {
      multiMessageValue = (_json["multiMessageValue"] as core.List)
          .map<ActivityEventsParametersMultiMessageValue>((value) =>
              new ActivityEventsParametersMultiMessageValue.fromJson(value))
          .toList();
    }
    if (_json.containsKey("multiValue")) {
      multiValue = (_json["multiValue"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("value")) {
      value = _json["value"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (boolValue != null) {
      _json["boolValue"] = boolValue;
    }
    if (intValue != null) {
      _json["intValue"] = intValue;
    }
    if (messageValue != null) {
      _json["messageValue"] = (messageValue).toJson();
    }
    if (multiIntValue != null) {
      _json["multiIntValue"] = multiIntValue;
    }
    if (multiMessageValue != null) {
      _json["multiMessageValue"] =
          multiMessageValue.map((value) => (value).toJson()).toList();
    }
    if (multiValue != null) {
      _json["multiValue"] = multiValue;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (value != null) {
      _json["value"] = value;
    }
    return _json;
  }
}

class ActivityEvents {
  /// Name of the event. This is the specific name of the activity reported by
  /// the API. And each eventName is related to a specific G Suite service or
  /// feature which the API organizes into types of events.
  /// For eventName request parameters in general:
  /// - If no eventName is given, the report returns all possible instances of
  /// an eventName.
  /// - When you request an eventName, the API's response returns all activities
  /// which contain that eventName. It is possible that the returned activities
  /// will have other eventName properties in addition to the one requested.
  /// For more information about eventName properties, see the list of event
  /// names for various applications above in applicationName.
  core.String name;

  /// Parameter value pairs for various applications. For more information about
  /// eventName parameters, see the list of event names for various applications
  /// above in applicationName.
  core.List<ActivityEventsParameters> parameters;

  /// Type of event. The G Suite service or feature that an administrator
  /// changes is identified in the type property which identifies an event using
  /// the eventName property. For a full list of the API's type categories, see
  /// the list of event names for various applications above in applicationName.
  core.String type;

  ActivityEvents();

  ActivityEvents.fromJson(core.Map _json) {
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("parameters")) {
      parameters = (_json["parameters"] as core.List)
          .map<ActivityEventsParameters>(
              (value) => new ActivityEventsParameters.fromJson(value))
          .toList();
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (name != null) {
      _json["name"] = name;
    }
    if (parameters != null) {
      _json["parameters"] =
          parameters.map((value) => (value).toJson()).toList();
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

/// Unique identifier for each activity record.
class ActivityId {
  /// Application name to which the event belongs. For possible values see the
  /// list of applications above in applicationName.
  core.String applicationName;

  /// The unique identifier for a G suite account.
  core.String customerId;

  /// Time of occurrence of the activity. This is in UNIX epoch time in seconds.
  core.DateTime time;

  /// Unique qualifier if multiple events have the same time.
  core.String uniqueQualifier;

  ActivityId();

  ActivityId.fromJson(core.Map _json) {
    if (_json.containsKey("applicationName")) {
      applicationName = _json["applicationName"];
    }
    if (_json.containsKey("customerId")) {
      customerId = _json["customerId"];
    }
    if (_json.containsKey("time")) {
      time = core.DateTime.parse(_json["time"]);
    }
    if (_json.containsKey("uniqueQualifier")) {
      uniqueQualifier = _json["uniqueQualifier"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (applicationName != null) {
      _json["applicationName"] = applicationName;
    }
    if (customerId != null) {
      _json["customerId"] = customerId;
    }
    if (time != null) {
      _json["time"] = (time).toIso8601String();
    }
    if (uniqueQualifier != null) {
      _json["uniqueQualifier"] = uniqueQualifier;
    }
    return _json;
  }
}

/// JSON template for the activity resource.
class Activity {
  /// User doing the action.
  ActivityActor actor;

  /// ETag of the entry.
  core.String etag;

  /// Activity events in the report.
  core.List<ActivityEvents> events;

  /// Unique identifier for each activity record.
  ActivityId id;

  /// IP address of the user doing the action. This is the Internet Protocol
  /// (IP) address of the user when logging into G Suite which may or may not
  /// reflect the user's physical location. For example, the IP address can be
  /// the user's proxy server's address or a virtual private network (VPN)
  /// address. The API supports IPv4 and IPv6.
  core.String ipAddress;

  /// The type of API resource. For an activity report, the value is
  /// audit#activity.
  core.String kind;

  /// This is the domain that is affected by the report's event. For example
  /// domain of Admin console or the Drive application's document owner.
  core.String ownerDomain;

  Activity();

  Activity.fromJson(core.Map _json) {
    if (_json.containsKey("actor")) {
      actor = new ActivityActor.fromJson(_json["actor"]);
    }
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("events")) {
      events = (_json["events"] as core.List)
          .map<ActivityEvents>((value) => new ActivityEvents.fromJson(value))
          .toList();
    }
    if (_json.containsKey("id")) {
      id = new ActivityId.fromJson(_json["id"]);
    }
    if (_json.containsKey("ipAddress")) {
      ipAddress = _json["ipAddress"];
    }
    if (_json.containsKey("kind")) {
      kind = _json["kind"];
    }
    if (_json.containsKey("ownerDomain")) {
      ownerDomain = _json["ownerDomain"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (actor != null) {
      _json["actor"] = (actor).toJson();
    }
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (events != null) {
      _json["events"] = events.map((value) => (value).toJson()).toList();
    }
    if (id != null) {
      _json["id"] = (id).toJson();
    }
    if (ipAddress != null) {
      _json["ipAddress"] = ipAddress;
    }
    if (kind != null) {
      _json["kind"] = kind;
    }
    if (ownerDomain != null) {
      _json["ownerDomain"] = ownerDomain;
    }
    return _json;
  }
}

/// An notification channel used to watch for resource changes.
class Channel {
  /// The address where notifications are delivered for this channel.
  core.String address;

  /// Date and time of notification channel expiration, expressed as a Unix
  /// timestamp, in milliseconds. Optional.
  core.String expiration;

  /// A UUID or similar unique string that identifies this channel.
  core.String id;

  /// Identifies this as a notification channel used to watch for changes to a
  /// resource, which is "api#channel".
  core.String kind;

  /// Additional parameters controlling delivery channel behavior. Optional.
  core.Map<core.String, core.String> params;

  /// A Boolean value to indicate whether payload is wanted. Optional.
  core.bool payload;

  /// An opaque ID that identifies the resource being watched on this channel.
  /// Stable across different API versions.
  core.String resourceId;

  /// A version-specific identifier for the watched resource.
  core.String resourceUri;

  /// An arbitrary string delivered to the target address with each notification
  /// delivered over this channel. Optional.
  core.String token;

  /// The type of delivery mechanism used for this channel.
  core.String type;

  Channel();

  Channel.fromJson(core.Map _json) {
    if (_json.containsKey("address")) {
      address = _json["address"];
    }
    if (_json.containsKey("expiration")) {
      expiration = _json["expiration"];
    }
    if (_json.containsKey("id")) {
      id = _json["id"];
    }
    if (_json.containsKey("kind")) {
      kind = _json["kind"];
    }
    if (_json.containsKey("params")) {
      params = (_json["params"] as core.Map).cast<core.String, core.String>();
    }
    if (_json.containsKey("payload")) {
      payload = _json["payload"];
    }
    if (_json.containsKey("resourceId")) {
      resourceId = _json["resourceId"];
    }
    if (_json.containsKey("resourceUri")) {
      resourceUri = _json["resourceUri"];
    }
    if (_json.containsKey("token")) {
      token = _json["token"];
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (address != null) {
      _json["address"] = address;
    }
    if (expiration != null) {
      _json["expiration"] = expiration;
    }
    if (id != null) {
      _json["id"] = id;
    }
    if (kind != null) {
      _json["kind"] = kind;
    }
    if (params != null) {
      _json["params"] = params;
    }
    if (payload != null) {
      _json["payload"] = payload;
    }
    if (resourceId != null) {
      _json["resourceId"] = resourceId;
    }
    if (resourceUri != null) {
      _json["resourceUri"] = resourceUri;
    }
    if (token != null) {
      _json["token"] = token;
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

/// JSON template for a parameter used in various reports.
class NestedParameter {
  /// Boolean value of the parameter.
  core.bool boolValue;

  /// Integer value of the parameter.
  core.String intValue;

  /// Multiple boolean values of the parameter.
  core.List<core.bool> multiBoolValue;

  /// Multiple integer values of the parameter.
  core.List<core.String> multiIntValue;

  /// Multiple string values of the parameter.
  core.List<core.String> multiValue;

  /// The name of the parameter.
  core.String name;

  /// String value of the parameter.
  core.String value;

  NestedParameter();

  NestedParameter.fromJson(core.Map _json) {
    if (_json.containsKey("boolValue")) {
      boolValue = _json["boolValue"];
    }
    if (_json.containsKey("intValue")) {
      intValue = _json["intValue"];
    }
    if (_json.containsKey("multiBoolValue")) {
      multiBoolValue = (_json["multiBoolValue"] as core.List).cast<core.bool>();
    }
    if (_json.containsKey("multiIntValue")) {
      multiIntValue = (_json["multiIntValue"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("multiValue")) {
      multiValue = (_json["multiValue"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("value")) {
      value = _json["value"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (boolValue != null) {
      _json["boolValue"] = boolValue;
    }
    if (intValue != null) {
      _json["intValue"] = intValue;
    }
    if (multiBoolValue != null) {
      _json["multiBoolValue"] = multiBoolValue;
    }
    if (multiIntValue != null) {
      _json["multiIntValue"] = multiIntValue;
    }
    if (multiValue != null) {
      _json["multiValue"] = multiValue;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (value != null) {
      _json["value"] = value;
    }
    return _json;
  }
}

/// Information about the type of the item.
class UsageReportEntity {
  /// The unique identifier of the customer's account.
  core.String customerId;

  /// Object key. Only relevant if entity.type = "OBJECT" Note: external-facing
  /// name of report is "Entities" rather than "Objects".
  core.String entityId;

  /// The user's immutable G Suite profile identifier.
  core.String profileId;

  /// The type of item. The value is customer.
  core.String type;

  /// The user's email address. Only relevant if entity.type = "USER"
  core.String userEmail;

  UsageReportEntity();

  UsageReportEntity.fromJson(core.Map _json) {
    if (_json.containsKey("customerId")) {
      customerId = _json["customerId"];
    }
    if (_json.containsKey("entityId")) {
      entityId = _json["entityId"];
    }
    if (_json.containsKey("profileId")) {
      profileId = _json["profileId"];
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
    if (_json.containsKey("userEmail")) {
      userEmail = _json["userEmail"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (customerId != null) {
      _json["customerId"] = customerId;
    }
    if (entityId != null) {
      _json["entityId"] = entityId;
    }
    if (profileId != null) {
      _json["profileId"] = profileId;
    }
    if (type != null) {
      _json["type"] = type;
    }
    if (userEmail != null) {
      _json["userEmail"] = userEmail;
    }
    return _json;
  }
}

class UsageReportParameters {
  /// Boolean value of the parameter.
  core.bool boolValue;

  /// The RFC 3339 formatted value of the parameter, for example
  /// 2010-10-28T10:26:35.000Z.
  core.DateTime datetimeValue;

  /// Integer value of the parameter.
  core.String intValue;

  /// Nested message value of the parameter.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.List<core.Map<core.String, core.Object>> msgValue;
  core.String name;

  /// String value of the parameter.
  core.String stringValue;

  UsageReportParameters();

  UsageReportParameters.fromJson(core.Map _json) {
    if (_json.containsKey("boolValue")) {
      boolValue = _json["boolValue"];
    }
    if (_json.containsKey("datetimeValue")) {
      datetimeValue = core.DateTime.parse(_json["datetimeValue"]);
    }
    if (_json.containsKey("intValue")) {
      intValue = _json["intValue"];
    }
    if (_json.containsKey("msgValue")) {
      msgValue = (_json["msgValue"] as core.List)
          .map<core.Map<core.String, core.Object>>(
              (value) => (value as core.Map).cast<core.String, core.Object>())
          .toList();
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("stringValue")) {
      stringValue = _json["stringValue"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (boolValue != null) {
      _json["boolValue"] = boolValue;
    }
    if (datetimeValue != null) {
      _json["datetimeValue"] = (datetimeValue).toIso8601String();
    }
    if (intValue != null) {
      _json["intValue"] = intValue;
    }
    if (msgValue != null) {
      _json["msgValue"] = msgValue;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (stringValue != null) {
      _json["stringValue"] = stringValue;
    }
    return _json;
  }
}

/// JSON template for a usage report.
class UsageReport {
  /// The date of the report request.
  core.String date;

  /// Information about the type of the item.
  UsageReportEntity entity;

  /// ETag of the resource.
  core.String etag;

  /// The type of API resource. For a usage report, the value is
  /// admin#reports#usageReport.
  core.String kind;

  /// Parameter value pairs for various applications. For the Customers usage
  /// report parameters and values, see the customer usage parameters reference.
  core.List<UsageReportParameters> parameters;

  UsageReport();

  UsageReport.fromJson(core.Map _json) {
    if (_json.containsKey("date")) {
      date = _json["date"];
    }
    if (_json.containsKey("entity")) {
      entity = new UsageReportEntity.fromJson(_json["entity"]);
    }
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("kind")) {
      kind = _json["kind"];
    }
    if (_json.containsKey("parameters")) {
      parameters = (_json["parameters"] as core.List)
          .map<UsageReportParameters>(
              (value) => new UsageReportParameters.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (date != null) {
      _json["date"] = date;
    }
    if (entity != null) {
      _json["entity"] = (entity).toJson();
    }
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (kind != null) {
      _json["kind"] = kind;
    }
    if (parameters != null) {
      _json["parameters"] =
          parameters.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class UsageReportsWarningsData {
  /// Key associated with a key-value pair to give detailed information on the
  /// warning.
  core.String key;

  /// Value associated with a key-value pair to give detailed information on the
  /// warning.
  core.String value;

  UsageReportsWarningsData();

  UsageReportsWarningsData.fromJson(core.Map _json) {
    if (_json.containsKey("key")) {
      key = _json["key"];
    }
    if (_json.containsKey("value")) {
      value = _json["value"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (key != null) {
      _json["key"] = key;
    }
    if (value != null) {
      _json["value"] = value;
    }
    return _json;
  }
}

class UsageReportsWarnings {
  /// Machine readable code or warning type. The warning code value is 200.
  core.String code;

  /// Key-value pairs to give detailed information on the warning.
  core.List<UsageReportsWarningsData> data;

  /// The human readable messages for a warning are:
  /// - Data is not available warning - Sorry, data for date yyyy-mm-dd for
  /// application "application name" is not available.
  /// - Partial data is available warning - Data for date yyyy-mm-dd for
  /// application "application name" is not available right now, please try
  /// again after a few hours.
  core.String message;

  UsageReportsWarnings();

  UsageReportsWarnings.fromJson(core.Map _json) {
    if (_json.containsKey("code")) {
      code = _json["code"];
    }
    if (_json.containsKey("data")) {
      data = (_json["data"] as core.List)
          .map<UsageReportsWarningsData>(
              (value) => new UsageReportsWarningsData.fromJson(value))
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
    if (data != null) {
      _json["data"] = data.map((value) => (value).toJson()).toList();
    }
    if (message != null) {
      _json["message"] = message;
    }
    return _json;
  }
}

class UsageReports {
  /// ETag of the resource.
  core.String etag;

  /// The type of API resource. For a usage report, the value is
  /// admin#reports#usageReports.
  core.String kind;

  /// Token to specify next page. A report with multiple pages has a
  /// nextPageToken property in the response. For your follow-on requests
  /// getting all of the report's pages, enter the nextPageToken value in the
  /// pageToken query string.
  core.String nextPageToken;

  /// Various application parameter records.
  core.List<UsageReport> usageReports;

  /// Warnings, if any.
  core.List<UsageReportsWarnings> warnings;

  UsageReports();

  UsageReports.fromJson(core.Map _json) {
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("kind")) {
      kind = _json["kind"];
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
    if (_json.containsKey("usageReports")) {
      usageReports = (_json["usageReports"] as core.List)
          .map<UsageReport>((value) => new UsageReport.fromJson(value))
          .toList();
    }
    if (_json.containsKey("warnings")) {
      warnings = (_json["warnings"] as core.List)
          .map<UsageReportsWarnings>(
              (value) => new UsageReportsWarnings.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (kind != null) {
      _json["kind"] = kind;
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    if (usageReports != null) {
      _json["usageReports"] =
          usageReports.map((value) => (value).toJson()).toList();
    }
    if (warnings != null) {
      _json["warnings"] = warnings.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}
