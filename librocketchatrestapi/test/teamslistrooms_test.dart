/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('rooms name exist info', () {
    test('check default values', () {
      final info = librocketchatrestapi.TeamInfoInfo("fff");
      librocketchatrestapi.TeamInfo teamInfo =
          librocketchatrestapi.TeamInfo(info);
      expect(info.teamId, 'fff');
      expect(teamInfo.canStart(), false);
      expect(teamInfo.requireHttpAuthentication(), true);

      expect(teamInfo.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/teams.info?teamId=fff'));
    });
  });
}
