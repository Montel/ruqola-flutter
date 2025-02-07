/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  final licensesmanager = libruqolacore.LicensesManager();
  group('Licenses Info', () {
    test('Test Initial Licenses Info values', () {
      expect(licensesmanager.licenses.isEmpty, true);
    });
  });
}
