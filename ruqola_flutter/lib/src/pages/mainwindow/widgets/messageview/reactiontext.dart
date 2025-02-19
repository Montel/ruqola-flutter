/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:libruqolacore/libruqolacore.dart';

class ReactionText extends StatefulWidget {
  final Reaction reaction;
  const ReactionText({
    super.key,
    required this.reaction,
  });

  @override
  ReactionTextState createState() => ReactionTextState();
}

class ReactionTextState extends State<ReactionText> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: widget.reaction.convertedUsersNameAtToolTip(),
        child: GestureDetector(
            onTap: () => {
                  // Remove emoji or add it.
                },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(EmojiParser().get(widget.reaction.reactionName).code),
                Text(widget.reaction.userNames.length.toString())
              ],
            )));
  }
}
