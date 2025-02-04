/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class MessageAttachmentField {
  final String value;
  final String title;
  MessageAttachmentField({this.value = '', this.title = ''});

  MessageAttachmentField.fromJson(Map<String, dynamic> json)
      : value = json['value'] ?? '',
        title = json['title'] ?? '';

  Map<String, dynamic> toJson() => {
        "value": value,
        "title": title,
      };

  @override
  String toString() {
    return "value: $value title: $title";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageAttachmentField &&
        other.value == value &&
        other.title == title;
  }

  @override
  int get hashCode {
    return value.hashCode ^ title.hashCode;
  }
}
