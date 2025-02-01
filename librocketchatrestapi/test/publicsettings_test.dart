/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('public settings info', () {
    test('check default values', () {
      librocketchatrestapi.PublicSettingsInfo publicSettingsInfo =
          librocketchatrestapi.PublicSettingsInfo();
      expect(publicSettingsInfo.canStart(), false);
      expect(publicSettingsInfo.requireHttpAuthentication(), false);

      expect(publicSettingsInfo.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/settings.public'));
    });
  });
}
