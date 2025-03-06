/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:collection/collection.dart';

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
  List<String>? highlightWords;
  String? emailNotificationMode;
  String? desktopNotifications;
  String? pushNotifications;
  String? newMessageNotification;
  String? newRoomNotification;
  RoomListSortOrder roomListSortOrder = RoomListSortOrder.unknown;
  RoomListDisplay roomListDisplay = RoomListDisplay.unknown;
  int idleTimeLimit = -1;
  int notificationsSoundVolume = -1;
  bool convertAsciiEmoji = true;
  bool useEmojis = true;
  bool hideRoles = false;
  bool displayAvatars = true;
  bool enableAutoAway = false;
  bool showUnread = false;
  bool showRoomAvatar = false;
  bool showFavorite = true;
  bool receiveLoginDetectionEmail = false;
  bool muteFocusedConversations = false;

  Ownuserpreferences();

  static RoomListDisplay convertStringToRoomListDisplay(String str) {
    switch (str) {
      case "medium":
        return RoomListDisplay.medium;
      case "condensed":
        return RoomListDisplay.condensed;
      case "extended":
        return RoomListDisplay.extended;
      default:
        print("Invalid RoomListDisplay $str");
        return RoomListDisplay.unknown;
    }
  }

  static RoomListSortOrder convertStringToRoomListSortOrder(String str) {
    switch (str) {
      case "activity":
        return RoomListSortOrder.byLastMessage;
      case "alphabetical":
        return RoomListSortOrder.alphabetically;
      default:
        print("Invalid RoomListSortOrder $str");
        return RoomListSortOrder.unknown;
    }
  }

  factory Ownuserpreferences.fromJson(Map<String, dynamic> json) {
    Ownuserpreferences owner = Ownuserpreferences();

    if (json.containsKey('highlights')) {
      owner.highlightWords = List<String>.from(json['highlights']);
    }

    owner.roomListSortOrder = convertStringToRoomListSortOrder(json['sidebarSortby'].toString());
    owner.idleTimeLimit = json['idleTimeLimit'] as int;
    owner.convertAsciiEmoji = json['convertAsciiEmoji'] as bool;
    owner.notificationsSoundVolume = json['notificationsSoundVolume'] as int;
    owner.emailNotificationMode = json['emailNotificationMode'];
    owner.desktopNotifications = json['desktopNotifications'];
    owner.pushNotifications = json['pushNotifications'];
    owner.newMessageNotification = json['newMessageNotification'];
    owner.newRoomNotification = json['newRoomNotification'];
    owner.roomListDisplay = convertStringToRoomListDisplay(json['sidebarViewMode'].toString());
    owner.useEmojis = json['useEmojis'] as bool;
    owner.hideRoles = json['hideRoles'] as bool;
    owner.displayAvatars = json['displayAvatars'] as bool;
    owner.enableAutoAway = json['enableAutoAway'] as bool;
    owner.showUnread = json['showUnread'] != null ? json['showUnread'] as bool : false;
    owner.showRoomAvatar = json['showRoomAvatar'] != null ? json['showRoomAvatar'] as bool : false;
    owner.showFavorite =
        json['sidebarShowFavorites'] != null ? json['sidebarShowFavorites'] as bool : false;
    owner.receiveLoginDetectionEmail = json['receiveLoginDetectionEmail'] != null
        ? json['receiveLoginDetectionEmail'] as bool
        : false;
    owner.muteFocusedConversations =
        json['muteFocusedConversations'] != null ? json['muteFocusedConversations'] as bool : false;

    return owner;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();
    return other is Ownuserpreferences &&
        listEquality.equals(other.highlightWords, highlightWords) &&
        other.emailNotificationMode == emailNotificationMode &&
        other.desktopNotifications == desktopNotifications &&
        other.pushNotifications == pushNotifications &&
        other.newMessageNotification == newMessageNotification &&
        other.newRoomNotification == newRoomNotification &&
        other.roomListSortOrder == roomListSortOrder &&
        other.roomListDisplay == roomListDisplay &&
        other.idleTimeLimit == idleTimeLimit &&
        other.notificationsSoundVolume == notificationsSoundVolume &&
        other.convertAsciiEmoji == convertAsciiEmoji &&
        other.useEmojis == useEmojis &&
        other.hideRoles == hideRoles &&
        other.displayAvatars == displayAvatars &&
        other.enableAutoAway == enableAutoAway &&
        other.showUnread == showUnread &&
        other.showRoomAvatar == showRoomAvatar &&
        other.showFavorite == showFavorite &&
        other.receiveLoginDetectionEmail == receiveLoginDetectionEmail &&
        other.muteFocusedConversations == muteFocusedConversations;
  }

  @override
  int get hashCode {
    return Object.hash(
      highlightWords,
      emailNotificationMode,
      desktopNotifications,
      pushNotifications,
      newMessageNotification,
      newRoomNotification,
      roomListSortOrder,
      roomListDisplay,
      idleTimeLimit,
      notificationsSoundVolume,
      convertAsciiEmoji,
      useEmojis,
      hideRoles,
      displayAvatars,
      enableAutoAway,
      showUnread,
      showRoomAvatar,
      showFavorite,
      receiveLoginDetectionEmail,
      muteFocusedConversations,
    );
  }

  @override
  String toString() {
    return 'Ownuserpreferences('
        'highlightWords: $highlightWords, '
        'emailNotificationMode: $emailNotificationMode, '
        'desktopNotifications: $desktopNotifications, '
        'pushNotifications: $pushNotifications, '
        'newMessageNotification: $newMessageNotification, '
        'newRoomNotification: $newRoomNotification, '
        'roomListSortOrder: $roomListSortOrder, '
        'roomListDisplay: $roomListDisplay, '
        'idleTimeLimit: $idleTimeLimit, '
        'notificationsSoundVolume: $notificationsSoundVolume, '
        'convertAsciiEmoji: $convertAsciiEmoji, '
        'useEmojis: $useEmojis, '
        'hideRoles: $hideRoles, '
        'displayAvatars: $displayAvatars, '
        'enableAutoAway: $enableAutoAway, '
        'showUnread: $showUnread, '
        'showRoomAvatar: $showRoomAvatar, '
        'showFavorite: $showFavorite, '
        'receiveLoginDetectionEmail: $receiveLoginDetectionEmail, '
        'muteFocusedConversations: $muteFocusedConversations'
        ')';
  }
}
