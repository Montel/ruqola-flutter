/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

enum SortOrder {
  ascendant,
  descendant,
  noSorting,
}

class Queryparameter {
  String? searchString;
  String? filter;
  bool useSyntaxRc70 = false;
  int count = 0;
  int offset = 0;
}
