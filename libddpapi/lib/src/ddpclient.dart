/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libddpapi/libddpapi.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'dart:developer' as developer;
import 'dart:async';
import 'dart:convert';

typedef ClientWebSocketController = StreamController<AbstractEvent>;

class DdpClient {
  ClientWebSocketController? _websocketController;

  late final Rocketchatbackend _rocketchatbackend = Rocketchatbackend(this);

  // Allow to return websocket controller
  ClientWebSocketController? get notifierController => _websocketController;

  set notifierController(ClientWebSocketController? controller) {
    if (_websocketController != null) {
      _websocketController!.close();
    }
    _websocketController = controller;
  }

  set authenticationbase(Authenticationbase auth) {
    _authentication = auth;
  }

  set serverUrl(String url) {
    _uri = Uri.parse(generateWebsocketUrl(url));
  }

  Future<void> start() async {
    if (_uri == null) {
      // Add level too TODO investigate it https://www.youtube.com/watch?v=ZYefoGqwsZU&ab_channel=NicoDevelop
      developer.log('Uri is null', name: 'ruqola.dart.ddpclient', level: 100);
      return;
    } else if (_uri!.hasEmptyPath) {
      developer.log('Uri is empty', name: 'ruqola.dart.ddpclient', level: 100);
      return;
    } else {
      // Add 10secondes timeout
      final timeout = Duration(seconds: 10);
      _socket = WebSocket(_uri!, timeout: timeout);
    }
    // Listen to changes in the connection state.
    _socket!.connection.listen((state) {
      // Handle changes in the connection state.
    });

    // Wait until first connection
    await _socket!.connection.firstWhere((state) => state is Connected);

    // Listen for incoming messages.
    _socket!.messages.listen(
      (message) {
        //print('message: "$message"');
        final messageNotification = Messagenotification.fromMap(json.decode(message));
        print("message found ${messageNotification.messageType}");
        switch (messageNotification.messageType) {
          case NotificationType.unknown:
            print("NotificationType.unknown it's a bug");
            break;
          case NotificationType.connected:
            if (_authentication != null) {
              _mapResult[_uid] = ResulType.login;
              sendMessage(jsonEncode(Authenticationutils.generateMethod(
                  "login",
                  Authenticationutils.loginLdap(
                      _authentication!.userName, _authentication!.password),
                  _uid++)));
            }
            break;
          case NotificationType.ping:
            developer.log('Ping received', name: 'ruqola.dart.ddpclient', level: 100);
            print("ping");
            sendMessage(jsonEncode(Authenticationutils.sendPong()));
            break;
          case NotificationType.error:
            print("ERROR ***** $message");
            // TODO: Handle this case.
            break;

          case NotificationType.added:
            print('message added: "$message"');
            _parseAdded(messageNotification);
            break;

          case NotificationType.changed:
            _parseChanged(messageNotification);
            break;

          case NotificationType.removed:
            _parseRemove(messageNotification);
            break;

          case NotificationType.nosub:
            _parseNoSubInfo(messageNotification.error, int.parse(messageNotification.id!));
            break;
          case NotificationType.updated:
            // TODO: Handle this case.
            break;

          case NotificationType.result:
            _parseResult(messageNotification);
            break;

          case NotificationType.ready:
            print('message ready: "$message"');
            break;
        }
      },
      onError: (error) => print('Error: $error'),
      onDone: () => print('Connection closed by server.'),
    );
    print("exit !!!! ");
  }

  void sendTextMessage(String roomId, String message) {
    sendMessage(jsonEncode(Authenticationutils.sendTextMessage(roomId, message, _uid)));
    _uid++;
  }

  void sendMessage(String message) {
    if (_socket != null && _socket!.connection.state is Connected) {
      print('Sending: $message');
      _socket!.send(message);
    } else {
      print('Cannot send message. WebSocket not connected.');
    }
  }

  Future<void> close() async {
    _socket?.close(1000, 'Close socket');
  }

  void method(ResulType type, List<Map<String, dynamic>> map) {
    sendMessage(jsonEncode(Authenticationutils.generateMethod(type.path, map, _uid)));
    // Store identifier
    _mapResult[_uid] = type;
    _uid++;
  }

  ResulType? resultMethodType(int id) {
    if (_mapResult.containsKey(id)) {
      ResulType type = _mapResult[id]!;

      // No idea why remove remove type too.
      Future.delayed(Duration.zero, () {
        _mapResult.remove(id);
      });
      print("return TYPE :::::::: $_mapResult sssssssssssssssssssssssssss $type");
      return type;
    }
    return null;
  }

  void subscribeAccount(String userId) {
    _rocketchatbackend.subscribeAccount(userId);
  }

  void subscribeRoomMessage(String roomId) {
    _rocketchatbackend.subscribeRoomMessage(roomId);
  }

  void _parseNoSubInfo(Messagenotificationerror? err, int id) {
    print("Nosub: $err");
    print("No subscription for element $id");
    print("Message: ${err!.message}");
    print("Reason: ${err.reason}");
  }

  void _addToController(AbstractEvent e) {
    if (_websocketController == null) {
      print("Missing websocket controller !!!!. Need to fix it");
      return;
    }
    _websocketController!.add(e);
  }

  void _parseResult(Messagenotification msg) {
    print("result");
    final identifier = int.parse(msg.id!);
    final type = resultMethodType(identifier);
    if (type != null) {
      final resultElement = ResultElements(msg, type);
      _addToController(resultElement);
    }
  }

  void _parseRemove(Messagenotification msg) {
    print("removed");
    final added = RemovedElements(msg);
    _addToController(added);
  }

  void _parseChanged(Messagenotification body) {
    print("changed");
    final added = ChangedElements(body);
    _addToController(added);
  }

  void _parseAdded(Messagenotification message) {
    print("added");
    final added = AddedElements(message);
    _addToController(added);
  }

  void subscribe(String name, String params) {
    sendMessage(jsonEncode(Authenticationutils.subscribe(name, params, _uid)));
    _uid++;
  }

  int generateIdentifier() {
    int uid = _uid;
    _uid++;
    return uid;
  }

  WebSocket? _socket;
  Uri? _uri;
  Authenticationbase? _authentication;
  int _uid = 0;
  final _mapResult = <int, ResulType>{};
}
