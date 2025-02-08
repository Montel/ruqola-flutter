/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

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

    test('empty json', () {
      final data = extractJsonData("deviceinfo", "deviceinfo-empty.json");
      final f = Deviceinfo.fromJson(data);
      expect(f, Deviceinfo());
    });
    test('test1 json', () {
      final data = extractJsonData("deviceinfo", "deviceinfo1.json");
      final f = Deviceinfo.fromJson(data);
      Deviceinfo expected = Deviceinfo();
      expected.host = "chat.kde.org";
      expected.identifier = "iy78NiKzd";
      expected.ip = "179.4.8.1";
      expected.sessionId = "iKzd";
      expected.userId = "acidH";
      // TODO expected.setLoginAt(1660405994979);
      expect(f, expected);
    });
    test('test2 json', () {
      final data = extractJsonData("deviceinfo", "deviceinfo2.json");
      final f = Deviceinfo.fromJson(data);
      Deviceinfo expected = Deviceinfo();
      expected.host = "chat.kde.org";
      expected.identifier = "87pMW";
      expected.ip = "1.7.6.11";
      expected.sessionId = "87pMW";

      expected.userId = "dacidH";
      expected.client = "Firefox";
      expected.os = "Linux x86_64";
      // TODO expected.setLoginAt(1660404361954);
      expect(f, expected);
    });
  });
}
