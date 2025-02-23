/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libddpapi/libddpapi.dart' as libddpapi;
import 'package:test/test.dart';

void main() {
  group('AuthenticationUtil', () {
    test('Test loginResume', () {
      String token = "AbAB";
      final List<dynamic> v = [
        {"resume": 'AbAB'}
      ];
      expect(libddpapi.Authenticationutils.loginResume(token), v);
    });

    test('Test convert passwrd', () {
      String password = "foo";
      expect(libddpapi.Authenticationutils.convertPasswordSsha256(password),
          "2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae");
    });

    test('Test loginLdap', () {
      String user = "bla";
      String password = "foo";
      final List<dynamic> v = [
        {'ldap': true, 'username': 'bla', 'ldapPass': 'foo', 'ldapOptions': {}}
      ];
      expect(libddpapi.Authenticationutils.loginLdap(user, password), v);
    });

    test('Test loginOauth', () {
      String credentialToken = "token1";
      String credentialSecret = "secret1";
      final List<dynamic> v = [
        {
          'oauth': {'credentialToken': 'token1', 'credentialSecret': 'secret1'}
        }
      ];
      expect(libddpapi.Authenticationutils.loginOauth(credentialToken, credentialSecret), v);
    });

    test('Test generate method loginLdap', () {
      String user = "bla";
      String password = "foo";

      final result = libddpapi.Authenticationutils.generateMethod(
          "login", libddpapi.Authenticationutils.loginLdap(user, password), 1);

      final v = {
        'msg': 'method',
        'method': 'login',
        'params': [
          {'ldap': true, 'username': 'bla', 'ldapPass': 'foo', 'ldapOptions': {}}
        ],
        'id': '1'
      };
      expect(result, v);
    });

    test('Test subscribe', () {
      final v = {
        'msg': 'sub',
        'id': '5',
        'name': 'method_name',
        'params': [
          'room_id/deleteMessage',
          {'useCollection': false, 'args': []}
        ]
      };
      String map = "room_id/deleteMessage";
      expect(libddpapi.Authenticationutils.subscribe("method_name", map, 5), v);
    });
  });
}
