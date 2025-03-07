/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('DownloadAppsLanguagesInfo Infos', () {
    test('Test Initial values', () {
      final info = DownloadAppsLanguagesInfo.defaultValues();
      expect(info.languageMap.isEmpty, true);
    });
  });
}
