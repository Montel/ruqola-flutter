/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libddpapi/src/notification/messagenotificationargs.dart';

class Messagenotificationfields {
  String? eventName;
  String? userName;
  Messagenotificationargs? args;
  Messagenotificationfields.fromMap(Map<String, dynamic> json) {
    eventName = json["eventName"];
    userName = json["username"];
    args = json["args"] == null
        ? null
        : Messagenotificationargs.fromMap(json["args"]);
  }

  @override
  String toString() {
    return "Messagenotificationfields(eventName: $eventName args: $args username: $userName)";
  }
}
