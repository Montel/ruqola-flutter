/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('owninfo', () {
    test('check default values', () {
      librocketchatrestapi.OwnInfo rolesList = librocketchatrestapi.OwnInfo();
      expect(rolesList.canStart(), false);
      expect(rolesList.requireHttpAuthentication(), true);
      expect(rolesList.url("https://www.kde.org"), Uri.parse('https://www.kde.org/api/v1/me'));
    });
  });
}
