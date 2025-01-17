// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteContact _$RemoteContactFromJson(Map<String, dynamic> json) =>
    RemoteContact(
      id: json['contactid'] as String? ?? "",
      firstName: json['firstname'] as String? ?? "",
      lastName: json['lastname'] as String? ?? "",
      email: json['emailaddress1'] as String? ?? "",
      password: json['adx_identity_newpassword'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteContactToJson(RemoteContact instance) =>
    <String, dynamic>{
      'contactid': instance.id,
      'firstname': instance.firstName,
      'lastname': instance.lastName,
      'emailaddress1': instance.email,
      'adx_identity_newpassword': instance.password,
    };
