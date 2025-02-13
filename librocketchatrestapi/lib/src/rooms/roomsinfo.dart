/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoomsInfoInfo {
  final String roomId;
  bool canStart() {
    return roomId.isNotEmpty;
  }

  Map<String, String> queryParameters() => {
        'roomId': roomId,
      };
  RoomsInfoInfo(this.roomId);
  @override
  String toString() {
    return "RoomsInfoInfo(roomId: $roomId)";
  }
}

class RoomsInfo extends Restapiabstractjob {
  final RoomsInfoInfo _info;
  RoomsInfo(this._info);

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoomsInfo");
      return false;
    }
    if (!_info.canStart()) {
      print("RoomsInfo: RoomsInfoInfo is invalid");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    final Uri uri = generateUrl(url, RestApiUrlType.roomsInfo)
        .replace(queryParameters: _info.queryParameters());
    return uri;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start RoomsInfo");
      return RestapiabstractjobResult();
    }

    http.Response response =
        await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
