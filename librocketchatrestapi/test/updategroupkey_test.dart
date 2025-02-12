/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('update groupe key', () {
    test('check default values', () {
      final info =
          librocketchatrestapi.UpdateGroupKeyInfo("fff", "dddd", "gggg");
      librocketchatrestapi.UpdateGroupKey validateToken =
          librocketchatrestapi.UpdateGroupKey(info);
      expect(info.roomId, "fff");
      expect(info.body(), {'rid': 'fff'});
      expect(validateToken.canStart(), false);
      expect(validateToken.requireHttpAuthentication(), true);

      expect(validateToken.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/e2e.updateGroupKey'));
    });
  });
}
