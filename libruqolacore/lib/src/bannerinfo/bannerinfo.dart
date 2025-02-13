/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class BannerInfo {
  final List<String> textArguments;
  final String text;
  final String title;
  final String link;
  final String identifier;
  final int priority;
  final bool read;

  BannerInfo({
    required this.textArguments,
    required this.text,
    required this.title,
    required this.link,
    required this.identifier,
    this.priority = -1,
    this.read = false,
  });
  BannerInfo.defaultValues()
      : textArguments = [],
        text = '',
        title = '',
        link = '',
        identifier = '',
        priority = -1,
        read = false;

  @override
  String toString() {
    return 'BannerInfo(textArguments: $textArguments, text: $text, title: $title, link: $link, identifier: $identifier, priority: $priority, read: $read)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is BannerInfo &&
        other.textArguments == textArguments &&
        other.text == text &&
        other.title == title &&
        other.link == link &&
        other.identifier == identifier &&
        other.priority == priority &&
        other.read == read;
  }

  @override
  int get hashCode {
    return textArguments.hashCode ^
        text.hashCode ^
        title.hashCode ^
        link.hashCode ^
        identifier.hashCode ^
        priority.hashCode ^
        read.hashCode;
  }

  factory BannerInfo.fromJson(Map<String, dynamic> json) {
    return BannerInfo(
      textArguments: List<String>.from(json['textArguments']),
      text: json['text'] ?? '',
      title: json['title'] ?? '',
      link: json['link'] ?? '',
      identifier: json['id'] ?? '',
      priority: json['mPriority'] ?? -1,
      read: json['mRead'] ?? false,
    );
  }
}
