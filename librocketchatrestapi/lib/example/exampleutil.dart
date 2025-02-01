/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/src/authentication/login.dart';

LoginInfo logInfo() {
  LoginInfo info = LoginInfo('<user>', '<password>');
  return info;
}

String serverUrl() {
  return "<url>";
}
