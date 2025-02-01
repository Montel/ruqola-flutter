/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('FileAttachment', () {
    test('empty json', () {
      final data =
          extractJsonData("fileattachments", "fileattachments-empty.json");
      final f = libruqolacore.FileAttachments.fromJson(data);
      expect(f.count, 0);
      expect(f.total, 0);
      expect(f.offset, 0);
      expect(f.files.isEmpty, true);
    });
  });
}
