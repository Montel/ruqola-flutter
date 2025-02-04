/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
enum PasswordSettingCheck {
  none(1 << 0),
  minLengh(1 << 1),
  maxLengh(1 << 2),
  forbidRepeatingCharactersCount(1 << 4),
  forbidRepeatingCharacters(1 << 8),
  atLeastOneLowercase(1 << 16),
  atLeastOneUppercase(1 << 32),
  atLeastOneSpecialCharacter(1 << 64),
  atLeastOneNumber(1 << 128);

  final int value;
  const PasswordSettingCheck(this.value);
}

class RuqolaServerConfigPassword {
  bool loadSettings(String id, String value) {
    // TODO
    return false;
  }

  @override
  bool operator ==(Object other) {
    return other is RuqolaServerConfigPassword &&
        other.accountsPasswordPolicyMinLength ==
            accountsPasswordPolicyMinLength &&
        other.accountsPasswordPolicyMaxLength ==
            accountsPasswordPolicyMaxLength &&
        other.accountsPasswordPolicyForbidRepeatingCharactersCount ==
            accountsPasswordPolicyForbidRepeatingCharactersCount &&
        other.accountsPasswordPolicyEnabled == accountsPasswordPolicyEnabled &&
        other.accountsPasswordPolicyForbidRepeatingCharacters ==
            accountsPasswordPolicyForbidRepeatingCharacters &&
        other.accountsPasswordPolicyAtLeastOneLowercase ==
            accountsPasswordPolicyAtLeastOneLowercase &&
        other.accountsPasswordPolicyAtLeastOneUppercase ==
            accountsPasswordPolicyAtLeastOneUppercase &&
        other.accountsPasswordPolicyAtLeastOneNumber ==
            accountsPasswordPolicyAtLeastOneNumber &&
        other.accountsPasswordPolicyAtLeastOneSpecialCharacter ==
            accountsPasswordPolicyAtLeastOneSpecialCharacter;
  }

  @override
  int get hashCode {
    return accountsPasswordPolicyMinLength.hashCode ^
        accountsPasswordPolicyMaxLength.hashCode ^
        accountsPasswordPolicyForbidRepeatingCharactersCount.hashCode ^
        accountsPasswordPolicyEnabled.hashCode ^
        accountsPasswordPolicyForbidRepeatingCharacters.hashCode ^
        accountsPasswordPolicyAtLeastOneLowercase.hashCode ^
        accountsPasswordPolicyAtLeastOneUppercase.hashCode ^
        accountsPasswordPolicyAtLeastOneNumber.hashCode ^
        accountsPasswordPolicyAtLeastOneSpecialCharacter.hashCode;
  }

  int passwordValidChecks() {
    int currentPolicy = PasswordSettingCheck.none.value;
    if (accountsPasswordPolicyEnabled) {
      if (accountsPasswordPolicyForbidRepeatingCharacters) {
        currentPolicy |=
            PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      }
      if (accountsPasswordPolicyAtLeastOneLowercase) {
        currentPolicy |= PasswordSettingCheck.atLeastOneLowercase.value;
      }
      if (accountsPasswordPolicyAtLeastOneUppercase) {
        currentPolicy |= PasswordSettingCheck.atLeastOneUppercase.value;
      }
      if (accountsPasswordPolicyAtLeastOneSpecialCharacter) {
        currentPolicy |= PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      }
      if (accountsPasswordPolicyAtLeastOneNumber) {
        currentPolicy |= PasswordSettingCheck.atLeastOneNumber.value;
      }
      if (accountsPasswordPolicyMinLength > 0) {
        currentPolicy |= PasswordSettingCheck.minLengh.value;
      }
      if (accountsPasswordPolicyMaxLength > 0) {
        currentPolicy |= PasswordSettingCheck.maxLengh.value;
      }
    }
    return currentPolicy;
  }

  @override
  String toString() {
    return 'RuqolaServerConfigPassword(accountsPasswordPolicyMinLength: $accountsPasswordPolicyMinLength, accountsPasswordPolicyMaxLength: $accountsPasswordPolicyMaxLength, accountsPasswordPolicyForbidRepeatingCharactersCount: $accountsPasswordPolicyForbidRepeatingCharactersCount accountsPasswordPolicyEnabled: $accountsPasswordPolicyEnabled accountsPasswordPolicyForbidRepeatingCharacters: $accountsPasswordPolicyForbidRepeatingCharacters accountsPasswordPolicyAtLeastOneLowercase: $accountsPasswordPolicyAtLeastOneLowercase accountsPasswordPolicyAtLeastOneUppercase: $accountsPasswordPolicyAtLeastOneUppercase accountsPasswordPolicyAtLeastOneNumber: $accountsPasswordPolicyAtLeastOneNumber accountsPasswordPolicyAtLeastOneSpecialCharacter: $accountsPasswordPolicyAtLeastOneSpecialCharacter)';
  }

  bool isValidatePassword(int checks) {
    final currentPolicy = passwordValidChecks();
    return currentPolicy == checks;
  }
  /*
  // TODO reimplement it in the future.
        [[nodiscard]] PasswordSettingChecks validatePassword(const QString &str);
  */

  int accountsPasswordPolicyMinLength = 12;
  int accountsPasswordPolicyMaxLength = 24;
  int accountsPasswordPolicyForbidRepeatingCharactersCount = 3;
  bool accountsPasswordPolicyEnabled = false;
  bool accountsPasswordPolicyForbidRepeatingCharacters = true;
  bool accountsPasswordPolicyAtLeastOneLowercase = true;
  bool accountsPasswordPolicyAtLeastOneUppercase = true;
  bool accountsPasswordPolicyAtLeastOneNumber = true;
  bool accountsPasswordPolicyAtLeastOneSpecialCharacter = true;
}
