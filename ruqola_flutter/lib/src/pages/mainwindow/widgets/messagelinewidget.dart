/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/messagecompleterline.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/services.dart'; // Pour ContextMenuController

class MessagelineWidget extends StatefulWidget {
  final Rocketchataccount account;
  const MessagelineWidget(this.account, {super.key});

  @override
  MessagelineWidgetState createState() => MessagelineWidgetState();
}

class MessagelineWidgetState extends State<MessagelineWidget> {
  final _controller = TextEditingController();

  void insertEmoji(String emoji) {
    final text = _controller.text;
    final selection = _controller.selection;
    final newText = text.replaceRange(
      selection.start,
      selection.end,
      emoji,
    );
    final newSelection = TextSelection.collapsed(offset: selection.start + emoji.length);
    _controller.text = newText;
    _controller.selection = newSelection;
  }

  void showEmojiPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EmojiPicker();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: SharedValue.currentRoomId,
      builder: (context, value, child) {
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: MessageCompleterLine(widget.account, _controller)),
                FilledButton(
                  child: Text(
                    "Send", // I18n + icon ?
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    if (SharedValue.currentRoomId.value.isNotEmpty) {
                      if (_controller.text.isNotEmpty && value.isNotEmpty) {
                        widget.account.sendMessage(value, _controller.text);
                        _controller.text = "";
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
