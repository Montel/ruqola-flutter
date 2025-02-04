/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('pin message info', () {
    test('check default values', () {
      librocketchatrestapi.PinMessageInfo info =
          librocketchatrestapi.PinMessageInfo("bla", false);
      librocketchatrestapi.PinMessage runcommand =
          librocketchatrestapi.PinMessage(info);
      expect(runcommand.requireHttpAuthentication(), true);
      expect(runcommand.requireTwoFactorAuthentication, false);
      expect(runcommand.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/chat.unPinMessage"));
      expect(info.body(), {'messageId': 'bla'});
    });
    test('check count values', () {
      librocketchatrestapi.PinMessageInfo info =
          librocketchatrestapi.PinMessageInfo("bla", true);
      librocketchatrestapi.PinMessage runcommand =
          librocketchatrestapi.PinMessage(info);
      expect(runcommand.requireHttpAuthentication(), true);
      expect(runcommand.requireTwoFactorAuthentication, false);
      expect(runcommand.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/chat.pinMessage"));
      expect(info.body(), {'messageId': 'bla'});
    });
  });
}
