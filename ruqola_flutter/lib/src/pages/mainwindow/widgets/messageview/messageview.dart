/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:provider/provider.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/messageview/messageviewitem.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';

class MessageView extends StatefulWidget {
  final Rocketchataccount account;
  const MessageView(this.account, {super.key});
  @override
  MessageViewSelectionState createState() => MessageViewSelectionState();
}

class MessageViewSelectionState extends State<MessageView> {
  // Currently selected item index
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: SharedValue.currentRoomId,
        builder: (context, value, child) {
          final models = Provider.of<Rocketchataccountmodels>(context);
          // Reference to the room you want to display messages for.
          final room = models.findRoomFromIdentifier(SharedValue.currentRoomId.value);
          if (room == null) return Text("No room seelected");

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListenableBuilder(
                      listenable: room,
                      builder: (BuildContext context, Widget? child) {
                        // We rebuild the ListView each time the list changes,
                        // so that the framework knows to update the rendering.
                        final messages = room.messages;
                        return ListView.builder(
                            itemCount: messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                child: MessageViewItem(
                                    message: messages[index], account: widget.account),
                              );
                            });
                      }),
                )),
              ],
            ),
          );
        });
  }
}
