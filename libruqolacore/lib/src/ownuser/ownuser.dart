/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/src/ownuser/ownuserpreferences.dart';
import 'package:libruqolacore/src/ownuser/servicepassword.dart';

class OwnUser {
  final String userId = '';
  final String userName = '';
  final String status = '';
  final String email = '';
  final String statusText = '';
  final String name = '';
  final String avatarUrl = '';
  final String statusDefault = '';
  final String nickName = '';
  final List<String> roles = [];
  ServicePassword servicePassword = ServicePassword.defaultValues();
  OwnUserPreferences ownUserPreferences = OwnUserPreferences();
  double utcOffset = 0.0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OwnUser &&
        other.userId == userId &&
        other.userName == userName &&
        other.status == status &&
        other.email == email &&
        other.statusText == statusText &&
        other.name == name &&
        other.avatarUrl == avatarUrl &&
        other.statusDefault == statusDefault &&
        other.nickName == nickName &&
        other.servicePassword == servicePassword &&
        other.roles == roles &&
        other.ownUserPreferences == ownUserPreferences &&
        other.utcOffset == utcOffset;
  }

  @override
  int get hashCode {
    final String userId = '';
    final String userName = '';
    final String status = '';
    final String email = '';
    final String statusText = '';
    final String name = '';
    final String avatarUrl = '';
    final String statusDefault = '';
    final String nickName = '';
    final List<String> roles = [];
    ServicePassword servicePassword = ServicePassword.defaultValues();
    OwnUserPreferences ownUserPreferences = OwnUserPreferences();
    double utcOffset = 0.0;

    return userId.hashCode ^
        userName.hashCode ^
        status.hashCode ^
        email.hashCode ^
        statusText.hashCode ^
        name.hashCode ^
        avatarUrl.hashCode ^
        nickName.hashCode ^
        roles.hashCode ^
        servicePassword.hashCode ^
        ownUserPreferences.hashCode ^
        utcOffset.hashCode ^
        statusDefault.hashCode;
  }

  @override
  String toString() {
    return 'OwnUser(userId: $userId, userName: $userName, status: $status, email: $email, statusText: $statusText, name: $name, avatarUrl: $avatarUrl, nickName: $nickName, roles: $roles, servicePassword: $servicePassword, ownUserPreferences: $ownUserPreferences, utcOffset: $utcOffset, statusDefault: $statusDefault)';
  }
}
