/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:libruqolacore/libruqolacore.dart';

class MessageViewItem extends StatefulWidget {
  final Message message;

  const MessageViewItem({
    super.key,
    required this.message,
  });

  @override
  MessageViewItemState createState() => MessageViewItemState();
}

class MessageViewItemState extends State<MessageViewItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.message.avatar),
        ),
        title: Text('@${widget.message.username}',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(widget.message.text),
            if (widget.message.reactions.isNotEmpty)
              Wrap(
                spacing: 10,
                children: widget.message.reactions
                    .map((emoji) => Tooltip(
                        message: emoji.convertedUsersNameAtToolTip(),
                        child: GestureDetector(
                          child:
                              Text(EmojiParser().get(emoji.reactionName).code),
                          onTap: () => {
                            // Remove emoji or add it.
                          },
                        )))
                    .toList(),
              ),
          ],
        ));
  }
}
