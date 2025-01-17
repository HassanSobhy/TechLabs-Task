import 'package:json_annotation/json_annotation.dart';
import 'package:tech_labs_task/src/domain/entities/contacts/contacts.dart';

part 'remote_contact.g.dart';

@JsonSerializable()
class RemoteContact {
  @JsonKey(name: 'contactid')
  final String? id;
  @JsonKey(name: 'firstname')
  final String? firstName;
  @JsonKey(name: 'lastname')
  final String? lastName;
  @JsonKey(name: 'emailaddress1')
  final String? email;
  @JsonKey(name: 'adx_identity_newpassword')
  final String? password;

  const RemoteContact({
    this.id = "",
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.password = "",
  });

  factory RemoteContact.fromJson(Map<String, dynamic> json) =>
      _$RemoteContactFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteContactToJson(this);
}

extension RemoteContactExtension on RemoteContact {
  Contact mapToDomain() {
    return Contact(
      id: id ?? "",
      firstName: firstName ?? "",
      lastName: lastName ?? "",
      email: email ?? "",
      password: password ?? "",
    );
  }
}
