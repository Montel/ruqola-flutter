/*
 * SPDX-FileCopyrightText: 2025 Werner Scholtz <werner.scholtz@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credentials.g.dart';

@JsonSerializable()

/// Not sure if this exists elsewhere in some kind of format maybe a good idea to have something like this ?
///
/// This uses https://pub.dev/packages/json_serializable and https://pub.dev/packages/build_runner
/// To automatically generate toJson and fromJson.
/// To regenerate use `dart run build_runner build` in this package's root directory.
@immutable
class Credentials {
  /// Username.
  final String? username;

  /// Password.
  final String? password;

  /// Instance url.
  /// TODO: maybe this should be a [Uri].
  final String? url;

  Credentials({
    required this.username,
    required this.password,
    required this.url,
  });

  bool get isValid => (username ?? '').isNotEmpty && (password ?? '').isNotEmpty && url != null;

  Credentials copyWith({
    String? username,
    String? password,
    String? uri,
  }) {
    return Credentials(
      username: username ?? this.username,
      password: password ?? this.password,
      url: uri ?? this.url,
    );
  }

  /// Create a json data from this [Credentials].
  Map<String, dynamic> toJson() => _$CredentialsToJson(this);

  /// Construct a [Credentials] object from json data.
  factory Credentials.fromJson(Map<String, dynamic> json) => _$CredentialsFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is Credentials &&
        other.username == username &&
        other.password == password &&
        other.url == url;
  }

  @override
  int get hashCode => Object.hash(username, password, url);
}
