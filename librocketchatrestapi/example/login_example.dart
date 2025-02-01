/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:librocketchatrestapi/example/exampleutil.dart';

// dart example/login_example.dart
Future<void> main() async {
  LoginInfo info = logInfo();
  Login job = Login(info);
  job.serverUrl = serverUrl();
  var result = await job.start();
  print("result $result");
}
