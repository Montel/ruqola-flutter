// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credentials _$CredentialsFromJson(Map<String, dynamic> json) => Credentials(
      password: json['password'] as String,
      username: json['username'] as String,
      uri: Uri.parse(json['url'] as String),
    );

Map<String, dynamic> _$CredentialsToJson(Credentials instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'url': instance.uri.toString(),
    };
