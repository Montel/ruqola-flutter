/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class BlockAction {
  final String actionId;
  final String text;
  final String type;
  final String blockId;
  final String value;
  final String url;

  BlockAction({
    required this.actionId,
    required this.text,
    required this.type,
    required this.blockId,
    required this.value,
    required this.url,
  });
  factory BlockAction.fromJson(Map<String, dynamic> json) {
    String text = '';
    if (json.containsKey("text")) {
      text = json["text"]["text"] ?? '';
    }
    return BlockAction(
      actionId: json['actionId'] ?? '',
      text: text,
      type: json['type'] ?? '',
      blockId: json['blockId'] ?? '',
      value: json['value'] ?? '',
      url: json['url'] ?? '',
    );
  }

  @override
  String toString() {
    return "BlockAction(actionId: $actionId text: $text type: $type blockId: $blockId value: $value url: $url)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BlockAction &&
        other.actionId == actionId &&
        other.text == text &&
        other.type == type &&
        other.blockId == blockId &&
        other.value == value &&
        other.url == url;
  }

  @override
  int get hashCode {
    return value.hashCode ^
        actionId.hashCode ^
        text.hashCode ^
        type.hashCode ^
        blockId.hashCode ^
        url.hashCode;
  }
}
