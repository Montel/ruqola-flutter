/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoomsFavoriteInfo {
  final String mRoomId;
  final bool favorite;
  RoomsFavoriteInfo(this.mRoomId, this.favorite);
  bool canStart() {
    return mRoomId.isNotEmpty;
  }

  Map<String, String> body() =>
      {'roomId': mRoomId, 'favorite': favorite.toString()};
}

class RoomsFavorite extends Restapiabstractjob {
  final RoomsFavoriteInfo _info;

  RoomsFavorite(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoomsFavorite");
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
    return generateUrl(url, RestApiUrlType.roomsFavorite);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }
    http.Response response = await http.post(url(serverUrl!),
        headers: headers(), body: _info.body());
    return result(response);
  }
}
