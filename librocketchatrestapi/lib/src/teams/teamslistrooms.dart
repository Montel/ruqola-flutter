/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class TeamsListRoomsInfo {
  final String teamId;
  bool canStart() {
    return teamId.isNotEmpty;
  }

  Map<String, String> queryParameters() => {
        'teamId': teamId,
      };
  TeamsListRoomsInfo(this.teamId);
  @override
  String toString() {
    return "TeamsListRoomsInfo(teamId: $teamId)";
  }
}

class TeamsListRooms extends Restapiabstractjob {
  final TeamsListRoomsInfo _info;
  TeamsListRooms(this._info);

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start TeamsListRooms");
      return false;
    }
    if (!_info.canStart()) {
      print("TeamsListRooms: TeamsListRoomsInfo is invalid");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    final Uri uri = generateUrl(url, RestApiUrlType.teamsListRooms)
        .replace(queryParameters: _info.queryParameters());
    return uri;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start TeamsListRooms");
      return RestapiabstractjobResult();
    }

    http.Response response = await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
