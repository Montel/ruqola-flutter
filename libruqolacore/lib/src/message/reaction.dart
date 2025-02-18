/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Reaction {
  final String reactionName;
  final List<String> userNames;

  Reaction({required this.reactionName, required this.userNames});

  String convertedUsersNameAtToolTip() {
    if (userNames.isEmpty) {
      return '';
    } else if (userNames.length == 1) {
      return "${userNames[0]} reacted with $reactionName";
    } else {
      String notificationStr = '';
      for (int i = 0, total = userNames.length; i < total; ++i) {
        String user = userNames[i];
        if (i == 0) {
          notificationStr = user;
        } else if (i < (total - 1)) {
          notificationStr = "$notificationStr, $user";
        } else {
          notificationStr = "$notificationStr and $user";
        }
      }
      return "$notificationStr reacted with $reactionName";
    }
  }

  @override
  String toString() {
    return "Reaction(reactionName: $reactionName userNames: $userNames)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Reaction &&
        other.reactionName == reactionName &&
        other.userNames == userNames;
  }

  @override
  int get hashCode {
    return reactionName.hashCode ^ userNames.hashCode;
  }
}
