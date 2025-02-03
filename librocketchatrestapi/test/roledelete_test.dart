/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Role delete', () {
    test('check default values', () {
      librocketchatrestapi.RoleDeleteInfo info =
          librocketchatrestapi.RoleDeleteInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.RoleDelete roleDelete =
          librocketchatrestapi.RoleDelete(info);
      roleDelete.serverUrl = "http://www.kde.org";
      expect(roleDelete.canStart(), false);
      expect(roleDelete.requireHttpAuthentication(), true);
      roleDelete.userId = 'user';
      roleDelete.authToken = 'token';

      expect(roleDelete.requireTwoFactorAuthentication, false);
      expect(roleDelete.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/roles.delete'));

      expect(info.body(), {'roleId': 'foo'});
    });
  });
}
