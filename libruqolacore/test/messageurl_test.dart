/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/libruqolacore.dart';
import 'package:test/test.dart';

void main() {
  test('Messageurl', () {
    final messageurl = Messageurl();
    expect(messageurl.url, '');
    expect(messageurl.pageTitle, '');
    expect(messageurl.description, '');
    expect(messageurl.imageUrl, '');
    expect(messageurl.authorName, '');
    expect(messageurl.authorUrl, '');
    expect(messageurl.siteUrl, '');
    expect(messageurl.siteName, '');
    expect(messageurl.urlId, '');
    expect(messageurl.htmlDescription, '');
    expect(messageurl.imageBuildUrl, '');
    expect(messageurl.imageHeight, -1);
    expect(messageurl.imageWidth, -1);
    expect(messageurl.showPreview, true);
    expect(messageurl.contentType, ContentType.none);
  });
}
