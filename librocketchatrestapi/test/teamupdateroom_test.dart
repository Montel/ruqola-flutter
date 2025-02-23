/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Team update Room', () {
    test('check default values', () {
      librocketchatrestapi.TeamUpdateRoomInfo info =
          librocketchatrestapi.TeamUpdateRoomInfo("foo", false);
      expect(info.canStart(), true);

      librocketchatrestapi.TeamUpdateRoom teamUpdateRoom =
          librocketchatrestapi.TeamUpdateRoom(info);
      teamUpdateRoom.serverUrl = "http://www.kde.org";
      expect(teamUpdateRoom.canStart(), false);
      expect(teamUpdateRoom.requireHttpAuthentication(), true);
      teamUpdateRoom.userId = 'user';
      teamUpdateRoom.authToken = 'token';

      expect(teamUpdateRoom.requireTwoFactorAuthentication, false);
      expect(teamUpdateRoom.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/teams.updateRoom'));

      expect(info.body(), {'roomId': 'foo', 'isDefault': 'false'});
    });
  });
}
