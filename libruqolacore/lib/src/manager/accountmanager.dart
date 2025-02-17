/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/src/rocketchataccount.dart';

class Accountmanager with ChangeNotifier {
  // TODO list of account
  // Use ini format
  void loadAccounts() {
    // Search accounts from system!
    // TODO add accounts
    notifyListeners();
  }

  void addAccount(Rocketchataccount account) {
    listAccouts.add(account);
    notifyListeners();
  }

  List<Rocketchataccount> listAccouts = [];

  @override
  bool operator ==(Object other) {
    return other is Accountmanager && other.listAccouts == listAccouts;
  }

  @override
  int get hashCode => listAccouts.hashCode;

  @override
  String toString() {
    return 'Accountmanager(listAccouts: $listAccouts)';
  }
}
