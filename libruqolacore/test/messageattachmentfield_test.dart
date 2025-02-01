/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('MessageAttachmentField', () {
    final messageAttachmentField = libruqolacore.MessageAttachmentField();

    test('Test Initial MessageAttachmentField values', () {
      expect(messageAttachmentField.value, null);
      expect(messageAttachmentField.title, null);
    });
  });
}
