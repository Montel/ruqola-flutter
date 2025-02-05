/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('Message', () {
    final message = libruqolacore.Message();

    test('Test Initial Message values', () {
      expect(message.mMessageId.isEmpty, true);
      expect(message.mText.isEmpty, true);
      expect(message.mAlias.isEmpty, true);
      expect(message.mRoomId.isEmpty, true);
      expect(message.mAvatar.isEmpty, true);
      expect(message.mEditedByUsername.isEmpty, true);
      expect(message.mMessageType, libruqolacore.MessageType.normaltext);
    });
  });

  // TODO add test loading elements
}
