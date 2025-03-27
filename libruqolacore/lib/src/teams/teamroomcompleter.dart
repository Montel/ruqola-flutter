/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class TeamRoomCompleter {
  final String name;
  final String fname;
  final String identifier;

  TeamRoomCompleter({
    required this.name,
    required this.fname,
    required this.identifier,
  });

  TeamRoomCompleter.defaultValues()
      : identifier = '',
        name = '',
        fname = '';

  factory TeamRoomCompleter.fromJson(Map<String, dynamic> json) {
    final String name = json["name"] ?? '';
    final String fname = json["fname"] ?? '';
    final String identifier = json["_id"] ?? '';

    return TeamRoomCompleter(
      name: name,
      fname: fname,
      identifier: identifier,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TeamRoomCompleter &&
        other.name == name &&
        other.fname == fname &&
        other.identifier == identifier;
  }

  @override
  int get hashCode {
    return name.hashCode ^ fname.hashCode ^ identifier.hashCode;
  }

  @override
  String toString() {
    return 'TeamRoomCompleter(name: $name, fname: $fname, identifier: $identifier)';
  }
}
