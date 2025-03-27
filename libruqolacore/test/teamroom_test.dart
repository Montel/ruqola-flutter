/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('TeamRoom info', () {
    test('Test Initial Team Rooms values', () {
      final libruqolacore.TeamRoom teamroom = libruqolacore.TeamRoom.defaultValues();
      expect(teamroom.autoJoin, false);
      expect(teamroom.name.isEmpty, true);
      expect(teamroom.fname.isEmpty, true);
      expect(teamroom.identifier.isEmpty, true);
    });
  });
}
