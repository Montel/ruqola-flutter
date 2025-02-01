/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('NotificationInfo', () {
    test('notification json', () {
      final data = extractJsonData("notification", "notification.json");
      final fields = data["fields"];
      final contents = fields["args"];

      final f = libruqolacore.NotificationInfo.fromJson(contents);

      libruqolacore.NotificationInfo r = libruqolacore.NotificationInfo();
      r.title = 'title';
      r.message = 'pong';
      r.senderId = 'tgrk5CZKgYGiSSqXp';
      r.channelType = 'd';
      r.senderName = 'Laurent';
      r.senderUserName = 'laurent';
      r.roomId = 'tgrk5CZKgYGiSSqXpuKK39zoewTkdacidH';
      r.messageId = 'yfitiEkpGyDAAJ6Eo';
      expect(f, r);
    });
  });
}
