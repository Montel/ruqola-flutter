/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/avatarinfo.dart';
import 'package:libruqolacore/src/message/reaction.dart';

enum MessageType {
  system,
  information,
  normaltext,
  videoconference,
}

class Message {
  Message(
      {this.messageId = "",
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
      this.reactions = const []});

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
    final reactionsJson = json["reactions"];
    List<Reaction> reactions = [];
    if (reactionsJson != null) {
      for (var entry in reactionsJson.entries) {
        // TODO move in reactions class ???
        final String reactionName = entry.key;
        final List<String> userNames = List<String>.from(entry.value['usernames']);
        final r = Reaction(reactionName: reactionName, userNames: userNames);
        reactions.add(r);
      }
    }
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
        userId: userId,
        reactions: reactions);
  }

  String avatarUrl(String serverUrl) {
    if (avatar.isNotEmpty) {
      return avatar;
    }
    if (emoji.isNotEmpty) {
      return emoji;
    }
    return avatarInfo().avatarUrl(serverUrl);
  }

  AvatarInfo avatarInfo() {
    AvatarInfo info = AvatarInfo();
    info.avatarType = AvatarType.user;
    info.identifier = username;
    return info;
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
  MessageType messageType = MessageType.normaltext;
  //Reactions
  List<Reaction> reactions = [];

  @override
  String toString() {
    return "Message(roomId: $roomId text: $text alias: $alias messageId: $messageId avatar: $avatar editedByUsername: $editedByUsername role:$role messageType: $messageType, reactions: $reactions)";
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
        other.messageType == messageType &&
        other.reactions == reactions;
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
        messageType.hashCode ^
        role.hashCode ^
        reactions.hashCode;
  }
}
