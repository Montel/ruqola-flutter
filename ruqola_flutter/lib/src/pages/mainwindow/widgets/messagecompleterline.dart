import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:provider/provider.dart';

class MessageCompleterLine extends StatefulWidget {
  final Rocketchataccount account;
  final TextEditingController _controller;
  const MessageCompleterLine(this.account, this._controller, {super.key});

  @override
  MessageCompleterLineState createState() => MessageCompleterLineState();
}

class MessageCompleterLineState extends State<MessageCompleterLine> {
  void insertEmoji(String emoji) {
    final text = widget._controller.text;
    final selection = widget._controller.selection;
    final newText = text.replaceRange(
      selection.start,
      selection.end,
      emoji,
    );
    final newSelection = TextSelection.collapsed(offset: selection.start + emoji.length);
    widget._controller.text = newText;
    widget._controller.selection = newSelection;
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
            widget._controller.text = selection;
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
