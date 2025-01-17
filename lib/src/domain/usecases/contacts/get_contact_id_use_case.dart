import 'package:tech_labs_task/src/domain/repositories/contacts_repository.dart';

class GetContactIdUseCase {
  final ContactsRepository _repository;

  GetContactIdUseCase(this._repository);

  Future<String> call() async {
    return await _repository.getContactId();
  }
}
