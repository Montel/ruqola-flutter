/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/roles/role.dart';

class Roles {
  // TODO parse it.
  List<Role> roles = [];
  // TODO
  @override
  bool operator ==(Object other) {
    return other is Roles && other.roles == roles;
  }

  @override
  int get hashCode {
    return roles.hashCode;
  }
}
