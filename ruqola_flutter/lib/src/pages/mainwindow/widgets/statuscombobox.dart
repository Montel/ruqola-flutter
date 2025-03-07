/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

// TODO

import 'dart:collection';

import 'package:flutter/material.dart';

const List<String> list = <String>['Online', 'Busy', 'Away', 'Offline'];

class StatusCombobox extends StatefulWidget {
  const StatusCombobox({super.key});
  @override
  StatusComboboxState createState() => StatusComboboxState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class StatusComboboxState extends State<StatusCombobox> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: menuEntries,
    );
  }
}
