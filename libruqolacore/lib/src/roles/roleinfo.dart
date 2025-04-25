/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class RoleInfo {
  String name = '';
  String identifier = '';
  String scope = '';
  String description = '';
  bool roleProtected = false;
  bool mandatory2fa = false;

  // factory RoleInfo.fromJson(Map<String, dynamic> json) {}

  @override
  bool operator ==(Object other) {
    return other is RoleInfo &&
        other.name == name &&
        other.identifier == identifier &&
        other.scope == scope &&
        other.description == description &&
        other.mandatory2fa == mandatory2fa &&
        other.roleProtected == roleProtected;
  }

  @override
  int get hashCode =>
      Object.hash(name, identifier, scope, description, mandatory2fa, roleProtected);

  @override
  String toString() {
    return 'RoleInfo(name: $name, identifier: $identifier, scope: $scope, description: $description, mandatory2fa: $mandatory2fa, roleProtected: $roleProtected)';
  }
}
