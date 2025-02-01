/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libddpapi/libddpapi.dart' as libddpapi;
import 'package:test/test.dart';

void main() {
  group('ddpclientevent', () {
    test('Test ResulType path', () {
      expect(libddpapi.ResulType.getRooms.path, 'rooms/get');
      expect(libddpapi.ResulType.getSubscriptions.path, 'subscriptions/get');
      expect(libddpapi.ResulType.unknown.path, '');
      expect(libddpapi.ResulType.login.path, '');
    });
  });
}
