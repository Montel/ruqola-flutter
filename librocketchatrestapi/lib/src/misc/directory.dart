/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

enum SearchType {
  unknown,
  rooms,
  users,
  teams,
}

class DirectoryInfo {
  final String pattern;
  final SearchType type;
  DirectoryInfo(this.pattern, this.type);
  bool canStart() {
    return type != SearchType.unknown;
  }

  @override
  String toString() {
    return "DirectoryInfo(pattern: $pattern, type: $type)";
  }
}

class Directory extends Restapiabstractjob {
  final DirectoryInfo _info;
  Directory(this._info);

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start Directory");
      return false;
    }
    if (!_info.canStart()) {
      print("Directory: DirectoryInfo is invalid");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.directory);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start Directory");
      return RestapiabstractjobResult();
    }

    http.Response response =
        await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
