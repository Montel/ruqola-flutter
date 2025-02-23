/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('remove invite', () {
    test('check default values', () {
      final String id = 'foo';
      librocketchatrestapi.RemoveInviteTokenInfo info =
          librocketchatrestapi.RemoveInviteTokenInfo(id);
      expect(info.identifier.isNotEmpty, true);

      librocketchatrestapi.RemoveInviteToken removeInvite =
          librocketchatrestapi.RemoveInviteToken(info);
      expect(removeInvite.canStart(), false);
      expect(removeInvite.requireHttpAuthentication(), true);
      expect(removeInvite.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/removeInvite/foo'));
    });
  });
}
