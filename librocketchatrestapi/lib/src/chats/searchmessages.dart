/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class SearchMessagesInfo {
  final String mRoomId;
  final String mSearchText;
  final bool mUseRegularExpression;
  final int mOffset;
  final int mCount;

  SearchMessagesInfo(this.mRoomId, this.mSearchText,
      [this.mUseRegularExpression = false,
      this.mOffset = -1,
      this.mCount = -1]);
  bool canStart() {
    if (mRoomId.isEmpty) {
      print("RoomId is empty");
      return false;
    }
    if (mSearchText.isEmpty) {
      print("SearchText is empty");
      return false;
    }

    return true;
  }

  String convertSearchText() {
    if (mUseRegularExpression) {
      return "/$mSearchText/i";
    }
    return mSearchText;
  }

  Map<String, String> queryParameters() {
    Map<String, String> map = {};
    map['roomId'] = mRoomId;
    if (mCount > -1) {
      map['count'] = mCount.toString();
    }
    map['searchText'] = convertSearchText();
    if (mOffset > -1) {
      map['offset'] = mOffset.toString();
    }
    return map;
  }
}

class SearchMessages extends Restapiabstractjob {
  final SearchMessagesInfo _info;

  SearchMessages(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start SearchMessages");
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
    return generateUrl(url, RestApiUrlType.chatSearch)
        .replace(queryParameters: _info.queryParameters());
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }
    http.Response response =
        await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
