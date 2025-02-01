/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class PrivateInfo extends Restapiabstractjob {
  PrivateInfo();

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start PrivateInfo");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    final Uri uri = generateUrl(url, RestApiUrlType.settings);
    return uri;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start PrivateInfo");
      return RestapiabstractjobResult();
    }

    http.Response response =
        await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
