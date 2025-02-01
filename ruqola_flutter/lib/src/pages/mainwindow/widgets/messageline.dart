/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';
// Look at https://github.com/Fintasys/emoji_picker_flutter/blob/master/example/lib/main_whatsapp.dart
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class Messageline extends StatelessWidget {
  final Rocketchataccount account;
  Messageline(this.account, {super.key});

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: SharedValue.currentRoomId,
        builder: (context, value, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: TextField(
                      contextMenuBuilder: (context, editableTextState) {
                        final List<ContextMenuButtonItem> buttonItems =
                            editableTextState.contextMenuButtonItems;

                        buttonItems.insert(
                          0,
                          ContextMenuButtonItem(
                            label: 'Add Quote', // I18n ?
                            onPressed: () {
                              // Necessary to remove menu
                              ContextMenuController.removeAny();
                            },
                          ),
                        );
                        // buttonItems.add(PopupMenuDivider());

                        return AdaptiveTextSelectionToolbar.buttonItems(
                          anchors: editableTextState.contextMenuAnchors,
                          buttonItems: buttonItems,
                        );
                      },
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                      autocorrect: true,
                      controller: _controller,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: _controller.clear,
                            icon: const Icon(Icons.clear),
                          ),
                          border: const OutlineInputBorder()))),
              FilledButton(
                  child: Text("Send",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18)), // TODO I18n !
                  onPressed: () {
                    if (_controller.text.isNotEmpty && value.isNotEmpty) {
                      account.sendMessage(value, _controller.text);
                      _controller.text = "";
                    }
                  })
            ],
          );
        });
  }
}
