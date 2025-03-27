/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
import 'package:libruqolacore/libruqolacore.dart';

class CommandModel with ChangeNotifier {
  Commands commands = Commands.defaultValues();

  parseCommands(Map<String, dynamic> json) {
    commands = Commands.fromJson(json);
  }

  @override
  String toString() {
    return 'CommandModel(commands: $commands)';
  }
}
