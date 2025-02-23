/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('statistics info', () {
    test('check default values', () {
      final info = librocketchatrestapi.StatisticsInfo(false);
      librocketchatrestapi.Statistics statistics = librocketchatrestapi.Statistics(info);
      expect(info.refresh, false);
      expect(statistics.canStart(), false);
      expect(statistics.requireHttpAuthentication(), true);

      expect(statistics.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/statistics?refresh=false'));
    });

    test('check refresh true', () {
      final info = librocketchatrestapi.StatisticsInfo(true);
      librocketchatrestapi.Statistics statistics = librocketchatrestapi.Statistics(info);
      expect(info.refresh, true);
      expect(statistics.canStart(), false);
      expect(statistics.requireHttpAuthentication(), true);

      expect(statistics.url("https://www.kde.org"),
          Uri.parse('https://www.kde.org/api/v1/statistics?refresh=true'));
    });
  });
}
