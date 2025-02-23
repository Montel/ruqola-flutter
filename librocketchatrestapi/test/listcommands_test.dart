/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('list commands info', () {
    test('check default values', () {
      librocketchatrestapi.ListCommands commands = librocketchatrestapi.ListCommands();
      expect(commands.requireHttpAuthentication(), true);
      expect(commands.requireTwoFactorAuthentication, false);
      expect(
          commands.url("http://www.kde.org"), Uri.parse("http://www.kde.org/api/v1/commands.list"));
    });
  });
}
