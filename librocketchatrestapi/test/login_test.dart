/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('login info', () {
    test('check default values', () {
      librocketchatrestapi.LoginInfo info = librocketchatrestapi.LoginInfo("user", "password");
      librocketchatrestapi.Login login = librocketchatrestapi.Login(info);
      expect(login.canStart(), false);
      expect(login.requireHttpAuthentication(), false);

      {
        librocketchatrestapi.LoginInfo info2 = librocketchatrestapi.LoginInfo("", "");
        expect(info2.isValid(), false);
      }
      {
        librocketchatrestapi.LoginInfo info2 = librocketchatrestapi.LoginInfo("dd", "");
        expect(info2.isValid(), false);
      }
      {
        librocketchatrestapi.LoginInfo info2 = librocketchatrestapi.LoginInfo("", "ccc");
        expect(info2.isValid(), false);
      }
      {
        librocketchatrestapi.LoginInfo info2 = librocketchatrestapi.LoginInfo("fdgd", "ccc");
        expect(info2.isValid(), true);
      }
      expect(login.url("http://www.kde.org"), Uri.parse("http://www.kde.org/api/v1/login"));
    });
    test('should generate login request', () {
      librocketchatrestapi.LoginInfo info = librocketchatrestapi.LoginInfo("user", "password");
      librocketchatrestapi.Login login = librocketchatrestapi.Login(info);

      expect(login.url("http://www.kde.org"), Uri.parse("http://www.kde.org/api/v1/login"));
    });
  });
}
