/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Channel infos', () {
    test('Test Initial values', () {
      final Channel b = Channel.defaultValues();
      expect(b.fname, '');
      expect(b.identifier, '');
      expect(b.name, '');
    });
  });
}
