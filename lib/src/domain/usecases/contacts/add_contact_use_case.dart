import 'package:tech_labs_task/src/core/resources/data_state.dart';
import 'package:tech_labs_task/src/domain/entities/contacts/contacts.dart';
import 'package:tech_labs_task/src/domain/repositories/contacts_repository.dart';

class AddContactUseCase {
  final ContactsRepository _repository;

  AddContactUseCase(this._repository);

  Future<DataState<String>> call(Contact contact) async {
    return await _repository.addContact(contact);
  }
}