/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('Team remove members', () {
    test('check default values', () {
      librocketchatrestapi.TeamRemoveMembersInfo info =
          librocketchatrestapi.TeamRemoveMembersInfo(
              ["foo", "blo", "fii"], "bla");
      expect(info.canStart(), true);

      librocketchatrestapi.TeamRemoveMembers teamRemoveMembers =
          librocketchatrestapi.TeamRemoveMembers(info);
      teamRemoveMembers.serverUrl = "http://www.kde.org";
      expect(teamRemoveMembers.canStart(), false);
      expect(teamRemoveMembers.requireHttpAuthentication(), true);
      teamRemoveMembers.userId = 'user';
      teamRemoveMembers.authToken = 'token';

      expect(teamRemoveMembers.requireTwoFactorAuthentication, false);
      expect(teamRemoveMembers.url("http://www.kde.org"),
          Uri.parse('http://www.kde.org/api/v1/teams.removeMember'));

      expect(info.body(), {'rooms': '["foo","blo","fii"]', 'teamId': 'bla'});
    });
  });
}
