/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class BlockAccessoryOption {
  final String text;
  final String value;

  @override
  String toString() {
    return "BlockAccessoryOption(text: $text value: $value)";
  }

  BlockAccessoryOption.defaultValues()
      : value = '',
        text = '';

  BlockAccessoryOption({required this.text, required this.value});

  factory BlockAccessoryOption.fromJson(Map<String, dynamic> json) {
    String value = json["value"] ?? '';
    String text = '';
    if (json["text"] != null) {
      text = json["text"]["text"] ?? '';
    }
    return BlockAccessoryOption(text: text, value: value);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is BlockAccessoryOption && other.text == text && other.value == value;
  }

  @override
  int get hashCode {
    return value.hashCode ^ text.hashCode;
  }
}
