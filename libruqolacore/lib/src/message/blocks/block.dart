/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/message/blocks/blockaccessory.dart';
import 'package:libruqolacore/src/message/blocks/blockaction.dart';
import 'package:collection/collection.dart';

enum BlockType {
  unknown,
  videoConf,
  actions,
  section,
  context,
  divider,
  overflow,
  image,
  preview,
  callout,
}

extension BlockTypeExt on BlockType {
  String get name {
    switch (this) {
      case BlockType.unknown:
        return '';
      case BlockType.videoConf:
        return 'video_conf';
      case BlockType.actions:
        return 'actions';
      case BlockType.section:
        return 'section';
      case BlockType.context:
        return 'context';
      case BlockType.divider:
        return 'divider';
      case BlockType.overflow:
        return 'overflow';
      case BlockType.image:
        return 'image';
      case BlockType.preview:
        return 'preview';
      case BlockType.callout:
        return 'callout';
    }
  }

  static BlockType fromName(String name) {
    switch (name) {
      case '':
        return BlockType.unknown;
      case 'video_conf':
        return BlockType.videoConf;
      case 'actions':
        return BlockType.actions;
      case 'section':
        return BlockType.section;
      case 'context':
        return BlockType.context;
      case 'divider':
        return BlockType.divider;
      case 'overflow':
        return BlockType.overflow;
      case 'image':
        return BlockType.image;
      case 'preview':
        return BlockType.preview;
      case 'callout':
        return BlockType.callout;
      default:
        throw ArgumentError('Invalid BlockType name: $name');
    }
  }
}

class Block {
  List<BlockAction>? blockActions;
  String blockId = '';
  String callId = '';
  String appId = '';
  String sectionText = '';
  BlockType blockType = BlockType.unknown;
  BlockAccessory? blockAccessory;
  // VideoConferenceInfo videoConferenceInfo;

  @override
  String toString() {
    return "Block(blockActions: $blockActions blockId: $blockId callId: $callId appId: $appId, sectionText: $sectionText blockType: $blockType, blockAccessory: $blockAccessory)";
  }

  Block({
    required this.blockActions,
    required this.blockId,
    required this.callId,
    required this.appId,
    required this.sectionText,
    required this.blockType,
    required this.blockAccessory,
  });

  factory Block.fromJson(Map<String, dynamic> json) {
    final String blockId = json["blockId"] ?? '';
    final String callId = json["callId"] ?? '';
    final String appId = json["appId"] ?? '';
    final BlockType blockType = BlockTypeExt.fromName(json["type"] ?? '');

    String sectionText = '';
    // Verify
    List<BlockAction>? blockActions;
    if (json.containsKey("elements")) {
      blockActions = List<BlockAction>.from(json["elements"]);
      // TODO
    }
    BlockAccessory? blockAccessory;
    if (json.containsKey("accessory")) {
      blockAccessory = BlockAccessory.fromJson(json["accessory"]);
      // TODO
    }
    return Block(
        blockId: blockId,
        callId: callId,
        appId: appId,
        blockActions: blockActions,
        blockAccessory: blockAccessory,
        sectionText: sectionText,
        blockType: blockType);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();

    return other is Block &&
        listEquality.equals(other.blockActions, blockActions) &&
        other.blockId == blockId &&
        other.callId == callId &&
        other.appId == appId &&
        other.sectionText == sectionText &&
        other.blockType == blockType &&
        other.blockAccessory == blockAccessory;
  }

  @override
  int get hashCode {
    return blockActions.hashCode ^
        blockId.hashCode ^
        callId.hashCode ^
        appId.hashCode ^
        sectionText.hashCode ^
        blockType.hashCode ^
        blockAccessory.hashCode;
  }
}
