/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoomsMuteUserInfo {
  final String mRoomId;
  final String mUsername;
  RoomsMuteUserInfo(this.mRoomId, this.mUsername);
  bool canStart() {
    if (mUsername.isEmpty || mRoomId.isEmpty) {
      print("RoomsMuteUserInfo: mUsername or mRoomId is empty.");
      return false;
    }
    return true;
  }

  Map<String, String> body() => {'roomId': mRoomId, 'username': mUsername};
}

class RoomsMuteUser extends Restapiabstractjob {
  final RoomsMuteUserInfo _info;

  RoomsMuteUser(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoomsMuteUser");
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
    return generateUrl(url, RestApiUrlType.roomsMuteUser);
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
