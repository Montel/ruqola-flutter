/* SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'dart:convert';
import 'dart:async';
import 'package:libddpapi/libddpapi.dart' as libddpapi;
import 'dart:io';

// Main Function
Future<void> main() async {
  // dart compile exe bin/libddpapi_example.dart -o script1 && /opt/travail/git/ruqola-dart/libddpapi/script1
  print("start apps");
  const String url = '<url>';
  final libddpapi.DdpClient webSocketClient = libddpapi.DdpClient();
  webSocketClient.serverUrl = url;
  print("start websocket");

  libddpapi.Authenticationbase b = libddpapi.Authenticationbase();
  b.setPassword = "<password>"; // TODO use password
  b.setUserUserName = "<user>"; //TODO use usename
  webSocketClient.authenticationbase = b;

  await webSocketClient.start();
  webSocketClient.sendMessage(jsonEncode(libddpapi.Authenticationutils.sendConnect()));

  // webSocketClient.sendMessage('ping');
  await for (var line in stdin.transform(utf8.decoder).transform(LineSplitter())) {
    if (line.trim().toLowerCase() == 'q') {
      print("Au revoir !");
      break;
    }
    print("Vous avez tapé : $line");
  }
  await webSocketClient.close();
  print("stopped apps");
  exit(0);
}
