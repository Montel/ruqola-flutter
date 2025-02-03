/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Remove user from role', () {
    test('check default values', () {
      librocketchatrestapi.RemoveUserFromRoleInfo info =
          librocketchatrestapi.RemoveUserFromRoleInfo("foo", "ddd");
      expect(info.canStart(), true);

      librocketchatrestapi.RemoveUserFromRole removeUserFromRole =
          librocketchatrestapi.RemoveUserFromRole(info);
      removeUserFromRole.serverUrl = "http://www.kde.org";
      expect(removeUserFromRole.canStart(), false);
      expect(removeUserFromRole.requireHttpAuthentication(), true);
      removeUserFromRole.userId = 'user';
      removeUserFromRole.authToken = 'token';

      expect(removeUserFromRole.requireTwoFactorAuthentication, false);
      expect(removeUserFromRole.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/roles.removeUserFromRole'));

      expect(info.body(), {'roleName': 'ddd', 'username': 'foo'});
    });
  });
}
