/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class TeamLeaveRoomInfo {
  final String roomId;
  final String teamId;
  TeamLeaveRoomInfo(this.roomId, this.teamId);
  bool canStart() {
    return roomId.isNotEmpty && teamId.isNotEmpty;
  }

  Map<String, String> body() => {'roomId': roomId, 'teamId': teamId};

  @override
  String toString() {
    return "TeamLeaveRoomInfo(teamId: $teamId, roomId: $roomId)";
  }
}

class TeamLeaveRoom extends Restapiabstractjob {
  final TeamLeaveRoomInfo _info;

  TeamLeaveRoom(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start TeamLeaveRoom");
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
    return generateUrl(url, RestApiUrlType.teamsLeave);
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
