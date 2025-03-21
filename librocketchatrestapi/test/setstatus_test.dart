/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('User Set Status', () {
    test('check default values', () {
      librocketchatrestapi.SetStatusInfo info = librocketchatrestapi.SetStatusInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.SetStatus SetStatus = librocketchatrestapi.SetStatus(info);
      SetStatus.serverUrl = "http://www.kde.org";
      expect(SetStatus.canStart(), false);
      expect(SetStatus.requireHttpAuthentication(), true);
      SetStatus.userId = 'user';
      SetStatus.authToken = 'token';

      expect(SetStatus.requireTwoFactorAuthentication, false);
      expect(SetStatus.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/users.SetStatus'));

      expect(info.body(), {'userId': "foo"});
    });
  });
}
