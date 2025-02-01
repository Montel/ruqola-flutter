/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class IgnoreUserInfo {
  final String mRoomId;
  final String mIgnoreUserId;
  final bool mIgnore;

  IgnoreUserInfo(this.mIgnoreUserId, this.mRoomId, this.mIgnore);
  bool canStart() {
    return mRoomId.isNotEmpty && mIgnoreUserId.isNotEmpty;
  }

  Map<String, String> queryParameters() => {
        'rid': mRoomId,
        'userId': mIgnoreUserId,
        'ignore': mIgnore ? "true" : "false",
      };
}

class IgnoreUser extends Restapiabstractjob {
  final IgnoreUserInfo _info;
  IgnoreUser(this._info);
  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.chatIgnoreUser)
        .replace(queryParameters: _info.queryParameters());
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start IgnoreUser");
      return false;
    }
    return _info.canStart();
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }

    http.Response response =
        await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
