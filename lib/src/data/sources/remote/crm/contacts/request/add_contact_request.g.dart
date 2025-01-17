// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddContactRequest _$AddContactRequestFromJson(Map<String, dynamic> json) =>
    AddContactRequest(
      firstName: json['firstname'] as String,
      lastName: json['lastname'] as String,
      email: json['emailaddress1'] as String,
      password: json['adx_identity_newpassword'] as String,
    );

Map<String, dynamic> _$AddContactRequestToJson(AddContactRequest instance) =>
    <String, dynamic>{
      'firstname': instance.firstName,
      'lastname': instance.lastName,
      'emailaddress1': instance.email,
      'adx_identity_newpassword': instance.password,
    };
