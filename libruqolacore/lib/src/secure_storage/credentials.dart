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
  final String username;

  /// Password.
  final String password;

  /// Instance url.
  final Uri uri;

  Credentials({
    required this.username,
    required this.password,
    required this.uri,
  });

  /// Create a json data from this [Credentials].
  Map<String, dynamic> toJson() => _$CredentialsToJson(this);

  /// Construct a [Credentials] object from json data.
  factory Credentials.fromJson(Map<String, dynamic> json) => _$CredentialsFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is Credentials &&
        other.username == username &&
        other.password == password &&
        other.uri == uri;
  }

  @override
  int get hashCode => Object.hash(username, password, uri);
}
