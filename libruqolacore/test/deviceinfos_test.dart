/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('Device Infos', () {
    final info = Deviceinfos.defaultValues();

    test('Test Initial values', () {
      expect(info.listDevices.isEmpty, true);
      expect(info.deviceInfosCount, 0);
      expect(info.offset, 0);
      expect(info.total, 0);
    });
    test('empty json', () {
      final data = extractJsonData("deviceinfos", "deviceinfos-empty.json");
      final f = Deviceinfos.fromJson(data);
      expect(f, Deviceinfos.defaultValues());
    });

    test('deviceinfos-1-element.json', () {
      final data = extractJsonData("deviceinfos", "deviceinfos-1-element.json");
      final f = Deviceinfos.fromJson(data);
      List<Deviceinfo> listDevices2 = [];
      {
        Deviceinfo expected = Deviceinfo();
        expected.host = "kde.com";
        expected.identifier = "LAS7ingGiy78NiKzd";
        expected.ip = "279.4.8.1";
        expected.sessionId = "Giy78NiKzd";
        expected.userId = "uKK39zoewTkd";
        expected.loginAt = 1660405994979;
        listDevices2.add(expected);
      }
      {
        Deviceinfo expected = Deviceinfo();
        expected.host = "kde.com";
        expected.identifier = "mxEY4NmYtise87pMW";
        expected.ip = "1.1.1.2";
        expected.sessionId = "mxEse87pMW";
        expected.userId = "uKKkdacidH";
        expected.loginAt = 1660404361954;
        expected.client = "Firefox";
        expected.os = "Linux x86_64";
        listDevices2.add(expected);
      }
      final expectDeviceInfos = Deviceinfos(
        listDevices: listDevices2,
        offset: 0,
        total: 2,
        deviceInfosCount: 50,
      );
      expect(f, expectDeviceInfos);
    });
  });
}
