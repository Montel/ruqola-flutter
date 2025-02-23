/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/ownuserpreferences.dart';
import 'package:test/test.dart';

import 'libruqolacoretest.dart';

void main() {
  group('ownuserpreferences', () {
    test('Test Initial OwnUserPreferences', () {
      Ownuserpreferences owner = Ownuserpreferences();
      expect(owner.mHighlightWords, null);
      expect(owner.mEmailNotificationMode, null);
      expect(owner.mDesktopNotifications, null);
      expect(owner.mPushNotifications, null);
      expect(owner.mNewRoomNotification, null);
      expect(owner.mNewMessageNotification, null);

      expect(owner.mRoomListSortOrder, RoomListSortOrder.unknown);
      expect(owner.mRoomListDisplay, RoomListDisplay.unknown);

      expect(owner.mIdleTimeLimit, -1);
      expect(owner.mNotificationsSoundVolume, -1);

      expect(owner.mConvertAsciiEmoji, true);
      expect(owner.mUseEmojis, true);
      expect(owner.mHideRoles, false);
      expect(owner.mDisplayAvatars, true);
      expect(owner.mEnableAutoAway, false);
      expect(owner.mShowUnread, false);
      expect(owner.mShowRoomAvatar, false);
      expect(owner.mShowFavorite, true);
      expect(owner.mReceiveLoginDetectionEmail, false);
      expect(owner.mMuteFocusedConversations, false);
    });

    test('parse ownerPreferences json', () {
      final data = extractJsonData("ownuserpreferences", "ownuserpreferences1.json");
      final ownerPreferences = Ownuserpreferences.fromJson(data);
      expect(ownerPreferences.mIdleTimeLimit, 300);
      expect(ownerPreferences.mConvertAsciiEmoji, true);
      expect(ownerPreferences.mNotificationsSoundVolume, 100);
      expect(ownerPreferences.mEmailNotificationMode, "mentions");
      expect(ownerPreferences.mDesktopNotifications, "mentions");
      expect(ownerPreferences.mUseEmojis, false);
      expect(ownerPreferences.mDisplayAvatars, true);
      expect(ownerPreferences.mShowFavorite, true);
      expect(ownerPreferences.mReceiveLoginDetectionEmail, false);

      expect(ownerPreferences.mNewRoomNotification, 'door');
      expect(ownerPreferences.mNewMessageNotification, 'chime');
      expect(ownerPreferences.mMuteFocusedConversations, true);

      expect(ownerPreferences.mRoomListSortOrder, RoomListSortOrder.byLastMessage);
      expect(ownerPreferences.mRoomListDisplay, RoomListDisplay.medium);
    });

    test('parse convertStringToRoomListDisplay json', () {
      expect(Ownuserpreferences.convertStringToRoomListDisplay(""), RoomListDisplay.unknown);
      expect(Ownuserpreferences.convertStringToRoomListDisplay("blabla"), RoomListDisplay.unknown);
      expect(Ownuserpreferences.convertStringToRoomListDisplay("medium"), RoomListDisplay.medium);
      expect(Ownuserpreferences.convertStringToRoomListDisplay("condensed"),
          RoomListDisplay.condensed);
      expect(
          Ownuserpreferences.convertStringToRoomListDisplay("extended"), RoomListDisplay.extended);
    });

    test('parse convertStringToRoomListSortOrder json', () {
      expect(Ownuserpreferences.convertStringToRoomListSortOrder(""), RoomListSortOrder.unknown);
      expect(
          Ownuserpreferences.convertStringToRoomListSortOrder("blabla"), RoomListSortOrder.unknown);
      expect(Ownuserpreferences.convertStringToRoomListSortOrder("activity"),
          RoomListSortOrder.byLastMessage);
      expect(Ownuserpreferences.convertStringToRoomListSortOrder("alphabetical"),
          RoomListSortOrder.alphabetically);
    });
  });
}
