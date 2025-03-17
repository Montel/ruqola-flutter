/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class MessageTranslations {
  Map<String, String> translatedString = {};

  MessageTranslations({this.translatedString = const {}});

  factory MessageTranslations.fromJson(Map<String, dynamic> json) {
    // TODO json["translations"];
    return MessageTranslations();
  }

  @override
  String toString() {
    return "MessageTranslations(translatedString: $translatedString)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageTranslations && other.translatedString == translatedString;
  }

  @override
  int get hashCode {
    return translatedString.hashCode;
  }
}
