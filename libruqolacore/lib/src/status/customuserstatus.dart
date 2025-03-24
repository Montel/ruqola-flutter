/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/src/user.dart';

class CustomUserStatus {
  final String identifier;
  final Status statusType;
  final String name;
  final int updatedAt;

  CustomUserStatus(
      {required this.identifier,
      required this.statusType,
      required this.name,
      required this.updatedAt});

  CustomUserStatus.defaultValues()
      : identifier = '',
        statusType = Status.unknown,
        name = '',
        updatedAt = -1;

  factory CustomUserStatus.fromJson(Map<String, dynamic> json) {
    final String identifier = json["_id"] ?? '';
    final String name = json["name"] ?? '';
    final Status statusType = StatusExt.statusFromString(json["statusType"] ?? '');
    final int updatedAt = DateTime.parse(json['_updatedAt'] ?? '').millisecondsSinceEpoch;

    return CustomUserStatus(
        identifier: identifier, name: name, statusType: statusType, updatedAt: updatedAt);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomUserStatus &&
        other.identifier == identifier &&
        other.statusType == statusType &&
        other.name == name &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode =>
      identifier.hashCode ^ statusType.hashCode ^ name.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'CustomUserStatus(identifier: $identifier, statusType: $statusType, name: $name, updatedAt: $updatedAt)';
  }
}
