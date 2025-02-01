/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/about/about_page.dart';
import 'package:ruqola_flutter/src/pages/login/login_page.dart';
import 'package:ruqola_flutter/src/pages/settings/settings_page.dart';

class HomePageDesktop extends StatefulWidget {
  final Rocketchataccount account;
  const HomePageDesktop(this.account, {super.key});
  @override
  State<HomePageDesktop> createState() => _HomePageDesktop();
}

class _HomePageDesktop extends State<HomePageDesktop> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = LoginPage(widget.account);
      case 1:
        page = SettingsPage();
      case 2:
        page = AboutPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
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
    });
  }
}
