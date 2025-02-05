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

    test('empty', () {
      final settings = libruqolacore.RuqolaServerConfigPassword();
      libruqolacore.PasswordSettingCheck check =
          libruqolacore.PasswordSettingCheck.none;
      libruqolacore.PasswordSettingCheck passwordOk =
          libruqolacore.PasswordSettingCheck.none;
      /*
        const RuqolaServerConfig::PasswordSettings::PasswordSettingChecks f = passwordSettings.validatePassword(password);

        QTest::newRow("empty") << QString() << settings << check << true << passwordOk;
 

    // qDebug() << " f " << f;
    QCOMPARE(f, checks);
    // qDebug() << " FGGDFGSFGSDFGS " << f;
    const bool passwordValidValue = passwordSettings.isValidatePassword(f);
    // qDebug() << " passwordValidValue " << passwordValidValue << " password " << password;
    QCOMPARE(passwordValidValue, valid);
    QCOMPARE(passwordSettings.passwordValidChecks(), passwordOk);
    */
    });
  });

  // TODO add test loading elements
}
