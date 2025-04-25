/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('Role Info', () {
    test('Test Initial Role Info values', () {
      final role = libruqolacore.Role.defaultValues();
      expect(role.isLeader, false);
      expect(role.isModerator, false);
      expect(role.isOwner, false);
      expect(role.userName.isEmpty, true);
      expect(role.userId.isEmpty, true);
      expect(role.isValid(), false);
    });

    test('Test Role Valid', () {
      libruqolacore.Role role = libruqolacore.Role.defaultValues();
      expect(role.isValid(), false);
      role.isOwner = true;
      expect(role.isValid(), false);
      role.isOwner = false;
      expect(role.isValid(), false);

      role.isLeader = true;
      expect(role.isValid(), false);
      role.isLeader = false;
      expect(role.isValid(), false);

      role.isModerator = true;
      expect(role.isValid(), false);
      role.isModerator = false;
      expect(role.isValid(), false);

      role.userId = "foo";
      expect(role.isValid(), true);
      role.userId = "";
      expect(role.isValid(), false);
    });

    test('Test Has Role', () {
      libruqolacore.Role role = libruqolacore.Role.defaultValues();
      role.userId = "foo";
      expect(role.hasARole(), false);
      role.isOwner = true;
      expect(role.hasARole(), true);
      role.isLeader = true;
      expect(role.hasARole(), true);
      role.isModerator = true;
      expect(role.hasARole(), true);
      role.isOwner = false;
      expect(role.hasARole(), true);
      role.isLeader = false;
      expect(role.hasARole(), true);
      role.isModerator = false;
      expect(role.hasARole(), false);
    });

    test('role1.json', () {
      final data = extractJsonData("rolesforroom", "role1.json");
      final f = libruqolacore.Role.fromJson(data);

      libruqolacore.Role expectRoleInfo = libruqolacore.Role.defaultValues();
      expectRoleInfo.userId = "id1";
      expectRoleInfo.isOwner = true;
      expectRoleInfo.isModerator = true;
      expectRoleInfo.isLeader = true;
      expectRoleInfo.userName = "bla";

      expect(f, expectRoleInfo);
    });

    test('role2.json', () {
      final data = extractJsonData("rolesforroom", "role2.json");
      final f = libruqolacore.Role.fromJson(data);

      libruqolacore.Role expectRoleInfo = libruqolacore.Role.defaultValues();
      expectRoleInfo.userId = "id2";
      expectRoleInfo.isOwner = true;
      expectRoleInfo.isModerator = false;
      expectRoleInfo.isLeader = true;
      expectRoleInfo.userName = "bla";

      expect(f, expectRoleInfo);
    });
  });

  // TODO add test loading elements
}
