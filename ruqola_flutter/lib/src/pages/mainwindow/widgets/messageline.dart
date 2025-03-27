import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/services.dart'; // Pour ContextMenuController

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
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Autocomplete<String>(
                        optionsViewOpenDirection: OptionsViewOpenDirection.up,
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          }
                          return _suggestions.where((String option) {
                            return option.contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        onSelected: (String selection) {
                          debugPrint('You just selected $selection');
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController fieldTextEditingController,
                            FocusNode fieldFocusNode,
                            VoidCallback onFieldSubmitted) {
                          return TextField(
                            controller: fieldTextEditingController,
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
                                onPressed: fieldTextEditingController.clear,
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
