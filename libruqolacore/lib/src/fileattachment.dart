/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import "package:libruqolacore/src/file.dart";
import 'package:collection/collection.dart';

class FileAttachments {
  FileAttachments({
    required this.count,
    required this.offset,
    required this.total,
    required this.files,
  });

  final int count;
  final int offset;
  final int total;
  final List<File> files;

  // Add getter
  int get getTotal => total;

  factory FileAttachments.fromJson(Map<String, dynamic> json) {
    final count = json['count'] as int?;
    final offset = json['offset'] as int?;
    final total = json['total'] as int?;
    // TODO parse it
    final List<File> files = [];
    return FileAttachments(
      count: count ?? 0,
      offset: offset ?? 0,
      total: total ?? 0,
      files: files,
    );
  }

  @override
  String toString() {
    return "FileAttachments(count: $count total: $total offset: $offset files: $files)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();

    return other is FileAttachments &&
        other.count == count &&
        other.total == total &&
        other.offset == offset &&
        listEquality.equals(other.files, files);
  }

  @override
  int get hashCode {
    return count.hashCode ^ total.hashCode ^ offset.hashCode ^ files.hashCode;
  }
}
