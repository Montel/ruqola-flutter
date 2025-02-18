/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  group('Reaction', () {
    test('Test tooltip', () {
      {
        final reaction = Reaction(reactionName: ":foo:", userNames: []);
        expect(reaction.convertedUsersNameAtToolTip(), "");
      }

      {
        final reaction = Reaction(reactionName: ":foo:", userNames: ["bla"]);
        expect(
            reaction.convertedUsersNameAtToolTip(), "bla reacted with :foo:");
      }

      {
        final reaction =
            Reaction(reactionName: ":foo:", userNames: ["bla", "blo"]);
        expect(reaction.convertedUsersNameAtToolTip(),
            "bla and blo reacted with :foo:");
      }

      {
        final reaction =
            Reaction(reactionName: ":foo:", userNames: ["bla", "blo", "bli"]);
        expect(reaction.convertedUsersNameAtToolTip(),
            "bla, blo and bli reacted with :foo:");
      }
    });
  });
}
