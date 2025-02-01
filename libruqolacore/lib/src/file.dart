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
  });
  String userid;
  String description;
  String filename;
  String mimetype;
  String url;
  String typeGroup;
  String fileIdentifier;

  /// https://codewithandrea.com/articles/parse-json-dart/
  factory File.fromJson(Map<String, dynamic> json) {
    final userid = json['userId'] ?? '';
    final description = json['description'] ?? '';
    final filename = json['name'] ?? '';
    final mimetype = json['type'] ?? '';
    final url = json['url'] ?? '';
    final fileIdentifier = json['_id'] ?? '';
    final typeGroup = json['typeGroup'] ?? '';
    return File(
      userid: userid,
      description: description,
      filename: filename,
      mimetype: mimetype,
      url: url,
      typeGroup: typeGroup,
      fileIdentifier: fileIdentifier,
    );
  }

  @override
  String toString() {
    return "File(userId: $userid\ndescription: $description filename: $filename mimetype: $mimetype url: $url fileIdentifier: $fileIdentifier typeGroup: $typeGroup)";
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
        other.fileIdentifier == fileIdentifier;
  }

  @override
  int get hashCode {
    return userid.hashCode ^
        description.hashCode ^
        filename.hashCode ^
        mimetype.hashCode ^
        url.hashCode ^
        typeGroup.hashCode ^
        fileIdentifier.hashCode;
  }
}
