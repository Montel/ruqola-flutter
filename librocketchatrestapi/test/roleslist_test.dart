/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('roles list', () {
    test('check default values', () {
      librocketchatrestapi.RolesList rolesList =
          librocketchatrestapi.RolesList();
      expect(rolesList.canStart(), false);
      expect(rolesList.requireHttpAuthentication(), true);
      expect(rolesList.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/roles.list'));
    });
  });
}
