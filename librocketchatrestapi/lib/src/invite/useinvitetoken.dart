/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class UseInviteTokenInfo {
  final String token;
  UseInviteTokenInfo(this.token);
  bool canStart() {
    return token.isNotEmpty;
  }

  Map<String, String> body() => {'token': token};
}

class UseInviteToken extends Restapiabstractjob {
  final UseInviteTokenInfo _info;

  UseInviteToken(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start ValidateInviteToken");
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
    return generateUrl(url, RestApiUrlType.useInviteToken);
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
