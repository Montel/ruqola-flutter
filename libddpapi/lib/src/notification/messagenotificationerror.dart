/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Messagenotificationerror {
  String? message;
  int? error;
  String? reason;

  Messagenotificationerror.fromMap(Map<String, dynamic> json) {
    message = json["message"];
    error = json["error"];
    reason = json["reason"];
  }

  @override
  String toString() {
    return "Messagenotificationerror(message: $message error: $error reason: $reason)";
  }
}
