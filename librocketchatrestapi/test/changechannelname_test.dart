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
      librocketchatrestapi.ChangeChannelNameInfo info =
          librocketchatrestapi.ChangeChannelNameInfo("foo", "nname");
      expect(info.canStart(), true);

      librocketchatrestapi.ChangeChannelName changeName =
          librocketchatrestapi.ChangeChannelName(info);
      changeName.serverUrl = "http://www.kde.org";
      expect(changeName.canStart(), false);
      expect(changeName.requireHttpAuthentication(), true);
      changeName.userId = 'user';
      changeName.authToken = 'token';

      expect(changeName.requireTwoFactorAuthentication, false);
      expect(changeName.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/channels.rename'));

      expect(info.body(), {'roomId': "foo", 'name': "nname"});
    });
  });
}
