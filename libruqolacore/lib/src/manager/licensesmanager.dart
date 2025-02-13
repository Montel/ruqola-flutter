/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class LicensesManager {
  bool hasLicense(String name) {
    return licenses.contains(name);
  }

  void parseLicenses(Map<String, dynamic> json) {
    final licenseObj = json["license"];
    if (licenseObj != null) {
      final activeModules = licenseObj["activeModules"];
      if (activeModules != null) {
        for (var item in activeModules) {
          licenses.add(item);
        }
      }
    }
  }

  // Parse license
  List<String> licenses = [];

  @override
  bool operator ==(Object other) {
    return other is LicensesManager && other.licenses == licenses;
  }

  @override
  int get hashCode => licenses.hashCode;

  @override
  String toString() {
    return 'LicensesManager(licenses: $licenses)';
  }
}
