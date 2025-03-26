/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'dart:convert';

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RestapiabstractjobResult {
  Map<String, dynamic>? result;
  bool? success;
  String? errorMessage;

  RestapiabstractjobResult({
    this.result,
    this.success = false,
    this.errorMessage = '',
  });

  RestapiabstractjobResult.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      result = json;
      success = json['success'];
    }
  }

  @override
  String toString() {
    return "RestapiabstractjobResult(success $success, result $result, errorMessage: $errorMessage)";
  }
}

abstract class Restapiabstractjob {
  Restapiabstractjob();

  String? serverUrl;
  String? userId;
  String? authToken;
  String? authMethod;
  String? authCode;
  Queryparameter? queryparameter;
  bool requireTwoFactorAuthentication = false;

  bool requireHttpAuthentication();

  Uri url(String url);

  RestapiabstractjobResult result(http.Response response) {
    try {
      if (response.statusCode == 200 && response.body.isNotEmpty == true) {
        return RestapiabstractjobResult.fromJson(jsonDecode(response.body));
      }
      throw RocketChatException(response.body);
    } on RocketChatException catch (e) {
      return RestapiabstractjobResult(errorMessage: e.message);
    } catch (e) {
      // TODO ???
      return RestapiabstractjobResult(result: null);
    }
  }

  // Reimplement it
  bool canStart() {
    if (serverUrl == null) {
      print("Server url is empty! Bug");
      return false;
    }
    /*
    if (requireTwoFactorAuthentication && mEnforcePasswordFallBack) {
        if (authMethod.isEmpty() || mAuthCode.isEmpty()) {
            qCWarning(ROCKETCHATQTRESTAPI_LOG) << "Job required two factor auth but mAuthMethod or mAuthCode is empty";
            return false;
        }
    }
    */
    if (requireHttpAuthentication() && !hasAuthenticationValue()) {
      print("Auth settings is empty. It's a bug: $authToken $userId");
      return false;
    }
    return true;
  }

  bool hasAuthenticationValue() {
    return authToken != null && authToken!.isNotEmpty && userId != null && userId!.isNotEmpty;
  }

  // Reimplement it
  Future<RestapiabstractjobResult> start();

  Map<String, String>? headers() {
    Map<String, String> headers = <String, String>{};
    if (authToken != null && authToken!.isNotEmpty) {
      headers['X-Auth-Token'] = authToken as String;
    }
    if (userId != null && userId!.isNotEmpty) {
      headers['X-User-Id'] = userId as String;
    }
    if (requireTwoFactorAuthentication) {
      if (authCode != null &&
          authCode!.isNotEmpty &&
          authMethod != null &&
          authMethod!.isNotEmpty) {
        headers['x-2fa-code'] = authCode as String;
        headers['x-2fa-method'] = authMethod as String;
      }
    }
    return headers;
  }
}
