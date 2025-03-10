/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Block Accessory Option infos', () {
    test('Test Initial values', () {
      BlockAccessoryOption opt = BlockAccessoryOption.defaultValues();
      expect(opt.text.isEmpty, true);
      expect(opt.value.isEmpty, true);
    });
  });
}
