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
    final info = Deviceinfos();

    test('Test Initial values', () {
      expect(info.listDevices.isEmpty, true);
      expect(info.deviceInfosCount, 0);
      expect(info.offset, 0);
      expect(info.total, 0);
    });
/*
    test('empty json', () {
      final data = extractJsonData("deviceinfo", "deviceinfo-empty.json");
      final f = Deviceinfo.fromJson(data);
      expect(f, Deviceinfo());
    });
    */
  });
}
