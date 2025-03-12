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

/*
  factory PersonalAccessTokenInfos.fromJson(Map<String, dynamic> json) {
    var repliesJson = json["replies"];
    if (repliesJson != null) {
      final List<String> replies = List<String>.from(repliesJson);
      return Replies(replies: replies);
    }
    return PersonalAccessTokenInfos();
  }
*/

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
