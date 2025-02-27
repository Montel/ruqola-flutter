/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('BlockAction infos', () {
    test('Test Initial values', () {
      final BlockAction b = BlockAction.defaultValues();
      expect(b.actionId, '');
      expect(b.text, '');
      expect(b.type, '');
      expect(b.blockId, '');
      expect(b.value, '');
      expect(b.url, '');
    });
  });
}
