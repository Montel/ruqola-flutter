/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoomsLeaveInfo {
  final String mRoomId;
  RoomsLeaveInfo(this.mRoomId);
  bool canStart() {
    return mRoomId.isNotEmpty;
  }

  Map<String, String> body() => {'roomId': mRoomId};
}

class RoomsLeave extends Restapiabstractjob {
  final RoomsLeaveInfo _info;

  RoomsLeave(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoomsLeave");
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
    return generateUrl(url, RestApiUrlType.roomsLeave);
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
