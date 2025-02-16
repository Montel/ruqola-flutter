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
  });
}
