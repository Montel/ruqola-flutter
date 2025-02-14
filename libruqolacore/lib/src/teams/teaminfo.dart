/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class TeamInfo {
  final String teamId;
  final int roomsCount;
  final bool mainTeam;
  final bool autoJoin;

  TeamInfo({
    required this.teamId,
    required this.roomsCount,
    required this.mainTeam,
    required this.autoJoin,
  });

  bool hasTeamRoom() {
    return !mainTeam && teamId.isNotEmpty;
  }

  factory TeamInfo.fromJson(Map<String, dynamic> json) {
    final String teamId = json["teamId"] ?? '';
    final bool mainTeam = json["teamMain"] ?? false;
    final bool autoJoin = json["teamDefault"] ?? false;
    final int roomsCount = json["roomsCount"] ?? 0;

    return TeamInfo(
      teamId: teamId,
      roomsCount: roomsCount,
      mainTeam: mainTeam,
      autoJoin: autoJoin,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TeamInfo &&
        other.teamId == teamId &&
        other.roomsCount == roomsCount &&
        other.mainTeam == mainTeam &&
        other.autoJoin == autoJoin;
  }

  @override
  int get hashCode {
    return teamId.hashCode ^
        roomsCount.hashCode ^
        mainTeam.hashCode ^
        autoJoin.hashCode;
  }

  @override
  String toString() {
    return 'TeamInfo(teamId: $teamId, roomsCount: $roomsCount, mainTeam: $mainTeam, autoJoin: $autoJoin)';
  }
}
