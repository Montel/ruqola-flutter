/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Block infos', () {
    test('Test Initial values', () {
      Block b = Block.defaultValues();

      expect(b.blockId.isEmpty, true);
      expect(b.callId.isEmpty, true);
      expect(b.appId.isEmpty, true);
      expect(b.sectionText.isEmpty, true);
      expect(b.blockType, BlockType.unknown);
      expect(b.blockAccessory == null, true);
      expect(b.blockActions == null, true);
    });
  });
}
