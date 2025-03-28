/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/services.dart'; // Pour ContextMenuController
import 'package:provider/provider.dart';

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
    final commandModel = Provider.of<CommandModel>(context);
    final List<String> suggestions = commandModel.listOfCommands();

    return ValueListenableBuilder<String>(
      valueListenable: SharedValue.currentRoomId,
      builder: (context, value, child) {
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Autocomplete<String>(
                        optionsViewOpenDirection: OptionsViewOpenDirection.up,
                        onSelected: (String selection) {
                          _controller.text = selection;
                        },
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          }
                          if (!textEditingValue.text.startsWith('/')) {
                            return const Iterable<String>.empty();
                          }
                          return suggestions.where((String option) {
                            return option
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        fieldViewBuilder: (BuildContext context, TextEditingController notUsed,
                            FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                          return TextField(
                            controller: _controller,
                            focusNode: fieldFocusNode,
                            contextMenuBuilder: (context, editableTextState) {
                              final List<ContextMenuButtonItem> buttonItems =
                                  editableTextState.contextMenuButtonItems;
                              buttonItems.insert(
                                0,
                                ContextMenuButtonItem(
                                  label: 'Add Quote',
                                  onPressed: () {
                                    ContextMenuController.removeAny();
                                  },
                                ),
                              );
                              return AdaptiveTextSelectionToolbar.buttonItems(
                                anchors: editableTextState.contextMenuAnchors,
                                buttonItems: buttonItems,
                              );
                            },
                            enabled: SharedValue.currentRoomId.value.isNotEmpty,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 3,
                            autocorrect: true,
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                onPressed: showEmojiPicker,
                                icon: Icon(Icons.emoji_emotions),
                              ),
                              suffixIcon: IconButton(
                                onPressed: _controller.clear,
                                icon: const Icon(Icons.clear),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          );
                        },
                      )),
                ),
                FilledButton(
                  child: Text(
                    "Send",
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
