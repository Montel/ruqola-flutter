/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';

class SharedValue with ChangeNotifier {
  static final ValueNotifier<String> currentRoomId = ValueNotifier<String>("");
  static final ValueNotifier<String> filterChannel = ValueNotifier<String>("");
}
