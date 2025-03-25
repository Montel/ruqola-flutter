/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('Status Model', () {
    test('Test Initial Status Model values', () {
      libruqolacore.StatusModel model = libruqolacore.StatusModel();
      expect(model.listStatus.length, 5);
      expect(model.currentStatus, libruqolacore.Status.unknown);
    });

    test('Test sortedList', () {
      libruqolacore.StatusModel model = libruqolacore.StatusModel();

      final List<libruqolacore.DisplayStatusInfo> lstInfo = model.sortedList();
      expect(lstInfo.first.order, 20);
      expect(lstInfo.elementAt(4).order, -1);
    });
  });

  group('DisplayStatusInfo', () {
    test('Test Initial DisplayStatusInfo values', () {
      libruqolacore.DisplayStatusInfo info = libruqolacore.DisplayStatusInfo();
      expect(info.displayText.isEmpty, true);
      expect(info.statusStr.isEmpty, true);
      expect(info.iconName.isEmpty, true);
      expect(info.status, libruqolacore.Status.unknown);
      expect(info.order, 0);
    });
  });
}
