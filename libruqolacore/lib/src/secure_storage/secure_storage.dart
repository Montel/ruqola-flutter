import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:libruqolacore/src/secure_storage/credentials.dart';

/// Please see https://pub.dev/packages/flutter_secure_storage
///
/// This package adds a dependency (https://wiki.gnome.org/Projects/Libsecret) for building on linux, it also requires special consideration for testing.
class SecureStorage {
  SecureStorage();
  final _storage = FlutterSecureStorage();

  /// TODO: users could possibly store more than one set of credentials
  /// so this will have to take that into account.
  ///
  /// What I suggest is we store a list of id's in shared_preferences at some point.
  /// for testing this is okay.
  String _getKey(int id) => "credentials-$id";

  /// Write [Credentials] to secure storage.
  ///
  /// TODO: Hard coding the key value to 0 for now.
  Future<void> writeCredentials(Credentials credentials, {int id = 0}) {
    return _write(_getKey(id), jsonEncode(credentials.toJson()));
  }

  /// Read [Credentials] from secure storage.
  ///
  /// TODO: Hard coding the key value to 0 for now.
  Future<void> deleteCredentials({int id = 0}) async => _delete(_getKey(id));

  /// Read [Credentials] from secure storage, returns null if none are found.
  ///
  /// TODO: Hard coding the key value to 0 for now.
  Future<Credentials?> readCredentials({int id = 0}) async {
    final value = await _read(_getKey(id));
    if (value == null) return null;
    return Credentials.fromJson(jsonDecode(value));
  }

  /// Write a [String] to secure storage at [key].
  Future<void> _write(String key, String data) => _storage.write(key: key, value: data);

  /// Read a [String] from secure storage at [key].
  Future<String?> _read(String key) => _storage.read(key: key);

  /// Delete a [key] and its data from secure storage.
  Future<void> _delete(String key) => _storage.delete(key: key);
}

/// Mock class used in unit testing to not require a system based Libsecret.
class MockSecureStorage extends SecureStorage {
  final _mockStorage = <String, String>{};

  @override
  Future<void> _write(String key, String data) async => _mockStorage[key] = data;

  @override
  Future<String?> _read(String key) async => _mockStorage[key];

  @override
  Future<void> _delete(String key) async => _mockStorage.remove(key);
}
