/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('list invite', () {
    test('check default values', () {
      librocketchatrestapi.ListInvite listInvite =
          librocketchatrestapi.ListInvite();
      expect(listInvite.canStart(), false);
      expect(listInvite.requireHttpAuthentication(), true);
      expect(listInvite.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/listInvites'));
    });
  });
}
