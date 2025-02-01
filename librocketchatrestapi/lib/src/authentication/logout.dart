/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:http/http.dart' as http;
import 'package:librocketchatrestapi/librocketchatrestapi.dart';

class Logout extends Restapiabstractjob {
  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.logout);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    http.Response response =
        await http.post(url(serverUrl!), headers: headers());
    return result(response);
  }
}
