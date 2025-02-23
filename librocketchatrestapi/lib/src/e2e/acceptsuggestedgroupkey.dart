/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class AcceptSuggestedGroupKeyInfo {
  final String roomId;
  AcceptSuggestedGroupKeyInfo(this.roomId);
  bool canStart() {
    return roomId.isNotEmpty;
  }

  Map<String, String> body() => {'rid': roomId};
}

class AcceptSuggestedGroupKey extends Restapiabstractjob {
  final AcceptSuggestedGroupKeyInfo _info;

  AcceptSuggestedGroupKey(this._info);

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
    return generateUrl(url, RestApiUrlType.e2EAcceptSuggestedGroupKey);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }
    http.Response response =
        await http.post(url(serverUrl!), headers: headers(), body: _info.body());
    return result(response);
  }
}
