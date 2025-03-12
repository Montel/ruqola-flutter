/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/message/blocks/blockaccessoryoption.dart';

enum AccessoryType {
  unknown,
  button,
  overflow,
  // TODO add more
}

class BlockAccessory {
  String actionId = '';
  String value = '';
  String text = '';
  AccessoryType type = AccessoryType.unknown;
  List<BlockAccessoryOption> options = [];

  BlockAccessory(
      {required this.actionId,
      required this.value,
      required this.text,
      required this.type,
      required this.options});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is BlockAccessory &&
        other.text == text &&
        other.value == value &&
        other.actionId == actionId &&
        other.type == type &&
        other.options == options;
  }

  @override
  int get hashCode {
    return value.hashCode ^ text.hashCode ^ actionId.hashCode ^ type.hashCode ^ options.hashCode;
  }

  factory BlockAccessory.fromJson(Map<String, dynamic> json) {
    String value = json["value"] ?? '';
    String actionId = json["actionId"] ?? '';
    String text = '';
    if (json["text"] != null) {
      text = json["text"]["text"] ?? '';
    }
    AccessoryType type =
        AccessoryType.unknown; // = convertAccessoryTypeToEnum(o["type"_L1].toString());

    List<BlockAccessoryOption> options = List<BlockAccessoryOption>.from(json["options"]);
    return BlockAccessory(
        value: value, actionId: actionId, text: text, options: options, type: type);
  }

  @override
  String toString() {
    return "BlockAccessory(text: $text, value: $value, actionId: $actionId, type: $type, options: $options)";
  }
}
