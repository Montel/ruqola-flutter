/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class PreviewCommand {
  final String id;
  final String value;
  final String type;

  PreviewCommand({required this.id, required this.value, required this.type});

  factory PreviewCommand.fromJson(Map<String, dynamic> json) {
    return PreviewCommand(
        id: json["id"] ?? '', value: json["value"] ?? '', type: json["type"] ?? '');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PreviewCommand && id == other.id && value == other.value && type == other.type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ value.hashCode ^ type.hashCode;
  }
}
