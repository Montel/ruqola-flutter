/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('personal access token', () {
    test('check default values', () {
      librocketchatrestapi.RegeneratePersonalAccessTokenInfo info =
          librocketchatrestapi.RegeneratePersonalAccessTokenInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.RegeneratePersonalAccessToken generatePersonalAccessToken =
          librocketchatrestapi.RegeneratePersonalAccessToken(info);
      generatePersonalAccessToken.serverUrl = "http://www.kde.org";
      expect(generatePersonalAccessToken.canStart(), false);
      expect(generatePersonalAccessToken.requireHttpAuthentication(), true);
      generatePersonalAccessToken.userId = 'user';
      generatePersonalAccessToken.authToken = 'token';

      expect(generatePersonalAccessToken.requireTwoFactorAuthentication, false);
      expect(generatePersonalAccessToken.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/users.regeneratePersonalAccessToken'));
    });

    test('check can start', () {
      librocketchatrestapi.RegeneratePersonalAccessTokenInfo info =
          librocketchatrestapi.RegeneratePersonalAccessTokenInfo("foo");
      expect(info.canStart(), true);

      librocketchatrestapi.RegeneratePersonalAccessToken generatePersonalAccessToken =
          librocketchatrestapi.RegeneratePersonalAccessToken(info);
      generatePersonalAccessToken.userId = 'user';
      generatePersonalAccessToken.authToken = 'token';
      generatePersonalAccessToken.serverUrl = "http://www.kde.org";
      expect(generatePersonalAccessToken.canStart(), true);
    });
  });
}
