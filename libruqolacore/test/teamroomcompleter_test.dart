/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('TeamRoomCompleter info', () {
    test('Test Initial TeamRoomCompleter values', () {
      final libruqolacore.TeamRoomCompleter teaminfo =
          libruqolacore.TeamRoomCompleter.defaultValues();
      expect(teaminfo.fname.isEmpty, true);
      expect(teaminfo.identifier.isEmpty, true);
      expect(teaminfo.name.isEmpty, true);
    });
  });
}
