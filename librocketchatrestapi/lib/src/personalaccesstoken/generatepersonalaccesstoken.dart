/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class GeneratePersonalAccessTokenInfo {
  final String mTokenName;
  final bool mBypassTwoFactor;
  GeneratePersonalAccessTokenInfo(this.mTokenName, this.mBypassTwoFactor);
  bool canStart() {
    return mTokenName.isNotEmpty;
  }

  Map<String, String> body() =>
      {'tokenName': mTokenName, 'bypassTwoFactor': mBypassTwoFactor.toString()};
}

class GeneratePersonalAccessToken extends Restapiabstractjob {
  final GeneratePersonalAccessTokenInfo _info;
  GeneratePersonalAccessToken(this._info);

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start GeneratePersonalAccessToken");
      return false;
    }
    if (!_info.canStart()) {
      print(
          "GeneratePersonalAccessTokenJob: GeneratePersonalAccessTokenInfo is invalid (token empty)");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    var generateUrl2 = generateUrl(url, RestApiUrlType.usersGeneratePersonalAccessToken);
    return generateUrl2;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }

    http.Response response =
        await http.post(url(serverUrl!), headers: headers(), body: _info.body());
    return result(response);
  }
}
