/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoomsNameExistsInfo {
  final String roomName;
  bool canStart() {
    return roomName.isNotEmpty;
  }

  Map<String, String> queryParameters() => {
        'roomName': roomName,
      };
  RoomsNameExistsInfo(this.roomName);
}

class RoomsNameExists extends Restapiabstractjob {
  final RoomsNameExistsInfo _info;
  RoomsNameExists(this._info);

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoomsNameExists");
      return false;
    }
    if (!_info.canStart()) {
      print("RoomsNameExists: RoomsNameExistsInfo is invalid");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    final Uri uri = generateUrl(url, RestApiUrlType.roomsNameExists)
        .replace(queryParameters: _info.queryParameters());
    return uri;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start RoomsNameExists");
      return RestapiabstractjobResult();
    }

    http.Response response =
        await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
