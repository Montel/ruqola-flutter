/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Invitation {
  String userIdentifier = '';
  String identifier = '';
  String roomId = '';
  // QDateTime mExpireDateTime;
  // QDateTime mCreateDateTime;
  int uses = 0;
  int maxUses = 0;

  Invitation(
      {required this.identifier,
      required this.userIdentifier,
      required this.roomId,
      required this.uses,
      required this.maxUses});

// Verify it
  factory Invitation.fromJson(Map<String, dynamic> json) {
    final String identifier = json["_id"] ?? '';
    final String userIdentifier = json["userId"] ?? '';
    final String roomId = json["rid"] ?? '';
    final int uses = json["uses"] ?? 0;
    final int maxUses = json["maxUses"] ?? 0;

    return Invitation(
      identifier: identifier,
      userIdentifier: userIdentifier,
      roomId: roomId,
      uses: uses,
      maxUses: maxUses,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Invitation &&
        other.userIdentifier == userIdentifier &&
        other.identifier == identifier &&
        other.roomId == roomId &&
        other.uses == uses &&
        other.maxUses == maxUses;
  }

  @override
  int get hashCode {
    return userIdentifier.hashCode ^
        identifier.hashCode ^
        roomId.hashCode ^
        uses.hashCode ^
        maxUses.hashCode;
  }

  @override
  String toString() {
    return 'Invitation(userIdentifier: $userIdentifier, identifier: $identifier, roomId: $roomId, uses: $uses, maxUses: $maxUses)';
  }
}
