/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RemoveInviteTokenInfo {
  final String identifier;
  RemoveInviteTokenInfo(this.identifier);
  bool canStart() {
    return identifier.isNotEmpty;
  }

  @override
  String toString() {
    return "RemoveInviteTokenInfo(identifier: $identifier)";
  }
}

class RemoveInviteToken extends Restapiabstractjob {
  final RemoveInviteTokenInfo _info;

  RemoveInviteToken(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start ValidateInviteToken");
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
    return generateUrl(url, RestApiUrlType.removeInvite,
        RestApiUrlExtensionType.v1, _info.identifier);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }
    http.Response response =
        await http.delete(url(serverUrl!), headers: headers());
    return result(response);
  }
}
