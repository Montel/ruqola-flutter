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
  // TODO parse it
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
/*
  factory CustomUserStatus.fromJson(Map<String, dynamic> json) {
    // TODO
  }
*/
  @override
  bool operator ==(Object other) {
    return other is CustomUserStatus &&
        other.identifier == identifier &&
        other.statusType == statusType &&
        other.name == name;
  }

  @override
  int get hashCode => identifier.hashCode ^ statusType.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'CustomUserStatus(identifier: $identifier, statusType: $statusType, name: $name)';
  }
}
