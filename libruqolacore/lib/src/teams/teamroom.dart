/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class TeamRoom {
  final String name;
  final String fname;
  final String identifier;
  final bool autoJoin;

  TeamRoom({
    required this.name,
    required this.fname,
    required this.identifier,
    required this.autoJoin,
  });

  TeamRoom.defaultValues()
      : name = '',
        fname = '',
        identifier = '',
        autoJoin = false;

  factory TeamRoom.fromJson(Map<String, dynamic> json) {
    final String name = json["name"] ?? '';
    final String fname = json["fname"] ?? '';
    final bool autoJoin = json["teamDefault"] ?? false;
    final String identifier = json["_id"] ?? '';

    return TeamRoom(
      name: name,
      fname: fname,
      identifier: identifier,
      autoJoin: autoJoin,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TeamRoom &&
        other.name == name &&
        other.fname == fname &&
        other.identifier == identifier &&
        other.autoJoin == autoJoin;
  }

  @override
  int get hashCode {
    return name.hashCode ^ fname.hashCode ^ identifier.hashCode ^ autoJoin.hashCode;
  }

  @override
  String toString() {
    return 'TeamRoom(name: $name, fname: $fname, identifier: $identifier, autoJoin: $autoJoin)';
  }
}
