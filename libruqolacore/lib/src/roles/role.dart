/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Role {
  final String userId;
  final String userName;
  final bool isModerator;
  final bool isLeader;
  final bool isOwner;

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

/*
  factory Role.fromJson(Map<String, dynamic> json) {
    final name = json["name"] ?? '';
    final lastTokenPart = json["lastTokenPart"] ?? '';
    final bypassTwoFactor = json["bypassTwoFactor"] ?? false;

    final createdAt = DateTime.parse(json["createdAt"].toString()).millisecondsSinceEpoch;

    return Role(
      name: name,
      lastTokenPart: lastTokenPart,
      createdAt: createdAt,
      bypassTwoFactor: bypassTwoFactor,
    );
  }
*/
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
