/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class ChannelClose extends Restapiabstractjob {
  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start DeleteMessage");
      return false;
    }
    return false; //TODO
  }

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.channelsClose);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Data is not valid");
      return RestapiabstractjobResult();
    }
    /*
    http.Response response = await http.post(url(serverUrl!),
        headers: headers(), body: _info.body());
    return result(response);
    */
    // TODO
    return RestapiabstractjobResult();
  }
}
