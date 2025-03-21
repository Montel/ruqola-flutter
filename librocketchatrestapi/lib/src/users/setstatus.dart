/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

enum StatusType {
  online,
  away,
  offline,
  busy,
  unknown,
}

extension StatusTypeExt on StatusType {
  String get name {
    switch (this) {
      case StatusType.online:
        return 'online';
      case StatusType.busy:
        return 'busy';
      case StatusType.away:
        return 'away';
      case StatusType.offline:
        return 'offline';
      default:
        return 'unknown';
    }
  }
}

class SetStatusInfo {
  final String userId;
  final String statusMessage;
  final StatusType statusType;
  SetStatusInfo({required this.userId, required this.statusType, this.statusMessage = ''});
  bool canStart() {
    return userId.isNotEmpty && statusType != StatusType.unknown;
  }

  Map<String, String> body() =>
      {'userId': userId, 'message': statusMessage, 'status': statusType.name};
  @override
  String toString() {
    return "SetStatusInfo(userId: $userId, message: $statusMessage, status: $statusType)";
  }
}

class SetStatus extends Restapiabstractjob {
  final SetStatusInfo _info;

  SetStatus(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start SetStatus");
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
    return generateUrl(url, RestApiUrlType.usersSetStatus);
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
