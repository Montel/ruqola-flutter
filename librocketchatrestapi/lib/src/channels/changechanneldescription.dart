/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class ChangeChannelDescriptionInfo {
  final String roomId;
  final String description;
  ChangeChannelDescriptionInfo(this.roomId, this.description);
  bool canStart() {
    // description can be empty
    return roomId.isNotEmpty;
  }

  Map<String, String> body() => {'roomId': roomId, 'description': description};

  @override
  String toString() {
    return "ChangeChannelDescriptionInfo(roomId: $roomId, description: $description)";
  }
}

class ChangeChannelDescription extends Restapiabstractjob {
  final ChangeChannelDescriptionInfo _info;

  ChangeChannelDescription(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start ChangeChannelDescription");
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
    return generateUrl(url, RestApiUrlType.channelsSetDescription);
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
