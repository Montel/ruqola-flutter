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

enum SystemMessageType {
  unknown,
  userJoined,
  userLeft,
  userLeftTeam,
  roomTopicChanged,
  userAdded,
  roomNameChanged,
  userRemoved,
  roomDescriptionChanged,
  roomAnnoucementChanged,
  roomPrivacyChanged,
  jitsiCallStarted,
  messageDeleted,
  pinned,
  encryptedMessage,
  userMuted,
  userUnmuted,
  subscriptionRoleAdded,
  subscriptionRoleRemoved,
  messageE2E,
  discussionCreated,
  userJoinedConversation,
  roomArchived,
  roomUnarchived,
  rtc,
  welcome,
  roomAvatarChanged,
  roomE2eEnabled,
  roomE2eDisabled,
  roomSetReadOnly,
  roomRemoveReadOnly,
  addedUserToTeam,
  removedUserFromTeam,
  userConvertedToTeam,
  userConvertedToChannel,
  userRemovedRoomFromTeam,
  userDeletedRoomFromTeam,
  userAddedRoomToTeam,
  roomAllowedReacting,
  roomDisallowedReacting,
  userJoinedTeam,
  userJoinedOtr,
  userKeyRefreshedSuccessfully,
  userRequesterOtrKeyRefresh,
  videoConf,
}

extension SystemMessageTypeExt on SystemMessageType {
  String get name {
    switch (this) {
      case SystemMessageType.unknown:
        return '';
      case SystemMessageType.userJoined:
        return 'uj';
      case SystemMessageType.userLeft:
        return 'ul';
      case SystemMessageType.userLeftTeam:
        return 'ult';
      case SystemMessageType.roomTopicChanged:
        return 'room_changed_topic';
      case SystemMessageType.userAdded:
        return 'au';
      case SystemMessageType.roomNameChanged:
        return 'r';
      case SystemMessageType.userRemoved:
        return 'ru';
      case SystemMessageType.roomDescriptionChanged:
        return 'room_changed_description';
      case SystemMessageType.roomAnnoucementChanged:
        return 'room_changed_announcement';
      case SystemMessageType.roomPrivacyChanged:
        return 'room_changed_privacy';
      case SystemMessageType.jitsiCallStarted:
        return 'jitsi_call_started';
      case SystemMessageType.messageDeleted:
        return 'rm';
      case SystemMessageType.pinned:
        return 'message_pinned';
      case SystemMessageType.encryptedMessage:
        return 'otr';
      case SystemMessageType.userMuted:
        return 'user-muted';
      case SystemMessageType.userUnmuted:
        return 'user-unmuted';
      case SystemMessageType.subscriptionRoleAdded:
        return 'subscription-role-added';
      case SystemMessageType.subscriptionRoleRemoved:
        return 'subscription-role-removed';
      case SystemMessageType.messageE2E:
        return 'e2e';
      case SystemMessageType.discussionCreated:
        return 'discussion-created';
      case SystemMessageType.userJoinedConversation:
        return 'ut';
      case SystemMessageType.roomArchived:
        return 'room-archived';
      case SystemMessageType.roomUnarchived:
        return 'room-unarchived';
      case SystemMessageType.rtc:
        return 'rtc';
      case SystemMessageType.welcome:
        return 'wm';
      case SystemMessageType.roomAvatarChanged:
        return 'room_changed_avatar';
      case SystemMessageType.roomE2eEnabled:
        return 'room_e2e_enabled';
      case SystemMessageType.roomE2eDisabled:
        return 'room_e2e_disabled';
      case SystemMessageType.roomSetReadOnly:
        return 'room-set-read-only';
      case SystemMessageType.roomRemoveReadOnly:
        return 'room-removed-read-only';
      case SystemMessageType.addedUserToTeam:
        return 'added-user-to-team';
      case SystemMessageType.removedUserFromTeam:
        return 'removed-user-from-team';
      case SystemMessageType.userConvertedToTeam:
        return 'user-converted-to-team';
      case SystemMessageType.userConvertedToChannel:
        return 'user-converted-to-channel';
      case SystemMessageType.userRemovedRoomFromTeam:
        return 'user-removed-room-from-team';
      case SystemMessageType.userDeletedRoomFromTeam:
        return 'user-deleted-room-from-team';
      case SystemMessageType.userAddedRoomToTeam:
        return 'user-added-room-to-team';
      case SystemMessageType.roomAllowedReacting:
        return 'room-allowed-reacting';
      case SystemMessageType.roomDisallowedReacting:
        return 'room-disallowed-reacting';
      case SystemMessageType.userJoinedTeam:
        return 'ujt';
      case SystemMessageType.userJoinedOtr:
        return 'user_joined_otr';
      case SystemMessageType.userKeyRefreshedSuccessfully:
        return 'user_key_refreshed_successfully';
      case SystemMessageType.userRequesterOtrKeyRefresh:
        return 'user_requested_otr_key_refresh';
      case SystemMessageType.videoConf:
        return 'videoconf';
    }
  }

  static SystemMessageType fromName(String str) {
    switch (str) {
      case 'uj':
        return SystemMessageType.userJoined;
      case 'ul':
        return SystemMessageType.userLeft;
      case 'ult':
        return SystemMessageType.userLeftTeam;
      case 'room_changed_topic':
        return SystemMessageType.roomTopicChanged;
      case 'au':
        return SystemMessageType.userAdded;
      case 'r':
        return SystemMessageType.roomNameChanged;
      case 'ru':
        return SystemMessageType.userRemoved;
      case 'room_changed_description':
        return SystemMessageType.roomDescriptionChanged;
      case 'room_changed_announcement':
        return SystemMessageType.roomAnnoucementChanged;
      case 'room_changed_privacy':
        return SystemMessageType.roomPrivacyChanged;
      case 'jitsi_call_started':
        return SystemMessageType.jitsiCallStarted;
      case 'rm':
        return SystemMessageType.messageDeleted;
      case 'message_pinned':
        return SystemMessageType.pinned;
      case 'otr':
        return SystemMessageType.encryptedMessage;
      case 'user-unmuted':
        return SystemMessageType.userUnmuted;
      case 'user-muted':
        return SystemMessageType.userMuted;
      case 'subscription-role-added':
        return SystemMessageType.subscriptionRoleAdded;
      case 'subscription-role-removed':
        return SystemMessageType.subscriptionRoleRemoved;
      case 'e2e':
        return SystemMessageType.messageE2E;
      case 'discussion-created':
        return SystemMessageType.discussionCreated;
      case 'ut':
        return SystemMessageType.userJoinedConversation;
      case 'room-archived':
        return SystemMessageType.roomArchived;
      case 'room-unarchived':
        return SystemMessageType.roomUnarchived;
      case 'rtc':
        return SystemMessageType.rtc;
      case 'wm':
        return SystemMessageType.welcome;
      case 'room_changed_avatar':
        return SystemMessageType.roomAvatarChanged;
      case 'room_e2e_enabled':
        return SystemMessageType.roomE2eEnabled;
      case 'room_e2e_disabled':
        return SystemMessageType.roomE2eDisabled;
      case 'room-set-read-only':
        return SystemMessageType.roomSetReadOnly;
      case 'room-removed-read-only':
        return SystemMessageType.roomRemoveReadOnly;
      case 'added-user-to-team':
        return SystemMessageType.addedUserToTeam;
      case 'removed-user-from-team':
        return SystemMessageType.removedUserFromTeam;
      case 'user-converted-to-team':
        return SystemMessageType.userConvertedToTeam;
      case 'user-converted-to-channel':
        return SystemMessageType.userConvertedToChannel;
      case 'user-removed-room-from-team':
        return SystemMessageType.userRemovedRoomFromTeam;
      case 'user-deleted-room-from-team':
        return SystemMessageType.userDeletedRoomFromTeam;
      case 'user-added-room-to-team':
        return SystemMessageType.userAddedRoomToTeam;
      case 'room-allowed-reacting':
        return SystemMessageType.roomAllowedReacting;
      case 'room-disallowed-reacting':
        return SystemMessageType.roomDisallowedReacting;
      case 'ujt':
        return SystemMessageType.userJoinedTeam;
      case 'user_joined_otr':
        return SystemMessageType.userJoinedOtr;
      case 'user_key_refreshed_successfully':
        return SystemMessageType.userKeyRefreshedSuccessfully;
      case 'user_requested_otr_key_refresh':
        return SystemMessageType.userRequesterOtrKeyRefresh;
      case 'videoconf':
        return SystemMessageType.videoConf;
      default:
        print('Unknown message type: $str');
        return SystemMessageType.unknown;
    }
  }
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
    required this.blocks,
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
      // print("Block $blocksJson");
      if (blocksJson.isNotEmpty) {
        for (var entry in blocksJson) {
          Block c = Block.fromJson(entry);
          blocks.add(c);
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
        replies: replies,
        blocks: blocks);
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

  // Blocks
  List<Block> blocks = [];

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
