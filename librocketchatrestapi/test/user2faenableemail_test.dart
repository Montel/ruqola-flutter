/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('User 2fa enable mail', () {
    test('check default values', () {
      librocketchatrestapi.User2FAEnableEmail user2fa =
          librocketchatrestapi.User2FAEnableEmail();
      user2fa.serverUrl = "http://www.kde.org";
      expect(user2fa.canStart(), false);
      expect(user2fa.requireHttpAuthentication(), true);
      user2fa.userId = 'user';
      user2fa.authToken = 'token';

      expect(user2fa.requireTwoFactorAuthentication, false);
      expect(user2fa.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/users.2fa.enableEmail'));
    });
  });
}
