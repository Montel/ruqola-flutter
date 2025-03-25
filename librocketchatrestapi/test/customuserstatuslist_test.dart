/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('custom user status', () {
    test('check default values', () {
      librocketchatrestapi.CustomUserStatusList customUserStatusList =
          librocketchatrestapi.CustomUserStatusList();
      expect(customUserStatusList.requireHttpAuthentication(), true);
      expect(customUserStatusList.requireTwoFactorAuthentication, false);
      expect(customUserStatusList.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/custom-user-status.list"));
    });
  });
}
