/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class PersonalAccessTokenInfo {
  final String lastTokenPart;
  final String name;
  final int createdAt;
  final bool bypassTwoFactor;

  PersonalAccessTokenInfo({
    required this.lastTokenPart,
    required this.name,
    required this.createdAt,
    required this.bypassTwoFactor,
  });

  factory PersonalAccessTokenInfo.fromJson(Map<String, dynamic> json) {
    final name = json["name"] ?? '';
    final lastTokenPart = json["lastTokenPart"] ?? '';
    final bypassTwoFactor = json["bypassTwoFactor"] ?? false;

    final createdAt =
        DateTime.parse(json["createdAt"].toString()).millisecondsSinceEpoch;

    return PersonalAccessTokenInfo(
      name: name,
      lastTokenPart: lastTokenPart,
      createdAt: createdAt,
      bypassTwoFactor: bypassTwoFactor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PersonalAccessTokenInfo &&
        other.lastTokenPart == lastTokenPart &&
        other.name == name &&
        other.createdAt == createdAt &&
        other.bypassTwoFactor == bypassTwoFactor;
  }

  @override
  int get hashCode {
    return lastTokenPart.hashCode ^
        name.hashCode ^
        bypassTwoFactor.hashCode ^
        createdAt.hashCode;
  }

  @override
  String toString() {
    return 'PersonalAccessTokenInfo(lastTokenPart: $lastTokenPart, name: $name, createdAt: $createdAt, bypassTwoFactor: $bypassTwoFactor)';
  }
}
