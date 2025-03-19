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
