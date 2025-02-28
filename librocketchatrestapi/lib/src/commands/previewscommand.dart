/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class PreviewsCommandInfo {
  final String commandName;
  final String roomId;
  final String params;

  PreviewsCommandInfo(this.commandName, this.roomId, this.params);
  bool canStart() {
    return commandName.isNotEmpty && roomId.isNotEmpty;
  }

// TODO add support get/post support !

  Map<String, String> body() {
    Map<String, String> json = {};
    json['command'] = commandName;
    json["roomId"] = roomId;
    if (params.isNotEmpty) {
      json["params"] = params;
    }
    return json;
  }
}

class PreviewsCommand extends Restapiabstractjob {
  final PreviewsCommandInfo _info;

  PreviewsCommand(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start PreviewsCommand");
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
    return generateUrl(url, RestApiUrlType.commandsPreview);
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
