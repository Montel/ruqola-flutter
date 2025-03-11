/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class MessagePinned {
  final String pinnedBy;
  final bool pinned;

  MessagePinned.defaultValues()
      : pinned = false,
        pinnedBy = '';

  MessagePinned({this.pinnedBy = '', this.pinned = false});

  factory MessagePinned.fromJson(Map<String, dynamic> json) {
    String pinnedBy = '';
    var pinnedObj = json['pinned'];
    if (pinnedObj != null) {
      pinnedBy = pinnedObj['username'] ?? '';
    }
    final bool pinned = json['pinned'] ?? false;
    return MessagePinned(
      pinnedBy: pinnedBy,
      pinned: pinned,
    );
  }

  @override
  String toString() {
    return "MessagePinned(pinnedBy: $pinnedBy pinned: $pinned)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessagePinned && other.pinnedBy == pinnedBy && other.pinned == pinned;
  }

  @override
  int get hashCode {
    return pinnedBy.hashCode ^ pinned.hashCode;
  }
}
