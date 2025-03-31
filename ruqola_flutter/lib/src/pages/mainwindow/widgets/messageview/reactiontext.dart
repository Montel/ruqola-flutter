/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:librocketchatrestapi/librocketchatrestapi.dart';

class ReactionText extends StatefulWidget {
  final Reaction reaction;
  final String messageId;
  const ReactionText({
    super.key,
    required this.reaction,
    required this.messageId,
  });

  @override
  ReactionTextState createState() => ReactionTextState();
}

class ReactionTextState extends State<ReactionText> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 220, 244, 3), // Fix color
          border: Border.all(
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Tooltip(
            message: widget.reaction.convertedUsersNameAsToolTip(),
            child: GestureDetector(
                onTap: () => {
                      // Remove emoji or add it.
                      print("click on it")
                    },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(EmojiParser().get(widget.reaction.reactionName).code),
                    Text(widget.reaction.userNames.length.toString())
                  ],
                ))));
  }
}
