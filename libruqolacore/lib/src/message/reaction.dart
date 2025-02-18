/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Reaction {
  final String reactionName;
  final List<String> userNames;

  Reaction({required this.reactionName, required this.userNames});

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
