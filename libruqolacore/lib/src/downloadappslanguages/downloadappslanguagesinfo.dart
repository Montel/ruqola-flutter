/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class DownloadAppsLanguagesInfo {
  final Map<String, Map<String, String>> languageMap = <String, Map<String, String>>{};

  @override
  String toString() {
    return 'DownloadAppsLanguagesInfo(languageMap: $languageMap)';
  }
}
