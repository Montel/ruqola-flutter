/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('AccountSettings', () {
    test('Test Initial values', () {
      final w = AccountSettings();
      expect(w.authToken, null);
      expect(w.userId, null);
      expect(w.serverUrl, null);
      expect(w.accountName, null);
      expect(w.displayName, null);
      expect(w.userName, null);
      expect(w.password, null);
    });
  });
}
