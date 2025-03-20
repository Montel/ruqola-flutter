/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/status/customuserstatus.dart';
import 'package:collection/collection.dart';

class CustomUserStatusModel {
  List<CustomUserStatus> customUserStatusList = [];
  int customUserCount = 0;
  int offset = 0;
  int total = 0;
  CustomUserStatusModel.defaultValues()
      : customUserCount = 0,
        offset = 0,
        total = 0,
        customUserStatusList = [];

  CustomUserStatusModel(
      {required this.customUserCount,
      required this.offset,
      required this.total,
      required this.customUserStatusList});

  factory CustomUserStatusModel.fromJson(Map<String, dynamic> json) {
    final int count = json["count"] ?? 0;
    final int offset = json["offset"] ?? 0;
    final int total = json["offset"] ?? 0;
    // Verify ??
    List<CustomUserStatus> customUserStatusList = List<CustomUserStatus>.from(json["statuses"]);

    return CustomUserStatusModel(
        customUserCount: count,
        offset: offset,
        total: total,
        customUserStatusList: customUserStatusList);
  }
  void deleteCustomUserStatuses() {
    // TODO
  }

  void updateCustomUserStatues() {
    //TODO
  }

  @override
  bool operator ==(Object other) {
    final listEquality = ListEquality();
    return other is CustomUserStatusModel &&
        other.customUserCount == customUserCount &&
        other.offset == offset &&
        other.total == total &&
        listEquality.equals(other.customUserStatusList, customUserStatusList);
  }

  @override
  int get hashCode =>
      total.hashCode ^ offset.hashCode ^ customUserCount.hashCode ^ customUserStatusList.hashCode;

  @override
  String toString() {
    return 'CustomUserStatusModel(customUserStatusList: $customUserStatusList, customUserCount: $customUserCount, offset: $offset, total: $total)';
  }
}
