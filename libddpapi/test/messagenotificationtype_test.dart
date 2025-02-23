/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libddpapi/libddpapi.dart' as libddpapi;
import 'package:test/test.dart';

void main() {
  group('MessageNotification Test', () {
    test('Test convertStringToNotificationType', () {
      expect(libddpapi.convertStringToNotificationType("added"), libddpapi.NotificationType.added);

      expect(libddpapi.convertStringToNotificationType("ping"), libddpapi.NotificationType.ping);
      expect(libddpapi.convertStringToNotificationType("connected"),
          libddpapi.NotificationType.connected);
      expect(libddpapi.convertStringToNotificationType("error"), libddpapi.NotificationType.error);
      expect(libddpapi.convertStringToNotificationType("added"), libddpapi.NotificationType.added);
      expect(
          libddpapi.convertStringToNotificationType("changed"), libddpapi.NotificationType.changed);
      expect(
          libddpapi.convertStringToNotificationType("removed"), libddpapi.NotificationType.removed);
      expect(libddpapi.convertStringToNotificationType("nosub"), libddpapi.NotificationType.nosub);
      expect(libddpapi.convertStringToNotificationType("ready"), libddpapi.NotificationType.ready);
      expect(
          libddpapi.convertStringToNotificationType("updated"), libddpapi.NotificationType.updated);
      expect(
          libddpapi.convertStringToNotificationType("result"), libddpapi.NotificationType.result);
    });
  });
}
