/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/message/blocks/blockaction.dart';
import 'package:collection/collection.dart';

enum BlockType {
  unknown,
  videoConf,
  actions,
  section,
}

class Block {
  List<BlockAction> blockActions = [];
  String blockId = '';
  String callId = '';
  String appId = '';
  String blockStr = '';
  String sectionText = '';
  BlockType blockType = BlockType.unknown;
  // VideoConferenceInfo mVideoConferenceInfo;

  @override
  String toString() {
    return "Block(blockActions: $blockActions blockId: $blockId callId: $callId appId: $appId blockStr: $blockStr sectionText: $sectionText mBlockType: $blockType)";
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
        other.blockStr == blockStr &&
        other.sectionText == sectionText &&
        other.blockType == blockType;
  }

  @override
  int get hashCode {
    return blockActions.hashCode ^
        blockId.hashCode ^
        callId.hashCode ^
        appId.hashCode ^
        blockStr.hashCode ^
        sectionText.hashCode ^
        blockType.hashCode;
  }
}
