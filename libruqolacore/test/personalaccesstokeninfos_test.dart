/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('PersonalAccessTokenInfos', () {
    test('Test load Personal Access Token (empty)', () {
      final data = extractJsonData("personalaccesstokeninfos", "empty-token.json");
      final PersonalAccessTokenInfos personalAccessTokenInfos =
          PersonalAccessTokenInfos.fromJson(data);
      final PersonalAccessTokenInfos expectedPersonalAccessTokenInfos =
          PersonalAccessTokenInfos(personalAccessTokenInfos: []);
      expect(personalAccessTokenInfos, expectedPersonalAccessTokenInfos);
    });
    test('Test load Personal Access Token (four tokens)', () {
      final data = extractJsonData("personalaccesstokeninfos", "four-tokens.json");
      final PersonalAccessTokenInfos personalAccessTokenInfos =
          PersonalAccessTokenInfos.fromJson(data);

      List<PersonalAccessTokenInfo> listTokenInfos = [];

      {
        PersonalAccessTokenInfo i = PersonalAccessTokenInfo(
            lastTokenPart: "I6mHG3",
            name: "test1",
            createdAt: 1741856600248,
            bypassTwoFactor: false);
        listTokenInfos.add(i);
      }
      {
        PersonalAccessTokenInfo i = PersonalAccessTokenInfo(
            lastTokenPart: "ClGA8G",
            name: "test2",
            createdAt: 1741856613045,
            bypassTwoFactor: false);
        listTokenInfos.add(i);
      }
      {
        PersonalAccessTokenInfo i = PersonalAccessTokenInfo(
            lastTokenPart: "eM7RyS",
            name: "test3",
            createdAt: 1741856625084,
            bypassTwoFactor: false);
        listTokenInfos.add(i);
      }
      {
        PersonalAccessTokenInfo i = PersonalAccessTokenInfo(
            lastTokenPart: "nGVprC",
            name: "test4",
            createdAt: 1741856839672,
            bypassTwoFactor: true);
        listTokenInfos.add(i);
      }
      final PersonalAccessTokenInfos expectedPersonalAccessTokenInfos =
          PersonalAccessTokenInfos(personalAccessTokenInfos: listTokenInfos);
      expect(personalAccessTokenInfos, expectedPersonalAccessTokenInfos);
    });
  });
}
