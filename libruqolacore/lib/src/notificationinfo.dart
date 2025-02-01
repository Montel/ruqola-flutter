/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

enum NotificationType {
  standardMessage,
  conferenceCall,
}

class NotificationInfo {
  NotificationInfo();
  factory NotificationInfo.fromJson(List<dynamic> json) {
    NotificationInfo info = NotificationInfo();
    final obj = json[0] as Map<String, dynamic>;
    info.title = obj["title"] ?? '';
    var payloadObj = obj["payload"] ?? {};
    if (payloadObj.isNotEmpty) {
      info.messageId = payloadObj["_id"] ?? '';
      info.roomId = payloadObj["rid"] ?? '';
      info.roomName = payloadObj["name"] ?? '';
      info.channelType = payloadObj["type"] ?? '';
      info.tmId = payloadObj["tmid"] ?? '';

      var senderObj = payloadObj["sender"] ?? {};
      if (senderObj.isNotEmpty) {
        info.senderId = senderObj["_id"] ?? '';
        info.senderName = senderObj["name"] ?? '';
        info.senderUserName = senderObj["username"] ?? '';
      } else {
        print("Problem with notification json: missing sender");
      }

      var messageObj = payloadObj["message"] ?? {};
      if (messageObj.isEmpty) {
        print("Problem with notification json: missing message");
        info.message = obj["text"];
      } else {
        if (messageObj["t"].toString() == "videoconf") {
          info.notificationType = NotificationType.conferenceCall;
        } else {
          info.message = messageObj["msg"] ?? '';
          if (info.message.isEmpty) {
            // Fallback to text
            info.message = obj["text"];
          }
        }
      }
    } else {
      print("Problem with notification json: missing payload");
    }
    return info;
  }

  bool get isValid {
    bool valid = senderId.isNotEmpty && channelType.isNotEmpty;
    if (notificationType == NotificationType.conferenceCall) {
      return valid;
    }
    return valid && message.isNotEmpty;
  }

  String messageId = '';
  String accountName = '';
  String message = '';
  String title = '';
  String senderId = '';
  String senderName = '';
  String senderUserName = '';
  String roomName = '';
  String roomId = '';
  String channelType = '';
  String tmId = '';
  String dateTime = '';
  // TODO QPixmap mPixmap;
  NotificationType notificationType = NotificationType.standardMessage;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationInfo &&
        other.messageId == messageId &&
        other.accountName == accountName &&
        other.message == message &&
        other.title == title &&
        other.senderId == senderId &&
        other.senderName == senderName &&
        other.senderUserName == senderUserName &&
        other.roomName == roomName &&
        other.roomId == roomId &&
        other.channelType == channelType &&
        other.tmId == tmId &&
        other.notificationType == notificationType &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return accountName.hashCode ^
        message.hashCode ^
        messageId.hashCode ^
        title.hashCode ^
        senderId.hashCode ^
        senderName.hashCode ^
        senderUserName.hashCode ^
        roomName.hashCode ^
        roomId.hashCode ^
        channelType.hashCode ^
        tmId.hashCode ^
        notificationType.hashCode ^
        dateTime.hashCode;
  }

  @override
  String toString() {
    return 'NotificationInfo(accountName: $accountName, message: $message, title: $title, senderId: $senderId, senderName: $senderName, senderUserName: $senderUserName, roomName: $roomName, roomId: $roomId, channelType: $channelType, tmId: $tmId, dateTime: $dateTime, notificationType: $notificationType)';
  }
}
