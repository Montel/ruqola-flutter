/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Rooms Favorite', () {
    test('check default values', () {
      librocketchatrestapi.AddUserToRoleInfo info =
          librocketchatrestapi.AddUserToRoleInfo("foo", "ddd");
      expect(info.canStart(), true);

      librocketchatrestapi.AddUserToRole addUserToRole =
          librocketchatrestapi.AddUserToRole(info);
      addUserToRole.serverUrl = "http://www.kde.org";
      expect(addUserToRole.canStart(), false);
      expect(addUserToRole.requireHttpAuthentication(), true);
      addUserToRole.userId = 'user';
      addUserToRole.authToken = 'token';

      expect(addUserToRole.requireTwoFactorAuthentication, false);
      expect(addUserToRole.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/roles.addUserToRole'));

      expect(info.body(), {'roleName': 'ddd', 'username': 'foo'});
    });
  });
}
