/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Avatar info', () {
    test('Test Initial values', () {
      final avatarInfo = AvatarInfo();
      expect(avatarInfo.isValid(), false);
      expect(avatarInfo.avatarType, AvatarType.unknown);
      expect(avatarInfo.identifier.isEmpty, true);
      expect(avatarInfo.etag.isEmpty, true);
    });

    test('Test assign values', () {
      final avatarInfo = AvatarInfo();
      expect(avatarInfo.isValid(), false);
      expect(avatarInfo.etag.isEmpty, true);
      expect(avatarInfo.identifier.isEmpty, true);
      expect(avatarInfo.avatarType, AvatarType.unknown);

      avatarInfo.identifier = "bla";
      expect(avatarInfo.generateAvatarIdentifier(), "bla");
      avatarInfo.etag = "foo";
      expect(avatarInfo.generateAvatarIdentifier(), "bla-foo");
    });

    test('Test generate url', () {
      {
        AvatarInfo avatarInfo = AvatarInfo();
        expect(avatarInfo.avatarUrl(''), Uri());
      }
      {
        AvatarInfo avatarInfo = AvatarInfo();
        avatarInfo.identifier = "user1";
        avatarInfo.avatarType = AvatarType.user;
        expect(
            avatarInfo.avatarUrl('http://www.kde.org'),
            Uri.parse(
                "http://www.kde.org/avatar/${avatarInfo.identifier}?format=png&size=22"));
      }
      {
        AvatarInfo avatarInfo = AvatarInfo();
        avatarInfo.identifier = "user1";
        avatarInfo.avatarType = AvatarType.user;
        avatarInfo.etag = "etag-user-identifier";

        expect(
            avatarInfo.avatarUrl('http://www.kde.org'),
            Uri.parse(
                "http://www.kde.org/avatar/${avatarInfo.identifier}?format=png&etag=${avatarInfo.etag}&size=22"));
      }
      {
        AvatarInfo avatarInfo = AvatarInfo();
        avatarInfo.identifier = "room1";
        avatarInfo.avatarType = AvatarType.room;
        expect(
            avatarInfo.avatarUrl('http://www.kde.org'),
            Uri.parse(
                "http://www.kde.org/avatar/room/${avatarInfo.identifier}?format=png&size=22"));
      }
      {
        AvatarInfo avatarInfo = AvatarInfo();
        avatarInfo.identifier = "room1";
        avatarInfo.avatarType = AvatarType.room;
        avatarInfo.etag = "etagIdentifier";

        expect(
            avatarInfo.avatarUrl('http://www.kde.org'),
            Uri.parse(
                "http://www.kde.org/avatar/room/${avatarInfo.identifier}?format=png&etag=${avatarInfo.etag}&size=22"));
      }
      {
        AvatarInfo avatarInfo = AvatarInfo();
        avatarInfo.identifier = "room1";
        avatarInfo.avatarType = AvatarType.room;
        avatarInfo.etag = "etagIdentifier";

        expect(
            avatarInfo.avatarUrl('http://www.kde.org'),
            Uri.parse(
                "http://www.kde.org/avatar/room/${avatarInfo.identifier}?format=png&etag=${avatarInfo.etag}&size=22"));
      }
    });
  });
}
