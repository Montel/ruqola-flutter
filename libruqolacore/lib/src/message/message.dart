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
    this.mMessageId = "",
    this.mText = '',
    this.mAlias = '',
    this.mRoomId = '',
    this.mAvatar = '',
    this.mEditedByUsername = '',
    this.mRole = '',
    this.mEmoji = '',
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
    return Message(
        mMessageId: messageId,
        mText: text,
        mAlias: alias,
        mRoomId: roomId,
        mAvatar: avatar,
        mEditedByUsername: editedByUsername,
        mRole: role,
        mEmoji: emoji);
  }

  Map<String, dynamic> toJson() => {
        // TODO
      };

  // _id
  final String mMessageId;

  // msg
  String mText;

  String mAlias;

  // rid
  final String mRoomId;

  // avatar
  String mAvatar;
  String mEditedByUsername;

  // Role
  String mRole;

  String mEmoji;
  // Message Type
  MessageType mMessageType = MessageType.normaltext;

  @override
  String toString() {
    return "mRoomId: $mRoomId mText: $mText mAlias: $mAlias mMessageId: $mMessageId mAvatar:$mAvatar mEditedByUsername:$mEditedByUsername mRole:$mRole mMessageType: $mMessageType";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.mMessageId == mMessageId &&
        other.mText == mText &&
        other.mAlias == mAlias &&
        other.mRoomId == mRoomId &&
        other.mAvatar == mAvatar &&
        other.mEditedByUsername == mEditedByUsername &&
        other.mRole == mRole &&
        other.mEmoji == mEmoji &&
        other.mMessageType == mMessageType;
  }

  @override
  int get hashCode {
    return mMessageId.hashCode ^
        mMessageId.hashCode ^
        mText.hashCode ^
        mAlias.hashCode ^
        mRoomId.hashCode ^
        mAvatar.hashCode ^
        mEditedByUsername.hashCode ^
        mEmoji.hashCode ^
        mMessageType.hashCode ^
        mRole.hashCode;
  }
}
