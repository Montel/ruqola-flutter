/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class LoginResult {
  LoginResult({required this.userId, required this.authToken});
  final String userId;
  final String authToken;

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final userId = data['userId'];
    final auth = data['authToken'];
    return LoginResult(userId: userId, authToken: auth);
  }

  @override
  String toString() {
    return "userId: $userId auth: $authToken";
  }
}

class LoginInfo {
  final String user;
  final String password;
  LoginInfo(this.user, this.password);
  bool isValid() {
    return user.isNotEmpty && password.isNotEmpty;
  }

  Map<String, String> body() {
    return {'user': user, 'password': password};
  }
}

class Login extends Restapiabstractjob {
  final LoginInfo _info;
  Login(this._info);

  @override
  bool requireHttpAuthentication() {
    return false;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start Login");
      return false;
    }
    return _info.isValid();
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.login);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Data is not valid");
      return RestapiabstractjobResult();
    }
    http.Response response = await http.post(url(serverUrl!),
        headers: headers(), body: _info.body());
    return result(response);
  }
}
