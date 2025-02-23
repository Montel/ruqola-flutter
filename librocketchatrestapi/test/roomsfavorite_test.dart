/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Rooms Favorite', () {
    test('check default values', () {
      librocketchatrestapi.RoomsFavoriteInfo info =
          librocketchatrestapi.RoomsFavoriteInfo("foo", false);
      expect(info.canStart(), true);

      librocketchatrestapi.RoomsFavorite roomsFavorite = librocketchatrestapi.RoomsFavorite(info);
      roomsFavorite.serverUrl = "http://www.kde.org";
      expect(roomsFavorite.canStart(), false);
      expect(roomsFavorite.requireHttpAuthentication(), true);
      roomsFavorite.userId = 'user';
      roomsFavorite.authToken = 'token';

      expect(roomsFavorite.requireTwoFactorAuthentication, false);
      expect(roomsFavorite.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/rooms.favorite'));

      expect(info.body(), {'roomId': 'foo', 'favorite': 'false'});
    });
  });
}
