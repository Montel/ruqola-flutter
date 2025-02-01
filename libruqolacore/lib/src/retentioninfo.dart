/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class RetentionInfo {
  bool enabled;
  bool overrideGlobal;
  bool excludePinned;
  bool filesOnly;
  int maxAge;

  RetentionInfo({
    this.enabled = false,
    this.overrideGlobal = false,
    this.excludePinned = false,
    this.filesOnly = false,
    this.maxAge = -1,
  });

  bool get isNotDefault {
    return enabled ||
        excludePinned ||
        filesOnly ||
        overrideGlobal ||
        maxAge != -1;
  }

  factory RetentionInfo.fromJson(Map<String, dynamic> json) {
    return RetentionInfo(
      enabled: json['enabled'] ?? false,
      overrideGlobal: json['overrideGlobal'] ?? false,
      excludePinned: json['excludePinned'] ?? false,
      filesOnly: json['filesOnly'] ?? false,
      maxAge: json['maxAge'] ?? -1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'overrideGlobal': overrideGlobal,
      'excludePinned': excludePinned,
      'filesOnly': filesOnly,
      'maxAge': maxAge,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RetentionInfo &&
        other.enabled == enabled &&
        other.overrideGlobal == overrideGlobal &&
        other.excludePinned == excludePinned &&
        other.filesOnly == filesOnly &&
        other.maxAge == maxAge;
  }

  @override
  int get hashCode {
    return enabled.hashCode ^
        overrideGlobal.hashCode ^
        excludePinned.hashCode ^
        filesOnly.hashCode ^
        maxAge.hashCode;
  }

  @override
  String toString() {
    return 'RetentionInfo(enabled: $enabled, overrideGlobal: $overrideGlobal, excludePinned: $excludePinned, filesOnly: $filesOnly, maxAge: $maxAge)';
  }
}
