import 'package:equatable/equatable.dart';
import 'package:tech_labs_task/src/data/sources/remote/crm/contacts/request/add_contact_request.dart';

class Contact extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const Contact({
    this.id = "",
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.password = "",
  });

  @override
  List<Object> get props => [
        id,
        firstName,
        lastName,
        email,
        password,
      ];
}

extension ContactRequestExtenstion on Contact {
  AddContactRequest toRequest() {
    return AddContactRequest(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
}
