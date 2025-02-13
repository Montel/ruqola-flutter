/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/src/bannerinfos/bannerinfo.dart';
import 'package:collection/collection.dart';

class Bannerinfos {
  List<BannerInfo> banners = [];

  @override
  String toString() {
    return 'BannerInfos(banners: $banners)';
  }

  Bannerinfos({required this.banners});
  factory Bannerinfos.fromJson(Map<String, dynamic> json) {
    List<BannerInfo> banners = [];
    final bannerJSon = json["banners"];
    if (bannerJSon != null) {
      for (var item in bannerJSon) {
        var info = BannerInfo.fromJson(item);
        if (info.isValid()) {
          banners.add(info);
        }
      }
    }
    return Bannerinfos(banners: banners);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();
    return other is Bannerinfos && listEquality.equals(other.banners, banners);
  }

  @override
  int get hashCode {
    return banners.hashCode;
  }
}
