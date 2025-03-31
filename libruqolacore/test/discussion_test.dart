/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Discussion Info', () {
    test('Test Initial values', () {
      final discussion = Discussion.defaultValues();
      expect(discussion.description.isEmpty, true);
      expect(discussion.parentRoomId.isEmpty, true);
      expect(discussion.discussionRoomId.isEmpty, true);
      expect(discussion.fname.isEmpty, true);
      expect(discussion.userName.isEmpty, true);
    });
  });
}
