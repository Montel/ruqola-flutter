/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';

class Receivertypingnotification with ChangeNotifier {
  // map<RoomId, List<UserId>
  Map<String, List<String>> mMapTypingNotifications = {};

  String generateNotification(List<String> userNames) {
    if (userNames.isEmpty) {
      return '';
    }
    if (userNames.length == 1) {
      return "<strong>${userNames[0]}</strong> is typing...";
    }

    String notificationStr = '';
    for (int i = 0; i < userNames.length; ++i) {
      String user = userNames[i];
      if (i == 0) {
        notificationStr = user;
      } else if (i < userNames.length - 1) {
        notificationStr = "$notificationStr, $user";
      } else {
        notificationStr = "$notificationStr and $user";
      }
    }
    return "<strong>$notificationStr</strong> are typing...";
  }

  String typingNotification(String roomId) {
    print("get notification value from $roomId");
    if (mMapTypingNotifications.containsKey(roomId)) {
      return generateNotification(mMapTypingNotifications[roomId]!);
    }
    return '';
  }

  void insertTypingNotification(String roomId, String userName, bool onTyping) {
    if (mMapTypingNotifications.containsKey(roomId)) {
      List<String> lst = mMapTypingNotifications[roomId]!;
      if (onTyping) {
        if (!lst.contains(userName)) {
          lst.add(userName);
          mMapTypingNotifications[roomId] = lst;
          notifyListeners();
        }
      } else {
        if (lst.remove(userName)) {
          if (lst.isEmpty) {
            // remove roomId
            mMapTypingNotifications.remove(roomId);
          } else {
            mMapTypingNotifications[roomId] = lst;
          }
          notifyListeners();
        }
      }
    } else {
      if (onTyping) {
        List<String> b = [];
        b.add(userName);
        mMapTypingNotifications[roomId] = b;
        notifyListeners();
      }
    }
  }
}
