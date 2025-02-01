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
  if (msgType == 'ping') {
    return NotificationType.ping;
  } else if (msgType == 'connected') {
    return NotificationType.connected;
  } else if (msgType == 'error') {
    return NotificationType.error;
  } else if (msgType == 'added') {
    return NotificationType.added;
  } else if (msgType == 'changed') {
    return NotificationType.changed;
  } else if (msgType == 'removed') {
    return NotificationType.removed;
  } else if (msgType == 'nosub') {
    return NotificationType.nosub;
  } else if (msgType == 'ready') {
    return NotificationType.ready;
  } else if (msgType == 'updated') {
    return NotificationType.updated;
  } else if (msgType == 'result') {
    return NotificationType.result;
  } else {
    return NotificationType.unknown;
  }
}
