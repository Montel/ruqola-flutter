/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('Room', () {
    final room = libruqolacore.Room();

    test('Test Initial Rooms values', () {
      expect(room.roomId.isEmpty, true);
      expect(room.name.isEmpty, true);
      expect(room.mFName, null);
      expect(room.topic.isEmpty, true);
      expect(room.description, null);
      expect(room.announcement, null);
      expect(room.numberMessages, 0);
      expect(room.mChannelType, libruqolacore.RoomType.unknown);
      expect(room.mRoles, null);
      expect(room.mUids, null);
      expect(room.mUserNames, null);
      expect(room.mThreadUnread, null);
      expect(room.favorite, false);
      expect(room.mEncrypted, false);
      expect(room.mBlocked, false);
      expect(room.mBlocker, false);
    });
  });
}
