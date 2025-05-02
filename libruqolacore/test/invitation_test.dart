/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Invitation', () {
    test('Test Initial values', () {
      Invitation invitation = Invitation.defaultValues();
      expect(invitation.identifier.isEmpty, true);
      expect(invitation.roomId.isEmpty, true);
      expect(invitation.uses, 0);
      expect(invitation.maxUses, 0);
    });
  });
}
