/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
class RocketChatException implements Exception {
  final String message;
  RocketChatException(this.message);

  @override
  String toString() {
    return "RocketChatException: $message";
  }
}
