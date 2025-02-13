/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'dart:convert';

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class MethodCallInfo {
  final String methodName;
  final bool anonymous;
  final Map<String, dynamic> messageObj;
  MethodCallInfo(this.methodName, this.anonymous, this.messageObj);
  bool canStart() {
    return methodName.isNotEmpty;
  }

  Map<String, String> body() => {'message': jsonEncode(messageObj)};
  @override
  String toString() {
    return "MethodCallInfo(methodName: $methodName, anonymous: $anonymous, messageObj: $messageObj)";
  }
}

class MethodCall extends Restapiabstractjob {
  final MethodCallInfo _info;
  MethodCall(this._info);

  @override
  bool requireHttpAuthentication() {
    return !_info.anonymous;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start MethodCall");
      return false;
    }
    if (!_info.canStart()) {
      print("MethodCallJob: mMethodCallJobInfo is invalid");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    var generateUrl2 = generateUrl(
        url,
        _info.anonymous
            ? RestApiUrlType.methodCallAnon
            : RestApiUrlType.methodCall,
        RestApiUrlExtensionType.v1,
        _info.methodName);
    return generateUrl2;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }

    http.Response response = await http.post(url(serverUrl!),
        headers: headers(), body: _info.body());
    return result(response);
  }
}
