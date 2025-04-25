/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:provider/provider.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/channelview/searchchannelline.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/channelview/channelviewheadertile.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/channelview/channelviewitem.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/sharedvalue.dart';
import 'package:ruqola_flutter/src/pages/mainwindow/widgets/statuscombobox.dart';

class ChannelView extends StatefulWidget {
  final Rocketchataccount account;
  const ChannelView(this.account, {super.key});
  @override
  ChannelViewSelectionState createState() => ChannelViewSelectionState();
}

class ChannelViewSelectionState extends State<ChannelView> {
  @override
  Widget build(BuildContext context) {
    final models = Provider.of<Rocketchataccountmodels>(context);
    return ValueListenableBuilder<String>(
        valueListenable: SharedValue.filterChannel,
        builder: (context, value, child) {
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.all(8.0), child: SearchChannelLine()),
                  Expanded(
                    child: ListenableBuilder(
                        listenable: models,
                        builder: (BuildContext context, Widget? child) {
                          // We rebuild the ListView each time the list changes,
                          // so that the framework knows to update the rendering.
                          final Map<String, List<Room>> sortedRoomsWithType =
                              models.sortedRoomsWithType(filter: SharedValue.filterChannel.value);

                          // Construire la liste avec des titres de catégorie
                          List<Widget> listWidgets = [];
                          sortedRoomsWithType.forEach((category, categoryItems) {
                            listWidgets.add(ChannelViewHeaderTile(category: category));
                            listWidgets.addAll(
                                categoryItems.map((item) => ChannelViewItem(item, widget.account)));
                          });

                          return ListView(
                            children: listWidgets,
                          );
                        }),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0), child: StatusCombobox(widget.account)),
                ],
              ),
            ),
          );
        });
  }
}
//Use showDialog for info.
// https://api.flutter.dev/flutter/material/showDialog.html
