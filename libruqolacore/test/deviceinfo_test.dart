/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Device Info', () {
    final info = Deviceinfo();

    test('Test Initial values', () {
      expect(info.identifier.isEmpty, true);
      expect(info.host.isEmpty, true);
      expect(info.sessionId.isEmpty, true);
      expect(info.ip.isEmpty, true);
      expect(info.userId.isEmpty, true);
      expect(info.client.isEmpty, true);
      expect(info.os.isEmpty, true);
      expect(info.loginAtDateTimeStr.isEmpty, true);
      expect(info.loginAt, -1);
    });
  });
}
