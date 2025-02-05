/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';

enum PasswordSettingCheck {
  none(0), // We need to have 0!
  minLengh(1 << 0),
  maxLengh(1 << 1),
  forbidRepeatingCharactersCount(1 << 2),
  forbidRepeatingCharacters(1 << 4),
  atLeastOneLowercase(1 << 8),
  atLeastOneUppercase(1 << 16),
  atLeastOneSpecialCharacter(1 << 32),
  atLeastOneNumber(1 << 64);

  final int value;
  const PasswordSettingCheck(this.value);
}

class RuqolaServerConfigPassword {
  bool loadSettings(String id, String value) {
    // TODO
    return false;
  }

  int validatePassword(String str) {
    int checks = PasswordSettingCheck.none.value;
    if (!accountsPasswordPolicyEnabled) {
      return checks;
    }
    int total = str.length;
    if (total >= accountsPasswordPolicyMinLength) {
      checks |= PasswordSettingCheck.minLengh.value;
    }
    if (total <= accountsPasswordPolicyMaxLength) {
      checks |= PasswordSettingCheck.maxLengh.value;
    }
    if (accountsPasswordPolicyForbidRepeatingCharacters) {
      bool tooManyRepeatingCharatersFound = false;
      int maxRepeatingChar =
          accountsPasswordPolicyForbidRepeatingCharactersCount;
      int duplicateCharFound = 0;
      for (int i = 0; i < total; ++i) {
        var c = str[i];
        for (int j = i; j < total; ++j) {
          if (str[j] == c) {
            duplicateCharFound++;
          } else {
            break;
          }
        }
        if (duplicateCharFound > maxRepeatingChar) {
          tooManyRepeatingCharatersFound = true;
          break;
        }
        duplicateCharFound = 0;
      }
      if (!tooManyRepeatingCharatersFound) {
        checks |= PasswordSettingCheck.forbidRepeatingCharactersCount.value;
      }
    }
    if (accountsPasswordPolicyAtLeastOneLowercase) {
      for (int i = 0; i < total; ++i) {
        if (str[i].characters.toLowerCase() == str[i].characters) {
          checks |= PasswordSettingCheck.atLeastOneLowercase.value;
          break;
        }
      }
    }
    if (accountsPasswordPolicyAtLeastOneUppercase) {
      for (int i = 0; i < total; ++i) {
        if (str[i].characters.toUpperCase() == str[i].characters) {
          checks |= PasswordSettingCheck.atLeastOneUppercase.value;
          break;
        }
      }
    }
    if (accountsPasswordPolicyAtLeastOneNumber) {
      for (int i = 0; i < total; ++i) {
        if (str[i].characters is num) {
          checks |= PasswordSettingCheck.atLeastOneNumber.value;
          break;
        }
      }
    }
    if (accountsPasswordPolicyAtLeastOneSpecialCharacter) {
      bool hasPunctuation = str
          .split('')
          .any((char) => RegExp(r'^\p{P}$', unicode: true).hasMatch(char));
      bool hasSymbol = str
          .split('')
          .any((char) => RegExp(r'^\p{S}$', unicode: true).hasMatch(char));
      if (hasSymbol || hasPunctuation) {
        checks |= PasswordSettingCheck.atLeastOneSpecialCharacter.value;
      }
    }
    return checks;
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
