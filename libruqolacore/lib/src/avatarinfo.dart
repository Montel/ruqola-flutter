/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

enum AvatarType {
  unknown,
  room,
  user,
  userAndRoom,
}

class AvatarInfo {
  AvatarInfo();
  bool isValid() {
    return (avatarType != AvatarType.unknown) && identifier.isNotEmpty;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AvatarInfo &&
        other.etag == etag &&
        other.identifier == identifier &&
        other.avatarType == avatarType;
  }

  @override
  int get hashCode {
    return etag.hashCode ^ identifier.hashCode ^ avatarType.hashCode;
  }

  @override
  String toString() {
    return "AvatarInfo(etag: $etag, identifier: $identifier, avatarType: $avatarType)";
  }

  String generateAvatarIdentifier() {
    if (etag.isEmpty) {
      return identifier;
    } else {
      return '$identifier-$etag';
    }
  }

  String avatarUrl(String serverRcUrl) {
    if (serverRcUrl.isEmpty) {
      return '';
    }
    String serverUrl = serverRcUrl;
    String subFolder = '';
    switch (avatarType) {
      case AvatarType.room:
        subFolder = "/room";
        break;
      case AvatarType.unknown:
      case AvatarType.user:
      case AvatarType.userAndRoom:
        break;
    }
    subFolder += '/$identifier';
    subFolder += "?format=png";
    if (etag.isNotEmpty) {
      subFolder += "&etag=$etag";
    }
    subFolder += "&size=22";
    if (!serverUrl.startsWith("https://") && !serverUrl.startsWith("http://")) {
      serverUrl = "https:/$serverUrl";
    }
    return "$serverUrl/avatar$subFolder";
  }

  String etag = '';
  String identifier = '';
  AvatarType avatarType = AvatarType.unknown;
}
