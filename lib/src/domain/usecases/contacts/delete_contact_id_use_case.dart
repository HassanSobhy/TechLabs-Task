import 'package:tech_labs_task/src/domain/repositories/contacts_repository.dart';

class DeleteContactIdUseCase {
  final ContactsRepository _repository;

  DeleteContactIdUseCase(this._repository);

  Future<void> call() async {
    return await _repository.deleteContactId();
  }
}
