/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('MessagePinned', () {
    test('Test Initial MessagePinned values', () {
      MessagePinned pinned = MessagePinned.defaultValues();
      expect(pinned.pinned, false);
      expect(pinned.pinnedBy.isEmpty, true);
    });
  });
}
