/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('User reset totp', () {
    test('check default values', () {
      librocketchatrestapi.ResetTotpInfo info =
          librocketchatrestapi.ResetTotpInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.ResetTotp resetTotp =
          librocketchatrestapi.ResetTotp(info);
      resetTotp.serverUrl = "http://www.kde.org";
      expect(resetTotp.canStart(), false);
      expect(resetTotp.requireHttpAuthentication(), true);
      resetTotp.userId = 'user';
      resetTotp.authToken = 'token';

      expect(resetTotp.requireTwoFactorAuthentication, false);
      expect(resetTotp.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/users.resetTOTP'));

      expect(info.body(), {'userId': "foo"});
    });
  });
}
