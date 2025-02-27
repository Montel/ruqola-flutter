/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('preview command info', () {
    test('check default values', () {
      librocketchatrestapi.PreviewsCommandInfo info = librocketchatrestapi.PreviewsCommandInfo(
        "",
        "",
        "",
      );
      librocketchatrestapi.PreviewsCommand previewsCommand =
          librocketchatrestapi.PreviewsCommand(info);
      expect(previewsCommand.requireHttpAuthentication(), true);
      expect(previewsCommand.requireTwoFactorAuthentication, false);
      expect(previewsCommand.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/commands.preview"));
    });

    // TODO check PreviewsCommandInfo too
  });
}
