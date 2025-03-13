/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:collection/collection.dart';
import 'package:libruqolacore/src/personalaccesstokens/personalaccesstokeninfo.dart';

class PersonalAccessTokenInfos {
  final List<PersonalAccessTokenInfo> personalAccessTokenInfos;

  PersonalAccessTokenInfos({
    required this.personalAccessTokenInfos,
  });

  factory PersonalAccessTokenInfos.fromJson(Map<String, dynamic> json) {
    var tokensArray = json["tokens"];
    if (tokensArray != null) {
      List<PersonalAccessTokenInfo> listTokenInfos = [];
      for (var item in tokensArray) {
        var personnalTokenInfo = PersonalAccessTokenInfo.fromJson(item);
        listTokenInfos.add(personnalTokenInfo);
      }
      return PersonalAccessTokenInfos(personalAccessTokenInfos: listTokenInfos);
    }
    return PersonalAccessTokenInfos(personalAccessTokenInfos: []);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();
    return other is PersonalAccessTokenInfos &&
        listEquality.equals(other.personalAccessTokenInfos, personalAccessTokenInfos);
  }

  @override
  int get hashCode {
    return personalAccessTokenInfos.hashCode;
  }

  @override
  String toString() {
    return 'PersonalAccessTokenInfos(personalAccessTokenInfos: $personalAccessTokenInfos)';
  }
}
