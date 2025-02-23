/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('license is enterprise', () {
    test('check default values', () {
      librocketchatrestapi.LicensesIsEnterprise info = librocketchatrestapi.LicensesIsEnterprise();
      expect(info.requireHttpAuthentication(), true);
      expect(info.requireTwoFactorAuthentication, false);
      expect(info.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/licenses.isEnterprise"));
    });
  });
}
