/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('private settings info', () {
    test('check default values', () {
      librocketchatrestapi.PrivateInfo privateInfo =
          librocketchatrestapi.PrivateInfo();
      expect(privateInfo.canStart(), false);
      expect(privateInfo.requireHttpAuthentication(), true);

      expect(privateInfo.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/settings'));
    });
  });
}
