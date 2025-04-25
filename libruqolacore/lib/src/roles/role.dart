/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Role {
  String userId = '';
  String userName = '';
  bool isModerator = false;
  bool isLeader = false;
  bool isOwner = false;

  Role.defaultValues()
      : userId = '',
        userName = '',
        isModerator = false,
        isLeader = false,
        isOwner = false;

  Role({
    required this.userId,
    required this.userName,
    required this.isModerator,
    required this.isLeader,
    required this.isOwner,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    var userObj = json["u"];
    String userId = '';
    String userName = '';
    bool isOwner = false;
    bool isLeader = false;
    bool isModerator = false;
    if (userObj != null) {
      userId = userObj["_id"] ?? '';
      userName = userObj["username"] ?? '';
    }

    final roleArray = json["roles"];
    if (roleArray != null) {
      for (var entry in roleArray) {
        if (entry == "moderator") {
          isModerator = true;
        } else if (entry == "leader") {
          isLeader = true;
        } else if (entry == "owner") {
          isOwner = true;
        } else {
          print("Unknown role name $entry");
        }
      }
    }

    return Role(
      userId: userId,
      userName: userName,
      isModerator: isModerator,
      isLeader: isLeader,
      isOwner: isOwner,
    );
  }

  bool isValid() {
    return userId.isNotEmpty;
  }

  bool hasARole() {
    return isModerator || isLeader || isOwner;
  }

  @override
  bool operator ==(Object other) {
    return other is Role &&
        other.userId == userId &&
        other.userName == userName &&
        other.isLeader == isLeader &&
        other.isModerator == isModerator &&
        other.isOwner == isOwner;
  }

  @override
  int get hashCode => Object.hash(userId, userName, isModerator, isLeader, isOwner);

  @override
  String toString() {
    return 'Role(userId: $userId, userName: $userName, isModerator: $isModerator, isLeader: $isLeader, isOwner: $isOwner)';
  }
}
