/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('TeamCompleter info', () {
    test('Test Initial TeamCompleter values', () {
      final libruqolacore.TeamCompleter teaminfo = libruqolacore.TeamCompleter.defaultValues();
      expect(teaminfo.fname.isEmpty, true);
      expect(teaminfo.teamId.isEmpty, true);
      expect(teaminfo.name.isEmpty, true);
    });
  });
}
