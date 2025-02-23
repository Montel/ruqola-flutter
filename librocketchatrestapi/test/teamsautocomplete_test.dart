/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('teams autocompete info', () {
    test('check default values', () {
      final info = librocketchatrestapi.TeamsAutoCompleteInfo("fff");
      librocketchatrestapi.TeamsAutoComplete teamsAutoComplete =
          librocketchatrestapi.TeamsAutoComplete(info);
      expect(info.name, 'fff');
      expect(teamsAutoComplete.canStart(), false);
      expect(teamsAutoComplete.requireHttpAuthentication(), true);

      expect(teamsAutoComplete.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/teams.autocomplete?name=fff'));
    });
  });
}
