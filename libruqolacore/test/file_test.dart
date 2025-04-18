/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('File', () {
    test('Test File Initial values', () {
      final file = File();
      expect(file.description.isEmpty, true);
      expect(file.userid.isEmpty, true);
      expect(file.filename.isEmpty, true);
      expect(file.mimetype.isEmpty, true);
      expect(file.url.isEmpty, true);
      expect(file.typeGroup.isEmpty, true);
      expect(file.fileIdentifier.isEmpty, true);
      expect(file.path.isEmpty, true);
      expect(file.roomId.isEmpty, true);
    });
  });
}
