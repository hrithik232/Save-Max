// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: unused_import, unnecessary_cast

library googleapis.policytroubleshooter.v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client policytroubleshooter/v1';

class PolicytroubleshooterApi {
  /// View and manage your data across Google Cloud Platform services
  static const CloudPlatformScope =
      "https://www.googleapis.com/auth/cloud-platform";

  final commons.ApiRequester _requester;

  IamResourceApi get iam => new IamResourceApi(_requester);

  PolicytroubleshooterApi(http.Client client,
      {core.String rootUrl = "https://policytroubleshooter.googleapis.com/",
      core.String servicePath = ""})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class IamResourceApi {
  final commons.ApiRequester _requester;

  IamResourceApi(commons.ApiRequester client) : _requester = client;

  /// Checks whether a member has a specific permission for a specific resource,
  /// and explains why the member does or does not have that permission.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a
  /// [GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyResponse>
      troubleshoot(
          GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyRequest request,
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

    _url = 'v1/iam:troubleshoot';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) =>
        new GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyResponse
            .fromJson(data));
  }
}

/// Information about the member, resource, and permission to check.
class GoogleCloudPolicytroubleshooterV1AccessTuple {
  /// Required. The full resource name that identifies the resource. For
  /// example,
  /// `//compute.googleapis.com/projects/my-project/zones/us-central1-a/instances/my-instance`.
  ///
  /// For examples of full resource names for Google Cloud services, see
  /// https://cloud.google.com/iam/help/troubleshooter/full-resource-names.
  core.String fullResourceName;

  /// Required. The IAM permission to check for the specified member and
  /// resource.
  ///
  /// For a complete list of IAM permissions, see
  /// https://cloud.google.com/iam/help/permissions/reference.
  ///
  /// For a complete list of predefined IAM roles and the permissions in each
  /// role, see https://cloud.google.com/iam/help/roles/reference.
  core.String permission;

  /// Required. The member, or principal, whose access you want to check, in the
  /// form of
  /// the email address that represents that member. For example,
  /// `alice@example.com` or
  /// `my-service-account@my-project.iam.gserviceaccount.com`.
  ///
  /// The member must be a Google Account or a service account. Other types of
  /// members are not supported.
  core.String principal;

  GoogleCloudPolicytroubleshooterV1AccessTuple();

  GoogleCloudPolicytroubleshooterV1AccessTuple.fromJson(core.Map _json) {
    if (_json.containsKey("fullResourceName")) {
      fullResourceName = _json["fullResourceName"];
    }
    if (_json.containsKey("permission")) {
      permission = _json["permission"];
    }
    if (_json.containsKey("principal")) {
      principal = _json["principal"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (fullResourceName != null) {
      _json["fullResourceName"] = fullResourceName;
    }
    if (permission != null) {
      _json["permission"] = permission;
    }
    if (principal != null) {
      _json["principal"] = principal;
    }
    return _json;
  }
}

/// Details about how a binding in a policy affects a member's ability to use a
/// permission.
class GoogleCloudPolicytroubleshooterV1BindingExplanation {
  /// Required. Indicates whether _this binding_ provides the specified
  /// permission to the
  /// specified member for the specified resource.
  ///
  /// This field does _not_ indicate whether the member actually has the
  /// permission for the resource. There might be another binding that overrides
  /// this binding. To determine whether the member actually has the permission,
  /// use the `access` field in the
  /// TroubleshootIamPolicyResponse.
  /// Possible string values are:
  /// - "ACCESS_STATE_UNSPECIFIED" : Reserved for future use.
  /// - "GRANTED" : The member has the permission.
  /// - "NOT_GRANTED" : The member does not have the permission.
  /// - "UNKNOWN_CONDITIONAL" : The member has the permission only if a
  /// condition expression evaluates to
  /// `true`.
  /// - "UNKNOWN_INFO_DENIED" : The sender of the request does not have access
  /// to all of the policies that
  /// Policy Troubleshooter needs to evaluate.
  core.String access;

  /// A condition expression that prevents access unless the expression
  /// evaluates
  /// to `true`.
  ///
  /// To learn about IAM Conditions, see
  /// http://cloud.google.com/iam/help/conditions/overview.
  GoogleTypeExpr condition;

  /// Indicates whether each member in the binding includes the member specified
  /// in the request, either directly or indirectly. Each key identifies a
  /// member
  /// in the binding, and each value indicates whether the member in the binding
  /// includes the member in the request.
  ///
  /// For example, suppose that a binding includes the following members:
  ///
  /// * `user:alice@example.com`
  /// * `group:product-eng@example.com`
  ///
  /// You want to troubleshoot access for `user:bob@example.com`. This user is a
  /// member of the group `group:product-eng@example.com`.
  ///
  /// For the first member in the binding, the key is `user:alice@example.com`,
  /// and the `membership` field in the value is set to
  /// `MEMBERSHIP_NOT_INCLUDED`.
  ///
  /// For the second member in the binding, the key is
  /// `group:product-eng@example.com`, and the `membership` field in the value
  /// is
  /// set to `MEMBERSHIP_INCLUDED`.
  core.Map<core.String,
          GoogleCloudPolicytroubleshooterV1BindingExplanationAnnotatedMembership>
      memberships;

  /// The relevance of this binding to the overall determination for the entire
  /// policy.
  /// Possible string values are:
  /// - "HEURISTIC_RELEVANCE_UNSPECIFIED" : Reserved for future use.
  /// - "NORMAL" : The data point has a limited effect on the result. Changing
  /// the data point
  /// is unlikely to affect the overall determination.
  /// - "HIGH" : The data point has a strong effect on the result. Changing the
  /// data point
  /// is likely to affect the overall determination.
  core.String relevance;

  /// The role that this binding grants. For example,
  /// `roles/compute.serviceAgent`.
  ///
  /// For a complete list of predefined IAM roles, as well as the permissions in
  /// each role, see https://cloud.google.com/iam/help/roles/reference.
  core.String role;

  /// Indicates whether the role granted by this binding contains the specified
  /// permission.
  /// Possible string values are:
  /// - "ROLE_PERMISSION_UNSPECIFIED" : Reserved for future use.
  /// - "ROLE_PERMISSION_INCLUDED" : The permission is included in the role.
  /// - "ROLE_PERMISSION_NOT_INCLUDED" : The permission is not included in the
  /// role.
  /// - "ROLE_PERMISSION_UNKNOWN_INFO_DENIED" : The sender of the request is not
  /// allowed to access the binding.
  core.String rolePermission;

  /// The relevance of the permission's existence, or nonexistence, in the role
  /// to the overall determination for the entire policy.
  /// Possible string values are:
  /// - "HEURISTIC_RELEVANCE_UNSPECIFIED" : Reserved for future use.
  /// - "NORMAL" : The data point has a limited effect on the result. Changing
  /// the data point
  /// is unlikely to affect the overall determination.
  /// - "HIGH" : The data point has a strong effect on the result. Changing the
  /// data point
  /// is likely to affect the overall determination.
  core.String rolePermissionRelevance;

  GoogleCloudPolicytroubleshooterV1BindingExplanation();

  GoogleCloudPolicytroubleshooterV1BindingExplanation.fromJson(core.Map _json) {
    if (_json.containsKey("access")) {
      access = _json["access"];
    }
    if (_json.containsKey("condition")) {
      condition = new GoogleTypeExpr.fromJson(_json["condition"]);
    }
    if (_json.containsKey("memberships")) {
      memberships = commons.mapMap<core.Map,
              GoogleCloudPolicytroubleshooterV1BindingExplanationAnnotatedMembership>(
          _json["memberships"].cast<core.String, core.Map>(),
          (core.Map item) =>
              new GoogleCloudPolicytroubleshooterV1BindingExplanationAnnotatedMembership
                  .fromJson(item));
    }
    if (_json.containsKey("relevance")) {
      relevance = _json["relevance"];
    }
    if (_json.containsKey("role")) {
      role = _json["role"];
    }
    if (_json.containsKey("rolePermission")) {
      rolePermission = _json["rolePermission"];
    }
    if (_json.containsKey("rolePermissionRelevance")) {
      rolePermissionRelevance = _json["rolePermissionRelevance"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (access != null) {
      _json["access"] = access;
    }
    if (condition != null) {
      _json["condition"] = (condition).toJson();
    }
    if (memberships != null) {
      _json["memberships"] = commons.mapMap<
              GoogleCloudPolicytroubleshooterV1BindingExplanationAnnotatedMembership,
              core.Map<core.String, core.Object>>(
          memberships,
          (GoogleCloudPolicytroubleshooterV1BindingExplanationAnnotatedMembership
                  item) =>
              (item).toJson());
    }
    if (relevance != null) {
      _json["relevance"] = relevance;
    }
    if (role != null) {
      _json["role"] = role;
    }
    if (rolePermission != null) {
      _json["rolePermission"] = rolePermission;
    }
    if (rolePermissionRelevance != null) {
      _json["rolePermissionRelevance"] = rolePermissionRelevance;
    }
    return _json;
  }
}

/// Details about whether the binding includes the member.
class GoogleCloudPolicytroubleshooterV1BindingExplanationAnnotatedMembership {
  /// Indicates whether the binding includes the member.
  /// Possible string values are:
  /// - "MEMBERSHIP_UNSPECIFIED" : Reserved for future use.
  /// - "MEMBERSHIP_INCLUDED" : The binding includes the member. The member can
  /// be included directly
  /// or indirectly. For example:
  ///
  /// * A member is included directly if that member is listed in the binding.
  /// * A member is included indirectly if that member is in a Google group or
  ///   G Suite domain that is listed in the binding.
  /// - "MEMBERSHIP_NOT_INCLUDED" : The binding does not include the member.
  /// - "MEMBERSHIP_UNKNOWN_INFO_DENIED" : The sender of the request is not
  /// allowed to access the binding.
  /// - "MEMBERSHIP_UNKNOWN_UNSUPPORTED" : The member is an unsupported type.
  /// Only Google Accounts and service
  /// accounts are supported.
  core.String membership;

  /// The relevance of the member's status to the overall determination for the
  /// binding.
  /// Possible string values are:
  /// - "HEURISTIC_RELEVANCE_UNSPECIFIED" : Reserved for future use.
  /// - "NORMAL" : The data point has a limited effect on the result. Changing
  /// the data point
  /// is unlikely to affect the overall determination.
  /// - "HIGH" : The data point has a strong effect on the result. Changing the
  /// data point
  /// is likely to affect the overall determination.
  core.String relevance;

  GoogleCloudPolicytroubleshooterV1BindingExplanationAnnotatedMembership();

  GoogleCloudPolicytroubleshooterV1BindingExplanationAnnotatedMembership.fromJson(
      core.Map _json) {
    if (_json.containsKey("membership")) {
      membership = _json["membership"];
    }
    if (_json.containsKey("relevance")) {
      relevance = _json["relevance"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (membership != null) {
      _json["membership"] = membership;
    }
    if (relevance != null) {
      _json["relevance"] = relevance;
    }
    return _json;
  }
}

/// Details about how a specific IAM Policy contributed
/// to the access check.
class GoogleCloudPolicytroubleshooterV1ExplainedPolicy {
  /// Indicates whether _this policy_ provides the specified permission to the
  /// specified member for the specified resource.
  ///
  /// This field does _not_ indicate whether the member actually has the
  /// permission for the resource. There might be another policy that overrides
  /// this policy. To determine whether the member actually has the permission,
  /// use the `access` field in the
  /// TroubleshootIamPolicyResponse.
  /// Possible string values are:
  /// - "ACCESS_STATE_UNSPECIFIED" : Reserved for future use.
  /// - "GRANTED" : The member has the permission.
  /// - "NOT_GRANTED" : The member does not have the permission.
  /// - "UNKNOWN_CONDITIONAL" : The member has the permission only if a
  /// condition expression evaluates to
  /// `true`.
  /// - "UNKNOWN_INFO_DENIED" : The sender of the request does not have access
  /// to all of the policies that
  /// Policy Troubleshooter needs to evaluate.
  core.String access;

  /// Details about how each binding in the policy affects the member's ability,
  /// or inability, to use the permission for the resource.
  ///
  /// If the sender of the request does not have access to the policy, this
  /// field
  /// is omitted.
  core.List<GoogleCloudPolicytroubleshooterV1BindingExplanation>
      bindingExplanations;

  /// The full resource name that identifies the resource. For example,
  /// `//compute.googleapis.com/projects/my-project/zones/us-central1-a/instances/my-instance`.
  ///
  /// If the sender of the request does not have access to the policy, this
  /// field
  /// is omitted.
  ///
  /// For examples of full resource names for Google Cloud services, see
  /// https://cloud.google.com/iam/help/troubleshooter/full-resource-names.
  core.String fullResourceName;

  /// The IAM policy attached to the resource.
  ///
  /// If the sender of the request does not have access to the policy, this
  /// field
  /// is empty.
  GoogleIamV1Policy policy;

  /// The relevance of this policy to the overall determination in the
  /// TroubleshootIamPolicyResponse.
  ///
  /// If the sender of the request does not have access to the policy, this
  /// field
  /// is omitted.
  /// Possible string values are:
  /// - "HEURISTIC_RELEVANCE_UNSPECIFIED" : Reserved for future use.
  /// - "NORMAL" : The data point has a limited effect on the result. Changing
  /// the data point
  /// is unlikely to affect the overall determination.
  /// - "HIGH" : The data point has a strong effect on the result. Changing the
  /// data point
  /// is likely to affect the overall determination.
  core.String relevance;

  GoogleCloudPolicytroubleshooterV1ExplainedPolicy();

  GoogleCloudPolicytroubleshooterV1ExplainedPolicy.fromJson(core.Map _json) {
    if (_json.containsKey("access")) {
      access = _json["access"];
    }
    if (_json.containsKey("bindingExplanations")) {
      bindingExplanations = (_json["bindingExplanations"] as core.List)
          .map<GoogleCloudPolicytroubleshooterV1BindingExplanation>((value) =>
              new GoogleCloudPolicytroubleshooterV1BindingExplanation.fromJson(
                  value))
          .toList();
    }
    if (_json.containsKey("fullResourceName")) {
      fullResourceName = _json["fullResourceName"];
    }
    if (_json.containsKey("policy")) {
      policy = new GoogleIamV1Policy.fromJson(_json["policy"]);
    }
    if (_json.containsKey("relevance")) {
      relevance = _json["relevance"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (access != null) {
      _json["access"] = access;
    }
    if (bindingExplanations != null) {
      _json["bindingExplanations"] =
          bindingExplanations.map((value) => (value).toJson()).toList();
    }
    if (fullResourceName != null) {
      _json["fullResourceName"] = fullResourceName;
    }
    if (policy != null) {
      _json["policy"] = (policy).toJson();
    }
    if (relevance != null) {
      _json["relevance"] = relevance;
    }
    return _json;
  }
}

/// Request for TroubleshootIamPolicy.
class GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyRequest {
  /// The information to use for checking whether a member has a permission for
  /// a
  /// resource.
  GoogleCloudPolicytroubleshooterV1AccessTuple accessTuple;

  GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyRequest();

  GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyRequest.fromJson(
      core.Map _json) {
    if (_json.containsKey("accessTuple")) {
      accessTuple = new GoogleCloudPolicytroubleshooterV1AccessTuple.fromJson(
          _json["accessTuple"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (accessTuple != null) {
      _json["accessTuple"] = (accessTuple).toJson();
    }
    return _json;
  }
}

/// Response for TroubleshootIamPolicy.
class GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyResponse {
  /// Indicates whether the member has the specified permission for the
  /// specified
  /// resource, based on evaluating all of the applicable IAM policies.
  /// Possible string values are:
  /// - "ACCESS_STATE_UNSPECIFIED" : Reserved for future use.
  /// - "GRANTED" : The member has the permission.
  /// - "NOT_GRANTED" : The member does not have the permission.
  /// - "UNKNOWN_CONDITIONAL" : The member has the permission only if a
  /// condition expression evaluates to
  /// `true`.
  /// - "UNKNOWN_INFO_DENIED" : The sender of the request does not have access
  /// to all of the policies that
  /// Policy Troubleshooter needs to evaluate.
  core.String access;

  /// List of IAM policies that were evaluated to check the member's
  /// permissions,
  /// with annotations to indicate how each policy contributed to the final
  /// result.
  ///
  /// The list of policies can include the policy for the resource itself. It
  /// can
  /// also include policies that are inherited from higher levels of the
  /// resource
  /// hierarchy, including the organization, the folder, and the project.
  ///
  /// To learn more about the resource hierarchy, see
  /// https://cloud.google.com/iam/help/resource-hierarchy.
  core.List<GoogleCloudPolicytroubleshooterV1ExplainedPolicy> explainedPolicies;

  GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyResponse();

  GoogleCloudPolicytroubleshooterV1TroubleshootIamPolicyResponse.fromJson(
      core.Map _json) {
    if (_json.containsKey("access")) {
      access = _json["access"];
    }
    if (_json.containsKey("explainedPolicies")) {
      explainedPolicies = (_json["explainedPolicies"] as core.List)
          .map<GoogleCloudPolicytroubleshooterV1ExplainedPolicy>((value) =>
              new GoogleCloudPolicytroubleshooterV1ExplainedPolicy.fromJson(
                  value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (access != null) {
      _json["access"] = access;
    }
    if (explainedPolicies != null) {
      _json["explainedPolicies"] =
          explainedPolicies.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Specifies the audit configuration for a service.
/// The configuration determines which permission types are logged, and what
/// identities, if any, are exempted from logging.
/// An AuditConfig must have one or more AuditLogConfigs.
///
/// If there are AuditConfigs for both `allServices` and a specific service,
/// the union of the two AuditConfigs is used for that service: the log_types
/// specified in each AuditConfig are enabled, and the exempted_members in each
/// AuditLogConfig are exempted.
///
/// Example Policy with multiple AuditConfigs:
///
///     {
///       "audit_configs": [
///         {
///           "service": "allServices"
///           "audit_log_configs": [
///             {
///               "log_type": "DATA_READ",
///               "exempted_members": [
///                 "user:jose@example.com"
///               ]
///             },
///             {
///               "log_type": "DATA_WRITE",
///             },
///             {
///               "log_type": "ADMIN_READ",
///             }
///           ]
///         },
///         {
///           "service": "sampleservice.googleapis.com"
///           "audit_log_configs": [
///             {
///               "log_type": "DATA_READ",
///             },
///             {
///               "log_type": "DATA_WRITE",
///               "exempted_members": [
///                 "user:aliya@example.com"
///               ]
///             }
///           ]
///         }
///       ]
///     }
///
/// For sampleservice, this policy enables DATA_READ, DATA_WRITE and ADMIN_READ
/// logging. It also exempts jose@example.com from DATA_READ logging, and
/// aliya@example.com from DATA_WRITE logging.
class GoogleIamV1AuditConfig {
  /// The configuration for logging of each type of permission.
  core.List<GoogleIamV1AuditLogConfig> auditLogConfigs;

  /// Specifies a service that will be enabled for audit logging.
  /// For example, `storage.googleapis.com`, `cloudsql.googleapis.com`.
  /// `allServices` is a special value that covers all services.
  core.String service;

  GoogleIamV1AuditConfig();

  GoogleIamV1AuditConfig.fromJson(core.Map _json) {
    if (_json.containsKey("auditLogConfigs")) {
      auditLogConfigs = (_json["auditLogConfigs"] as core.List)
          .map<GoogleIamV1AuditLogConfig>(
              (value) => new GoogleIamV1AuditLogConfig.fromJson(value))
          .toList();
    }
    if (_json.containsKey("service")) {
      service = _json["service"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (auditLogConfigs != null) {
      _json["auditLogConfigs"] =
          auditLogConfigs.map((value) => (value).toJson()).toList();
    }
    if (service != null) {
      _json["service"] = service;
    }
    return _json;
  }
}

/// Provides the configuration for logging a type of permissions.
/// Example:
///
///     {
///       "audit_log_configs": [
///         {
///           "log_type": "DATA_READ",
///           "exempted_members": [
///             "user:jose@example.com"
///           ]
///         },
///         {
///           "log_type": "DATA_WRITE",
///         }
///       ]
///     }
///
/// This enables 'DATA_READ' and 'DATA_WRITE' logging, while exempting
/// jose@example.com from DATA_READ logging.
class GoogleIamV1AuditLogConfig {
  /// Specifies the identities that do not cause logging for this type of
  /// permission.
  /// Follows the same format of Binding.members.
  core.List<core.String> exemptedMembers;

  /// The log type that this config enables.
  /// Possible string values are:
  /// - "LOG_TYPE_UNSPECIFIED" : Default case. Should never be this.
  /// - "ADMIN_READ" : Admin reads. Example: CloudIAM getIamPolicy
  /// - "DATA_WRITE" : Data writes. Example: CloudSQL Users create
  /// - "DATA_READ" : Data reads. Example: CloudSQL Users list
  core.String logType;

  GoogleIamV1AuditLogConfig();

  GoogleIamV1AuditLogConfig.fromJson(core.Map _json) {
    if (_json.containsKey("exemptedMembers")) {
      exemptedMembers =
          (_json["exemptedMembers"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("logType")) {
      logType = _json["logType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (exemptedMembers != null) {
      _json["exemptedMembers"] = exemptedMembers;
    }
    if (logType != null) {
      _json["logType"] = logType;
    }
    return _json;
  }
}

/// Associates `members` with a `role`.
class GoogleIamV1Binding {
  /// The condition that is associated with this binding.
  ///
  /// If the condition evaluates to `true`, then this binding applies to the
  /// current request.
  ///
  /// If the condition evaluates to `false`, then this binding does not apply to
  /// the current request. However, a different role binding might grant the
  /// same
  /// role to one or more of the members in this binding.
  ///
  /// To learn which resources support conditions in their IAM policies, see the
  /// [IAM
  /// documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
  GoogleTypeExpr condition;

  /// Specifies the identities requesting access for a Cloud Platform resource.
  /// `members` can have the following values:
  ///
  /// * `allUsers`: A special identifier that represents anyone who is
  ///    on the internet; with or without a Google account.
  ///
  /// * `allAuthenticatedUsers`: A special identifier that represents anyone
  ///    who is authenticated with a Google account or a service account.
  ///
  /// * `user:{emailid}`: An email address that represents a specific Google
  ///    account. For example, `alice@example.com` .
  ///
  ///
  /// * `serviceAccount:{emailid}`: An email address that represents a service
  ///    account. For example, `my-other-app@appspot.gserviceaccount.com`.
  ///
  /// * `group:{emailid}`: An email address that represents a Google group.
  ///    For example, `admins@example.com`.
  ///
  /// * `deleted:user:{emailid}?uid={uniqueid}`: An email address (plus unique
  ///    identifier) representing a user that has been recently deleted. For
  ///    example, `alice@example.com?uid=123456789012345678901`. If the user is
  /// recovered, this value reverts to `user:{emailid}` and the recovered user
  ///    retains the role in the binding.
  ///
  /// * `deleted:serviceAccount:{emailid}?uid={uniqueid}`: An email address
  /// (plus
  /// unique identifier) representing a service account that has been recently
  ///    deleted. For example,
  ///    `my-other-app@appspot.gserviceaccount.com?uid=123456789012345678901`.
  ///    If the service account is undeleted, this value reverts to
  /// `serviceAccount:{emailid}` and the undeleted service account retains the
  ///    role in the binding.
  ///
  /// * `deleted:group:{emailid}?uid={uniqueid}`: An email address (plus unique
  ///    identifier) representing a Google group that has been recently
  /// deleted. For example, `admins@example.com?uid=123456789012345678901`. If
  /// the group is recovered, this value reverts to `group:{emailid}` and the
  ///    recovered group retains the role in the binding.
  ///
  ///
  /// * `domain:{domain}`: The G Suite domain (primary) that represents all the
  ///    users of that domain. For example, `google.com` or `example.com`.
  core.List<core.String> members;

  /// Role that is assigned to `members`.
  /// For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
  core.String role;

  GoogleIamV1Binding();

  GoogleIamV1Binding.fromJson(core.Map _json) {
    if (_json.containsKey("condition")) {
      condition = new GoogleTypeExpr.fromJson(_json["condition"]);
    }
    if (_json.containsKey("members")) {
      members = (_json["members"] as core.List).cast<core.String>();
    }
    if (_json.containsKey("role")) {
      role = _json["role"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (condition != null) {
      _json["condition"] = (condition).toJson();
    }
    if (members != null) {
      _json["members"] = members;
    }
    if (role != null) {
      _json["role"] = role;
    }
    return _json;
  }
}

/// An Identity and Access Management (IAM) policy, which specifies access
/// controls for Google Cloud resources.
///
///
/// A `Policy` is a collection of `bindings`. A `binding` binds one or more
/// `members` to a single `role`. Members can be user accounts, service
/// accounts,
/// Google groups, and domains (such as G Suite). A `role` is a named list of
/// permissions; each `role` can be an IAM predefined role or a user-created
/// custom role.
///
/// For some types of Google Cloud resources, a `binding` can also specify a
/// `condition`, which is a logical expression that allows access to a resource
/// only if the expression evaluates to `true`. A condition can add constraints
/// based on attributes of the request, the resource, or both. To learn which
/// resources support conditions in their IAM policies, see the
/// [IAM
/// documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
///
/// **JSON example:**
///
///     {
///       "bindings": [
///         {
///           "role": "roles/resourcemanager.organizationAdmin",
///           "members": [
///             "user:mike@example.com",
///             "group:admins@example.com",
///             "domain:google.com",
///             "serviceAccount:my-project-id@appspot.gserviceaccount.com"
///           ]
///         },
///         {
///           "role": "roles/resourcemanager.organizationViewer",
///           "members": [
///             "user:eve@example.com"
///           ],
///           "condition": {
///             "title": "expirable access",
///             "description": "Does not grant access after Sep 2020",
/// "expression": "request.time < timestamp('2020-10-01T00:00:00.000Z')",
///           }
///         }
///       ],
///       "etag": "BwWWja0YfJA=",
///       "version": 3
///     }
///
/// **YAML example:**
///
///     bindings:
///     - members:
///       - user:mike@example.com
///       - group:admins@example.com
///       - domain:google.com
///       - serviceAccount:my-project-id@appspot.gserviceaccount.com
///       role: roles/resourcemanager.organizationAdmin
///     - members:
///       - user:eve@example.com
///       role: roles/resourcemanager.organizationViewer
///       condition:
///         title: expirable access
///         description: Does not grant access after Sep 2020
///         expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
///     - etag: BwWWja0YfJA=
///     - version: 3
///
/// For a description of IAM and its features, see the
/// [IAM documentation](https://cloud.google.com/iam/docs/).
class GoogleIamV1Policy {
  /// Specifies cloud audit logging configuration for this policy.
  core.List<GoogleIamV1AuditConfig> auditConfigs;

  /// Associates a list of `members` to a `role`. Optionally, may specify a
  /// `condition` that determines how and when the `bindings` are applied. Each
  /// of the `bindings` must contain at least one member.
  core.List<GoogleIamV1Binding> bindings;

  /// `etag` is used for optimistic concurrency control as a way to help
  /// prevent simultaneous updates of a policy from overwriting each other.
  /// It is strongly suggested that systems make use of the `etag` in the
  /// read-modify-write cycle to perform policy updates in order to avoid race
  /// conditions: An `etag` is returned in the response to `getIamPolicy`, and
  /// systems are expected to put that etag in the request to `setIamPolicy` to
  /// ensure that their change will be applied to the same version of the
  /// policy.
  ///
  /// **Important:** If you use IAM Conditions, you must include the `etag`
  /// field
  /// whenever you call `setIamPolicy`. If you omit this field, then IAM allows
  /// you to overwrite a version `3` policy with a version `1` policy, and all
  /// of
  /// the conditions in the version `3` policy are lost.
  core.String etag;
  core.List<core.int> get etagAsBytes {
    return convert.base64.decode(etag);
  }

  set etagAsBytes(core.List<core.int> _bytes) {
    etag =
        convert.base64.encode(_bytes).replaceAll("/", "_").replaceAll("+", "-");
  }

  /// Specifies the format of the policy.
  ///
  /// Valid values are `0`, `1`, and `3`. Requests that specify an invalid value
  /// are rejected.
  ///
  /// Any operation that affects conditional role bindings must specify version
  /// `3`. This requirement applies to the following operations:
  ///
  /// * Getting a policy that includes a conditional role binding
  /// * Adding a conditional role binding to a policy
  /// * Changing a conditional role binding in a policy
  /// * Removing any role binding, with or without a condition, from a policy
  ///   that includes conditions
  ///
  /// **Important:** If you use IAM Conditions, you must include the `etag`
  /// field
  /// whenever you call `setIamPolicy`. If you omit this field, then IAM allows
  /// you to overwrite a version `3` policy with a version `1` policy, and all
  /// of
  /// the conditions in the version `3` policy are lost.
  ///
  /// If a policy does not include any conditions, operations on that policy may
  /// specify any valid version or leave the field unset.
  ///
  /// To learn which resources support conditions in their IAM policies, see the
  /// [IAM
  /// documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
  core.int version;

  GoogleIamV1Policy();

  GoogleIamV1Policy.fromJson(core.Map _json) {
    if (_json.containsKey("auditConfigs")) {
      auditConfigs = (_json["auditConfigs"] as core.List)
          .map<GoogleIamV1AuditConfig>(
              (value) => new GoogleIamV1AuditConfig.fromJson(value))
          .toList();
    }
    if (_json.containsKey("bindings")) {
      bindings = (_json["bindings"] as core.List)
          .map<GoogleIamV1Binding>(
              (value) => new GoogleIamV1Binding.fromJson(value))
          .toList();
    }
    if (_json.containsKey("etag")) {
      etag = _json["etag"];
    }
    if (_json.containsKey("version")) {
      version = _json["version"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (auditConfigs != null) {
      _json["auditConfigs"] =
          auditConfigs.map((value) => (value).toJson()).toList();
    }
    if (bindings != null) {
      _json["bindings"] = bindings.map((value) => (value).toJson()).toList();
    }
    if (etag != null) {
      _json["etag"] = etag;
    }
    if (version != null) {
      _json["version"] = version;
    }
    return _json;
  }
}

/// Represents a textual expression in the Common Expression Language (CEL)
/// syntax. CEL is a C-like expression language. The syntax and semantics of CEL
/// are documented at https://github.com/google/cel-spec.
///
/// Example (Comparison):
///
///     title: "Summary size limit"
///     description: "Determines if a summary is less than 100 chars"
///     expression: "document.summary.size() < 100"
///
/// Example (Equality):
///
///     title: "Requestor is owner"
///     description: "Determines if requestor is the document owner"
///     expression: "document.owner == request.auth.claims.email"
///
/// Example (Logic):
///
///     title: "Public documents"
/// description: "Determine whether the document should be publicly visible"
///     expression: "document.type != 'private' && document.type != 'internal'"
///
/// Example (Data Manipulation):
///
///     title: "Notification string"
///     description: "Create a notification string with a timestamp."
///     expression: "'New message received at ' + string(document.create_time)"
///
/// The exact variables and functions that may be referenced within an
/// expression
/// are determined by the service that evaluates it. See the service
/// documentation for additional information.
class GoogleTypeExpr {
  /// Optional. Description of the expression. This is a longer text which
  /// describes the expression, e.g. when hovered over it in a UI.
  core.String description;

  /// Textual representation of an expression in Common Expression Language
  /// syntax.
  core.String expression;

  /// Optional. String indicating the location of the expression for error
  /// reporting, e.g. a file name and a position in the file.
  core.String location;

  /// Optional. Title for the expression, i.e. a short string describing
  /// its purpose. This can be used e.g. in UIs which allow to enter the
  /// expression.
  core.String title;

  GoogleTypeExpr();

  GoogleTypeExpr.fromJson(core.Map _json) {
    if (_json.containsKey("description")) {
      description = _json["description"];
    }
    if (_json.containsKey("expression")) {
      expression = _json["expression"];
    }
    if (_json.containsKey("location")) {
      location = _json["location"];
    }
    if (_json.containsKey("title")) {
      title = _json["title"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (description != null) {
      _json["description"] = description;
    }
    if (expression != null) {
      _json["expression"] = expression;
    }
    if (location != null) {
      _json["location"] = location;
    }
    if (title != null) {
      _json["title"] = title;
    }
    return _json;
  }
}
