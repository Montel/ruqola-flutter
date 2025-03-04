/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Mentions {
  Map<String, String> mentions = <String, String>{};

  Mentions({required this.mentions});
  factory Mentions.fromJson(Map<String, dynamic> json) {
    Map<String, String> mentionsMap = {};
    json.forEach((key, value) {
      if (value is String) {
        mentionsMap[key] = value;
      }
    });
    return Mentions(
      mentions: mentionsMap,
    );
  }

  @override
  String toString() {
    return "Mentions(mentions: $mentions)";
  }
}
