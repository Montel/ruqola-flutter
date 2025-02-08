/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/managedevices/deviceinfo.dart';

class Deviceinfos {
  Deviceinfos();

  factory Deviceinfos.fromJson(Map<String, dynamic> json) {
    // TODO
    return Deviceinfos();
  }

  List<Deviceinfo> listDevices = [];
  int deviceInfosCount = 0;
  int offset = 0;
  int total = 0;

  @override
  bool operator ==(Object other) {
    return other is Deviceinfos &&
        other.listDevices == listDevices &&
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
