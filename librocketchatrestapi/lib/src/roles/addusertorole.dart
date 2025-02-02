/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class AddUserToRoleInfo {
  final String username;
  final String roleName;
  AddUserToRoleInfo(this.username, this.roleName);
  bool canStart() {
    return username.isNotEmpty && roleName.isNotEmpty;
  }

  Map<String, String> body() => {'roleName': roleName, 'username': username};
}

class AddUserToRole extends Restapiabstractjob {
  final AddUserToRoleInfo _info;

  AddUserToRole(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start AddUserToRole");
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
    return generateUrl(url, RestApiUrlType.rolesAddUserToRole);
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
