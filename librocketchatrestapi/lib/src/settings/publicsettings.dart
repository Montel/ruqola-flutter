/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class PublicSettingsInfo extends Restapiabstractjob {
  PublicSettingsInfo();

  @override
  bool requireHttpAuthentication() {
    return false;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start PublicSettingsInfo");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    final Uri uri = generateUrl(url, RestApiUrlType.settingsPublic);
    return uri;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start PublicSettingsInfo");
      return RestapiabstractjobResult();
    }

    http.Response response =
        await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
