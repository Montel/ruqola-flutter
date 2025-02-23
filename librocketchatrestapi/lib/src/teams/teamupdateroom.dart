/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class TeamUpdateRoomInfo {
  final String roomId;
  final bool isDefault;
  TeamUpdateRoomInfo(this.roomId, this.isDefault);
  bool canStart() {
    return roomId.isNotEmpty;
  }

  Map<String, String> body() => {'roomId': roomId, 'isDefault': isDefault.toString()};
}

class TeamUpdateRoom extends Restapiabstractjob {
  final TeamUpdateRoomInfo _info;

  TeamUpdateRoom(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start TeamUpdateRoom");
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
    return generateUrl(url, RestApiUrlType.teamsUpdateRoom);
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
