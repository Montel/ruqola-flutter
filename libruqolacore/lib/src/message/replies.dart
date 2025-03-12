/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Replies {
  final List<String> replies;
  Replies({this.replies = const []});

  Replies.defaultValues() : replies = const [];

  factory Replies.fromJson(Map<String, dynamic> json) {
    var repliesJson = json["replies"];
    if (repliesJson != null) {
      final List<String> replies = List<String>.from(repliesJson);
      return Replies(replies: replies);
    }
    return Replies();
  }

  @override
  String toString() {
    return "Replies(replies: $replies)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Replies && other.replies == replies;
  }

  @override
  int get hashCode {
    return replies.hashCode;
  }
}
