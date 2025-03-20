/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Custom User Status Model', () {
    test('Test default values', () {
      final CustomUserStatusModel status = CustomUserStatusModel.defaultValues();
      expect(status.offset, 0);
      expect(status.total, 0);
      expect(status.customUserCount, 0);
      expect(status.customUserStatusList.isEmpty, true);
    });
  });
}
