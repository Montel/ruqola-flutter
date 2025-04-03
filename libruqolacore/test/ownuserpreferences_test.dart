/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/ownuser/ownuserpreferences.dart';
import 'package:test/test.dart';

import 'libruqolacoretest.dart';

void main() {
  group('ownuserpreferences', () {
    test('Test Initial OwnUserPreferences', () {
      OwnUserPreferences owner = OwnUserPreferences();
      expect(owner.highlightWords, null);
      expect(owner.emailNotificationMode, null);
      expect(owner.desktopNotifications, null);
      expect(owner.pushNotifications, null);
      expect(owner.newRoomNotification, null);
      expect(owner.newMessageNotification, null);

      expect(owner.roomListSortOrder, RoomListSortOrder.unknown);
      expect(owner.roomListDisplay, RoomListDisplay.unknown);

      expect(owner.idleTimeLimit, -1);
      expect(owner.notificationsSoundVolume, -1);

      expect(owner.convertAsciiEmoji, true);
      expect(owner.useEmojis, true);
      expect(owner.hideRoles, false);
      expect(owner.displayAvatars, true);
      expect(owner.enableAutoAway, false);
      expect(owner.showUnread, false);
      expect(owner.showRoomAvatar, false);
      expect(owner.showFavorite, true);
      expect(owner.receiveLoginDetectionEmail, false);
      expect(owner.muteFocusedConversations, false);
    });

    test('parse ownerPreferences json', () {
      final data = extractJsonData("ownuserpreferences", "ownuserpreferences1.json");
      final ownerPreferences = OwnUserPreferences.fromJson(data);
      expect(ownerPreferences.idleTimeLimit, 300);
      expect(ownerPreferences.convertAsciiEmoji, true);
      expect(ownerPreferences.notificationsSoundVolume, 100);
      expect(ownerPreferences.emailNotificationMode, "mentions");
      expect(ownerPreferences.desktopNotifications, "mentions");
      expect(ownerPreferences.useEmojis, false);
      expect(ownerPreferences.displayAvatars, true);
      expect(ownerPreferences.showFavorite, true);
      expect(ownerPreferences.receiveLoginDetectionEmail, false);

      expect(ownerPreferences.newRoomNotification, 'door');
      expect(ownerPreferences.newMessageNotification, 'chime');
      expect(ownerPreferences.muteFocusedConversations, true);

      expect(ownerPreferences.roomListSortOrder, RoomListSortOrder.byLastMessage);
      expect(ownerPreferences.roomListDisplay, RoomListDisplay.medium);
    });

    test('parse convertStringToRoomListDisplay json', () {
      expect(OwnUserPreferences.convertStringToRoomListDisplay(""), RoomListDisplay.unknown);
      expect(OwnUserPreferences.convertStringToRoomListDisplay("blabla"), RoomListDisplay.unknown);
      expect(OwnUserPreferences.convertStringToRoomListDisplay("medium"), RoomListDisplay.medium);
      expect(OwnUserPreferences.convertStringToRoomListDisplay("condensed"),
          RoomListDisplay.condensed);
      expect(
          OwnUserPreferences.convertStringToRoomListDisplay("extended"), RoomListDisplay.extended);
    });

    test('parse convertStringToRoomListSortOrder json', () {
      expect(OwnUserPreferences.convertStringToRoomListSortOrder(""), RoomListSortOrder.unknown);
      expect(
          OwnUserPreferences.convertStringToRoomListSortOrder("blabla"), RoomListSortOrder.unknown);
      expect(OwnUserPreferences.convertStringToRoomListSortOrder("activity"),
          RoomListSortOrder.byLastMessage);
      expect(OwnUserPreferences.convertStringToRoomListSortOrder("alphabetical"),
          RoomListSortOrder.alphabetically);
    });
  });
}
