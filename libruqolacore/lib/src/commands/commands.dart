/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/commands/command.dart';
import 'package:collection/collection.dart';

class Commands {
  final List<Command> listCommands;
  final int commandsCount;
  final int offset;
  final int total;

  Commands({
    required this.listCommands,
    required this.commandsCount,
    required this.offset,
    required this.total,
  });

  List<String> listOfCommands() {
    List<String> lst = [];
    for (var a in listCommands) {
      lst.add(a.commandName);
    }
    return lst;
  }

  factory Commands.fromJson(Map<String, dynamic> json) {
    final deviceInfosCount = json["count"] ?? 0;
    final offset = json["offset"] ?? 0;
    final total = json["total"] ?? 0;
    List<Command> listCommands = [];
    final commands = json["commands"];
    if (commands != null) {
      for (var item in commands) {
        var deviceInfo = Command.fromJson(item);
        listCommands.add(deviceInfo);
      }
    }
    return Commands(
      listCommands: listCommands,
      commandsCount: deviceInfosCount,
      offset: offset,
      total: total,
    );
  }

  Commands.defaultValues()
      : listCommands = [],
        commandsCount = 0,
        offset = 0,
        total = 0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();
    return other is Commands &&
        listEquality.equals(other.listCommands, listCommands) &&
        other.commandsCount == commandsCount &&
        other.offset == offset &&
        other.total == total;
  }

  @override
  int get hashCode {
    return listCommands.hashCode ^ commandsCount.hashCode ^ offset.hashCode ^ total.hashCode;
  }

  @override
  String toString() {
    return 'Commands(listCommands: $listCommands, deviceInfosCount: $commandsCount, offset: $offset, total: $total)';
  }
}
