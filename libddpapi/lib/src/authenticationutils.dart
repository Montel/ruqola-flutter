/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Authenticationutils {
  /// Convert password with ssha256
  static String convertPasswordSsha256(String password) {
    var bytes1 = utf8.encode(password);
    var digest1 = sha256.convert(bytes1);
    return digest1.toString();
  }

  static Map<String, dynamic> sendTextMessage(String roomId, String message, int identifier,
      [String messageId = ""]) {
    List<Map<String, dynamic>> sendJson = [
      {
        // TODO messageid ????
        //"_id": roomId,
        "rid": roomId,
        "msg": message,
      }
    ];
    return generateMethod("sendMessage", sendJson, identifier);
  }

// Generate method
  static Map<String, dynamic> generateMethod(
      String methodName, List<Map<String, dynamic>> params, int identifier) {
    return {"msg": "method", "method": methodName, "params": params, "id": identifier.toString()};
  }

  static Map<String, dynamic> generateMethodCall(
      String methodName, List<dynamic> params, int identifier) {
    return {"msg": "method", "method": methodName, "params": params, "id": identifier.toString()};
  }

  /// Send pong info
  static Map<String, dynamic> sendPong() {
    return {"msg": "pong"};
  }

  /// Generate sendConnect
  static Map<String, dynamic> sendConnect() {
    return {
      "msg": "connect",
      "version": "1",
      "support": ["1", "pre2", "pre1"]
    };
  }

  /// Generate loginLdap
  static List<Map<String, dynamic>> loginLdap(String user, String password) {
    return [
      {"ldap": true, "username": user, "ldapPass": password, "ldapOptions": {}}
    ];
  }

  /// Return loginResume
  static List<Map<String, dynamic>> loginResume(String token) {
    return [
      {"resume": token}
    ];
  }

// https://api.flutter.dev/flutter/dart-convert/jsonDecode.html
  static List<Map<String, dynamic>> loginOauth(String credentialToken, String credentialSecret) {
    return [
      {
        "oauth": {
          "credentialToken": credentialToken,
          "credentialSecret": credentialSecret,
        }
      }
    ];
  }

  static Map<String, dynamic> subscribe(String name, String params, int id) {
    Map<String, dynamic> map = {
      "msg": "sub",
      "id": id.toString(),
      "name": name,
      "params": [
        params,
        {"useCollection": false, "args": []}
      ]
    };
    return map;
  }
}
