/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Channel {
  final String fname;
  final String name;
  final String identifier;

  Channel.defaultValues()
      : fname = '',
        name = '',
        identifier = '';
  Channel({required this.fname, required this.name, required this.identifier});
  factory Channel.fromJson(Map<String, dynamic> json) {
    final String name = json["name"] ?? '';
    final String fname = json["fname"] ?? '';
    final String identifier = json["_id"] ?? '';
    return Channel(name: name, fname: fname, identifier: identifier);
  }

  @override
  String toString() {
    return "Channel(fname: $fname, name: $name, identifier: $identifier)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Channel &&
        other.fname == fname &&
        other.name == name &&
        other.identifier == identifier;
  }

  @override
  int get hashCode {
    return fname.hashCode ^ name.hashCode ^ identifier.hashCode;
  }
}
