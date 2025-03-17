/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Custom User Status', () {
    test('Test Initial values', () {
      final CustomUserStatus status = CustomUserStatus.defaultValues();
      expect(status.identifier.isEmpty, true);
      expect(status.name.isEmpty, true);
      expect(status.statusType, Status.unknown);
      expect(status.updatedAt, -1);
    });
  });
}
