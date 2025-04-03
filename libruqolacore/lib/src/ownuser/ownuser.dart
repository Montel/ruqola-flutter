/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/src/ownuser/ownuserpreferences.dart';

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
  // TODO ServicePassword mServicePassword;
  OwnUserPreferences ownUserPreferences = OwnUserPreferences();
  double mUtcOffset = 0.0;
}
