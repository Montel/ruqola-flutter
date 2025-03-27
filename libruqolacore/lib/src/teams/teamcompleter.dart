/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class TeamCompleter {
  final String name;
  final String fname;
  final String teamId;

  TeamCompleter({
    required this.name,
    required this.fname,
    required this.teamId,
  });

  TeamCompleter.defaultValues()
      : teamId = '',
        name = '',
        fname = '';

  factory TeamCompleter.fromJson(Map<String, dynamic> json) {
    final String name = json["name"] ?? '';
    final String fname = json["fname"] ?? '';
    final String teamId = json["teamId"] ?? '';

    return TeamCompleter(
      name: name,
      fname: fname,
      teamId: teamId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TeamCompleter &&
        other.name == name &&
        other.fname == fname &&
        other.teamId == teamId;
  }

  @override
  int get hashCode {
    return name.hashCode ^ fname.hashCode ^ teamId.hashCode;
  }

  @override
  String toString() {
    return 'TeamCompleter(name: $name, fname: $fname, teamId: $teamId)';
  }
}
