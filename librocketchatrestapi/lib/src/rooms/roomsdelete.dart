/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoomsDeleteInfo {
  final String roomId;
  RoomsDeleteInfo(this.roomId);
  bool canStart() {
    return roomId.isNotEmpty;
  }

  Map<String, String> body() => {'roomId': roomId};
  @override
  String toString() {
    return "RoomsDeleteInfo(roomId: $roomId)";
  }
}

class RoomsDelete extends Restapiabstractjob {
  final RoomsDeleteInfo _info;

  RoomsDelete(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoomsDelete");
      return false;
    }
    return _info.canStart();
  }

  @override
  bool requireHttpAuthentication() {
    return false;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.roomsDelete);
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
