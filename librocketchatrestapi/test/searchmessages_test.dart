/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('search text info', () {
    test('check default values', () {
      librocketchatrestapi.SearchMessagesInfo info =
          librocketchatrestapi.SearchMessagesInfo("bla", "search_element");
      librocketchatrestapi.SearchMessages runcommand = librocketchatrestapi.SearchMessages(info);
      expect(runcommand.requireHttpAuthentication(), true);
      expect(runcommand.requireTwoFactorAuthentication, false);
      expect(runcommand.url("http://www.kde.org"),
          Uri.parse("http://www.kde.org/api/v1/chat.search?roomId=bla&searchText=search_element"));
    });
    test('check count values', () {
      librocketchatrestapi.SearchMessagesInfo info =
          librocketchatrestapi.SearchMessagesInfo("bla", "search_element", false, -1, 5);
      librocketchatrestapi.SearchMessages runcommand = librocketchatrestapi.SearchMessages(info);
      expect(runcommand.requireHttpAuthentication(), true);
      expect(runcommand.requireTwoFactorAuthentication, false);
      expect(
          runcommand.url("http://www.kde.org"),
          Uri.parse(
              "http://www.kde.org/api/v1/chat.search?roomId=bla&count=5&searchText=search_element"));
    });
  });
}
