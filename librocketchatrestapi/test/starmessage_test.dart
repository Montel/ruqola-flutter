/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('star message info', () {
    test('check default values', () {
      librocketchatrestapi.StarMessageInfo info =
          librocketchatrestapi.StarMessageInfo("bla", true);
      librocketchatrestapi.StarMessage starMessage =
          librocketchatrestapi.StarMessage(info);
      expect(starMessage.requireHttpAuthentication(), true);
      expect(starMessage.requireTwoFactorAuthentication, false);
      expect(starMessage.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/chat.starMessage"));
      expect(info.body(), {'messageId': 'bla'});
    });
    test('check count values', () {
      librocketchatrestapi.StarMessageInfo info =
          librocketchatrestapi.StarMessageInfo("bla", false);
      librocketchatrestapi.StarMessage starMessage =
          librocketchatrestapi.StarMessage(info);
      expect(starMessage.requireHttpAuthentication(), true);
      expect(starMessage.requireTwoFactorAuthentication, false);
      expect(starMessage.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/chat.unStarMessage"));
      expect(info.body(), {'messageId': 'bla'});
    });
  });
}
