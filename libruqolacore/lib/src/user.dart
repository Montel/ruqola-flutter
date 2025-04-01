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
  static Status statusFromString(String str) {
    if (str == "online") {
      return Status.online;
    } else if (str == "busy") {
      return Status.busy;
    } else if (str == "away") {
      return Status.away;
    } else if (str == "offline") {
      return Status.offline;
    } else {
      return Status.unknown;
    }
  }

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
        return 'Modify Status...';
    }
  }
}

class User {
  User(
      {this.userid = '',
      this.name = '',
      this.username = '',
      this.statusText = '',
      this.bio = '',
      this.nickname = '',
      this.active = true,
      this.status = Status.unknown,
      this.requirePasswordChange = false,
      this.typeUser = '',
      this.roles = const []});

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
  final bool active;
  final bool requirePasswordChange;
  final Status status;
  final String typeUser;
  final List<String> roles;
  // TODO add roles/i18nroles

  factory User.fromJson(Map<String, dynamic> json) {
    final userid = json['_id'] ?? '';
    final name = json['name'] ?? '';
    final username = json['username'] ?? '';
    final statusText = json['statusText'] ?? '';
    final bio = json['bio'] ?? '';
    final active = json['active'] ?? true;
    final statusStr = json['status'] ?? '';
    final typeUser = json['type'] ?? '';
    final Status status = StatusExt.statusFromString(statusStr);
    final bool requirePasswordChange = json['requirePasswordChange'] ?? false;
    final List<String> roles = [];
    final rolesJson = json["roles"];
    if (rolesJson != null) {
      for (var item in rolesJson) {
        var fileInfo = item;
        roles.add(fileInfo);
      }
    }

    return User(
        userid: userid,
        name: name,
        username: username,
        statusText: statusText,
        bio: bio,
        active: active,
        status: status,
        requirePasswordChange: requirePasswordChange,
        typeUser: typeUser,
        roles: roles);
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
        other.status == status &&
        other.typeUser == typeUser &&
        other.requirePasswordChange == requirePasswordChange &&
        other.roles == roles;
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
        status.hashCode ^
        typeUser.hashCode ^
        roles.hashCode ^
        requirePasswordChange.hashCode;
  }

  @override
  String toString() {
    return 'User(userid :$userid, name: $name, username: $username, statusText: $statusText, bio: $bio, nickname: $nickname, active: $active, status: $status, requirePasswordChange: $requirePasswordChange, type: $typeUser, roles: $roles)';
  }
}
