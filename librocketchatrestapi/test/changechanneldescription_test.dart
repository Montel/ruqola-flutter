/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Change Channel annoucement', () {
    test('check default values', () {
      librocketchatrestapi.ChangeChannelDescriptionInfo info =
          librocketchatrestapi.ChangeChannelDescriptionInfo("foo", "descr");
      expect(info.canStart(), true);

      librocketchatrestapi.ChangeChannelDescription changeDescription =
          librocketchatrestapi.ChangeChannelDescription(info);
      changeDescription.serverUrl = "http://www.kde.org";
      expect(changeDescription.canStart(), false);
      expect(changeDescription.requireHttpAuthentication(), true);
      changeDescription.userId = 'user';
      changeDescription.authToken = 'token';

      expect(changeDescription.requireTwoFactorAuthentication, false);
      expect(changeDescription.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/channels.setDescription'));

      expect(info.body(), {'roomId': "foo", 'description': "descr"});
    });
  });
}
