/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('Custom User Status Model', () {
    test('Test default values', () {
      final CustomUserStatusModel status = CustomUserStatusModel.defaultValues();
      expect(status.offset, 0);
      expect(status.total, 0);
      expect(status.customUserCount, 0);
      expect(status.customUserStatusList.isEmpty, true);
    });

    test('customuser2.json', () {
      final data = extractJsonData("customuserstatus", "customuser2.json");
      final f = CustomUserStatusModel.fromJson(data);

      List<CustomUserStatus> lstStatus = [];

      {
        final String identifier = "GZHpA5fENrWHRfaoN";
        final String name = "CM";
        final Status statusType = StatusExt.statusFromString('busy');
        final int updatedAt = 1603106197911;
        final CustomUserStatus f = CustomUserStatus(
            identifier: identifier, name: name, statusType: statusType, updatedAt: updatedAt);
        lstStatus.add(f);
      }
      {
        final String identifier = "tygCbhbgCojk8G28G";
        final String name = "Vacation";
        final Status statusType = StatusExt.statusFromString('away');
        final int updatedAt = 1588199612532;
        final CustomUserStatus f = CustomUserStatus(
            identifier: identifier, name: name, statusType: statusType, updatedAt: updatedAt);
        lstStatus.add(f);
      }
      f.customUserStatusList = lstStatus;
    });
  });
}
