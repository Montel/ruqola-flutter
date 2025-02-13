/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class TeamsAutoCompleteInfo {
  final String name;
  bool canStart() {
    return name.isNotEmpty;
  }

  Map<String, String> queryParameters() => {
        'name': name,
      };
  TeamsAutoCompleteInfo(this.name);

  @override
  String toString() {
    return "TeamsAutoCompleteInfo(name: $name)";
  }
}

class TeamsAutoComplete extends Restapiabstractjob {
  final TeamsAutoCompleteInfo _info;
  TeamsAutoComplete(this._info);

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start TeamsAutoComplete");
      return false;
    }
    if (!_info.canStart()) {
      print("TeamsAutoComplete: TeamsAutoCompleteInfo is invalid");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    final Uri uri = generateUrl(url, RestApiUrlType.teamsAutocomplete)
        .replace(queryParameters: _info.queryParameters());
    return uri;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start TeamsAutoComplete");
      return RestapiabstractjobResult();
    }

    http.Response response =
        await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
