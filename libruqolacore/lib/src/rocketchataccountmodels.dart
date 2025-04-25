/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libddpapi/libddpapi.dart';
import 'package:libruqolacore/src/message/message.dart';
import 'package:libruqolacore/src/ownuser/ownuserpreferences.dart';
import 'package:libruqolacore/src/room.dart';
import 'package:libruqolacore/src/user.dart';
import 'package:flutter/material.dart';

enum SectionName {
  unread("Unread"), // I18n
  favorites("Favorites"),
  teams("Teams"),
  rooms("Rooms"),
  privateMessages("Private Messages"),
  discussions("Discussions"),
  unknown("Unknown");

  final String name;
  const SectionName(this.name);
}

class Rocketchataccountmodels with ChangeNotifier {
  void parseSubscriptionGet(Messagenotificationresult map) {
    print("parseSubscriptionGet $map");
    final obj = map.result;

    final removed = obj['remove'];
    if (removed != null) {
      print("removed is not empty ! implement it");
    }

    final updatedArray = obj['update'];
    if (updatedArray != null) {
      for (var item in updatedArray) {
        print("updated : $item");
        final r = Room();
        r.parseSubscriptionRoom(item);
        rooms.add(r);
      }
    } else {
      print("update element is not found!");
    }
    notifyListeners();
    print("Number of rooms ${rooms.length}");
  }

  int compare(Room a, Room b, RoomListSortOrder list) {
    if (a == b) return 0;
    switch (list) {
      case RoomListSortOrder.unknown:
        // TODO warning!!!
        break;
      case RoomListSortOrder.byLastMessage:
        // TODO implement it
        break;
      case RoomListSortOrder.alphabetically:
        return a.displayName().compareTo(b.displayName());
    }
    return a.displayName().compareTo(b.displayName());
  }

  String sectionName(SectionName e) {
    return e.name;
  }

  SectionName section(Room r) {
    // (r.unread > 0 || r.alert)
    if (r.favorite) {
      // TODO
      return SectionName.favorites;
    } else if (r.teamInfo.mainTeam) {
      return SectionName.teams;
    }
    switch (r.channelType) {
      case RoomType.direct:
        return SectionName.privateMessages;
      case RoomType.channel:
        if (r.parentRid != null && r.parentRid!.isEmpty) {
          return SectionName.rooms;
        } else {
          return SectionName.discussions;
        }
      case RoomType.private:
        if (r.parentRid != null && r.parentRid!.isEmpty) {
          return SectionName.rooms;
        } else {
          return SectionName.discussions;
        }
      case RoomType.unknown:
        break;
    }
    return SectionName.unknown;
  }

/*
RoomModel::Section RoomModel::section(Room *r) const
{
    const Room::RoomType roomType = r->channelType();
    if (mRocketChatAccount && mRocketChatAccount->sortUnreadOnTop() && (r->unread() > 0 || r->alert())) {
        if (!r->hideUnreadStatus()) {
            return Section::Unread;
        }
    }
    if (r->favorite() && mRocketChatAccount && mRocketChatAccount->sortFavoriteChannels()) {
        return Section::Favorites;
    } else if (r->favorite() && !mRocketChatAccount) {
        return Section::Favorites;
    } else if (r->teamInfo().mainTeam()) {
        return Section::Teams;
    }
    switch (roomType) {
    case Room::RoomType::Private: {
        if (r->parentRid().isEmpty()) {
            return Section::Rooms;
        } else {
            return Section::Discussions;
        }
    }
    case Room::RoomType::Channel: {
        if (r->parentRid().isEmpty()) {
            return Section::Rooms;
        } else {
            return Section::Discussions;
        }
    }
    case Room::RoomType::Direct: {
        return Section::PrivateMessages;
    }
    case Room::RoomType::Unknown:
        break;
    }
    return Section::Unknown;
}
*/

  int compareSection(String a, String b) {
    if (a == b) return 0;
    if (a == SectionName.favorites.name) {
      return -1;
    } else if (b == SectionName.favorites.name) {
      return 1;
    } else {
      return a.compareTo(b);
    }
  }

  Map<String, List<Room>> sortedRoomsWithType(
      [RoomListSortOrder list = RoomListSortOrder.alphabetically, String filter = ""]) {
    Map<String, List<Room>> groupedRooms = {};

    rooms.sort((a, b) => compare(a, b, list));

    for (var room in rooms) {
      if (room.open) {
        final String sectionName = section(room).name;
        if (!groupedRooms.containsKey(sectionName)) {
          groupedRooms[sectionName] = [];
        }
        groupedRooms[sectionName]!.add(room);
      }
    }
    var sortedByKeyMap = Map.fromEntries(
        groupedRooms.entries.toList()..sort((e1, e2) => compareSection(e1.key, e2.key)));
    return sortedByKeyMap;
  }

  void setRoomWasInitialized(String roomId, bool initialized) {
    for (final Room r in rooms) {
      if (r.roomId == roomId) {
        r.wasInitialized = true;
      }
    }
  }

  bool roomWasInitialized(String roomId) {
    for (final Room r in rooms) {
      if (r.roomId == roomId) {
        return r.wasInitialized;
      }
    }
    return false;
  }

  Room? findRoomFromIdentifier(String roomId) {
    print("Find roomId $roomId");
    for (final Room r in rooms) {
      if (r.roomId == roomId) {
        return r;
      }
    }
    return null;
  }

  void processIncomingMessages(List<dynamic> json) {
    for (var item in json) {
      Message msg = Message.fromJson(item);
      for (Room r in rooms) {
        if (r.roomId == msg.roomId) {
          r.messages.add(msg);
        }
      }

      // FIXME
      for (final Room r in rooms) {
        r.notify();
      }
    }
  }

  void insertRoom(Map<String, dynamic> roomData) {
    Room r = Room();
    r.parseInsertRoom(roomData);
    addRoom(r);
  }

  void addRoom(Room room) {
    rooms.add(room);
    notifyListeners();
    // TODO verify that room is not duplicated
    /*
    qCDebug(RUQOLA_ROOMS_LOG) << " void RoomModel::addRoom(const Room &room)" << room->name();
    const int roomCount = mRoomsList.count();
    for (int i = 0; i < roomCount; ++i) {
        if (mRoomsList.at(i)->roomId() == room->roomId()) {
            qCDebug(RUQOLA_ROOMS_LOG) << " room already exist " << room->roomId() << " A bug ? ";
            delete room;
            return false;
        }
    }
    */
  }

  void updateRooms(Map<String, dynamic> roomData) {
    print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEER");
    String rId = roomData["rid"] ?? '';
    if (rId.isEmpty) {
      rId = roomData["_id"] ?? '';
    }
    if (rId.isNotEmpty) {
      for (Room r in rooms) {
        if (r.roomId == rId) {
          r.parseUpdateRoom(roomData);
          notifyListeners();
          break;
        }
      }
    } else {
      print("RoomModel::updateRoom incorrect jsonobject $roomData");
    }
  }

  void addMessage(Map<String, dynamic> replyObject /*, bool useRestApi, bool temporaryMessage*/) {
    String roomId = replyObject["rid"];
    if (roomId.isNotEmpty) {
      for (Room r in rooms) {
        if (r.roomId == roomId) {
          //Message m = Message();
          //TODO  m.parseMessage(replyObject, useRestApi, emojiManager());
          /*
        m.setMessageType(Message::MessageType::Information);
        m.setPendingMessage(temporaryMessage);
        if (!m.threadMessageId().isEmpty()) {
            // qDebug() << " It's a thread message id ****************************" << m.threadMessageId();
            updateThreadMessageList(m);
        }
        // m.setMessageType(Message::System);
        // TODO add special element!See roomData QJsonObject({"_id":"u9xnnzaBQoQithsxP","msg":"You have been muted and cannot speak in this
        // room","rid":"Dic5wZD4Zu9ze5gk3","ts":{"$date":1534166745895}})
        // Temporary => we don't add it in database
        */
          //r.messages.add(m);
          notifyListeners();
          break;
        }
      }
    }
  }

  List<Room> rooms = [];
  List<User> users = [];
}
