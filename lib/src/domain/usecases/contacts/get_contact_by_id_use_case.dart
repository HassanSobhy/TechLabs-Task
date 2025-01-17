import 'package:tech_labs_task/src/core/resources/data_state.dart';
import 'package:tech_labs_task/src/domain/entities/contacts/contacts.dart';
import 'package:tech_labs_task/src/domain/repositories/contacts_repository.dart';

class GetContactByIdUseCase {
  final ContactsRepository _repository;

  GetContactByIdUseCase(this._repository);

  Future<DataState<Contact>> call(String id) async {
    return await _repository.getContactById(id);
  }
}