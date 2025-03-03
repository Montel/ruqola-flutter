/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/commands/previewcommand.dart';

List<PreviewCommand> fromJson(Map<String, dynamic> json) {
  List<PreviewCommand> commands = [];
  var previewObj = json["preview"];
  if (previewObj != null) {
    var items = previewObj["items"];
    if (items != null) {
      for (var i in items) {
        var command = PreviewCommand.fromJson(i);
        if (command.isValid()) {
          commands.add(command);
        }
      }
    }
  }
  return commands;
}
