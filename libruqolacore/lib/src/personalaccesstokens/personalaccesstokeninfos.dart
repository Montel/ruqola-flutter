/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/managedevices/deviceinfo.dart';
import 'package:collection/collection.dart';

class PersonalAccessTokenInfos {
  /*
  final List<PersonalAccessTokenInfo> personalAccessTokenInfos;
  final int PersonalAccessTokenInfosCount;
  final int offset;
  final int total;

  PersonalAccessTokenInfos({
    required this.listDevices,
    required this.PersonalAccessTokenInfosCount,
    required this.offset,
    required this.total,
  });
  factory PersonalAccessTokenInfos.fromJson(Map<String, dynamic> json) {
    final PersonalAccessTokenInfosCount = json["count"] ?? 0;
    final offset = json["offset"] ?? 0;
    final total = json["total"] ?? 0;
    List<Deviceinfo> listDevices = [];
    final sessions = json["sessions"];
    if (sessions != null) {
      for (var item in sessions) {
        var deviceInfo = Deviceinfo.fromJson(item);
        listDevices.add(deviceInfo);
      }
    }
    return PersonalAccessTokenInfos(
      listDevices: listDevices,
      PersonalAccessTokenInfosCount: PersonalAccessTokenInfosCount,
      offset: offset,
      total: total,
    );
  }
  PersonalAccessTokenInfos.defaultValues()
      : listDevices = [],
        PersonalAccessTokenInfosCount = 0,
        offset = 0,
        total = 0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();
    return other is PersonalAccessTokenInfos &&
        listEquality.equals(other.listDevices, listDevices) &&
        other.PersonalAccessTokenInfosCount == PersonalAccessTokenInfosCount &&
        other.offset == offset &&
        other.total == total;
  }

  @override
  int get hashCode {
    return listDevices.hashCode ^
        PersonalAccessTokenInfosCount.hashCode ^
        offset.hashCode ^
        total.hashCode;
  }

  @override
  String toString() {
    return 'PersonalAccessTokenInfos(listDevices: $listDevices, PersonalAccessTokenInfosCount: $PersonalAccessTokenInfosCount, offset: $offset, total: $total)';
  }
  */
}
