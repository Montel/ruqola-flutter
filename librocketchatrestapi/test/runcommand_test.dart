/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('run command info', () {
    test('check default values', () {
      librocketchatrestapi.RunCommandInfo info =
          librocketchatrestapi.RunCommandInfo("", "", "", "", "");
      librocketchatrestapi.RunCommand runcommand = librocketchatrestapi.RunCommand(info);
      expect(runcommand.requireHttpAuthentication(), true);
      expect(runcommand.requireTwoFactorAuthentication, false);
      expect(runcommand.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/commands.run"));
    });

    // TODO check RunCommandInfo too
  });
}
