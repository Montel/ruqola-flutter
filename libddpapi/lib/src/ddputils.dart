/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

String generateWebsocketUrl(String url) {
  if (url.isEmpty) {
    return "";
  }
  if (url.startsWith("https://")) {
    url = url.replaceFirst("https://", "wss://");
  } else if (url.startsWith("http://")) {
    url = url.replaceFirst("http://", "ws://");
  } else if (!url.startsWith("wss://")) {
    url = "wss://$url";
  }
  if (!url.endsWith("/websocket")) {
    url = "$url/websocket";
  }
  return url;
}
