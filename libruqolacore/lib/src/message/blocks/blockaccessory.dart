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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is BlockAccessory &&
        other.text == text &&
        other.value == value &&
        other.actionId == actionId &&
        other.type == type;
  }

  @override
  int get hashCode {
    return value.hashCode ^ text.hashCode ^ actionId.hashCode ^ type.hashCode;
  }

  @override
  String toString() {
    return "BlockAccessory(text: $text, value: $value, actionId: $actionId, type: $type, options: $options)";
  }
}
