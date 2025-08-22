/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

enum NotificationType {
  unknown,
  connected,
  ping,
  error,
  added,
  changed,
  removed,
  nosub,
  updated,
  result,
  ready,
}

NotificationType convertStringToNotificationType(String msgType) {
  return switch (msgType) {
    'ping' => NotificationType.ping,
    'connected' => NotificationType.connected,
    'error' => NotificationType.error,
    'added' => NotificationType.added,
    'changed' => NotificationType.changed,
    'removed' => NotificationType.removed,
    'nosub' => NotificationType.nosub,
    'ready' => NotificationType.ready,
    'updated' => NotificationType.updated,
    'result' => NotificationType.result,
    _ => NotificationType.unknown,
  };
}
