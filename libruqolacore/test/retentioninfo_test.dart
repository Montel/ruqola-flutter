/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:libruqolacore/src/retentioninfo.dart';
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('Retention Info', () {
    test('Test Initial Retention Info values', () {
      final retentionInfo = libruqolacore.RetentionInfo();
      expect(retentionInfo.maxAge, -1);
      expect(retentionInfo.enabled, false);
      expect(retentionInfo.excludePinned, false);
      expect(retentionInfo.filesOnly, false);
      expect(retentionInfo.overrideGlobal, false);
    });

    test('retention.json', () {
      final data = extractJsonData("retention", "retention.json");
      final result = RetentionInfo.fromJson(data);

      final expectValues = RetentionInfo(
        maxAge: 32,
        enabled: true,
        excludePinned: false,
        filesOnly: true,
        overrideGlobal: true,
      );
      expect(result, expectValues);
    });
  });
}
