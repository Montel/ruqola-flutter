/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Messagenotificationresult {
  String? id;
  String? token;
  DateTime? tokenExpires;
  String? type;

  // Remove result when all will be parsed
  late Map<String, dynamic> result;

  Messagenotificationresult.fromMap(Map<String, dynamic> json) {
    result = json;
    id = result['id'];
    token = result['token'];
    tokenExpires = result['tokenExpires'] != null &&
            result['tokenExpires']['\$date'] != null
        ? DateTime.fromMillisecondsSinceEpoch(result['tokenExpires']['\$date'])
        : DateTime.now();

    type = result['type'];
    // TODO add more
  }

  @override
  String toString() {
    return "Messagenotificationresult(result: $result id: $id token:$token tokenExpires:$tokenExpires type:$type)";
  }
}
