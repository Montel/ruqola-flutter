/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoomsUnMuteUserInfo {
  final String roomId;
  final String username;
  RoomsUnMuteUserInfo(this.roomId, this.username);
  bool canStart() {
    if (username.isEmpty || roomId.isEmpty) {
      print("RoomsUnMuteUserInfo: mUsername or mRoomId is empty.");
      return false;
    }
    return true;
  }

  Map<String, String> body() => {'roomId': roomId, 'username': username};

  @override
  String toString() {
    return "RoomsUnMuteUserInfo(roomId: $roomId, username: $username)";
  }
}

class RoomsUnMuteUser extends Restapiabstractjob {
  final RoomsUnMuteUserInfo _info;

  RoomsUnMuteUser(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoomsUnMuteUser");
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
    return generateUrl(url, RestApiUrlType.roomsUnmuteUser);
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
