/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class ChangeChannelAnnouncementInfo {
  final String roomId;
  final String announcement;
  ChangeChannelAnnouncementInfo(this.roomId, this.announcement);
  bool canStart() {
    // announcement can be empty
    return roomId.isNotEmpty;
  }

  Map<String, String> body() =>
      {'roomId': roomId, 'announcement': announcement};

  @override
  String toString() {
    return "ChangeChannelAnnouncementInfo(roomId: $roomId, announcement: $announcement)";
  }
}

class ChangeChannelAnnouncement extends Restapiabstractjob {
  final ChangeChannelAnnouncementInfo _info;

  ChangeChannelAnnouncement(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start ChangeChannelAnnouncement");
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
    return generateUrl(url, RestApiUrlType.channelsSetAnnouncement);
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
