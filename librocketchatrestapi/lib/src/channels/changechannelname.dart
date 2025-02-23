/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class ChangeChannelNameInfo {
  final String roomId;
  final String name;
  ChangeChannelNameInfo(this.roomId, this.name);
  bool canStart() {
    return roomId.isNotEmpty && name.isNotEmpty;
  }

  Map<String, String> body() => {'roomId': roomId, 'name': name};

  @override
  String toString() {
    return "ChangeChannelNameInfo(roomId: $roomId, name: $name)";
  }
}

class ChangeChannelName extends Restapiabstractjob {
  final ChangeChannelNameInfo _info;

  ChangeChannelName(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start ChangeChannelName");
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
    return generateUrl(url, RestApiUrlType.channelsRename);
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
