/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class User2FAEnableEmail extends Restapiabstractjob {
  User2FAEnableEmail();

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start User2FAEnableEmail");
      return false;
    }
    return true;
  }

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.users2FAEnableEmail);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }
    http.Response response = await http.post(url(serverUrl!), headers: headers());
    return result(response);
  }
}
