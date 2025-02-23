/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoomsCleanHistoryInfo {
  final String roomId;
  RoomsCleanHistoryInfo(this.roomId);
  bool canStart() {
    return roomId.isNotEmpty;
  }

  // TODO
/*
  DateTime latest; // required
  DateTime oldest; // required
  String roomId; // required
  List<String> users;
  bool inclusive = false;
  bool excludePinned = false;
  bool filesOnly = false;
  bool ignoreThreads = false;
  bool ignoreDiscussion = false;
*/
  Map<String, String> body() => {'roomId': roomId};
}

class RoomsCleanHistory extends Restapiabstractjob {
  final RoomsCleanHistoryInfo _info;

  RoomsCleanHistory(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoomsCleanHistory");
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
    return generateUrl(url, RestApiUrlType.roomsCleanHistory);
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
