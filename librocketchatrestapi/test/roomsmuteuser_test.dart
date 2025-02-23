/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Rooms Mute user', () {
    test('check default values', () {
      librocketchatrestapi.RoomsMuteUserInfo info =
          librocketchatrestapi.RoomsMuteUserInfo("foo", "user");
      expect(info.canStart(), true);

      librocketchatrestapi.RoomsMuteUser roomsMute = librocketchatrestapi.RoomsMuteUser(info);
      roomsMute.serverUrl = "http://www.kde.org";
      expect(roomsMute.canStart(), false);
      expect(roomsMute.requireHttpAuthentication(), true);
      roomsMute.userId = 'user';
      roomsMute.authToken = 'token';

      expect(roomsMute.requireTwoFactorAuthentication, false);
      expect(roomsMute.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/rooms.muteUser'));

      expect(info.body(), {'roomId': "foo", "username": "user"});
    });
  });
}
