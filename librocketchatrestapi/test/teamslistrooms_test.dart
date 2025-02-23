/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('teams list rooms info', () {
    test('check default values', () {
      final info = librocketchatrestapi.TeamsListRoomsInfo("fff");
      librocketchatrestapi.TeamsListRooms teamsListRooms =
          librocketchatrestapi.TeamsListRooms(info);
      expect(info.teamId, 'fff');
      expect(teamsListRooms.canStart(), false);
      expect(teamsListRooms.requireHttpAuthentication(), true);

      expect(teamsListRooms.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/teams.listRooms?teamId=fff'));
    });
  });
}
