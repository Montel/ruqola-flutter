/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/messageview/reactiontext.dart';

enum MenuMessageType {
  dumpMessageInfo,
  markAsFavorite,
  followMessage,
}

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
        trailing: PopupMenuButton<int>(onSelected: (value) {
          // Handle the selection from the PopupMenuButton
          if (value == MenuMessageType.dumpMessageInfo.index) {
            print("${widget.message}");
          } else if (value == MenuMessageType.markAsFavorite.index) {
            // TODO
          }
        }, itemBuilder: (BuildContext context) {
          // Define the menu items for the PopupMenuButton
          return <PopupMenuEntry<int>>[
            PopupMenuItem<int>(
              value: MenuMessageType.markAsFavorite.index,
              child: Text("Mark as Favorite"), //I18n
            ),
            PopupMenuItem<int>(
              value: MenuMessageType.followMessage.index,
              child: Text("Follow message"), //I18n
            ),
            PopupMenuDivider(),
            PopupMenuItem<int>(
              value: MenuMessageType.dumpMessageInfo.index,
              child: Text("Dump message"),
            ),
          ];
        }),
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
