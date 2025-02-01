/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:librocketchatrestapi/example/exampleutil.dart';

// dart example/librocketchatrestapi_example.dart
Future<void> main() async {
  LicensesInfo info = LicensesInfo();
  info.serverUrl = serverUrl();
  info.userId = "H7Q9djXQ4iShzD9T2";
  info.authToken = "<test>";
  var result = await info.start();
  print("result $result");
}
