/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class ResetTotpInfo {
  final String userId;
  ResetTotpInfo(this.userId);
  bool canStart() {
    return userId.isNotEmpty;
  }

  Map<String, String> body() => {'userId': userId};
}

class ResetTotp extends Restapiabstractjob {
  final ResetTotpInfo _info;

  ResetTotp(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start ResetTotp");
      return false;
    }
    return _info.canStart();
  }

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.usersResetTOTP);
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
