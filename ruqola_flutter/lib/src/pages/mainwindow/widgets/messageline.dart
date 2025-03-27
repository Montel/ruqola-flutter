/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// Look at https://github.com/Fintasys/emoji_picker_flutter/blob/master/example/lib/main_whatsapp.dart

class Messageline extends StatefulWidget {
  final Rocketchataccount account;
  const Messageline(this.account, {super.key});
  @override
  MessagelineState createState() => MessagelineState();
}

class MessagelineState extends State<Messageline> {
  final _controller = TextEditingController();

  final List<String> _suggestions = [
    'Flutter',
    'Dart',
    'Widget',
    'Stateful',
    'Stateless',
    'Builder',
    'Context',
  ];
  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _filteredSuggestions = _suggestions
          .where((suggestion) => suggestion.toLowerCase().contains(_controller.text.toLowerCase()))
          .toList();
    });
  }

  // _controller.addListener(_onTextChanged);

  @override
  Widget build(BuildContext context) {
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
          return EmojiPicker(
              //onEmojiSelected: {
              /*
              (Category category, Emoji emoji) {
              insertEmoji(emoji.emoji);
            }
            */
              //},
              );
        },
      );
    }

    return ValueListenableBuilder<String>(
        valueListenable: SharedValue.currentRoomId,
        builder: (context, value, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                          enabled: SharedValue.currentRoomId.value.isNotEmpty,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 3,
                          autocorrect: true,
                          controller: _controller,
                          decoration: InputDecoration(
                              prefixIcon: IconButton(
                                  onPressed: showEmojiPicker, icon: Icon(Icons.emoji_emotions)),
                              suffixIcon: IconButton(
                                onPressed: _controller.clear,
                                icon: const Icon(Icons.clear),
                              ),
                              border: const OutlineInputBorder())))),
              FilledButton(
                  child: Text("Send",
                      style: TextStyle(color: Colors.white, fontSize: 18)), // TODO I18n !
                  onPressed: () {
                    if (SharedValue.currentRoomId.value.isNotEmpty) {
                      if (_controller.text.isNotEmpty && value.isNotEmpty) {
                        widget.account.sendMessage(value, _controller.text);
                        _controller.text = "";
                      }
                    }
                  }),
            ],
          );
        });
  }
}
