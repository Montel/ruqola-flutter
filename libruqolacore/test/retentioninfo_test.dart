/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  final retentionInfo = libruqolacore.RetentionInfo();
  group('Retention Info', () {
    test('Test Initial Retention Info values', () {
      expect(retentionInfo.maxAge, -1);
      expect(retentionInfo.enabled, false);
      expect(retentionInfo.excludePinned, false);
      expect(retentionInfo.filesOnly, false);
      expect(retentionInfo.overrideGlobal, false);
    });
  });

  // TODO add test loading elements
}
