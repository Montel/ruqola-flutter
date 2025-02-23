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
      expect(serverConfigPassword.accountsPasswordPolicyForbidRepeatingCharacters, true);
      expect(serverConfigPassword.accountsPasswordPolicyAtLeastOneLowercase, true);
      expect(serverConfigPassword.accountsPasswordPolicyAtLeastOneUppercase, true);
      expect(serverConfigPassword.accountsPasswordPolicyAtLeastOneNumber, true);
      expect(serverConfigPassword.accountsPasswordPolicyAtLeastOneSpecialCharacter, true);
      expect(serverConfigPassword.accountsPasswordPolicyMinLength, 12);
      expect(serverConfigPassword.accountsPasswordPolicyMaxLength, 24);
      expect(serverConfigPassword.accountsPasswordPolicyForbidRepeatingCharactersCount, 3);
    });

    void testValues(libruqolacore.RuqolaServerConfigPassword settings, int check, int passwordOk,
        String password, bool valid) {
      int f = settings.validatePassword(password);
      expect(f, check);
      bool passwordValidValue = settings.isValidatePassword(f);
      expect(passwordValidValue, valid);
      expect(settings.passwordValidChecks(), passwordOk);
    }

    test('empty', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      int check = libruqolacore.PasswordSettingCheck.none.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.none.value;
      testValues(settings, check, passwordOk, '', true);
    });
    test('disable', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = false;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.none.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.none.value;
      testValues(settings, check, passwordOk, "sdfsdfDdd2", true);
    });
    test('test2', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;

      testValues(settings, check, passwordOk, "AAAAA", false);
    });

    test('test3', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = false;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      testValues(settings, check, passwordOk, "Aqsdfsdfsdf", false);
    });

    test('test4', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = true;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value;

      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      testValues(settings, check, passwordOk, "Aqsdfsdfsdf", false);
    });

    test('test5', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = true;
      settings.accountsPasswordPolicyAtLeastOneNumber = true;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      testValues(settings, check, passwordOk, "Aq1444", false);
    });
    test('test6', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = true;
      settings.accountsPasswordPolicyAtLeastOneNumber = true;
      settings.accountsPasswordPolicyMinLength = 6;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      testValues(settings, check, passwordOk, "Aq1444", false);
    });
    test('test7', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = true;
      settings.accountsPasswordPolicyAtLeastOneNumber = true;
      settings.accountsPasswordPolicyMinLength = 6;
      settings.accountsPasswordPolicyMaxLength = 8;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;

      testValues(settings, check, passwordOk, "Aq144444", false);
    });
    test('test7 (less than max)', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = true;
      settings.accountsPasswordPolicyAtLeastOneNumber = true;
      settings.accountsPasswordPolicyMinLength = 6;
      settings.accountsPasswordPolicyMaxLength = 8;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      testValues(settings, check, passwordOk, "Aq1444", false);
    });

    test('test8', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = true;
      settings.accountsPasswordPolicyAtLeastOneNumber = true;
      settings.accountsPasswordPolicyMinLength = 6;
      settings.accountsPasswordPolicyMaxLength = 8;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      testValues(settings, check, passwordOk, "Aq1444@", true);
    });

    test('test8-1', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = true;
      settings.accountsPasswordPolicyAtLeastOneNumber = true;
      settings.accountsPasswordPolicyMinLength = 6;
      settings.accountsPasswordPolicyMaxLength = 8;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      testValues(settings, check, passwordOk, "Aq1444;", true);
    });
    test('test8-2', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = true;
      settings.accountsPasswordPolicyAtLeastOneNumber = true;
      settings.accountsPasswordPolicyMinLength = 6;
      settings.accountsPasswordPolicyMaxLength = 8;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      testValues(settings, check, passwordOk, "Aq1444_", true);
    });

    test('test9', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      settings.accountsPasswordPolicyEnabled = true;
      settings.accountsPasswordPolicyAtLeastOneUppercase = true;
      settings.accountsPasswordPolicyAtLeastOneLowercase = true;
      settings.accountsPasswordPolicyAtLeastOneNumber = true;
      settings.accountsPasswordPolicyMinLength = 6;
      settings.accountsPasswordPolicyMaxLength = 8;
      settings.accountsPasswordPolicyForbidRepeatingCharactersCount = 4;
      int check = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      int passwordOk = libruqolacore.PasswordSettingCheck.atLeastOneUppercase.value |
          libruqolacore.PasswordSettingCheck.maxLengh.value |
          libruqolacore.PasswordSettingCheck.atLeastOneLowercase.value |
          libruqolacore.PasswordSettingCheck.atLeastOneNumber.value |
          libruqolacore.PasswordSettingCheck.minLengh.value |
          libruqolacore.PasswordSettingCheck.forbidRepeatingCharactersCount.value |
          libruqolacore.PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      testValues(settings, check, passwordOk, "Aq1444_", true);
    });
  });
}
