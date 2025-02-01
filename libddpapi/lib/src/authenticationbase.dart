/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Authenticationbase {
  set setAuthToken(String auth) {
    _authToken = auth;
  }

  String? get authToken {
    return _authToken;
  }

  set setUserId(String userId) {
    _userId = userId;
  }

  String? get userId {
    return _userId;
  }

  set setUserUserName(String userName) {
    _userName = userName;
  }

  String get userName {
    return _userName;
  }

  set setPassword(String p) {
    _password = p;
  }

  String get password {
    return _password;
  }

  @override
  String toString() {
    return "Authentication (userId: $_userId, authToken: $_authToken)";
  }

  String? _authToken;
  String? _userId;
  String _userName = "";
  String _password = "";
}
