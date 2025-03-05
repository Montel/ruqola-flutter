/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class MessageStarred {
  final bool isStarred;

  MessageStarred({this.isStarred = false});

  MessageStarred.fromJson(Map<String, dynamic> json) : isStarred = json['starred'] ?? false;

  @override
  String toString() {
    return "MessageStarred(isStarred: $isStarred)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageStarred && other.isStarred == isStarred;
  }

  @override
  int get hashCode {
    return isStarred.hashCode;
  }
}
