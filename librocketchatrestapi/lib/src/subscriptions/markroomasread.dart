/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class MarkRoomAsReadInfo {
  final String roomId;
  MarkRoomAsReadInfo(this.roomId);
  bool canStart() {
    if (roomId.isEmpty) {
      print("MarkRoomAsReadInfo: roomId is empty.");
      return false;
    }
    return true;
  }

  Map<String, String> body() => {'rid': roomId};

  @override
  String toString() {
    return "MarkRoomAsReadInfo(roomId: $roomId)";
  }
}

class MarkRoomAsRead extends Restapiabstractjob {
  final MarkRoomAsReadInfo _info;

  MarkRoomAsRead(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start MarkRoomAsRead");
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
    return generateUrl(url, RestApiUrlType.subscriptionsRead);
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
