/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class DeleteMessageInfo {
  final String roomId;
  final String messageId;
  DeleteMessageInfo(this.roomId, this.messageId);
  bool canStart() {
    return roomId.isNotEmpty && messageId.isNotEmpty;
  }

  Map<String, String> body() => {'roomId': roomId, 'msgId': messageId};

  @override
  String toString() {
    return "DeleteMessageInfo(roomId: $roomId, messageId: $messageId)";
  }
}

class DeleteMessage extends Restapiabstractjob {
  final DeleteMessageInfo _info;

  DeleteMessage(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start DeleteMessage");
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
    return generateUrl(url, RestApiUrlType.chatDelete);
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
