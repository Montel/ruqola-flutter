/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/messageview/reactiontext.dart';

class MessageViewItem extends StatefulWidget {
  final Message message;
  final Rocketchataccount account;

  const MessageViewItem({
    super.key,
    required this.message,
    required this.account,
  });

  @override
  MessageViewItemState createState() => MessageViewItemState();
}

class MessageViewItemState extends State<MessageViewItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage:
              NetworkImage(widget.message.avatarUrl(widget.account.settings.serverUrl)),
        ),
        title: Text('@${widget.message.username}', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(widget.message.text),
            if (widget.message.reactions.isNotEmpty)
              Wrap(
                spacing: 10,
                children:
                    widget.message.reactions.map((emoji) => ReactionText(reaction: emoji)).toList(),
              ),
          ],
        ));
  }
}
