/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('rooms images info', () {
    test('check default values', () {
      final info = librocketchatrestapi.RoomsImagesInfo("fff", "ggg", 5, 3);
      librocketchatrestapi.RoomsImages roomsImages =
          librocketchatrestapi.RoomsImages(info);
      expect(info.count, 3);
      expect(info.offset, 5);
      expect(info.roomId, 'fff');
      expect(info.startingFromId, 'ggg');
      expect(roomsImages.canStart(), false);
      expect(roomsImages.requireHttpAuthentication(), true);

      expect(
          roomsImages.url("https://www.kde.org"),
          Uri.parse(
              'https://www.kde.org/api/v1/rooms.images?roomId=fff&startingFromId=ggg&offset=5&count=3'));
    });
  });
}
