/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Banner info', () {
    test('Test Initial values', () {
      final bannerinfo = BannerInfo.defaultValues();
      expect(bannerinfo.textArguments.isEmpty, true);
      expect(bannerinfo.text.isEmpty, true);
      expect(bannerinfo.title.isEmpty, true);
      expect(bannerinfo.link.isEmpty, true);
      expect(bannerinfo.identifier.isEmpty, true);
      expect(bannerinfo.priority, -1);
      expect(bannerinfo.read, false);
    });
  });
}
