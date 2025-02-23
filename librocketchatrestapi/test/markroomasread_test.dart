/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Rooms room as read', () {
    test('check default values', () {
      librocketchatrestapi.MarkRoomAsReadInfo info = librocketchatrestapi.MarkRoomAsReadInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.MarkRoomAsRead markRoomAsRead =
          librocketchatrestapi.MarkRoomAsRead(info);
      markRoomAsRead.serverUrl = "http://www.kde.org";
      expect(markRoomAsRead.canStart(), false);
      expect(markRoomAsRead.requireHttpAuthentication(), true);
      markRoomAsRead.userId = 'user';
      markRoomAsRead.authToken = 'token';

      expect(markRoomAsRead.requireTwoFactorAuthentication, false);
      expect(markRoomAsRead.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/subscriptions.read'));

      expect(info.body(), {'rid': 'foo'});
    });
  });
}
