/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Licensesmanager {
  bool hasLicense(String name) {
    return licenses.contains(name);
  }

  // Parse license
  List<String> licenses = [];
}
