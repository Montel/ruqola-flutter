/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('follow message', () {
    test('check default values', () {
      librocketchatrestapi.FollowMessageInfo info =
          librocketchatrestapi.FollowMessageInfo("foo");
      expect(info.isValid(), true);

      librocketchatrestapi.FollowMessage unfollow =
          librocketchatrestapi.FollowMessage(info);
      unfollow.serverUrl = "http://www.kde.org";
      expect(unfollow.canStart(), false);
      expect(unfollow.requireHttpAuthentication(), true);
      unfollow.userId = 'user';
      unfollow.authToken = 'token';

      expect(unfollow.requireTwoFactorAuthentication, false);
      expect(unfollow.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/chat.followMessage'));
    });

    test('check can start', () {
      librocketchatrestapi.FollowMessageInfo info =
          librocketchatrestapi.FollowMessageInfo("foo");
      expect(info.isValid(), true);

      librocketchatrestapi.FollowMessage unfollow =
          librocketchatrestapi.FollowMessage(info);
      unfollow.userId = 'user';
      unfollow.authToken = 'token';
      unfollow.serverUrl = "http://www.kde.org";
      expect(unfollow.canStart(), true);
    });
  });
}
