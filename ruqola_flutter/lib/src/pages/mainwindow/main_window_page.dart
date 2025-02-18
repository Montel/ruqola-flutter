/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/channelview.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/messageline.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/messageview/messageview.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/statusbarmessage.dart';

class MainWindow extends StatelessWidget {
  final Rocketchataccount account;
  const MainWindow(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ChannelView(account),
          ),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Expanded(child: MessageView(account)),
                Messageline(account),
                Expanded(child: StatusBarMessage(account))
              ]))
        ],
      ),
    ));
  }
}
