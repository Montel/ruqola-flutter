/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoomsImagesInfo {
  final String roomId;
  final String startingFromId;
  final int offset;
  final int count;
  bool isValid() {
    return roomId.isNotEmpty && startingFromId.isNotEmpty && (count > 0);
  }

  Map<String, String> queryParameters() => {
        'roomId': roomId,
        'startingFromId': startingFromId,
        'offset': offset.toString(),
        'count': count.toString(),
      };
  RoomsImagesInfo(this.roomId, this.startingFromId, this.offset, this.count);
}

class RoomsImages extends Restapiabstractjob {
  final RoomsImagesInfo _info;
  RoomsImages(this._info);

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoomsImages");
      return false;
    }
    if (!_info.isValid()) {
      print("RoomsImages: RoomsImagesInfo is invalid");
      return false;
    }
    return true;
  }

  @override
  Uri url(String url) {
    final Uri uri = generateUrl(url, RestApiUrlType.roomsImages)
        .replace(queryParameters: _info.queryParameters());
    return uri;
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start RoomsImages");
      return RestapiabstractjobResult();
    }

    http.Response response = await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
