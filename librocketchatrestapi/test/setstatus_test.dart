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
      librocketchatrestapi.SetStatusInfo info = librocketchatrestapi.SetStatusInfo(
          userId: "foo", statusType: librocketchatrestapi.StatusType.away);
      expect(info.canStart(), true);

      librocketchatrestapi.SetStatus setStatus = librocketchatrestapi.SetStatus(info);
      setStatus.serverUrl = "http://www.kde.org";
      expect(setStatus.canStart(), false);
      expect(setStatus.requireHttpAuthentication(), true);
      setStatus.userId = 'user';
      setStatus.authToken = 'token';

      expect(setStatus.requireTwoFactorAuthentication, false);
      expect(setStatus.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/users.setStatus'));

      expect(info.body(), {'userId': 'foo', 'message': '', 'status': 'away'});
    });
  });
}
