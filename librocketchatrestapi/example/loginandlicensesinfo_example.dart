/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:librocketchatrestapi/example/exampleutil.dart';

// dart example/loginandlicenses_example.dart
Future<void> main() async {
  // ignore: no_leading_underscores_for_local_identifiers
  final String _serverUrl = serverUrl();
  LoginInfo info = logInfo();
  Login job = Login(info);
  job.serverUrl = _serverUrl;
  var result = await job.start();
  print("result ! $result");
  var loginInfoResult = LoginResult.fromJson(result.result!);
  print("result $loginInfoResult");

  // License

  LicensesInfo licensesinfo = LicensesInfo();
  licensesinfo.serverUrl = _serverUrl;
  licensesinfo.userId = loginInfoResult.userId;
  licensesinfo.authToken = loginInfoResult.authToken;
  var resultLicense = await licensesinfo.start();
  print("result $resultLicense");
}
