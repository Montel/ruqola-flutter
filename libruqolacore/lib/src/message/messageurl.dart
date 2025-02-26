/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

enum ContentType {
  none,
  image,
  imageAnimated,
  audio,
  video,
}

class Messageurl {
  Messageurl();
  factory Messageurl.fromJson(Map<String, dynamic> json) {
    Messageurl messageUrl = Messageurl();
    // TODO
    return messageUrl;
  }

  @override
  String toString() {
    return "Messageurl(url: $url pageTitle: $pageTitle description: $description imageUrl: $imageUrl authorName: $authorName authorUrl: $authorUrl siteUrl: $siteUrl siteName: $siteName urlId: $urlId hytmlDescription: $htmlDescription imageBuildUrl: $imageBuildUrl imageHeight: $imageHeight imageWidth: $imageWidth showPreview: $showPreview contentType: $contentType )";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Messageurl &&
        other.url == url &&
        other.pageTitle == pageTitle &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.authorName == authorName &&
        other.authorUrl == authorUrl &&
        other.siteUrl == siteUrl &&
        other.siteName == siteName &&
        other.urlId == urlId &&
        other.htmlDescription == htmlDescription &&
        other.imageBuildUrl == imageBuildUrl &&
        other.imageHeight == imageHeight &&
        other.imageWidth == imageWidth &&
        other.showPreview == showPreview &&
        other.contentType == contentType;
  }

  @override
  int get hashCode {
    return url.hashCode ^
        pageTitle.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        authorName.hashCode ^
        authorUrl.hashCode ^
        siteUrl.hashCode ^
        siteName.hashCode ^
        urlId.hashCode ^
        htmlDescription.hashCode ^
        imageBuildUrl.hashCode ^
        imageHeight.hashCode ^
        imageWidth.hashCode ^
        showPreview.hashCode ^
        contentType.hashCode;
  }

  String url = '';
  String pageTitle = '';
  String description = '';
  String imageUrl = '';
  String authorName = '';
  String authorUrl = '';
  String siteUrl = '';
  String siteName = '';
  String urlId = '';
  String htmlDescription = '';
  String imageBuildUrl = '';
  int imageHeight = -1;
  int imageWidth = -1;
  bool showPreview = true;
  ContentType contentType = ContentType.none;
}
