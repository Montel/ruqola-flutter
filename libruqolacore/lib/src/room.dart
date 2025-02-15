/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:flutter/material.dart';
import 'package:libruqolacore/src/message/message.dart';
import 'package:libruqolacore/src/teams/teaminfo.dart';

// t (can take values "d" , "c" or "p" or "l")
enum RoomType {
  unknown,
  direct,
  channel,
  private,
  // Omnichannel ?
}

// Add state
enum RoomState {
  none(0),
  readOnly(1),
  selected(2),
  favorite(4),
  open(8),
  alert(16),
  blocker(32),
  archived(64),
  blocked(128),
  encrypted(256),
  joinCodeRequired(512),
  wasInitialized(1024),
  broadCast(2048),
  autoTranslate(4096);

  final int value;
  const RoomState(this.value);
}

class Room with ChangeNotifier {
  String displayName() {
    /*
            if (mRocketChatAccount) {
                if (mRocketChatAccount->useRealName()) {
                    return r->displayFName();
                } else {
                    if (mChannelType == RoomType.direct) {
                        return mName;
                    } else {
                  */
    if (mFName != null && mFName!.isEmpty) {
      return mFName!;
    } else {
      return mName;
    }
/*                
                    }
                }
            } else {
                return r->name();
            }
*/
  }

  void roomTypeFromString(String type) {
    if (type == "p") {
      mChannelType = RoomType.private;
    } else if (type == "c") {
      mChannelType = RoomType.channel;
    } else if (type == "d") {
      mChannelType = RoomType.direct;
    } else {
      mChannelType = RoomType.unknown;
    }
  }

  void parseSubscriptionRoom(Map<String, dynamic> map) {
    mRoomId = map["rid"].toString();
    mName = map["name"].toString();
    mOpen = map["open"];
    mAlert = map["alert"];
    mFName = map["fname"];
    if (map.containsKey("ro")) {
      mReadOnly = map["ro"];
    }

    if (map.containsKey("blocker")) {
      mBlocker = map["blocker"];
    } else {
      mBlocker = false;
    }
    if (map.containsKey("blocked")) {
      mBlocked = map["blocked"];
    } else {
      mBlocked = false;
    }

    if (map.containsKey("encrypted")) {
      mEncrypted = map["encrypted"];
    } else {
      mEncrypted = false;
    }

    if (map.containsKey("f")) {
      mFavorite = map["f"];
    }
    roomTypeFromString(map["t"] ?? '');

    print("$this");
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  void parseInsertRoom(Map<String, dynamic> map) {
    mRoomId = map["_id"].toString();
    mName = map["name"].toString();
    mOpen = map["open"];
    mAlert = map["alert"];
    mFName = map["fname"];
    if (map.containsKey("ro")) {
      mReadOnly = map["ro"];
    }

    if (map.containsKey("announcement")) {
      mAnnouncement = map["announcement"];
    }
    if (map.containsKey("description")) {
      mDescription = map["description"];
    }
    mUnread = map["unread"];

    if (map.containsKey("f")) {
      mFavorite = map["f"];
    }

    if (map.containsKey("tunread")) {
      // mThreadUnread = setThreadUnread(extractStringList(json, "tunread"_L1));
    }

    mAutoTranslate = map["autoTranslate"];

    roomTypeFromString(map["t"] ?? '');
    teamInfo = TeamInfo.fromJson(map);
/*
    setAutoTranslateLanguage(json["autoTranslateLanguage"_L1].toString());
    
    setJitsiTimeout(Utils::parseDate(QStringLiteral("jitsiTimeout"), json));
    // topic/announcement/description is not part of update subscription

    if (json.contains("userMentions"_L1)) {
        setUserMentions(json["userMentions"_L1].toInt());
    }
    if (json.contains("groupMentions"_L1)) {
        setGroupMentions(json["groupMentions"_L1].toInt());
    }

    if (json.contains("tunread"_L1)) {
        setThreadUnread(extractStringList(json, "tunread"_L1));
    }
    setUpdatedAt(Utils::parseDate(QStringLiteral("_updatedAt"), json));
    setLastSeenAt(Utils::parseDate(QStringLiteral("ls"), json));
    setLastMessageAt(Utils::parseDate(QStringLiteral("lm"), json));


    parseBlockerArchived(json);

    // setE2eKeyId(json["e2eKeyId"_L1].toString());
    setE2EKey(json["E2EKey"_L1].toString());

    if (json.contains("encrypted"_L1)) {
        setEncrypted(json["encrypted"_L1].toBool());
    } else {
        setEncrypted(false);
    }

    parseCommonData(json);
    parseDisplaySystemMessage(json);

    const QJsonValue ownerValue = json.value("u"_L1);
    if (!ownerValue.isUndefined()) {
        const QJsonObject objOwner = ownerValue.toObject();
        setRoomCreatorUserId(objOwner.value("_id"_L1).toString().toLatin1());
        setRoomCreatorUserName(objOwner.value("username"_L1).toString());
    } else {
        // When room is initialized we are the owner. When we update room we have the real
        // owner and if it's empty => we need to clear it.
        setRoomCreatorUserId(QByteArray());
        setRoomCreatorUserName(QString());
    }
    // qDebug() << " *thus" << *this;
    mNotificationOptions.parseNotificationOptions(json);
*/

    notifyListeners();
  }

  void parseUpdateRoom(Map<String, dynamic> map) {
    if (map.containsKey("alert")) {
      mAlert = map["alert"];
    }
    if (map.containsKey("f")) {
      mFavorite = map["f"];
    }
    if (map.containsKey("unread")) {
      mUnread = map["unread"];
    }
    if (map.containsKey("announcement")) {
      mAnnouncement = map["announcement"];
    }

    if (map.containsKey("open")) {
      mOpen = map["open"];
    }
    if (map.containsKey("topic")) {
      mTopic = map["topic"];
    }
    if (map.containsKey("name")) {
      mName = map["name"];
    }
    if (map.containsKey("description")) {
      mDescription = map["description"];
    }
    if (map.containsKey("fname")) {
      mFName = map["fname"];
    }
    mReadOnly = map["ro"] ?? false;
    if (map.containsKey("rid")) {
      mRoomId = map["rid"];
    }
    if (map.containsKey("msgs")) {
      mNumberMessages = map["msgs"];
    }
    if (map.containsKey("autoTranslate")) {
      mAutoTranslate = map["autoTranslate"];
    }

/*
    setJitsiTimeout(Utils::parseDate(QStringLiteral("jitsiTimeout"), map));

    if (map.containsKey("userMentions")) {
        setUserMentions(map["userMentions"].toInt());
    }
    if (map.containsKey("groupMentions")) {
        setGroupMentions(map["groupMentions"].toInt());
    }
    if (map.containsKey("joinCodeRequired")) {
        setJoinCodeRequired(map["joinCodeRequired"].toBool());
    } else {
        setJoinCodeRequired(false);
    }


    if (map.containsKey("autoTranslateLanguage")) {
        setAutoTranslateLanguage(map["autoTranslateLanguage"]);
    }

    parseBlockerArchived(map);
    if (map.containsKey("blocked")) {
        setBlocked(map["blocked"].toBool());
    } else {
        setBlocked(false);
    }

    if (map.containsKey("encrypted")) {
        setEncrypted(map["encrypted"].toBool());
    } else {
        setEncrypted(false);
    }
    // TODO verify it. add autotest
    if (map.containsKey("broadcast")) {
        setBroadcast(map["broadcast"].toBool());
    } else {
        setBroadcast(false);
    }
    
    const qint64 result = Utils::parseDate(QStringLiteral("ls"), map);
    if (result != -1) {
        setLastSeenAt(result);
    }
    const qint64 lm = Utils::parseDate(QStringLiteral("lm"), map);
    if (lm != -1) {
        setLastMessageAt(lm);
    }

    setHighlightsWord(extractStringList(map, "userHighlights"));

    if (map.containsKey("ignored")) {
        setIgnoredUsers(extractStringList(map, "ignored"));
    }

    // TODO E2EKey
    setE2eKeyId(map["e2eKeyId"]);

    const QJsonValue ownerValue = map.value("u");
    if (!ownerValue.isUndefined()) {
        const QJsonObject objOwner = ownerValue.toObject();
        setRoomCreatorUserId(objOwner.value("_id").toLatin1());
        setRoomCreatorUserName(objOwner.value("username"));
    } else {
        // When room is initialized we are the owner. When we update room we have the real
        // owner and if it's empty => we need to clear it.
        setRoomCreatorUserId(QByteArray());
        setRoomCreatorUserName(QString());
    }
    if (map.containsKey("prid")) {
        setParentRid(map["prid"].toLatin1());
    }
    if (map.containsKey("uids")) {
        const QJsonArray &uidsArray = map["uids"].toArray();
        const auto &u0 = uidsArray[0].toLatin1();
        const auto &u1 = uidsArray[1].toLatin1();
        setDirectChannelUserId((u0 == mRocketChatAccount->userId()) ? u1 : u0);

        QStringList lstUids;
        lstUids.reserve(uidsArray.count());
        for (int i = 0; i < uidsArray.count(); ++i) {
            lstUids << uidsArray.at(i);
        }
        setUids(lstUids);
    }

    const QJsonArray userNamesArray = map.value("usernames").toArray();
    QStringList lstUserNames;
    const int nbUserNamesArray = userNamesArray.count();
    lstUserNames.reserve(nbUserNamesArray);
    for (int i = 0; i < nbUserNamesArray; ++i) {
        lstUserNames << userNamesArray.at(i);
    }
    setUserNames(lstUserNames);

    setMutedUsers(extractStringList(map, "muted"));
    setAvatarETag(map.value("avatarETag").toLatin1());
    parseDisplaySystemMessage(map);
    parseRetentionInfo(map);
*/
    teamInfo = TeamInfo.fromJson(map);
    notifyListeners();
  }

/*
  Room.fromJson(Map<String, dynamic> json) {
      r->setRoomId(o["rid"_L1].toString().toLatin1());
    r->setChannelType(Room::roomTypeFromString(o["t"_L1].toString()));
    r->setName(o["name"_L1].toString());
    r->setFName(o["fname"_L1].toString());
    r->setAutoTranslateLanguage(o["autoTranslateLanguage"_L1].toString());
    r->setAutoTranslate(o["autoTranslate"_L1].toBool());
    r->setRoomCreatorUserName(o["roomCreatorUserName"_L1].toString());
    r->setRoomCreatorUserId(o["roomCreatorUserID"_L1].toString().toLatin1());
    r->setTopic(o["topic"_L1].toString());
    r->setJitsiTimeout(static_cast<qint64>(o["jitsiTimeout"_L1].toDouble()));
    r->setReadOnly(o["ro"_L1].toBool());
    r->setUnread(o["unread"_L1].toInt(0));
    r->setUserMentions(o["userMentions"_L1].toInt(0));
    r->setGroupMentions(o["groupMentions"_L1].toInt(0));
    r->setAnnouncement(o["announcement"_L1].toString());
    r->setSelected(o["selected"_L1].toBool());
    r->setFavorite(o["favorite"_L1].toBool());
    r->setAlert(o["alert"_L1].toBool());
    r->setOpen(o["open"_L1].toBool());
    r->setArchived(o["archived"_L1].toBool());
    r->setDescription(o["description"_L1].toString());
    r->setBlocker(o["blocker"_L1].toBool());
    r->setBlocked(o["blocked"_L1].toBool());
    r->setEncrypted(o["encrypted"_L1].toBool());
    r->setBroadcast(o["broadcast"_L1].toBool());
    r->setE2EKey(o["e2ekey"_L1].toString());
    r->setE2eKeyId(o["e2ekeyid"_L1].toString());
    r->setJoinCodeRequired(o["joinCodeRequired"_L1].toBool());
    r->setUpdatedAt(static_cast<qint64>(o["updatedAt"_L1].toDouble()));
    r->setLastSeenAt(static_cast<qint64>(o["lastSeenAt"_L1].toDouble()));
    r->setNumberMessages(static_cast<qint64>(o["msgs"_L1].toInt()));

    r->setMutedUsers(extractStringList(o, "muted"_L1));

    r->setDisplaySystemMessageTypes(extractStringList(o, "systemMessages"_L1));

    r->setIgnoredUsers(extractStringList(o, "ignored"_L1));

    r->setHighlightsWord(extractStringList(o, "userHighlights"_L1));

    r->setRoles(extractStringList(o, "roles"_L1));

    r->setThreadUnread(extractStringList(o, "tunread"_L1));

    const QJsonObject notificationsObj = o.value("notifications"_L1).toObject();
    const NotificationOptions notifications = NotificationOptions::deserialize(notificationsObj);
    r->setNotificationOptions(notifications);

    r->setDirectChannelUserId(o["directChannelUserId"_L1].toString().toLatin1());

    r->setAvatarETag(o["avatarETag"_L1].toString().toLatin1());

    r->setUids(extractStringList(o, "uids"_L1));

    const QJsonObject retentionObj = o.value("retention"_L1).toObject();
    const RetentionInfo retention = RetentionInfo::deserialize(retentionObj);
    r->setRetentionInfo(retention);
    const TeamInfo teaminfo = TeamInfo::deserialize(o);
    r->setTeamInfo(teaminfo);

    if (o.contains("prid"_L1)) {
        r->setParentRid(o["prid"_L1].toString().toLatin1());
    }

    r->setUserNames(extractStringList(o, "usernames"_L1));

  }
*/
  Map<String, dynamic> toJson() => {
        "rid": mRoomId,
        //o["t"_L1] = Room::roomFromRoomType(r->channelType());
        "name": mName,
        "fname": mFName,
        /*
    o["roomCreatorUserName"_L1] = r->roomOwnerUserName();
    o["roomCreatorUserID"_L1] = QString::fromLatin1(r->roomCreatorUserId());
    if (r->numberMessages() > 0) {
        o["msgs"_L1] = r->numberMessages();
    }
    if (!r->topic().isEmpty()) {
        o["topic"_L1] = r->topic();
    }
    if (!r->autoTranslateLanguage().isEmpty()) {
        o["autoTranslateLanguage"_L1] = r->autoTranslateLanguage();
    }
    if (r->autoTranslate()) {
        o["autoTranslate"_L1] = r->autoTranslate();
    }
    o["jitsiTimeout"_L1] = r->jitsiTimeout();
    o["updatedAt"_L1] = r->updatedAt();
    o["lastSeenAt"_L1] = r->lastSeenAt();
    */
        "ro": mReadOnly,
        "unread": mUnread,
        /*
    if (!r->announcement().isEmpty()) {
        o["announcement"_L1] = r->announcement();
    }
    */
      };
/*
    o["selected"_L1] = r->selected();
    o["favorite"_L1] = r->favorite();
    o["alert"_L1] = r->alert();
    o["open"_L1] = r->open();
    o["blocker"_L1] = r->blocker();
    o["blocked"_L1] = r->blocked();
    o["encrypted"_L1] = r->encrypted();
    o["archived"_L1] = r->archived();
    o["broadcast"_L1] = r->broadcast();
    if (r->joinCodeRequired()) {
        o["joinCodeRequired"_L1] = true;
    }
    if (!r->e2EKey().isEmpty()) {
        o["e2ekey"_L1] = r->e2EKey();
    }
    if (!r->e2eKeyId().isEmpty()) {
        o["e2ekeyid"_L1] = r->e2eKeyId();
    }

    if (!r->description().isEmpty()) {
        o["description"_L1] = r->description();
    }
    o["userMentions"_L1] = r->userMentions();
    if (r->groupMentions() > 0) {
        o["groupMentions"_L1] = r->groupMentions();
    }

    serializeStringList(o, "muted"_L1, r->mutedUsers());

    serializeStringList(o, "ignored"_L1, r->ignoredUsers());
    serializeStringList(o, "tunread"_L1, r->threadUnread());

    serializeStringList(o, "roles"_L1, r->roles());

    o["notifications"_L1] = NotificationOptions::serialize(r->notificationOptions());

    if (!r->directChannelUserId().isEmpty()) {
        o["directChannelUserId"_L1] = QLatin1StringView(r->directChannelUserId());
    }

    serializeStringList(o, "systemMessages"_L1, r->displaySystemMessageTypes());

    serializeStringList(o, "userHighlights"_L1, r->highlightsWord());

    if (!r->avatarETag().isEmpty()) {
        o["avatarETag"_L1] = QLatin1StringView(r->avatarETag());
    }
    if (!r->uids().isEmpty()) {
        o["uids"_L1] = QJsonArray::fromStringList(r->uids());
    }

    if (r->retentionInfo().isNotDefault()) {
        o["retention"_L1] = RetentionInfo::serialize(r->retentionInfo());
    }
    if (r->teamInfo().isValid()) {
        TeamInfo::serialize(r->teamInfo(), o);
    }
    if (!r->parentRid().isEmpty()) {
        o["prid"_L1] = QLatin1StringView(r->parentRid());
    }

    serializeStringList(o, "usernames"_L1, r->userNames());

    if (toBinary) {
        return QCborValue::fromJsonValue(o).toCbor();
    }
    d.setObject(o);
    return d.toJson(QJsonDocument::Indented);
      };
*/
  // Roles
  List<String>? mRoles;

  List<String>? mUids;
  List<String>? mUserNames;
  List<String>? mThreadUnread;

  String mRoomId = "";
  // name
  String mName = "";

  String? mFName;

  // topic
  String mTopic = "";

  // Description
  String? mDescription;

  // Announcement
  String? mAnnouncement;

  String? mParentRid;

  int mNumberMessages = 0;

  int mUnread = 0;
  bool mOpen = true;
  bool mAlert = false;
  bool mReadOnly = false;
  bool mFavorite = false;

  bool mWasInitialized = false;
  bool mBlocker = false;
  bool mBlocked = false;
  bool mEncrypted = false;
  bool mAutoTranslate = false;

  RoomType mChannelType = RoomType.unknown;
  TeamInfo teamInfo = TeamInfo.defaultValues();
  List<Message> messages = [];

  @override
  String toString() {
    return "Room(mRoomId: $mRoomId  mName: $mName open: $mOpen mAnnouncement: $mAnnouncement mReadOnly: $mReadOnly mAlert: $mAlert, number of message:${messages.length}, teamInfo: $teamInfo)";
  }
}
