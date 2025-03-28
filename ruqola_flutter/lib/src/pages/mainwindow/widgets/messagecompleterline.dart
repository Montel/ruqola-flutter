/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:provider/provider.dart';

class MessageCompleterLine extends StatefulWidget {
  final Rocketchataccount account;
  final TextEditingController controller;
  const MessageCompleterLine(this.account, this.controller, {super.key});

  @override
  MessageCompleterLineState createState() => MessageCompleterLineState();
}

class MessageCompleterLineState extends State<MessageCompleterLine> {
  void insertEmoji(String emoji) {
    final text = widget.controller.text;
    final selection = widget.controller.selection;
    final newText = text.replaceRange(
      selection.start,
      selection.end,
      emoji,
    );
    final newSelection = TextSelection.collapsed(offset: selection.start + emoji.length);
    widget.controller.text = newText;
    widget.controller.selection = newSelection;
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

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Autocomplete<String>(
          optionsViewOpenDirection: OptionsViewOpenDirection.up,
          onSelected: (String selection) {
            widget.controller.text = selection;
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            if (!textEditingValue.text.startsWith('/')) {
              return const Iterable<String>.empty();
            }
            return suggestions.where((String option) {
              return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
            });
          },
          fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
              FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
            textEditingController = widget.controller;

            return ListenableBuilder(
                listenable: commandModel,
                builder: (BuildContext context, Widget? child) {
                  return TextField(
                    controller: textEditingController,
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
                    onSubmitted: (String value) {
                      // TODO fix me
                      // Custom behavior when the return key is pressed
                      print('Return key pressed. Text: $value');
                      // You can add more custom behavior here
                      textEditingController.clear(); // Clear the text field after submission
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
                        onPressed: textEditingController.clear,
                        icon: const Icon(Icons.clear),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  );
                });
          },
        ));
  }
}
