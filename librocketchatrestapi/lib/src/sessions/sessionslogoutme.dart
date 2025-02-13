/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class SessionLogoutMeInfo {
  final String sessionId;
  SessionLogoutMeInfo(this.sessionId);
  bool canStart() {
    if (sessionId.isEmpty) {
      print("SessionLogoutMeInfo: mUsermSessionId is empty.");
      return false;
    }
    return true;
  }

  Map<String, String> body() => {'sessionId': sessionId};
  @override
  String toString() {
    return "SessionLogoutMeInfo(sessionId: $sessionId)";
  }
}

class SessionLogoutMe extends Restapiabstractjob {
  final SessionLogoutMeInfo _info;

  SessionLogoutMe(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start SessionLogoutMe");
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
    return generateUrl(url, RestApiUrlType.sessionsLogoutMe);
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
