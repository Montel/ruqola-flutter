/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:libruqolacore/libruqolacore.dart';

class MessageViewItem extends StatefulWidget {
  final String username;
  final String avatarUrl;
  final String htmlContent;
  final List<Reaction> reactions;

  const MessageViewItem({
    super.key,
    required this.username,
    required this.htmlContent,
    required this.reactions,
    required this.avatarUrl,
  });

  @override
  MessageViewItemState createState() => MessageViewItemState();
}

class MessageViewItemState extends State<MessageViewItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.avatarUrl),
        ),
        title: Text('@${widget.username}',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(widget.htmlContent),
            if (widget.reactions.isNotEmpty)
              Wrap(
                children: widget.reactions
                    .map((emoji) => GestureDetector(
                          child: Text(emoji.reactionName),
                          onTap: () => {
                            // Remove emoji or add it.
                          },
                        ))
                    .toList(),
              ),
          ],
        ));
  }
}
