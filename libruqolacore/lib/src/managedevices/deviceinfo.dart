/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Deviceinfo {
  String identifier = '';
  String host = '';
  String sessionId = '';
  String ip = '';
  String userId = '';
  String client = '';
  String os = '';
  String loginAtDateTimeStr = '';
  int loginAt = -1;

  Deviceinfo();

  factory Deviceinfo.fromJson(Map<String, dynamic> json) {
    String identifier = '';
    String host = '';
    String sessionId = '';
    String ip = '';
    String userId = '';
    String client = '';
    String os = '';
    String loginAtDateTimeStr = '';
    int loginAt = -1;

    identifier = json["_id"] ?? '';
    host = json["host"] ?? '';
    sessionId = json["sessionId"] ?? '';
    ip = json["ip"] ?? '';
    userId = json["userId"] ?? '';
    var deviceObj = json["device"];
    if (deviceObj != null) {
      var osObj = deviceObj["os"];
      if (osObj != null) {
        os =
            osObj["name"] == null ? '' : '${osObj["name"]} ${osObj["version"]}';
      }
      client = deviceObj["name"] ?? '';
    }
    if (json["loginAt"] != null) {
      loginAt =
          DateTime.parse(json["loginAt"].toString()).millisecondsSinceEpoch;
    }

    Deviceinfo info = Deviceinfo();
    info.identifier = identifier;
    info.host = host;
    info.sessionId = sessionId;
    info.userId = userId;
    info.client = client;
    info.os = os;
    info.loginAtDateTimeStr = loginAtDateTimeStr;
    info.loginAt = loginAt;
    info.ip = ip;
    return info;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Deviceinfo &&
        other.identifier == identifier &&
        other.host == host &&
        other.sessionId == sessionId &&
        other.ip == ip &&
        other.userId == userId &&
        other.client == client &&
        other.loginAt == loginAt &&
        other.loginAtDateTimeStr == loginAtDateTimeStr &&
        other.os == os;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        identifier.hashCode ^
        host.hashCode ^
        sessionId.hashCode ^
        ip.hashCode ^
        client.hashCode ^
        loginAt.hashCode ^
        loginAtDateTimeStr.hashCode ^
        os.hashCode;
  }

  @override
  String toString() {
    return 'Deviceinfo(userId: $userId, identifier: $identifier, host: $host, sessionId: $sessionId, ip: $ip, client: $client, loginAt: $loginAt, loginAtDateTimeStr: $loginAtDateTimeStr, os: $os)';
  }
}
