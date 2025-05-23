/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('custom user status', () {
    test('check default values', () {
      librocketchatrestapi.LoadEmojiCustom loadEmojiCustom = librocketchatrestapi.LoadEmojiCustom();
      expect(loadEmojiCustom.requireHttpAuthentication(), true);
      expect(loadEmojiCustom.requireTwoFactorAuthentication, false);
      expect(loadEmojiCustom.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/emoji-custom.list"));
    });
  });
}
