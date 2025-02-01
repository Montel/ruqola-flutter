/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class MessageAttachmentField {
  MessageAttachmentField({this.value, this.title});
  String? value;
  String? title;

  MessageAttachmentField.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        "value": value,
        "title": title,
      };

  @override
  String toString() {
    return "value: $value title: $title";
  }
}
