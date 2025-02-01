/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('use invite token info', () {
    test('check default values', () {
      final info = librocketchatrestapi.UseInviteTokenInfo("fff");
      librocketchatrestapi.UseInviteToken validateToken =
          librocketchatrestapi.UseInviteToken(info);
      expect(info.token, "fff");
      expect(info.body(), {'token': 'fff'});
      expect(validateToken.canStart(), false);
      expect(validateToken.requireHttpAuthentication(), true);

      expect(validateToken.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/useInviteToken'));
    });
  });
}
