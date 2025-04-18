/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class File {
  File({
    this.userid = '',
    this.description = '',
    this.filename = '',
    this.mimetype = '',
    this.url = '',
    this.typeGroup = '',
    this.fileIdentifier = '',
    this.path = '',
    this.roomId = '',
  });
  String userid;
  String description;
  String filename;
  String mimetype;
  String url;
  String typeGroup;
  String fileIdentifier;
  String path;
  String roomId;

  /// https://codewithandrea.com/articles/parse-json-dart/
  factory File.fromJson(Map<String, dynamic> json) {
    final userid = json['userId'] ?? '';
    final description = json['description'] ?? '';
    final filename = json['name'] ?? '';
    final mimetype = json['type'] ?? '';
    final url = json['url'] ?? '';
    final fileIdentifier = json['_id'] ?? '';
    final typeGroup = json['typeGroup'] ?? '';
    final path = json['path'] ?? '';
    final roomId = json['rid'] ?? '';
    return File(
      userid: userid,
      description: description,
      filename: filename,
      mimetype: mimetype,
      url: url,
      typeGroup: typeGroup,
      fileIdentifier: fileIdentifier,
      path: path,
      roomId: roomId,
    );
  }

  @override
  String toString() {
    return "File(roomId: $roomId\nuserId: $userid\ndescription: $description filename: $filename mimetype: $mimetype url: $url fileIdentifier: $fileIdentifier typeGroup: $typeGroup path: $path)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is File &&
        other.userid == userid &&
        other.description == description &&
        other.filename == filename &&
        other.mimetype == mimetype &&
        other.url == url &&
        other.typeGroup == typeGroup &&
        other.fileIdentifier == fileIdentifier &&
        other.roomId == roomId &&
        other.path == path;
  }

  @override
  int get hashCode {
    return userid.hashCode ^
        description.hashCode ^
        filename.hashCode ^
        mimetype.hashCode ^
        url.hashCode ^
        typeGroup.hashCode ^
        fileIdentifier.hashCode ^
        roomId.hashCode ^
        path.hashCode;
  }
}
