/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('Team info', () {
    test('Test Initial TeamInfo values', () {
      final libruqolacore.TeamInfo teaminfo = libruqolacore.TeamInfo.defaultValues();
      expect(teaminfo.autoJoin, false);
      expect(teaminfo.roomsCount, 0);
      expect(teaminfo.mainTeam, false);
      expect(teaminfo.teamId.isEmpty, true);
    });

    test('Test verify if has team room', () {
      libruqolacore.TeamInfo teaminfo = libruqolacore.TeamInfo.defaultValues();
      expect(teaminfo.hasTeamRoom(), false);
      teaminfo.mainTeam = true;
      teaminfo.teamId = 'ff';
      expect(teaminfo.hasTeamRoom(), false);

      teaminfo.mainTeam = false;
      expect(teaminfo.hasTeamRoom(), true);

      teaminfo.teamId = '';
      expect(teaminfo.hasTeamRoom(), false);
    });
  });
}
