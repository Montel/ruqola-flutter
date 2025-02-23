/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'dart:convert';
import 'dart:io';

dynamic extractJsonData(String directory, String jsonName) {
  final path = "${Directory.current.path}${Platform.pathSeparator}test/data/$directory/$jsonName";
  final file = File(path);

  final map = jsonDecode(file.readAsStringSync());
  return map;
}
