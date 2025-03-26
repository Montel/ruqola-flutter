/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class CustomEmoji {
  String emojiIdentifier = '';
  String identifier = '';
  String extension = '';
  String name = '';
  String cachedHtml = '';
  List<String> aliases = [];
  int updatedAt = 0;

  CustomEmoji.defaultValues()
      : emojiIdentifier = '',
        identifier = '',
        extension = '',
        name = '',
        cachedHtml = '',
        aliases = [],
        updatedAt = 0;

  CustomEmoji(
      {required this.emojiIdentifier,
      required this.extension,
      required this.name,
      required this.identifier});

  factory CustomEmoji.fromJson(Map<String, dynamic> json) {
    final String identifier = json["_id"] ?? '';
    final String extension = json["extension"] ?? '';
    final String name = json["name"] ?? '';
    final String emojiIdentifier = ':$name:';
    if (json.containsKey("aliases")) {
      var alias = json["aliases"];
      // TODO
    }

    // TODO updateAt + aliases

    return CustomEmoji(
        emojiIdentifier: emojiIdentifier, extension: extension, name: name, identifier: identifier);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomEmoji &&
        other.emojiIdentifier == emojiIdentifier &&
        other.identifier == identifier &&
        other.extension == extension &&
        other.name == name &&
        other.cachedHtml == cachedHtml &&
        other.aliases == aliases &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return emojiIdentifier.hashCode ^
        identifier.hashCode ^
        extension.hashCode ^
        name.hashCode ^
        aliases.hashCode ^
        updatedAt.hashCode ^
        cachedHtml.hashCode;
  }

  @override
  String toString() {
    return 'CustomEmoji(emojiIdentifier: $emojiIdentifier, identifier: $identifier, extension: $extension, name: $name, aliases: $aliases, updatedAt: $updatedAt, cachedHtml: $cachedHtml)';
  }
}
