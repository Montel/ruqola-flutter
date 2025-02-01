/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class UnFollowMessageInfo {
  final String messageId;
  UnFollowMessageInfo(this.messageId);
  bool canStart() {
    return messageId.isNotEmpty;
  }

  Map<String, String> body() => {'mid': messageId};
}

class UnFollowMessage extends Restapiabstractjob {
  final UnFollowMessageInfo _info;

  UnFollowMessage(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start UnFollowMessage");
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
    return generateUrl(url, RestApiUrlType.chatUnFollowMessage);
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
