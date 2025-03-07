/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

enum Status {
  online,
  busy,
  away,
  offline,
  unknown,
}

extension StatusExt on Status {
  String get name {
    switch (this) {
      case Status.online:
        return 'online';
      case Status.busy:
        return 'busy';
      case Status.away:
        return 'away';
      case Status.offline:
        return 'offline';
      default:
        return 'unknown';
    }
  }

  String get translatedName {
    // TODO i18n ?
    switch (this) {
      case Status.online:
        return 'Online';
      case Status.busy:
        return 'Busy';
      case Status.away:
        return 'Away';
      case Status.offline:
        return 'Offline';
      default:
        return '';
    }
  }

  String get iconName {
    // Fix me
    switch (this) {
      case Status.online:
        return 'Online';
      case Status.busy:
        return 'Busy';
      case Status.away:
        return 'Away';
      case Status.offline:
        return 'Offline';
      default:
        return '';
    }
  }
}

class User {
  User({
    this.userid = "",
    this.name = "",
    this.username = "",
    this.statusText = "",
    this.bio = "",
    this.nickname = "",
    this.active = false,
    this.status = Status.unknown,
  });

  static Status presenceStatusFromString(String? status) {
    if (status?.isEmpty ?? true) {
      return Status.unknown;
    }
    if (status == "online") {
      return Status.online;
    } else if (status == "busy") {
      return Status.busy;
    } else if (status == "away") {
      return Status.away;
    } else if (status == "offline") {
      return Status.offline;
    } else {
      return Status.unknown;
    }
  }

  bool isValid() {
    return userid.isNotEmpty;
  }

  // userId can't be empty
  final String userid;
  final String? name;
  final String? username;
  final String? statusText;
  final String? bio;
  final String? nickname;
  final bool? active;
  final Status? status;
  // TODO add more

  factory User.fromJson(Map<String, dynamic> json) {
    final userid = json['_id'] as String;
    final name = json['name'] as String?;
    final username = json['username'] as String?;
    final statusText = json['statusText'] as String?;
    final bio = json['bio'] as String?;
    final active = json['active'] as bool;
    final statusStr = json['status'] as String?;
    final Status status = User.presenceStatusFromString(statusStr);

    return User(
        userid: userid,
        name: name,
        username: username,
        statusText: statusText,
        bio: bio,
        active: active,
        status: status);
  }
  @override
  bool operator ==(Object other) {
    return other is User &&
        other.userid == userid &&
        other.name == name &&
        other.username == username &&
        other.statusText == statusText &&
        other.bio == bio &&
        other.nickname == nickname &&
        other.active == active &&
        other.status == status;
  }

  @override
  int get hashCode {
    return userid.hashCode ^
        name.hashCode ^
        username.hashCode ^
        statusText.hashCode ^
        bio.hashCode ^
        nickname.hashCode ^
        active.hashCode ^
        status.hashCode;
  }

  @override
  String toString() {
    return 'User(userid :$userid, name: $name, username: $username, statusText: $statusText, bio: $bio, nickname: $nickname, active: $active, status: $status)';
  }
}
