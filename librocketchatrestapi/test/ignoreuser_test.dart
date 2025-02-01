/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('ignore user', () {
    test('check default values', () {
      librocketchatrestapi.IgnoreUserInfo info =
          librocketchatrestapi.IgnoreUserInfo("foo", "bla", true);
      expect(info.canStart(), true);

      librocketchatrestapi.IgnoreUser unfollow =
          librocketchatrestapi.IgnoreUser(info);
      unfollow.serverUrl = "http://www.kde.org";
      expect(unfollow.canStart(), false);
      expect(unfollow.requireHttpAuthentication(), true);
      unfollow.userId = 'user';
      unfollow.authToken = 'token';

      expect(unfollow.requireTwoFactorAuthentication, false);
      expect(
          unfollow.url("http://www.kde.org"),
          Uri.parse(
              'http://www.kde.org/api/v1/chat.ignoreUser?rid=bla&userId=foo&ignore=true'));
    });

    test('check can start', () {
      librocketchatrestapi.IgnoreUserInfo info =
          librocketchatrestapi.IgnoreUserInfo("foo", "bla", true);
      expect(info.canStart(), true);

      librocketchatrestapi.IgnoreUser ignoreuser =
          librocketchatrestapi.IgnoreUser(info);
      ignoreuser.userId = 'user';
      ignoreuser.authToken = 'token';
      ignoreuser.serverUrl = "http://www.kde.org";
      expect(ignoreuser.canStart(), true);
    });
  });
}
