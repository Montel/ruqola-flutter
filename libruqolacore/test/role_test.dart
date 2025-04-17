/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('Role Info', () {
    test('Test Initial Role Info values', () {
      final role = libruqolacore.Role.defaultValues();
      expect(role.isLeader, false);
      expect(role.isModerator, false);
      expect(role.isOwner, false);
      expect(role.userName.isEmpty, true);
      expect(role.userId.isEmpty, true);
      expect(role.isValid(), false);
    });
  });

  // TODO add test loading elements
}
