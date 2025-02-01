/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class ValidateInviteTokenResult {
  ValidateInviteTokenResult({required this.valid});
  final bool valid;

  factory ValidateInviteTokenResult.fromJson(Map<String, dynamic> json) {
    final valid = json['valid'];
    return ValidateInviteTokenResult(valid: valid);
  }

  @override
  String toString() {
    return "valid: $valid";
  }
}

class ValidateInviteTokenInfo {
  final String token;
  ValidateInviteTokenInfo(this.token);
  bool canStart() {
    return token.isNotEmpty;
  }

  Map<String, String> body() => {'token': token};
}

class ValidateInviteToken extends Restapiabstractjob {
  final ValidateInviteTokenInfo _info;

  ValidateInviteToken(this._info);

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
    return false;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.validateInviteToken);
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
