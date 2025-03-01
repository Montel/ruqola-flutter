/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libddpapi/src/notification/messagenotificationfields.dart';
import 'package:libddpapi/src/notification/messagenotificationresult.dart';
import 'package:libddpapi/src/notification/messagenotificationtype.dart';
import 'package:libddpapi/src/notification/messagenotificationerror.dart';

class Messagenotification {
  NotificationType messageType = NotificationType.unknown;
  String? id;
  String? collection;
  List<String>? methods;
  List<String>? subs;
  Messagenotificationfields? fields;
  Messagenotificationresult? result;
  Messagenotificationerror? error;

  Messagenotification.fromMap(Map<String, dynamic> json) {
    print("MESSAGE NOTIFICATION $json");

    messageType = convertStringToNotificationType(json["msg"]);
    id = json["id"];
    collection = json["collection"];
    methods = json["methods"] == null ? null : List<String>.from(json["methods"]);

    subs = json["subs"] == null ? null : List<String>.from(json["subs"]);
    fields = json["fields"] == null ? null : Messagenotificationfields.fromMap(json["fields"]);

    var resultJson = json["result"];
    if (resultJson == null) {
      result = null;
    } else {
      // It can return [] => empty
      if (resultJson.isNotEmpty) {
        result = Messagenotificationresult.fromMap(resultJson);
      }
    }

    error = json["error"] == null ? null : Messagenotificationerror.fromMap(json["error"]);
  }

  @override
  String toString() {
    return "Messagenotification(messageType ${messageType.name} collection: $collection, id: $id method $methods subs: $subs fields: $fields error: $error  result: $result)";
  }
}
