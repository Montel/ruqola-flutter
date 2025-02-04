/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
/*
// TODO implement enum flags !
        enum PasswordSettingCheck {
            None = 0,
            MinLengh = 1,
            MaxLengh = 2,
            ForbidRepeatingCharactersCount = 4,
            ForbidRepeatingCharacters = 8,
            AtLeastOneLowercase = 16,
            AtLeastOneUppercase = 32,
            AtLeastOneSpecialCharacter = 64,
            AtLeastOneNumber = 128,
        }
*/
class RuqolaServerConfigPassword {
  int accountsPasswordPolicyMinLength = 12;
  int accountsPasswordPolicyMaxLength = 24;
  int accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
  bool accountsPasswordPolicyEnabled = false;
  bool accountsPasswordPolicyForbidRepeatingCharacters = true;
  bool accountsPasswordPolicyAtLeastOneLowercase = true;
  bool accountsPasswordPolicyAtLeastOneUppercase = true;
  bool accountsPasswordPolicyAtLeastOneNumber = true;
  bool accountsPasswordPolicyAtLeastOneSpecialCharacter = true;

  bool loadSettings(String id, String value) {
    // TODO
    return false;
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return super == other;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;

  /*
        [[nodiscard]] bool operator==(const RuqolaServerConfig::PasswordSettings &other) const;
        [[nodiscard]] PasswordSettingChecks validatePassword(const QString &str);
        [[nodiscard]] bool isValidatePassword(PasswordSettingChecks checks) const;
        [[nodiscard]] PasswordSettingChecks passwordValidChecks() const;
        */
}
