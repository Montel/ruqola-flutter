/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/src/user.dart';
import 'package:libruqolacore/src/status/customuserstatus.dart';

class DisplayStatusInfo {
  String displayText = '';
  String statusStr = '';
  String iconName = '';
  Status status = Status.unknown;
  int order = 0;

  @override
  bool operator ==(Object other) {
    return other is DisplayStatusInfo &&
        other.displayText == displayText &&
        other.statusStr == statusStr &&
        other.iconName == iconName &&
        other.status == status &&
        other.order == order;
  }

  @override
  int get hashCode =>
      displayText.hashCode ^
      statusStr.hashCode ^
      iconName.hashCode ^
      status.hashCode ^
      order.hashCode;

  @override
  String toString() {
    return 'DisplayStatusInfo(displayText: $displayText, statusStr: $statusStr, iconName: $iconName, status: $status, order: $order)';
  }
}

class StatusModel {
  List<DisplayStatusInfo> listStatus = [];

  StatusModel() {
    fillModel();
  }

  void fillModel() {
    listStatus.clear();
    {
      final statusInfo = createStatusInfo(Status.online, 20);
      listStatus.add(statusInfo);
    }
    {
      final statusInfo = createStatusInfo(Status.busy, 19);
      listStatus.add(statusInfo);
    }
    {
      final statusInfo = createStatusInfo(Status.away, 18);
      listStatus.add(statusInfo);
    }
    {
      final statusInfo = createStatusInfo(Status.offline, 17);
      listStatus.add(statusInfo);
    }
    {
      final statusInfo = createStatusInfo(Status.unknown, -1);
      listStatus.add(statusInfo);
    }
  }

  DisplayStatusInfo createStatusInfo(Status status, int order) {
    DisplayStatusInfo statusInfo = DisplayStatusInfo();
    statusInfo.status = status;
    statusInfo.displayText = status.translatedName;
    statusInfo.iconName = status.iconName;
    statusInfo.order = order;
    statusInfo.statusStr = status.name;
    return statusInfo;
  }

  void updateCustomStatus(List<CustomUserStatus> lst) {
    // TODO
    fillModel();
    for (final CustomUserStatus s in lst) {
      DisplayStatusInfo statusInfo = DisplayStatusInfo();
      statusInfo.status = s.statusType;
      statusInfo.displayText = s.name;
      // TODO statusInfo.iconName = iconFromPresenceStatus(statusInfo.status);
      statusInfo.order = 5;
      statusInfo.statusStr = s.name;
      listStatus.add(statusInfo);
    }
  }

  @override
  String toString() {
    return 'StatusModel(listStatus: $listStatus)';
  }
}
