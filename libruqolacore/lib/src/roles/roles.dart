/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/roles/role.dart';
import 'package:collection/collection.dart';

class Roles {
  // TODO parse it.
  List<Role> roles = [];
  // TODO
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();
    return other is Roles && listEquality.equals(other.roles, roles);
  }

  @override
  int get hashCode {
    return roles.hashCode;
  }

  @override
  String toString() {
    return 'Roles(roles: $roles)';
  }
  // TODO parse it
}
