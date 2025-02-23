/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('get rooms info', () {
    test('check default values', () {
      librocketchatrestapi.GetRooms getRooms = librocketchatrestapi.GetRooms();
      expect(getRooms.canStart(), false);
      expect(getRooms.requireHttpAuthentication(), true);

      expect(
          getRooms.url("https://www.kde.org"), Uri.parse('https://www.kde.org/api/v1/rooms.get'));
    });
  });
}
