/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Unfollow message', () {
    test('check default values', () {
      librocketchatrestapi.UnFollowMessageInfo info =
          librocketchatrestapi.UnFollowMessageInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.UnFollowMessage unfollow =
          librocketchatrestapi.UnFollowMessage(info);
      expect(unfollow.canStart(), false);
      expect(unfollow.requireHttpAuthentication(), true);

      expect(unfollow.requireTwoFactorAuthentication, false);
      unfollow.serverUrl = "http://www.kde.org";
      expect(unfollow.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/chat.unfollowMessage'));
    });

    test('check can start', () {
      librocketchatrestapi.UnFollowMessageInfo info =
          librocketchatrestapi.UnFollowMessageInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.UnFollowMessage unfollow =
          librocketchatrestapi.UnFollowMessage(info);
      unfollow.userId = 'user';
      unfollow.authToken = 'token';
      unfollow.serverUrl = "http://www.kde.org";
      expect(unfollow.canStart(), true);
    });
  });
}
