/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

import 'package:uuid/uuid.dart';

class RunCommandInfo {
  final String commandName;
  final String roomId;
  final String threadMessageId;
  final String triggerId;
  final String params;

  static RunCommandInfo parseString(String str, String roomId,
      [String tmid = '', String forceTriggerValue = '']) {
    String commandName = '';
    String params = "";
    String triggedId = '';
    if (str.length > 1) {
      final String newStr = str.substring(1);
      List<String> lst = newStr.split(' ');
      commandName = lst[0];
      lst.removeAt(0);
      if (lst.isNotEmpty) {
        params = lst.join(' ');
      }
      if (forceTriggerValue.isEmpty) {
        var uuid = Uuid();
        triggedId = uuid.v4();
      } else {
        triggedId = forceTriggerValue;
      }
    }

    return RunCommandInfo(
        commandName: commandName,
        roomId: roomId,
        threadMessageId: tmid,
        params: params,
        triggerId: triggedId);
  }

  RunCommandInfo(
      {required this.commandName,
      required this.roomId,
      required this.threadMessageId,
      required this.triggerId,
      required this.params});

  bool canStart() {
    return commandName.isNotEmpty && roomId.isNotEmpty;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RunCommandInfo &&
        other.params == params &&
        other.commandName == commandName &&
        threadMessageId == other.threadMessageId &&
        triggerId == other.triggerId;
  }

  @override
  int get hashCode {
    return params.hashCode ^ commandName.hashCode ^ threadMessageId.hashCode ^ triggerId.hashCode;
  }

  @override
  String toString() {
    return "RunCommandInfo(commandName: $commandName, roomId: $roomId, threadMessageId: $threadMessageId, triggerId: $triggerId, params: $params)";
  }

  Map<String, String> body() {
    Map<String, String> json = {};
    json['command'] = commandName;
    json["roomId"] = roomId;

    if (threadMessageId.isNotEmpty) {
      json["tmid"] = threadMessageId;
    }
    if (triggerId.isNotEmpty) {
      json["triggerId"] = triggerId;
    }
    if (params.isNotEmpty) {
      json["params"] = params;
    }
    return json;
  }
}

class RunCommand extends Restapiabstractjob {
  final RunCommandInfo _info;

  RunCommand(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RunCommand");
      return false;
    }
    return _info.canStart();
  }

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.commandsRun);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }
    http.Response response =
        await http.post(url(serverUrl!), headers: headers(), body: _info.body());
    return result(response);
  }
}
