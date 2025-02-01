/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordInfo {
  final String email;
  ForgotPasswordInfo(this.email);
  bool canStart() {
    if (email.isEmpty) {
      print("ForgotPasswordInfo: email is empty.");
      return false;
    }
    return true;
  }

  Map<String, String> body() => {'email': email};
}

class ForgotPassword extends Restapiabstractjob {
  final ForgotPasswordInfo _info;

  ForgotPassword(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start ForgotPassword");
      return false;
    }
    return _info.canStart();
  }

  @override
  bool requireHttpAuthentication() {
    return false;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.forgotPassword);
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
