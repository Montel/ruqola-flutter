/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/material.dart';
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

class StatusModel with ChangeNotifier {
  Status currentStatus = Status.unknown;
  List<DisplayStatusInfo> listStatus = [];

  void setCurrentStatus(Status status) {
    currentStatus = status;
    notifyListeners();
  }

  List<DisplayStatusInfo> sortedList() {
    List<DisplayStatusInfo> list = List.from(listStatus);
    list.sort((a, b) => a.order.compareTo(b.order));
    final List<DisplayStatusInfo> reverted = list.reversed.toList();
    return reverted;
  }

  StatusModel() {
    fillModel();
    notifyListeners();
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

  void updateCustomStatus(List<CustomUserStatus> lstStatus) {
    fillModel();
    for (final CustomUserStatus s in lstStatus) {
      DisplayStatusInfo statusInfo = DisplayStatusInfo();
      statusInfo.status = s.statusType;
      statusInfo.displayText = s.name;
      statusInfo.iconName = statusInfo.status.iconName;
      statusInfo.order = 5;
      statusInfo.statusStr = s.name;
      listStatus.add(statusInfo);
    }
    notifyListeners();
  }

  @override
  String toString() {
    return 'StatusModel(listStatus: $listStatus)';
  }
}
