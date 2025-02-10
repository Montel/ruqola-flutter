/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/managedevices/deviceinfo.dart';
import 'package:collection/collection.dart';

class Deviceinfos {
  final List<Deviceinfo> listDevices;
  final int deviceInfosCount;
  final int offset;
  final int total;

  Deviceinfos({
    required this.listDevices,
    required this.deviceInfosCount,
    required this.offset,
    required this.total,
  });
  factory Deviceinfos.fromJson(Map<String, dynamic> json) {
    final deviceInfosCount = json["count"] ?? 0;
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
    return Deviceinfos(
      listDevices: listDevices,
      deviceInfosCount: deviceInfosCount,
      offset: offset,
      total: total,
    );
  }
  Deviceinfos.defaultValues()
      : listDevices = [],
        deviceInfosCount = 0,
        offset = 0,
        total = 0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();
    return other is Deviceinfos &&
        listEquality.equals(other.listDevices, listDevices) &&
        other.deviceInfosCount == deviceInfosCount &&
        other.offset == offset &&
        other.total == total;
  }

  @override
  int get hashCode {
    return listDevices.hashCode ^
        deviceInfosCount.hashCode ^
        offset.hashCode ^
        total.hashCode;
  }

  @override
  String toString() {
    return 'Deviceinfos(listDevices: $listDevices, deviceInfosCount: $deviceInfosCount, offset: $offset, total: $total)';
  }
}
