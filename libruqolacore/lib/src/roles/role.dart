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

  bool isValid() {
    return userId.isNotEmpty;
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
