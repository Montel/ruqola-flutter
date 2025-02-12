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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final listEquality = ListEquality();
    return other is PersonalAccessTokenInfos &&
        listEquality.equals(
            other.personalAccessTokenInfos, personalAccessTokenInfos);
  }

  @override
  int get hashCode {
    return personalAccessTokenInfos.hashCode;
  }

  @override
  String toString() {
    return 'PersonalAccessTokenInfo(personalAccessTokenInfos: $personalAccessTokenInfos)';
  }
}
