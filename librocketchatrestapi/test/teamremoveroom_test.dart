/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Team Remove Room', () {
    test('check default values', () {
      librocketchatrestapi.TeamRemoveRoomInfo info =
          librocketchatrestapi.TeamRemoveRoomInfo("foo", "bla");
      expect(info.canStart(), true);

      librocketchatrestapi.TeamRemoveRoom teamRemoveRoom =
          librocketchatrestapi.TeamRemoveRoom(info);
      teamRemoveRoom.serverUrl = "http://www.kde.org";
      expect(teamRemoveRoom.canStart(), false);
      expect(teamRemoveRoom.requireHttpAuthentication(), true);
      teamRemoveRoom.userId = 'user';
      teamRemoveRoom.authToken = 'token';

      expect(teamRemoveRoom.requireTwoFactorAuthentication, false);
      expect(teamRemoveRoom.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/teams.removeRoom'));

      expect(info.body(), {'roomId': 'foo', 'teamId': 'bla'});
    });
  });
}
