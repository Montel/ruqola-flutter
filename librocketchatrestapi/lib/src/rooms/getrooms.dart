/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class GetRooms extends Restapiabstractjob {
  GetRooms();

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start GetRooms");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    final Uri uri = generateUrl(url, RestApiUrlType.roomsGet);
    return uri;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start GetRooms");
      return RestapiabstractjobResult();
    }

    http.Response response = await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
