/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:libddpapi/libddpapi.dart' as libddpapi;
import 'package:libruqolacore/libruqolacore.dart';
import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;

class Rocketchataccount {
  final _ddpclient = libddpapi.DdpClient();
  final AccountSettings settings = AccountSettings();
  final models = Rocketchataccountmodels();
  final receiverTypingNotification = Receivertypingnotification();

  final StreamController<libddpapi.AbstractEvent> _eventWebsocketController =
      StreamController<libddpapi.AbstractEvent>.broadcast();

  /// Something for the UI to determine what is happening here.
  ///
  /// This could be an enum with more states than just true/false
  /// [error, connecting, connected, reloading, etc....]
  final isConnected = ValueNotifier<bool>(false);

  Future<void> connect() async {
    // Add controler
    _ddpclient.notifierController = _eventWebsocketController;
    // Assign url
    _ddpclient.serverUrl = settings.serverUrl;

    // Authentication base
    final authbase = libddpapi.Authenticationbase();
    authbase.setPassword = settings.password;
    authbase.setUserUserName = settings.userName;
    _ddpclient.authenticationbase = authbase;

    _eventWebsocketController.stream
        .where((event) => event is libddpapi.AddedElements)
        .listen((event) {
      final addedElement = event as libddpapi.AddedElements;
      if (addedElement.message.collection == 'users') {
        final id = addedElement.message.id;
        final field = addedElement.message.fields!;
        final username = field.userName;
        if (username == settings.userName) {
          _ddpclient.subscribeAccount(id!);
        }
      }
      print('added element : ${addedElement.message}');
    });

    _eventWebsocketController.stream
        .where((event) => event is libddpapi.ChangedElements)
        .listen((event) {
      final changedElement = event as libddpapi.ChangedElements;
      _parseChangedElement(changedElement);
      print('changed element : ${changedElement.message}');
    });

    _eventWebsocketController.stream
        .where((event) => event is libddpapi.RemovedElements)
        .listen((event) {
      final removedElement = event as libddpapi.RemovedElements;
      print('removed element : ${removedElement.message}');
      _parseRemovedElement(removedElement);
    });

    _eventWebsocketController.stream
        .where((event) => event is libddpapi.ResultElements)
        .listen((event) {
      final resultElement = event as libddpapi.ResultElements;
      // print('result element *****************: ${resultElement.message}');

      // print('result element Id : ${resultElement.message['result']['id']}');
      //print(
      //    'result element Token : ${resultElement.message['result']['token']}');

      final identifier = resultElement.message.id!;
      // print("IDENTIFIER : $identifier");
      final type = _ddpclient.resultMethodType(int.parse(identifier));
      // print("type**************************** $type");
      switch (type) {
        case libddpapi.ResulType.login:
          {
            print('LOGIN: result element *****************: ${resultElement.message.result}');
            const List<Map<String, dynamic>> result = [
              {"\$date": 0}
            ];
            if (resultElement.message.result != null) {
              final result = resultElement.message.result!;
              // Assign token/id
              if (result.token != null) {
                settings.setAuthToken = result.token!;
              }
              if (result.id != null) {
                settings.setUserId = result.id!;
              }
            }

            _ddpclient.method(libddpapi.ResulType.getSubscriptions, result);
            break;
            // Store token/id in settings
          }
        case libddpapi.ResulType.getSubscriptions:
          {
            models.parseSubscriptionGet(event.message.result!);
            const List<Map<String, dynamic>> result = [
              {"\$date": 0}
            ];
            _ddpclient.method(libddpapi.ResulType.getRooms, result);
            break;
          }
        case libddpapi.ResulType.getRooms:
          {
            print("it's getROOMS !!!!");
            break;
          }
        case null:
          print("It's null!!!! Look at what we need to do");
          break;
        case libddpapi.ResulType.unknown:
          print("libddpapi.ResulType.unknown: what do you do ?");
          break;
      }
    });

    // start client
    await _ddpclient.start();
    _ddpclient.sendMessage(jsonEncode(libddpapi.Authenticationutils.sendConnect()));

    // Update the is connected value.
    isConnected.value = true;
  }

  Future<void> close() async {
    _ddpclient.close();
  }

  Future<void> sendMessage(String roomId, String message) async {
    _ddpclient.sendTextMessage(roomId, message);
  }

  Future<void> loadHistory(String roomId) async {
    if (!models.roomWasInitialized(roomId)) {
      // verify that room is already loaded
      _ddpclient.subscribeRoomMessage(roomId);
      models.setRoomWasInitialized(roomId, true);
      // (["655dce3ad4d9f6f4174260f3",null,50,{"$date":1736416546526}])
      // Allow to generate code from util class
      final List<dynamic> messageObj = [
        roomId,
        null,
        "50",
        {"\$date": 1736510044447} // FIXME verify date
      ];

      final String methodName = 'loadHistory';
      final Map<String, dynamic> generatedLoadHistory =
          libddpapi.Authenticationutils.generateMethodCall(
              methodName, messageObj, _ddpclient.generateIdentifier());

      librocketchatrestapi.MethodCallInfo info =
          librocketchatrestapi.MethodCallInfo(methodName, false, generatedLoadHistory);
      librocketchatrestapi.MethodCall loadHistory = librocketchatrestapi.MethodCall(info);
      loadHistory.serverUrl = settings.serverUrl;
      loadHistory.userId = settings.userId;
      loadHistory.authToken = settings.authToken;
      var resultHistory = await loadHistory.start();
      // print("result history $resultHistory");
      if (resultHistory.success != null) {
        // Decode message from result
        final result = resultHistory.result!['result'];
        if (result != null) {
          final messagesArray = result['messages'];
          models.processIncomingMessages(messagesArray);
        }
      }
    }
  }

  void _parseRemovedElement(libddpapi.RemovedElements removedElement) {
    String? collection = removedElement.message.collection;
    if (collection == null) {
      print("problem with parsing collection ");
      return;
    }
    if (collection == "users") {
      print("user removed !!!!");
      // TODO implement it
    } else if (collection == "stream-notify-logged") {
      print("stream-notify-logged: removed ");
    } else {
      print(" Other collection type  removed $collection object ${removedElement.message.fields}");
    }
  }

  void _parseChangedElement(libddpapi.ChangedElements changedElement) {
    String? collection = changedElement.message.collection;
    if (collection == null) {
      print("problem with parsing collection ");
      return;
    }
    if (collection == "stream-room-messages") {
      models.processIncomingMessages(changedElement.message.fields!.args!.args!);
      // TODO
    } else if (collection == "users") {
      print("User collection");
    } else if (collection == "rooms") {
      print("Rooms collection");
    } else if (collection == "stream-notify-user") {
      _parseStreamNotifyUser(changedElement);
    } else if (collection == "stream-notify-room") {
      final String eventname = changedElement.message.fields!.eventName!;
      print("eventName $eventname");
      if (eventname.endsWith("/deleteMessage")) {
        String roomId = eventname.replaceAll("/deleteMessage", '');

//  const QJsonArray contents = fields.value("args"_L1).toArray();

        /*
            MessagesModel *messageModel = mRocketChatAccount->messageModelForRoom(roomId.toLatin1());
            if (messageModel) {
                const QByteArray messageId = contents.at(0).toObject()["_id"_L1].toString().toLatin1();
                messageModel->deleteMessage(messageId);
                Room *room = mRocketChatAccount->room(roomId.toLatin1());
                if (room) {
                    mRocketChatAccount->deleteMessageFromDatabase(room->displayFName(), messageId);
                }
                // We don't know if we delete a message from thread. So look at in threadModel if we have this identifier
                MessagesModel *threadMessageModel = mRocketChatAccount->threadMessageModel();
                threadMessageModel->deleteMessage(messageId);
            } else {
                qCWarning(RUQOLA_MESSAGE_LOG) << " MessageModel is empty for :" << roomId << " It's a bug for sure.";
            }
            */
      } else if (eventname.endsWith("/user-activity")) {
        String roomId = eventname.replaceAll("/user-activity", '');
        // flutter: changed element : messageType changed collection: stream-notify-room, id: id
        // method null subs: null fields: eventName: dBWXYy4nyBHn8Q7dv/user-activity args: args: [user, true]
        // username: null error: null  result: null

        final String typingUserName = changedElement.message.fields!.args!.args![0].toString();
        if (typingUserName != settings.userName) {
          bool status = false;
          if (changedElement.message.fields!.args!.args![1] is bool) {
            status = changedElement.message.fields!.args!.args![1] as bool;
          } else if (changedElement.message.fields!.args!.args![1] is List) {
            var listElement = changedElement.message.fields!.args!.args![1];
            if (listElement.isNotEmpty && listElement[0].toString() == "user-typing") {
              status = true;
            }
          }
          receiverTypingNotification.insertTypingNotification(roomId, typingUserName, status);
        }
      } else if (eventname.endsWith("/deleteMessageBulk")) {
        // TODO ????
      } else {
        print("Unknown stream-notify-room $eventname");
      }
    } else if (collection == "stream-notify-logged") {
      final String eventname = changedElement.message.fields!.eventName!;
      if (eventname == "roles-change") {
        // TODO mRocketChatAccount->rolesChanged(contents);
      } else if (eventname == "updateAvatar") {
        // TODO mRocketChatAccount->avatarChanged(contents);
      } else if (eventname == "updateEmojiCustom") {
        // TODO mRocketChatAccount->addUpdateEmojiCustomList(contents);
      } else if (eventname == "Users:NameChanged") {
        // TODO mRocketChatAccount->setNameChanged(contents);
      } else if (eventname == "Users:Deleted") {
        // TODO mRocketChatAccount->deleteUser(contents);
      } else if (eventname == "deleteCustomUserStatus") {
        // TODO mRocketChatAccount->deleteCustomUserStatus(contents);
      } else if (eventname == "updateCustomUserStatus") {
        // TODO mRocketChatAccount->updateCustomUserStatus(contents);
      } else if (eventname == "user-status") {
        // TODO mRocketChatAccount->setUserStatusChanged(contents);
      } else if (eventname == "deleteEmojiCustom") {
        // TODO mRocketChatAccount->deleteEmojiCustom(contents);
      } else if (eventname == "permissions-changed") {
        // TODO mRocketChatAccount->permissionUpdated(contents);
      } else if (eventname == "private-settings-changed") {
        // TODO mRocketChatAccount->privateSettingsUpdated(contents);
      } else {
        print("stream-notify-logged not supported $eventname");
      }
    } else if (collection == "stream-notify-all") {
      final String eventname = changedElement.message.fields!.eventName!;
      if (eventname == "deleteCustomSound") {
        // TODO mRocketChatAccount->deleteCustomSound(contents);
      } else if (eventname == "updateCustomSound") {
        // TODO mRocketChatAccount->updateCustomSound(contents);
      } else {
        print("NEED TO IMPLEMENT stream-notify-all $eventname");
      }
      //{"collection":"stream-notify-all","fields":{"args":[{"soundData":{"_id":"LmShBQiqaCJDbgduR","_updatedAt":{"$date":1603350386481},"extension":"mp3","name":"ss"}}],"eventName":"deleteCustomSound"},"id":"id","msg":"changed"}
    } else if (collection == "stream-stdout") {
      // mRocketChatAccount->addStdoutInfo(contents);
    } else if (collection == "stream-roles") {
      final String eventname = changedElement.message.fields!.eventName!;
      if (eventname == "roles") {
        // TODO mRocketChatAccount->updateRoles(contents);
      }
    } else if (collection == "stream-apps") {
      final String eventname = changedElement.message.fields!.eventName!;
      if (eventname == "apps") {
        // TODO mRocketChatAccount->updateApps(contents);
      }
    } else {
      print("Unknow and implemented $collection");
    }
  }

  void _parseStreamNotifyUser(libddpapi.ChangedElements changedElement) {
    final String eventname = changedElement.message.fields!.eventName!;

    if (eventname.endsWith("/uiInteraction")) {
      // TODO interaction!
    } else if (eventname.endsWith("subscriptions-changed")) {
      /*
            RoomModel *model = mRocketChatAccount->roomModel();
            model->updateSubscription(contents);
            if (mRocketChatAccount->ruqolaLogger()) {
                QJsonDocument d;
                d.setObject(fields);
                mRocketChatAccount->ruqolaLogger()->dataReceived(QByteArrayLiteral("stream-notify-user: subscriptions-changed:") + d.toJson());
            } else {
                qCDebug(RUQOLA_LOG) << "stream-notify-user: subscriptions-changed " << object;
            }

      */
    } else if (eventname.endsWith("/rooms-changed")) {
      var listElement = changedElement.message.fields!.args!.args![0];
      String actionName = listElement.toString();
      print("ROOM CHANGED ************************************ $actionName");

      if (actionName == "updated") {
        print("Update room ");
        var listElement = changedElement.message.fields!.args!.args![1];
        models.updateRooms(listElement);
        /*
    
                mRocketChatAccount->updateUserInRoom(roomData);
                */
      } else if (actionName == "inserted") {
        print("insert new Room !!!!!");
        var listElement = changedElement.message.fields!.args!.args![1];
        models.insertRoom(listElement);
        /*
                mRocketChatAccount->playNewRoomNotification();
                */
      } else if (actionName == "removed") {
        print("removed Room !!!!!");
        /*
                qCDebug(RUQOLA_LOG) << "Remove channel" << contents;
                const QJsonObject roomData = contents[1].toObject();
                // TODO use rid
                model->removeRoom(QByteArray());
                */
      } else {
        print("rooms-changed invalid actionName $actionName");
      }
    } else if (eventname.endsWith("/notification")) {
      // TODO NotificationInfo info = NotificationInfo.fromJson()
      // TODO
      //mRocketChatAccount->sendNotification(contents);
    } else if (eventname.endsWith("/webrtc")) {
    } else if (eventname.endsWith("/otr")) {
      // TODO mRocketChatAccount->parseOtr(contents);
    } else if (eventname.endsWith("/message")) {
      print("INSERT MESSAGE");
      var listElement = changedElement.message.fields!.args!.args![0];
      var roomData = listElement[0];
      models.addMessage(roomData);
      /*
                 if (mRocketChatAccount->ruqolaLogger()) {
                QJsonDocument d;
                d.setObject(object);
                mRocketChatAccount->ruqolaLogger()->dataReceived(QByteArrayLiteral("stream-notify-user: message: ") + d.toJson());
            } else {
                qCDebug(RUQOLA_LOG) << "stream-notify-user : Message: " << object;
            }
            const QJsonObject roomData = contents[0].toObject();
            mRocketChatAccount->addMessage(roomData);
            qCDebug(RUQOLA_LOG) << "stream-notify-user : Message  " << eventname << " contents " << contents;
            qDebug() << "stream-notify-user : Message  " << eventname << " contents " << contents;
      */
    } else if (eventname.endsWith("/userData")) {
      /*
            if (mRocketChatAccount->ruqolaLogger()) {
                QJsonDocument d;
                d.setObject(object);
                mRocketChatAccount->ruqolaLogger()->dataReceived(QByteArrayLiteral("stream-notify-user: userData event: ") + d.toJson());
            } else {
                qCDebug(RUQOLA_LOG) << "stream-notify-user: userData event: " << object;
            }
            mRocketChatAccount->updateUserData(contents);
            // TODO update avatar
            qCDebug(RUQOLA_LOG) << "stream-notify-user : message event " << eventname << " contents " << contents;


      */
    } else if (eventname.endsWith("/video-conference")) {
      /*
            qDebug() << " *******************************************************************" << eventname << " contents " << contents;
            if (mRocketChatAccount->ruqolaLogger()) {
                QJsonDocument d;
                d.setObject(object);
                mRocketChatAccount->ruqolaLogger()->dataReceived(QByteArrayLiteral("stream-notify-user: video-conference ") + d.toJson());
            } else {
                qCDebug(RUQOLA_LOG) << "stream-notify-user: video-conference :account name:" << mRocketChatAccount->accountName() << "object" << object;
            }
            mRocketChatAccount->parseVideoConference(contents);
            qCDebug(RUQOLA_LOG) << "stream-notify-user : message event " << eventname << " contents " << contents;

      */
    } else if (eventname.endsWith("/force_logout")) {
      /*
                  qCDebug(RUQOLA_LOG) << " FORCE LOGOUT!!!!";
            // Clear auth token otherwise we can't reconnect.
            mRocketChatAccount->settings()->setAuthToken({});
            qCDebug(RUQOLA_LOG) << "stream-notify-user : message event " << eventname << " contents " << contents;
            */
    } else {
/*
            if (mRocketChatAccount->ruqolaLogger()) {
                QJsonDocument d;
                d.setObject(object);
                mRocketChatAccount->ruqolaLogger()->dataReceived(QByteArrayLiteral("stream-notify-user: Unknown event: ") + d.toJson());
            } else {
                qCDebug(RUQOLA_UNKNOWN_COLLECTIONTYPE_LOG) << "Unknown change: " << object;
            }
            qCDebug(RUQOLA_LOG) << "stream-notify-user : message event " << eventname << " contents " << contents;
*/
    }
  }
}
