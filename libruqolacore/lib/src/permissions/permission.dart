/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Permission {
  List<String> roles = [];
  String identifier = '';
  int updatedAt = -1;

  @override
  String toString() {
    return 'Permission(roles: $roles, identifier: $identifier, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Permission &&
        other.roles == roles &&
        other.identifier == identifier &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return roles.hashCode ^ identifier.hashCode ^ updatedAt.hashCode;
  }
  // TODO parse
}
