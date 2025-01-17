import 'package:json_annotation/json_annotation.dart';

part 'add_contact_request.g.dart';

@JsonSerializable()
class AddContactRequest {
  @JsonKey(name: 'firstname')
  final String firstName;
  @JsonKey(name: 'lastname')
  final String lastName;
  @JsonKey(name: 'emailaddress1')
  final String email;
  @JsonKey(name: 'adx_identity_newpassword')
  final String password;

  const AddContactRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory AddContactRequest.fromJson(Map<String, dynamic> json) =>
      _$AddContactRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddContactRequestToJson(this);

  @override
  String toString() {
    return 'AddContactRequest{firstName: $firstName, lastName: $lastName, email: $email, password: $password,}';
  }
}
