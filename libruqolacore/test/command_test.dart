/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Command', () {
    test('Test Initial values', () {
      final command = Command();
      expect(command.permissions.isEmpty, true);
      expect(command.params.isEmpty, true);
      expect(command.commandName.isEmpty, true);
      expect(command.description.isEmpty, true);
      expect(command.providesPreview, false);
      expect(command.clientOnly, false);
    });
  });
}
