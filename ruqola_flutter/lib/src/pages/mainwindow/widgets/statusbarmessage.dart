/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';

class StatusBarMessage extends StatefulWidget {
  final Rocketchataccount account;
  const StatusBarMessage(this.account, {super.key});

  @override
  StatusBarMessageState createState() => StatusBarMessageState();
}

class StatusBarMessageState extends State<StatusBarMessage> {
  @override
  Widget build(BuildContext context) {
    final receiverTypingNotification = Provider.of<Receivertypingnotification>(context);
    return ValueListenableBuilder<String>(
      valueListenable: SharedValue.currentRoomId,
      builder: (context, value, child) {
        return ListenableBuilder(
          listenable: receiverTypingNotification,
          builder: (BuildContext context, Widget? child) {
            return Html(
              data: receiverTypingNotification.typingNotification(SharedValue.currentRoomId.value),
            );
          },
        );
      },
    );
  }
}
