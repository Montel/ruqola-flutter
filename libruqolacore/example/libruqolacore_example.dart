/* SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'dart:convert';
import 'dart:async';
import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'dart:io';

// Main Function
Future<void> main() async {
  // dart compile exe example/libruqolacore_example.dart -o libruqolacore_example && /opt/travail/git/ruqola-dart/libruqolacore/libruqolacore_example
  print("start apps");

  libruqolacore.Rocketchataccount account = libruqolacore.Rocketchataccount();
  account.settings.setPassword = "<password>";
  account.settings.setUserName = "<user>";
  account.settings.setServerUrl = '<url>';

  await account.connect();

  // Create a event loop
  await for (var line in stdin.transform(utf8.decoder).transform(LineSplitter())) {
    if (line.trim().toLowerCase() == 'q') {
      print("Au revoir !");
      break;
    }
    print("Vous avez tapé : $line");
  }
  await account.close();
  print("stopped apps");
  exit(0);
}
