/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class FollowMessageInfo {
  final String messageId;
  FollowMessageInfo(this.messageId);
  bool isValid() {
    return messageId.isNotEmpty;
  }

  Map<String, String> body() => {'mid': messageId};
  @override
  String toString() {
    return "FollowMessageInfo(mid: $messageId)";
  }
}

class FollowMessage extends Restapiabstractjob {
  final FollowMessageInfo _info;

  FollowMessage(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start FollowMessage");
      return false;
    }
    return _info.isValid();
  }

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.chatFollowMessage);
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
