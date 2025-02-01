/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import "dart:io";

import "package:ini/ini.dart";

class AccountSettings {
  // TODO save settings/load settings

  set setUserId(String id) {
    _userId = id;
  }

  String get userId {
    return _userId;
  }

  set setAuthToken(String id) {
    _authToken = id;
  }

  String get authToken {
    return _authToken;
  }

  set setServerUrl(String id) {
    _serverUrl = id;
  }

  String get serverUrl {
    return _serverUrl;
  }

  set setAccountName(String id) {
    _accountName = id;
  }

  String get accountName {
    return _accountName;
  }

  set setDisplayName(String id) {
    _displayName = id;
  }

  String get displayName {
    return _displayName;
  }

  set setUserName(String id) {
    _userName = id;
  }

  String get userName {
    return _userName;
  }

  set setPassword(String id) {
    _password = id;
  }

  String get password {
    return _password;
  }

  Future<void> saveSettings(String filePath) async {
    var config = Config();
    final String sectionName = 'General';
    config.addSection(sectionName);
    config.set(sectionName, 'serverURL', _serverUrl);
    config.set(sectionName, 'accountName', _accountName);
    config.set(sectionName, 'displayName', _displayName);
    config.set(sectionName, 'userID', _userId);
    // ADD MORE

    var file = File(filePath);
    await file.writeAsString(config.toString());
  }

  Future<void> loadSettings(String filePath) async {
    var file = File(filePath);
    if (!await file.exists()) return;

    final String sectionName = 'General';

    var config = Config.fromString(await file.readAsString());
    _serverUrl = config.get(sectionName, 'serverURL') ?? '';
    _accountName = config.get(sectionName, 'accountName') ?? '';
    _displayName = config.get(sectionName, 'displayName') ?? '';
    _userId = config.get(sectionName, 'userID') ?? '';
    // TODO add more
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountSettings &&
        other._userId == _userId &&
        other._authToken == _authToken &&
        other._serverUrl == _serverUrl &&
        other._accountName == _accountName &&
        other._displayName == _displayName &&
        other._userName == _userName &&
        other._password == _password;
  }

  @override
  int get hashCode {
    return _userId.hashCode ^
        _authToken.hashCode ^
        _serverUrl.hashCode ^
        _accountName.hashCode ^
        _displayName.hashCode ^
        _userName.hashCode ^
        _password.hashCode;
  }

  String _userId = '';
  String _authToken = '';
  String _serverUrl = '';
  String _accountName = '';
  String _displayName = '';
  String _userName = '';
  String _password = '';
}
