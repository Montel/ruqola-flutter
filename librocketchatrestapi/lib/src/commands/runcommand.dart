/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RunCommandInfo {
  final String commandName;
  final String roomId;
  final String threadMessageId;
  final String triggerId;
  final String params;

  RunCommandInfo(this.commandName, this.roomId, this.threadMessageId, this.triggerId, this.params);
  bool canStart() {
    return commandName.isNotEmpty && roomId.isNotEmpty;
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
