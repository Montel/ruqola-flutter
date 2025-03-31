/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Discussion {
  final String description;
  final String parentRoomId;
  final String discussionRoomId;
  final String fname;
  final String userName;
  /*
    QString mLastMessageDateTimeStr;
    QString mTimeStampDateTimeStr;
    int mNumberMessages = 0;
    qint64 mLastMessage = -1;
    qint64 mTimeStamp = -1;
*/
  Discussion.defaultValues()
      : description = '',
        parentRoomId = '',
        discussionRoomId = '',
        fname = '',
        userName = '';

  Discussion({
    required this.description,
    required this.parentRoomId,
    required this.discussionRoomId,
    required this.fname,
    required this.userName,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Discussion &&
        other.description == description &&
        other.parentRoomId == parentRoomId &&
        other.discussionRoomId == discussionRoomId &&
        other.fname == fname &&
        other.userName == userName;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        parentRoomId.hashCode ^
        discussionRoomId.hashCode ^
        fname.hashCode ^
        userName.hashCode;
  }

  @override
  String toString() {
    return 'Discussion(description: $description, parentRoomId: $parentRoomId, discussionRoomId: $discussionRoomId, fname: $fname, userName: $userName)';
  }
}
