/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

enum TypePreview {
  unknown,
  image,
  video,
  audio,
  text,
  other,
}

TypePreview typePreviewFromString(String str) {
  if (str == "image") {
    return TypePreview.image;
  } else if (str == "video") {
    return TypePreview.video;
  } else if (str == "audio") {
    return TypePreview.audio;
  } else if (str == "text") {
    return TypePreview.text;
  } else if (str == "other") {
    return TypePreview.other;
  } else {
    print("Unknown type preview: $str");
  }
  return TypePreview.unknown;
}

class PreviewCommand {
  final String id;
  final String value;
  final TypePreview type;

  PreviewCommand({required this.id, required this.value, required this.type});

  factory PreviewCommand.fromJson(Map<String, dynamic> json) {
    final TypePreview type = typePreviewFromString(json["type"] ?? '');
    return PreviewCommand(id: json["id"] ?? '', value: json["value"] ?? '', type: type);
  }

  bool isValid() {
    return id.isNotEmpty && value.isNotEmpty && type != TypePreview.unknown;
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
