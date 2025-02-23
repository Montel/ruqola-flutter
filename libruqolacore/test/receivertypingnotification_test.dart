/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Typing Notification', () {
    Receivertypingnotification d = Receivertypingnotification();
    test('Test Initial values', () {
      expect(d.mMapTypingNotifications.isEmpty, true);
      expect(d.typingNotification("Foo").isEmpty, true);
    });
    test('Test text generated', () {
      expect(d.typingNotification("Foo").isEmpty, true);

      d.insertTypingNotification("room1", "user1", true);
      expect(d.typingNotification("room1"), "<strong>user1</strong> is typing...");
      d.insertTypingNotification("room1", "user1", true);
      expect(d.typingNotification("room1"), "<strong>user1</strong> is typing...");

      // Add different user.
      d.insertTypingNotification("room2", "user2", true);
      expect(d.typingNotification("room2"), "<strong>user2</strong> is typing...");

      d.insertTypingNotification("room2", "user3", true);
      expect(d.typingNotification("room2"), "<strong>user2 and user3</strong> are typing...");

      d.insertTypingNotification("room2", "user1", true);
      expect(
          d.typingNotification("room2"), "<strong>user2, user3 and user1</strong> are typing...");

      // Remove typing
      d.insertTypingNotification("room2", "user3", false);
      expect(d.typingNotification("room2"), "<strong>user2 and user1</strong> are typing...");

      d.insertTypingNotification("room2", "user1", false);
      expect(d.typingNotification("room2"), "<strong>user2</strong> is typing...");

      d.insertTypingNotification("room2", "user3", false);
      expect(d.typingNotification("room2"), "<strong>user2</strong> is typing...");

      d.insertTypingNotification("room2", "user2", false);
      expect(d.typingNotification("room2").isEmpty, true);

      // No user/roomId
      d.insertTypingNotification("room2", "user2", false);
      expect(d.typingNotification("room2").isEmpty, true);

      expect(d.typingNotification("room5").isEmpty, true);
    });
  });
}
