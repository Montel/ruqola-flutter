/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libddpapi/libddpapi.dart' as libddpapi;
import 'package:test/test.dart';

void main() {
  group('DDpUtils', () {
    test('Test generateWebsocketUrl', () {
      String url = "";
      expect(libddpapi.generateWebsocketUrl(url), "");

      url = "http://foo.kde.org/";
      expect(
          libddpapi.generateWebsocketUrl(url), "ws://foo.kde.org//websocket");

      url = "http://foo.kde.org";
      expect(libddpapi.generateWebsocketUrl(url), "ws://foo.kde.org/websocket");

      url = "foo.kde.org";
      expect(
          libddpapi.generateWebsocketUrl(url), "wss://foo.kde.org/websocket");

      url = "foo.kde.org/websocket";
      expect(
          libddpapi.generateWebsocketUrl(url), "wss://foo.kde.org/websocket");

      url = "wss://foo.kde.org/websocket";
      expect(
          libddpapi.generateWebsocketUrl(url), "wss://foo.kde.org/websocket");
    });
  });
}
