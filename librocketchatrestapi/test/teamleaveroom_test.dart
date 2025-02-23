/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Team Leave Room', () {
    test('check default values', () {
      librocketchatrestapi.TeamLeaveRoomInfo info =
          librocketchatrestapi.TeamLeaveRoomInfo("foo", "bla");
      expect(info.canStart(), true);

      librocketchatrestapi.TeamLeaveRoom teamLeaveRoom = librocketchatrestapi.TeamLeaveRoom(info);
      teamLeaveRoom.serverUrl = "http://www.kde.org";
      expect(teamLeaveRoom.canStart(), false);
      expect(teamLeaveRoom.requireHttpAuthentication(), true);
      teamLeaveRoom.userId = 'user';
      teamLeaveRoom.authToken = 'token';

      expect(teamLeaveRoom.requireTwoFactorAuthentication, false);
      expect(teamLeaveRoom.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/teams.leave'));

      expect(info.body(), {'roomId': 'foo', 'teamId': 'bla'});
    });
  });
}
