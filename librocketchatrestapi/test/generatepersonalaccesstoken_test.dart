/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('generate personal access token', () {
    test('check default values', () {
      librocketchatrestapi.GeneratePersonalAccessTokenInfo info =
          librocketchatrestapi.GeneratePersonalAccessTokenInfo("foo", true);
      expect(info.canStart(), true);

      librocketchatrestapi.GeneratePersonalAccessToken generatePersonalAccessToken =
          librocketchatrestapi.GeneratePersonalAccessToken(info);
      generatePersonalAccessToken.serverUrl = "http://www.kde.org";
      expect(generatePersonalAccessToken.canStart(), false);
      expect(generatePersonalAccessToken.requireHttpAuthentication(), true);
      generatePersonalAccessToken.userId = 'user';
      generatePersonalAccessToken.authToken = 'token';

      expect(generatePersonalAccessToken.requireTwoFactorAuthentication, false);
      expect(generatePersonalAccessToken.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/users.generatePersonalAccessToken'));
    });

    test('check can start', () {
      librocketchatrestapi.GeneratePersonalAccessTokenInfo info =
          librocketchatrestapi.GeneratePersonalAccessTokenInfo("foo", true);
      expect(info.canStart(), true);

      librocketchatrestapi.GeneratePersonalAccessToken generatePersonalAccessToken =
          librocketchatrestapi.GeneratePersonalAccessToken(info);
      generatePersonalAccessToken.userId = 'user';
      generatePersonalAccessToken.authToken = 'token';
      generatePersonalAccessToken.serverUrl = "http://www.kde.org";
      expect(generatePersonalAccessToken.canStart(), true);
    });
  });
}
