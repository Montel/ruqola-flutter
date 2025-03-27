/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import "dart:async";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruqola_flutter/src/pages/home/desktop.dart';
import 'package:libruqolacore/libruqolacore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Rocketchataccount account = Rocketchataccount();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => account.receiverTypingNotification,
          child: RuqolaMainApp(account),
        ),
        ChangeNotifierProvider(
          create: (context) => account.models,
          child: RuqolaMainApp(account),
        ),
        ChangeNotifierProvider(
          create: (context) => account.statusModel,
          child: RuqolaMainApp(account),
        ),
        ChangeNotifierProvider(
          create: (context) => account.commandModel,
          child: RuqolaMainApp(account),
        ),
        Provider(create: (context) => account),
        Provider(create: (context) => SecureStorage()),
      ],
      child: RuqolaMainApp(account),
    ),
  );
}

class RuqolaMainApp extends StatefulWidget {
  final Rocketchataccount account;
  const RuqolaMainApp(this.account, {super.key});

  @override
  State<RuqolaMainApp> createState() => MainWidgetState();
}

class MainWidgetState extends State<RuqolaMainApp> {
  @override
  void initState() {
    SystemTrayDesktop d = SystemTrayDesktop();
    d.initMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: HomePageDesktop(),
      ),
    );
  }
}
