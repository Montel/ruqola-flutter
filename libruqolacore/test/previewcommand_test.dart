/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Preview Command', () {
    test('Test default Values', () {
      PreviewCommand previewCommand = PreviewCommand.defaultValues();
      expect(previewCommand.id, '');
      expect(previewCommand.value, '');
      expect(previewCommand.type, TypePreview.unknown);
      expect(previewCommand.isValid(), false);
    });
  });
}
