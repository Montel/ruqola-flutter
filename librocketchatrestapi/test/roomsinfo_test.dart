/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('rooms info', () {
    test('check default values', () {
      final info = librocketchatrestapi.RoomsInfoInfo("fff");
      librocketchatrestapi.RoomsInfo roomsInfo = librocketchatrestapi.RoomsInfo(info);
      expect(info.roomId, 'fff');
      expect(roomsInfo.canStart(), false);
      expect(roomsInfo.requireHttpAuthentication(), true);

      expect(roomsInfo.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/rooms.info?roomId=fff'));
    });
  });
}
