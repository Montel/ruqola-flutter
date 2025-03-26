/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import "package:url_launcher/url_launcher.dart";

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String appName = "Ruqola Flutter";
  String version = "0.0.1";
  String developer = "Laurent Montel";
  String description =
      "Ruqola Flutter is a [Rocket.Chat](https://www.rocket.chat/) client in flutter."; // I18n

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  Future<void> _loadAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appName = packageInfo.appName; //
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")), // I18n
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/icons/png/ruqola_icon.png'), 
            ),
            SizedBox(height: 16),
            Text(appName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Version: $version", style: TextStyle(fontSize: 16, color: Colors.grey)), // Ii18n
            SizedBox(height: 16),
            Text(description, textAlign: TextAlign.center),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Developer"), // Ii18n
              subtitle: Text(developer),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Contact"), // Ii18n
              subtitle: Text("laurent.montel@kdab.com"),
              onTap: () => launchUrl(Uri.parse("mailto:laurent.montel@kdab.com")),
            ),
            Spacer(),
            Text("© 2024-2025 Ruqola Flutter",
                style: TextStyle(fontSize: 12, color: Colors.grey)), // Ii18n
          ],
        ),
      ),
    );
  }
}
