/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('session logout me info', () {
    test('check default values', () {
      librocketchatrestapi.SessionLogoutMeInfo info =
          librocketchatrestapi.SessionLogoutMeInfo("");
      librocketchatrestapi.SessionLogoutMe sessionLogoutMe =
          librocketchatrestapi.SessionLogoutMe(info);
      expect(sessionLogoutMe.requireHttpAuthentication(), true);
      expect(sessionLogoutMe.requireTwoFactorAuthentication, false);
      expect(sessionLogoutMe.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/sessions/logout.me"));
    });
  });
}
