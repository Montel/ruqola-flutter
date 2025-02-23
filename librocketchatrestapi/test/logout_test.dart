/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('logout info', () {
    test('check default values', () {
      librocketchatrestapi.Logout logout = librocketchatrestapi.Logout();
      expect(logout.canStart(), false);
      expect(logout.requireHttpAuthentication(), true);
    });
  });
}
