/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class GetDiscussionsInfo {
  final String roomId;
  bool canStart() {
    return roomId.isNotEmpty;
  }

  GetDiscussionsInfo(this.roomId);

  Map<String, String> queryParameters() => {
        'roomId': roomId,
      };
  @override
  String toString() {
    return "GetDiscussionsInfo(roomId: $roomId)";
  }
}

class GetDiscussions extends Restapiabstractjob {
  final GetDiscussionsInfo _info;
  GetDiscussions(this._info);

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start GetDiscussions");
      return false;
    }
    if (!_info.canStart()) {
      print("GetDiscussions: GetDiscussionsInfo is invalid");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    final Uri uri = generateUrl(url, RestApiUrlType.roomsGetDiscussions)
        .replace(queryParameters: _info.queryParameters());
    return uri;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start GetDiscussions");
      return RestapiabstractjobResult();
    }

    http.Response response = await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
