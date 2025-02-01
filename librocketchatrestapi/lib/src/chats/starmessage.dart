/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class StarMessageInfo {
  final String mMessageId;
  final bool mStarMessage;

  StarMessageInfo(this.mMessageId, [this.mStarMessage = false]);
  bool canStart() {
    return mMessageId.isNotEmpty;
  }

  Map<String, String> body() => {'messageId': mMessageId};
}

class StarMessage extends Restapiabstractjob {
  final StarMessageInfo _info;
  StarMessage(this._info);
  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(
        url,
        _info.mStarMessage
            ? RestApiUrlType.chatStarMessage
            : RestApiUrlType.chatUnStarMessage);
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start StarMessage");
      return false;
    }
    return _info.canStart();
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
