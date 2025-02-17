/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('Commands', () {
    test('Test Initial values', () {
      final commands = Commands.defaultValues();
      expect(commands.commandsCount, 0);
      expect(commands.listCommands.isEmpty, true);
      expect(commands.offset, 0);
      expect(commands.total, 0);
    });

    test('command2.json', () {
      final data = extractJsonData("commands", "command2.json");
      final f = Commands.fromJson(data);
      expect(f.commandsCount, 25);
      expect(f.offset, 0);
      expect(f.total, 25);
    });

    test('command1.json', () {
      final data = extractJsonData("commands", "command1.json");
      final f = Commands.fromJson(data);
      expect(f.commandsCount, 0);
      expect(f.offset, 0);
      expect(f.total, 0);
    });

    test('command3.json', () {
      final data = extractJsonData("commands", "command3.json");
      final f = Commands.fromJson(data);
      expect(f.commandsCount, 3);
      expect(f.offset, 0);
      expect(f.total, 3);
    });

    test('load permissions', () {
      final data = extractJsonData("commands", "command3.json");
      Commands f = Commands.fromJson(data);
      expect(f.commandsCount, 3);
      expect(f.offset, 0);
      expect(f.total, 3);
      List<Command> lstCommands = [];
      {
        final c = Command.defaultValues();
        c.commandName = "/slackbridge-import";
        lstCommands.add(c);
      }
      {
        final c = Command.defaultValues();
        c.commandName = "/archive";
        c.description = "Archive";
        c.permissions = ["archive-room"];
        c.params = "#channel";
        lstCommands.add(c);
      }

      {
        final c = Command.defaultValues();
        c.commandName = "/leave";
        c.description = "Leave_the_current_channel";
        c.permissions = ["leave-c", "leave-p"];
        lstCommands.add(c);
      }
      final f2 = Commands(
        listCommands: lstCommands,
        commandsCount: f.commandsCount,
        offset: f.offset,
        total: f.total,
      );
      expect(f, f2);
    });
  });
}
