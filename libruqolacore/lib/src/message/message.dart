/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/avatarinfo.dart';
import 'package:libruqolacore/src/message/reaction.dart';
import 'package:libruqolacore/src/message/channel.dart';
import 'package:libruqolacore/src/message/blocks/block.dart';
import 'package:collection/collection.dart';
import 'package:libruqolacore/src/message/replies.dart';

enum MessageType {
  system,
  information,
  normaltext,
  videoconference,
}

class Message {
  Message({
    required this.messageId,
    required this.text,
    required this.alias,
    required this.roomId,
    required this.avatar,
    required this.editedByUsername,
    required this.role,
    required this.emoji,
    required this.username,
    required this.name,
    required this.userId,
    required this.reactions,
    required this.channels,
    required this.replies,
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

    final channelsJson = json["channels"];
    List<Channel> channels = [];
    if (channelsJson != null) {
      // print("CHANNEL $channelsJson");
      if (channelsJson.isNotEmpty) {
        for (var entry in channelsJson) {
          Channel c = Channel.fromJson(entry);
          channels.add(c);
        }
      }
    }

    // Block
    final blocksJson = json["blocks"];
    List<Block> blocks = [];
    if (blocksJson != null) {
      // print("Block $channelsJson");
      if (blocksJson.isNotEmpty) {
        for (var entry in blocksJson) {
          // TOOD implement
          //Block c = Block.fromJson(entry);
          // channels.add(c);
        }
      }
    }

    // Replies
    final Replies replies = Replies.fromJson(json);

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
        reactions: reactions,
        channels: channels,
        replies: replies);
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

  // Channels
  List<Channel> channels = [];

  Replies replies = Replies.defaultValues();

  @override
  String toString() {
    return "Message(roomId: $roomId text: $text alias: $alias messageId: $messageId avatar: $avatar editedByUsername: $editedByUsername role:$role messageType: $messageType, reactions: $reactions, channels: $channels)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    final listEquality = ListEquality();
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
        listEquality.equals(other.reactions, reactions) &&
        listEquality.equals(other.channels, channels);
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
        reactions.hashCode ^
        channels.hashCode;
  }
}
