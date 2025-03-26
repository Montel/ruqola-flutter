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
}

extension AccessoryTypeExt on AccessoryType {
  String get name {
    switch (this) {
      case AccessoryType.unknown:
        return '';
      case AccessoryType.button:
        return 'button';
      case AccessoryType.overflow:
        return 'overflow';
    }
  }

  static AccessoryType fromName(String name) {
    switch (name) {
      case '':
        return AccessoryType.unknown;
      case 'button':
        return AccessoryType.button;
      case 'overflow':
        return AccessoryType.overflow;
      default:
        throw ArgumentError('Invalid AccessoryType name: $name');
    }
  }
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
    final String value = json["value"] ?? '';
    final String actionId = json["actionId"] ?? '';
    String text = '';
    if (json["text"] != null) {
      text = json["text"]["text"] ?? '';
    }
    final AccessoryType type = AccessoryTypeExt.fromName(json["type"] ?? '');

    final optionsJson = json["options"];
    List<BlockAccessoryOption> options = [];
    if (optionsJson != null) {
      for (var entry in optionsJson) {
        BlockAccessoryOption opt = BlockAccessoryOption.fromJson(entry);
        options.add(opt);
      }
    }
    return BlockAccessory(
        value: value, actionId: actionId, text: text, options: options, type: type);
  }

  @override
  String toString() {
    return "BlockAccessory(text: $text, value: $value, actionId: $actionId, type: $type, options: $options)";
  }
}
