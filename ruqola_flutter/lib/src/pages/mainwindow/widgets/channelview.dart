/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:provider/provider.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';

enum MenuChannelType {
  closeChannel,
  markAsRead,
  changeFavorite,
}

class ChannelView extends StatefulWidget {
  final Rocketchataccount account;
  const ChannelView(this.account, {super.key});
  @override
  ChannelViewSelectionState createState() => ChannelViewSelectionState();
}

class ChannelViewSelectionState extends State<ChannelView> {
  String? roomIdSelected;
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final models = Provider.of<Rocketchataccountmodels>(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search', // I18n!
                  suffixIcon: IconButton(
                    onPressed: _controller.clear,
                    icon: const Icon(Icons.clear),
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                // onChanged: {
                // TODO implement it
                //}
              ),
            ),
            Expanded(
              child: ListenableBuilder(
                  listenable: models,
                  builder: (BuildContext context, Widget? child) {
                    // We rebuild the ListView each time the list changes,
                    // so that the framework knows to update the rendering.
                    final Map<String, List<Room>> sortedRoomsWithType =
                        models.sortedRoomsWithType();

                    // Construire la liste avec des titres de catégorie
                    List<Widget> listWidgets = [];
                    sortedRoomsWithType.forEach((category, categoryItems) {
                      listWidgets.add(ListTile(
                        title: Text(category,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        tileColor: Colors.grey[200],
                      ));
                      listWidgets.addAll(categoryItems.map((item) => ListTile(
                          title: Text(item.displayName()),
                          selected: roomIdSelected == item.roomId,
                          selectedTileColor:
                              const Color.fromRGBO(187, 222, 251, 1),
                          trailing: PopupMenuButton<int>(
                            onSelected: (value) {
                              // Handle the selection from the PopupMenuButton
                              if (value == MenuChannelType.markAsRead.index) {
                                // TODO
                              } else if (value ==
                                  MenuChannelType.closeChannel.index) {
                                _dialogQuitChannelBuilder(item.roomId, context);
                              } else if (value ==
                                  MenuChannelType.changeFavorite.index) {
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
                            setState(() {
                              roomIdSelected = item.roomId;
                            });
                            SharedValue.currentRoomId.value = roomIdSelected!;
                            widget.account.loadHistory(roomIdSelected!);
                          })));
                    });

                    return ListView(
                      children: listWidgets,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
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

//Use showDialog for info.
// https://api.flutter.dev/flutter/material/showDialog.html
