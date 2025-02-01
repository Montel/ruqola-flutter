/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libddpapi/libddpapi.dart';

class Rocketchatbackend {
  final DdpClient _ddclient;

  Rocketchatbackend(this._ddclient);

  void subscribeRoomMessage(String roomId) {
    _ddclient.subscribe("stream-room-messages", roomId);
    final listStreamRoomMessages = const {
      "deleteMessage",
      "deleteMessageBulk",
      "user-activity",
    };
    for (final notifier in listStreamRoomMessages) {
      _ddclient.subscribe("stream-notify-room", '$roomId/$notifier');
    }
  }

  void subscribeAccount(String userId) {
    _subscribeListStreamNotifyUser(userId);
    _subscribeListStreamNotifyLogger();
    _subscribeListStreamNoticationAll();
    _subscribeListStreamRoles();
    _subscribeListStreamApps();
  }

  void _subscribeListStreamRoles() {
    final listStreamRoles = const {
      "roles",
    };
    for (final notifier in listStreamRoles) {
      _ddclient.subscribe("stream-roles", notifier);
    }
  }

  void _subscribeListStreamApps() {
    final listStreamApps = const {
      "apps",
    };
    for (final notifier in listStreamApps) {
      _ddclient.subscribe("stream-apps", notifier);
    }
  }

  void _subscribeListStreamNotifyUser(String userId) {
    final listStreamNotifyUser = const {
      "notification",
      "rooms-changed",
      "webrtc",
      "otr",
      "message",
      "subscriptions-changed",
    };
    for (final notifier in listStreamNotifyUser) {
      _ddclient.subscribe("stream-notify-user", '$userId/$notifier');
    }
  }

  void _subscribeListStreamNotifyLogger() {
    final listStreamNotifyLogged = const {
      "updateAvatar",
      "roles-change",
      "updateEmojiCustom",
      "deleteEmojiCustom",
      "Users:NameChanged",
      "Users:Deleted",
      "banner-changed",
      "deleteCustomUserStatus",
      "updateCustomUserStatus",
      "voip.statuschanged",
      "user-status",
      "permissions-changed",
      "private-settings-changed",
    };
    for (final notifier in listStreamNotifyLogged) {
      _ddclient.subscribe("stream-notify-logged", notifier);
    }
  }

  void _subscribeListStreamNoticationAll() {
    final listStreamNoticationAll = const {
      "public-info",
      "deleteCustomSound",
      "updateCustomSound",
      "deleteEmojiCustom",
      "public-settings-changed",
      "permissions-changed",
      "license",
      "userData",
      "banners",
      "force_logout",
    };
    for (final notifier in listStreamNoticationAll) {
      _ddclient.subscribe("stream-notify-all", notifier);
    }
  }
}
