/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';
import 'libruqolacoretest.dart';

void main() {
  group('User', () {
    final user = libruqolacore.User();

    test('Test User Initial values', () {
      expect(user.userid.isEmpty, true);
      expect(user.name?.isEmpty, true);
      expect(user.username?.isEmpty, true);
      expect(user.statusText?.isEmpty, true);
      expect(user.bio?.isEmpty, true);
      expect(user.nickname?.isEmpty, true);
      expect(user.active, true);
      expect(user.requirePasswordChange, false);
      expect(user.typeUser.isEmpty, true);
      expect(user.roles.isEmpty, true);
    });

    test('Compare enum Status Value', () {
      expect(libruqolacore.Status.away.name, "away");
      expect(libruqolacore.Status.offline.name, "offline");
      expect(libruqolacore.Status.online.name, "online");
      expect(libruqolacore.Status.busy.name, "busy");
      expect(libruqolacore.Status.unknown.name, "unknown");
    });

    test('userrestapi json', () {
      final data = extractJsonData("users", "userrestapi.json");

      final user = libruqolacore.User.fromJson(data);
      expect(user.name, "name_user");
      expect(user.active, true);
      expect(user.username, "username");
      expect(user.userid, "BDFj6E7Z9RYucn8C");
      expect(user.status, libruqolacore.Status.offline);
    });

    test('userrestapi2 json', () {
      final data = extractJsonData("users", "userrestapi2.json");
      final user = libruqolacore.User.fromJson(data);
      expect(user.name, "Bla bla");
      expect(user.active, true);
      expect(user.username, "steffen");
      expect(user.userid, "XQZAk3998f9hSNwh");
      expect(user.status, libruqolacore.Status.online);
    });

    test('Compare enum Status from string', () {
      expect(libruqolacore.StatusExt.statusFromString("away"), libruqolacore.Status.away);
      expect(libruqolacore.StatusExt.statusFromString("offline"), libruqolacore.Status.offline);
      expect(libruqolacore.StatusExt.statusFromString("online"), libruqolacore.Status.online);
      expect(libruqolacore.StatusExt.statusFromString("busy"), libruqolacore.Status.busy);
      expect(libruqolacore.StatusExt.statusFromString(""), libruqolacore.Status.unknown);
      expect(libruqolacore.StatusExt.statusFromString("bla away"), libruqolacore.Status.unknown);
    });
  });
}
