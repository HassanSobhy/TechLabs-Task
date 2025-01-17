import 'package:tech_labs_task/src/domain/repositories/contacts_repository.dart';

class SaveContactIdUseCase {
  final ContactsRepository _repository;

  SaveContactIdUseCase(this._repository);

  Future<void> call(String id) async {
    return await _repository.saveContactId(id);
  }
}
