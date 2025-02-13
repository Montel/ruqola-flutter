/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'dart:convert';

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class TeamRemoveMembersInfo {
  final List<String> rooms;
  final String teamId;
  TeamRemoveMembersInfo(this.rooms, this.teamId);
  bool canStart() {
    return rooms.isNotEmpty && teamId.isNotEmpty;
  }

  Map<String, String> body() => {'rooms': jsonEncode(rooms), 'teamId': teamId};

  @override
  String toString() {
    return "TeamRemoveMembersInfo(teamId: $teamId, rooms: $rooms)";
  }
}

class TeamRemoveMembers extends Restapiabstractjob {
  final TeamRemoveMembersInfo _info;

  TeamRemoveMembers(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start TeamRemoveMembers");
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
    return generateUrl(url, RestApiUrlType.teamsRemoveMember);
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
