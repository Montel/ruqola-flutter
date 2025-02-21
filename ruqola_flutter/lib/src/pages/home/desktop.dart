/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:provider/provider.dart';
import 'package:ruqola_flutter/src/pages/about/about_page.dart';
import 'package:ruqola_flutter/src/pages/login/login_page.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/main_window_page.dart' show MainWindow;
import 'package:ruqola_flutter/src/pages/settings/settings_page.dart';

class HomePageDesktop extends StatefulWidget {
  const HomePageDesktop({super.key});

  @override
  State<HomePageDesktop> createState() => _HomePageDesktop();
}

class _HomePageDesktop extends State<HomePageDesktop> {
  /// With provider we do not need to pass around the account.
  ///
  /// TOOD: once the account manager is setup use it instead.
  Rocketchataccount get account => context.read<Rocketchataccount>();

  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    account.isConnected.addListener(_update);
  }

  @override
  void dispose() {
    super.dispose();
    account.isConnected.removeListener(_update);
  }

  void _update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        final connected = account.isConnected.value;
        page = connected ? MainWindow(account) : LoginPage();
      case 1:
        page = SettingsPage();
      case 2:
        page = AboutPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                // TODO add list of account here. Model from account manager ?
                NavigationRailDestination(
                  icon: Icon(Icons.favorite), // Fix icon
                  label: Text('Account'), // I18n
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'), // I18n
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info),
                  label: Text('About'), // I18n
                ),
              ],
              labelType: NavigationRailLabelType.all,
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}
