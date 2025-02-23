/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class ReactOnMessageInfo {
  final String messageId;
  final bool shouldReact;
  final String emoji;

  ReactOnMessageInfo(this.messageId, this.emoji, [this.shouldReact = true]);
  bool canStart() {
    if (emoji.isEmpty) {
      print("ReactOnMessageInfo: emoji is empty");
      return false;
    }
    if (messageId.isEmpty) {
      print("ReactOnMessageInfo: messageId is empty");
      return false;
    }
    return true;
  }

  Map<String, String> body() =>
      {'emoji': emoji, "messageId": messageId, "shouldReact": shouldReact.toString()};
  @override
  String toString() {
    return "ReactOnMessageInfo(emoji: $emoji, messageId: $messageId, shouldReact: $shouldReact)";
  }
}

class ReactOnMessage extends Restapiabstractjob {
  final ReactOnMessageInfo _info;
  ReactOnMessage(this._info);
  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.chatReact);
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start ReactOnMessage");
      return false;
    }
    return _info.canStart();
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
