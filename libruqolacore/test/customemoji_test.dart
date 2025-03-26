/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('CustomEmoji infos', () {
    test('Test Initial values', () {
      final CustomEmoji emoji = CustomEmoji.defaultValues();
      expect(emoji.aliases.isEmpty, true);
      expect(emoji.emojiIdentifier.isEmpty, true);
      expect(emoji.identifier.isEmpty, true);
      expect(emoji.extension.isEmpty, true);
      expect(emoji.name.isEmpty, true);
      expect(emoji.cachedHtml.isEmpty, true);
      expect(emoji.updatedAt, 0);
    });
  });
}
