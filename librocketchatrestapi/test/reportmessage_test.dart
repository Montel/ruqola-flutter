/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart'
    as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('report message', () {
    test('check default values', () {
      librocketchatrestapi.ReportMessageInfo info =
          librocketchatrestapi.ReportMessageInfo("messageId1", "description");
      expect(info.description, "description");
      expect(info.messageId, "messageId1");

      librocketchatrestapi.ReportMessage reportMessage =
          librocketchatrestapi.ReportMessage(info);
      expect(reportMessage.canStart(), false);
      expect(reportMessage.requireHttpAuthentication(), true);
      expect(reportMessage.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/chat.reportMessage'));
    });
    // TODO compare json
  });
}
