/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
class ServicePassword {
  final String password;
  final bool email2faEnabled;
  final bool totp;

  ServicePassword.defaultValues()
      : password = '',
        email2faEnabled = false,
        totp = false;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServicePassword &&
        other.password == password &&
        other.email2faEnabled == email2faEnabled &&
        other.totp == totp;
  }

  @override
  int get hashCode {
    return password.hashCode ^ email2faEnabled.hashCode ^ totp.hashCode;
  }

  @override
  String toString() {
    return 'ServicePassword(password: $password, email2faEnabled: $email2faEnabled, totp: $totp)';
  }
}
