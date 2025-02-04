/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('RuqolaServerConfigPassword', () {
    final serverConfigPassword = libruqolacore.RuqolaServerConfigPassword();

    test('Test Initial RuqolaServerConfigPassword values', () {
      expect(serverConfigPassword.accountsPasswordPolicyEnabled, false);
      expect(
          serverConfigPassword.accountsPasswordPolicyForbidRepeatingCharacters,
          true);
      expect(
          serverConfigPassword.accountsPasswordPolicyAtLeastOneLowercase, true);
      expect(
          serverConfigPassword.accountsPasswordPolicyAtLeastOneUppercase, true);
      expect(serverConfigPassword.accountsPasswordPolicyAtLeastOneNumber, true);
      expect(
          serverConfigPassword.accountsPasswordPolicyAtLeastOneSpecialCharacter,
          true);
      expect(serverConfigPassword.accountsPasswordPolicyMinLength, 12);
      expect(serverConfigPassword.accountsPasswordPolicyMaxLength, 24);
      expect(
          serverConfigPassword
              .accountsPasswordPolicyForbidRepeatingCharactersCount,
          3);
    });
  });

  // TODO add test loading elements
}
