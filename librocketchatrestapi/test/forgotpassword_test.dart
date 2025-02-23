/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('forgot password', () {
    test('check default values', () {
      librocketchatrestapi.ForgotPasswordInfo info = librocketchatrestapi.ForgotPasswordInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.ForgotPassword forgotPassword =
          librocketchatrestapi.ForgotPassword(info);
      forgotPassword.serverUrl = "http://www.kde.org";
      expect(forgotPassword.canStart(), true);
      expect(forgotPassword.requireHttpAuthentication(), false);
      forgotPassword.userId = 'user';
      forgotPassword.authToken = 'token';

      expect(forgotPassword.requireTwoFactorAuthentication, false);
      expect(forgotPassword.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/users.forgotPassword'));
    });

    test('check can start', () {
      librocketchatrestapi.ForgotPasswordInfo info = librocketchatrestapi.ForgotPasswordInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.ForgotPassword unfollow = librocketchatrestapi.ForgotPassword(info);
      unfollow.userId = 'user';
      unfollow.authToken = 'token';
      unfollow.serverUrl = "http://www.kde.org";
      expect(unfollow.canStart(), true);
    });
  });
}
