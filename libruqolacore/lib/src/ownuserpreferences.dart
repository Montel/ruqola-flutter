/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

enum RoomListSortOrder {
  unknown,
  byLastMessage,
  alphabetically,
}

enum RoomListDisplay {
  unknown,
  condensed,
  medium,
  extended,
}

class Ownuserpreferences {
  // Implement constructor
  Ownuserpreferences();

  static RoomListDisplay convertStringToRoomListDisplay(String str) {
    if (str == "medium") {
      return RoomListDisplay.medium;
    } else if (str == "condensed") {
      return RoomListDisplay.condensed;
    } else if (str == "extended") {
      return RoomListDisplay.extended;
    } else {
      print("Invalid RoomListDisplay $str");
    }
    return RoomListDisplay.unknown;
  }

  static RoomListSortOrder convertStringToRoomListSortOrder(String str) {
    if (str == "activity") {
      return RoomListSortOrder.byLastMessage;
    } else if (str == "alphabetical") {
      return RoomListSortOrder.alphabetically;
    } else {
      print("Invalid RoomListSortOrder $str");
    }
    return RoomListSortOrder.unknown;
  }

  List<String>? mHighlightWords;
  String? mEmailNotificationMode;
  String? mDesktopNotifications;
  String? mPushNotifications;
  String? mNewMessageNotification;
  String? mNewRoomNotification;
  RoomListSortOrder mRoomListSortOrder = RoomListSortOrder.unknown;
  RoomListDisplay mRoomListDisplay = RoomListDisplay.unknown;
  int mIdleTimeLimit = -1;
  int mNotificationsSoundVolume = -1;
  bool mConvertAsciiEmoji = true;
  bool mUseEmojis = true;
  bool mHideRoles = false;
  bool mDisplayAvatars = true;
  bool mEnableAutoAway = false;
  bool mShowUnread = false;
  bool mShowRoomAvatar = false;
  bool mShowFavorite = true;
  bool mReceiveLoginDetectionEmail = false;
  bool mMuteFocusedConversations = false;

  factory Ownuserpreferences.fromJson(Map<String, dynamic> json) {
    Ownuserpreferences owner = Ownuserpreferences();

    if (json.containsKey('highlights')) {
      owner.mHighlightWords = List<String>.from(json['highlights']);
    }

    owner.mRoomListSortOrder =
        convertStringToRoomListSortOrder(json['sidebarSortby'].toString());
    owner.mIdleTimeLimit = json['idleTimeLimit'] as int;
    owner.mConvertAsciiEmoji = json['convertAsciiEmoji'] as bool;
    owner.mNotificationsSoundVolume = json['notificationsSoundVolume'] as int;
    owner.mEmailNotificationMode = json['emailNotificationMode'];
    owner.mDesktopNotifications = json['desktopNotifications'];
    owner.mPushNotifications = json['pushNotifications'];
    owner.mNewMessageNotification = json['newMessageNotification'];
    owner.mNewRoomNotification = json['newRoomNotification'];
    owner.mRoomListDisplay =
        convertStringToRoomListDisplay(json['sidebarViewMode'].toString());
    owner.mUseEmojis = json['useEmojis'] as bool;
    owner.mHideRoles = json['hideRoles'] as bool;
    owner.mDisplayAvatars = json['displayAvatars'] as bool;
    owner.mEnableAutoAway = json['enableAutoAway'] as bool;
    owner.mShowUnread =
        json['showUnread'] != null ? json['showUnread'] as bool : false;
    owner.mShowRoomAvatar =
        json['showRoomAvatar'] != null ? json['showRoomAvatar'] as bool : false;
    owner.mShowFavorite = json['sidebarShowFavorites'] != null
        ? json['sidebarShowFavorites'] as bool
        : false;
    owner.mReceiveLoginDetectionEmail =
        json['receiveLoginDetectionEmail'] != null
            ? json['receiveLoginDetectionEmail'] as bool
            : false;
    owner.mMuteFocusedConversations = json['muteFocusedConversations'] != null
        ? json['muteFocusedConversations'] as bool
        : false;

    return owner;
  }
}
