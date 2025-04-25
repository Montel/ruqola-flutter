/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  final roles = libruqolacore.Roles();
  group('Roles Info', () {
    test('Test Initial Roles Info values', () {
      expect(roles.roles.isEmpty, true);
      // TODO
    });
  });

  // TODO add test loading elements
}
