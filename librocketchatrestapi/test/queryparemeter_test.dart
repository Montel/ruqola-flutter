/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('queryparameter', () {
    test('check values', () {
      librocketchatrestapi.Queryparameter w = librocketchatrestapi.Queryparameter();
      expect(w.count, 0);
      expect(w.useSyntaxRc70, false);
      expect(w.offset, 0);
    });
  });
}
