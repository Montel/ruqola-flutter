/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Message', () {
    /*
    final message = libruqolacore.Message();

    test('Test Initial Message values', () {
      expect(message.messageId.isEmpty, true);
      expect(message.text.isEmpty, true);
      expect(message.alias.isEmpty, true);
      expect(message.roomId.isEmpty, true);
      expect(message.avatar.isEmpty, true);
      expect(message.editedByUsername.isEmpty, true);
      expect(message.messageType, libruqolacore.MessageType.normaltext);
    });
    */
    test('Test SystemMessageType value', () {
      for (SystemMessageType systemMessageType in SystemMessageType.values) {
        final String str = systemMessageType.name;
        expect(SystemMessageTypeExt.fromName(str), systemMessageType);
      }
    });
  });

  // TODO add test loading elements
}
