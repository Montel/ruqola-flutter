/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

// Define the abstract base event class
import 'package:libddpapi/src/notification/messagenotification.dart';

abstract class AbstractEvent {}

class AddedElements extends AbstractEvent {
  final Messagenotification message;

  AddedElements(this.message);
}

class RemovedElements extends AbstractEvent {
  final Messagenotification message;

  RemovedElements(this.message);
}

class ChangedElements extends AbstractEvent {
  final Messagenotification message;

  ChangedElements(this.message);
}

// Add Result type
enum ResulType {
  unknown,
  login,
  getRooms,
  getSubscriptions,
}

extension ResulTypeExtension on ResulType {
  String get path {
    switch (this) {
      case ResulType.unknown:
        return "";
      case ResulType.login:
        return "";
      case ResulType.getRooms:
        return "rooms/get";
      case ResulType.getSubscriptions:
        return "subscriptions/get";
    }
  }
}

class ResultElements extends AbstractEvent {
  final Messagenotification message;
  final ResulType type;
  ResultElements(this.message, this.type);
}
