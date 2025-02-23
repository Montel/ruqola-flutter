/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Rect on message', () {
    test('check default values', () {
      librocketchatrestapi.ReactOnMessageInfo info =
          librocketchatrestapi.ReactOnMessageInfo("foo", "dfdfssg", false);
      expect(info.canStart(), true);

      librocketchatrestapi.ReactOnMessage unfollow = librocketchatrestapi.ReactOnMessage(info);
      unfollow.serverUrl = "http://www.kde.org";
      expect(unfollow.canStart(), false);
      expect(unfollow.requireHttpAuthentication(), true);
      unfollow.userId = 'user';
      unfollow.authToken = 'token';

      expect(unfollow.requireTwoFactorAuthentication, false);
      expect(unfollow.url("http://www.kde.org"), Uri.parse('http://www.kde.org/api/v1/chat.react'));

      expect(
          info.body(), {'emoji': "dfdfssg", "messageId": "foo", "shouldReact": false.toString()});
    });
  });
}
