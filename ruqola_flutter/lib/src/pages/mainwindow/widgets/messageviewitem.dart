/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MessageViewItem extends StatefulWidget {
  final String username;
  final String htmlContent;
  final List<String> reactions;

  const MessageViewItem({
    super.key,
    required this.username,
    required this.htmlContent,
    required this.reactions,
  });

  @override
  MessageViewItemState createState() => MessageViewItemState();
}

// TODO add reactions
class MessageViewItemState extends State<MessageViewItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text('@{widget.username}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(widget.htmlContent),
            if (widget.reactions.isNotEmpty)
              Wrap(
                children: widget.reactions.map((emoji) => Text(emoji)).toList(),
              ),
          ],
        ));
  }
}
