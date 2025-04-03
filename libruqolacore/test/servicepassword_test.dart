/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('Service Password info', () {
    test('Test Initial TeamInfo values', () {
      final libruqolacore.ServicePassword servicePassword =
          libruqolacore.ServicePassword.defaultValues();
      expect(servicePassword.totp, false);
      expect(servicePassword.email2faEnabled, false);
      expect(servicePassword.password.isEmpty, true);
    });
  });
}
