/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';

enum MenuChannelType {
  closeChannel,
  markAsRead,
  changeFavorite,
}

class ChannelViewItem extends StatefulWidget {
  final Rocketchataccount account;
  final Room room;
  const ChannelViewItem(this.room, this.account, {super.key});
  @override
  ChannelViewItemState createState() => ChannelViewItemState();
}

class ChannelViewItemState extends State<ChannelViewItem> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: SharedValue.currentRoomId,
        builder: (context, value, child) {
          return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(""), // TODO implement it.
              ),
              title: Text(widget.room.displayName()),
              selected: SharedValue.currentRoomId.value == widget.room.roomId,
              selectedTileColor: const Color.fromRGBO(187, 222, 251, 1),
              trailing: PopupMenuButton<int>(
                onSelected: (value) {
                  // Handle the selection from the PopupMenuButton
                  if (value == MenuChannelType.markAsRead.index) {
                    // TODO
                  } else if (value == MenuChannelType.closeChannel.index) {
                    _dialogQuitChannelBuilder(widget.room.roomId, context);
                  } else if (value == MenuChannelType.changeFavorite.index) {
                    // TODO
                  }
                },
                itemBuilder: (BuildContext context) {
                  // Define the menu items for the PopupMenuButton
                  return <PopupMenuEntry<int>>[
                    PopupMenuItem<int>(
                      value: MenuChannelType.markAsRead.index,
                      child: Text("Mark As Read"),
                    ),
                    PopupMenuItem<int>(
                      value: MenuChannelType.changeFavorite.index,
                      child: Text(
                          "Add as Favorite"), // TOOD change it if it's always favorite
                    ),
                    PopupMenuItem<int>(
                      value: MenuChannelType.closeChannel.index,
                      child: Text("Quit Channel"),
                    ),
                  ];
                },
              ),
              onTap: () {
                /*setState(() {
                  roomIdSelected = widget.room.roomId;
                });*/
                SharedValue.currentRoomId.value = widget.room.roomId;
                widget.account.loadHistory(widget.room.roomId);
              });
        });
  }

  Future<void> _dialogQuitChannelBuilder(String roomId, BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quit Channel'), // I18n
          content: const Text(
            'Do you want to quit this channel ?', // I18n
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'), //I18n
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'), //I18n
              onPressed: () {
                Navigator.of(context).pop();
                // Allow to close roomId
              },
            ),
          ],
        );
      },
    );
  }
}
