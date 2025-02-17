/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Command {
  Command(
      {this.params = '',
      this.commandName = '',
      this.description = '',
      this.providesPreview = false,
      this.clientOnly = false,
      this.permissions = const []});
  List<String> permissions = [];
  String params = '';
  String commandName = '';
  String description = '';
  bool providesPreview = false;
  bool clientOnly = false;

  factory Command.fromJson(Map<String, dynamic> json) {
    final bool providesPreview = json["providesPreview"] ?? false;
    final bool clientOnly = json["clientOnly"] ?? false;
    final String params = json["params"] ?? '';
    String commandResult = json["command"] ?? '';
    final String description = json["description"] ?? '';
    if (commandResult.isNotEmpty) {
      commandResult = '/$commandResult';
    }
    return Command(
        params: params,
        commandName: commandResult,
        description: description,
        providesPreview: providesPreview,
        clientOnly: clientOnly);
  }

  Command.defaultValues()
      : params = '',
        commandName = '',
        description = '',
        providesPreview = false,
        clientOnly = false,
        permissions = const [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Command &&
        other.params == params &&
        other.commandName == commandName &&
        description == other.description &&
        providesPreview == other.providesPreview &&
        clientOnly == other.clientOnly;
  }

  @override
  int get hashCode {
    return params.hashCode ^
        commandName.hashCode ^
        description.hashCode ^
        providesPreview.hashCode ^
        clientOnly.hashCode;
  }

  @override
  String toString() {
    return 'Command(params: $params, commandName: $commandName, description: $description, providesPreview: $providesPreview, clientOnly: $clientOnly)';
  }
}
