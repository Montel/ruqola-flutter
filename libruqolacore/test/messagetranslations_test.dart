/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/message/messagetranslations.dart';
import 'package:test/test.dart';

void main() {
  group('MessageTranslations', () {
    test('Test Initial values', () {
      final MessageTranslations translations = MessageTranslations();
      expect(translations.translatedString.isEmpty, true);
    });
  });
}
