/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class PinMessageInfo {
  final String mMessageId;
  final bool mPinMessage;

  PinMessageInfo(this.mMessageId, [this.mPinMessage = false]);
  bool canStart() {
    return mMessageId.isNotEmpty;
  }

  Map<String, String> body() => {'messageId': mMessageId};
}

class PinMessage extends Restapiabstractjob {
  final PinMessageInfo _info;
  PinMessage(this._info);
  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(
        url,
        _info.mPinMessage
            ? RestApiUrlType.chatPinMessage
            : RestApiUrlType.chatUnPinMessage);
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start PinMessage");
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
