/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

enum MessageType {
  system,
  information,
  normaltext,
  videoconference,
}

class Message {
  Message({
    this.messageId = "",
    this.text = '',
    this.alias = '',
    this.roomId = '',
    this.avatar = '',
    this.editedByUsername = '',
    this.role = '',
    this.emoji = '',
    this.username = '',
    this.name = '',
    this.userId = '',
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    // print("MESSAGE: $json");
    final messageId = json['_id'] ?? '';
    final text = json['msg'] ?? '';
    final alias = json['alias'] ?? '';
    final roomId = json['rid'] ?? '';
    final avatar = json['avatar'] ?? '';
    final role = json['role'] ?? '';
    final emoji = json['emoji'] ?? '';
    final editedByUsername = ""; // FIXME

    final userObject = json["u"];

    final username = userObject["username"] ?? '';
    final name = userObject["name"] ?? '';
    final userId = userObject["_id"] ?? '';

    return Message(
        messageId: messageId,
        text: text,
        alias: alias,
        roomId: roomId,
        avatar: avatar,
        editedByUsername: editedByUsername,
        role: role,
        emoji: emoji,
        username: username,
        name: name,
        userId: userId);
  }

  Map<String, dynamic> toJson() => {
        // TODO
      };

  // _id
  final String messageId;
  // u
  String username;
  String name;
  String userId;

  // msg
  String text;

  String alias;

  // rid
  final String roomId;

  // avatar
  String avatar;
  String editedByUsername;

  // Role
  String role;

  String emoji;
  // Message Type
  MessageType mMessageType = MessageType.normaltext;

  @override
  String toString() {
    return "Message(mRoomId: $roomId mText: $text mAlias: $alias mMessageId: $messageId mAvatar:$avatar mEditedByUsername:$editedByUsername mRole:$role mMessageType: $mMessageType)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.messageId == messageId &&
        other.text == text &&
        other.alias == alias &&
        other.roomId == roomId &&
        other.avatar == avatar &&
        other.editedByUsername == editedByUsername &&
        other.role == role &&
        other.emoji == emoji &&
        other.mMessageType == mMessageType;
  }

  @override
  int get hashCode {
    return messageId.hashCode ^
        messageId.hashCode ^
        text.hashCode ^
        alias.hashCode ^
        roomId.hashCode ^
        avatar.hashCode ^
        editedByUsername.hashCode ^
        emoji.hashCode ^
        mMessageType.hashCode ^
        role.hashCode;
  }
}
