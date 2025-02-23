/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Change Channel annoucement', () {
    test('check default values', () {
      librocketchatrestapi.ChangeChannelAnnouncementInfo info =
          librocketchatrestapi.ChangeChannelAnnouncementInfo("foo", "annouc");
      expect(info.canStart(), true);

      librocketchatrestapi.ChangeChannelAnnouncement changeAnnouncement =
          librocketchatrestapi.ChangeChannelAnnouncement(info);
      changeAnnouncement.serverUrl = "http://www.kde.org";
      expect(changeAnnouncement.canStart(), false);
      expect(changeAnnouncement.requireHttpAuthentication(), true);
      changeAnnouncement.userId = 'user';
      changeAnnouncement.authToken = 'token';

      expect(changeAnnouncement.requireTwoFactorAuthentication, false);
      expect(changeAnnouncement.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/channels.setAnnouncement'));

      expect(info.body(), {'roomId': "foo", 'announcement': "annouc"});
    });
  });
}
