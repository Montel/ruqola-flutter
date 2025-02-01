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
      final info = librocketchatrestapi.RoomsNameExistsInfo("fff");
      librocketchatrestapi.RoomsNameExists roomsNameExists =
          librocketchatrestapi.RoomsNameExists(info);
      expect(info.roomName, 'fff');
      expect(roomsNameExists.canStart(), false);
      expect(roomsNameExists.requireHttpAuthentication(), true);

      expect(
          roomsNameExists.url("https://www.kde.org"),
          Uri.parse(
              'https://www.kde.org/api/v1/rooms.nameExists?roomName=fff'));
    });
  });
}
