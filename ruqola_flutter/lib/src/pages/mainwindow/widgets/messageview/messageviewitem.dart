/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/messageview/reactiontext.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

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
            print("Mark as favorite");
          } else if (value == MenuMessageType.followMessage.index) {
            print("Mark as follow message");
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
            MarkdownBody(
              onTapLink: (text, href, title) {
                if (href != null) {
                  _launchURL(href);
                }
              },
              data: widget.message.text,
              styleSheet: MarkdownStyleSheet(
                codeblockDecoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            if (widget.message.reactions.isNotEmpty)
              Wrap(
                spacing: 10,
                children: widget.message.reactions
                    .map((emoji) =>
                        ReactionText(reaction: emoji, messageId: widget.message.messageId))
                    .toList(),
              ),
          ],
        ));
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
