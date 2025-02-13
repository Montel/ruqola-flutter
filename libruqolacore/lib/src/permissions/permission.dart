/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Permission {
  List<String> roles = [];
  String identifier = '';
  int updatedAt = -1;

  /*
  int mUpdatedAt = -1;
  List<String> mRolesStr;
  List<String> mRoles;
  String mIdentifier;
  */
/*
  Permission();
  List<String> permissions = [];
  String params = '';
  String commandName = '';
  String description = '';
  String translatedDescription = '';
  String translatedParams = '';
  bool providesPreview = false;
  bool clientOnly = false;

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Command();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Permission &&
        other.params == params &&
        other.commandName == commandName &&
        description == other.description &&
        translatedDescription == other.translatedDescription &&
        translatedParams == other.translatedParams &&
        providesPreview == other.providesPreview &&
        clientOnly == other.clientOnly;
  }

  @override
  int get hashCode {
    return params.hashCode ^
        commandName.hashCode ^
        description.hashCode ^
        translatedDescription.hashCode ^
        translatedParams.hashCode ^
        providesPreview.hashCode ^
        clientOnly.hashCode;
  }

  @override
  String toString() {
    return 'Permission(params: $params, commandName: $commandName, description: $description, translatedDescription: $translatedDescription, translatedParams: $translatedParams, providesPreview: $providesPreview, clientOnly: $clientOnly)';
  }
  */
}
