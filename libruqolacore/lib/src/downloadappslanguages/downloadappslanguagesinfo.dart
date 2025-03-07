/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class DownloadAppsLanguagesInfo {
  final Map<String, Map<String, String>> languageMap;

  DownloadAppsLanguagesInfo({required this.languageMap});

  DownloadAppsLanguagesInfo.defaultValues() : languageMap = {};

  factory DownloadAppsLanguagesInfo.fromJson(Map<String, dynamic> json, String id) {
    Map<String, Map<String, String>> languageMap = <String, Map<String, String>>{};

    final languagesObj = json["languages"];
    if (languagesObj != null) {
      final keys = languagesObj.keys;
      for (final lang in keys) {
        final map = languagesObj[lang];
        if (map is Map<String, dynamic>) {
          final translatedMap = <String, String>{};
          map.forEach((key, value) {
            if (value is String) {
              translatedMap['app-$id.$key'] = value;
            }
          });
          languageMap[lang] = translatedMap;
        }
      }
    }

    return DownloadAppsLanguagesInfo(languageMap: languageMap);
  }

  @override
  String toString() {
    return 'DownloadAppsLanguagesInfo(languageMap: $languageMap)';
  }
}
