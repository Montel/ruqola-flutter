/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('get discussions info', () {
    test('check default values', () {
      final info = librocketchatrestapi.GetDiscussionsInfo("fff");
      librocketchatrestapi.GetDiscussions getDiscussions =
          librocketchatrestapi.GetDiscussions(info);
      expect(info.roomId, 'fff');
      expect(getDiscussions.canStart(), false);
      expect(getDiscussions.requireHttpAuthentication(), true);

      expect(
          getDiscussions.url("https://www.kde.org"),
          Uri.parse(
              'https://www.kde.org/api/v1/rooms.getDiscussions?roomId=fff'));
    });
  });
}
