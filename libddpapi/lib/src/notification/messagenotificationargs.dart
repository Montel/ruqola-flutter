/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Messagenotificationargs {
  List<dynamic>? args;
  Messagenotificationargs.fromMap(List<dynamic> json) {
    args = json;
  }

  @override
  String toString() {
    return "args: $args";
  }
}
