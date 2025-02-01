/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libddpapi/libddpapi.dart' as libddpapi;
import 'package:test/test.dart';

void main() {
  group('AuthenticationBase', () {
    test('Test default value', () {
      libddpapi.Authenticationbase b = libddpapi.Authenticationbase();
      expect(b.authToken, null);
      expect(b.userId, null);
    });
  });
}
