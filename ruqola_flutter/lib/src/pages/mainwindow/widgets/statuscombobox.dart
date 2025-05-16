/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'dart:collection';
import 'package:libruqolacore/libruqolacore.dart';
import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

Future<void> _changeStatus(Rocketchataccount account, Status status,
    [String statusMessage = '']) async {
  final Map<Status, StatusType> convertStatusEnum = {
    Status.online: StatusType.online,
    Status.away: StatusType.away,
    Status.busy: StatusType.busy,
    Status.offline: StatusType.offline,
  };

  final SetStatusInfo info = SetStatusInfo(
      userId: account.settings.userId,
      statusType: convertStatusEnum[status] ?? StatusType.online,
      statusMessage: statusMessage);
  final SetStatus changeStatus = SetStatus(info);
  changeStatus.serverUrl = account.settings.serverUrl;
  changeStatus.userId = account.settings.userId;
  changeStatus.authToken = account.settings.authToken;
  var resultChangeStatus = await changeStatus.start();
  if (!(resultChangeStatus.success ?? false)) {
    print("Error during change status $resultChangeStatus");
  }
}

class StatusCombobox extends StatefulWidget {
  final Rocketchataccount account;
  const StatusCombobox(this.account, {super.key});
  @override
  StatusComboboxState createState() => StatusComboboxState();
}

typedef MenuEntry = DropdownMenuEntry<Status>;

class StatusComboboxState extends State<StatusCombobox> {
  // Define map icon. We can't add directly in StatusModel as it's core not UI
  final Map<Status, IconData> statusIcons = {
    Status.online: Icons.check_circle,
    Status.away: Icons.do_not_disturb,
    Status.busy: Icons.access_time,
    Status.offline: Icons.cancel,
  };
  @override
  Widget build(BuildContext context) {
    final statusModel = Provider.of<StatusModel>(context);
    Status dropdownValue = statusModel.currentStatus;
    List<DisplayStatusInfo> sortedList = statusModel.sortedList();
    final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
      sortedList.map<MenuEntry>((DisplayStatusInfo info) => MenuEntry(
          value: info.status,
          label: info.displayText,
          leadingIcon: Icon(statusIcons[info.status] ?? Icons.help_outline))),
    );

    // TODO fix combobox not editable!
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListenableBuilder(
              listenable: statusModel,
              builder: (BuildContext context, Widget? child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownMenu<Status>(
                    enableFilter: false,
                    initialSelection: dropdownValue,
                    onSelected: (Status? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                        _changeStatus(widget.account, dropdownValue);
                      });
                    },
                    dropdownMenuEntries: menuEntries,
                    // Ensure the dropdown menu takes up the full width of the row
                    inputDecorationTheme: InputDecorationTheme(
                      constraints: BoxConstraints.expand(width: double.infinity),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
