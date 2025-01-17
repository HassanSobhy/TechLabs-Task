import 'package:tech_labs_task/src/core/resources/data_state.dart';
import 'package:tech_labs_task/src/domain/entities/contacts/contacts.dart';

abstract class ContactsRepository {
  Future<DataState<String>> addContact(
    Contact contact,
  );

  Future<void> saveContactId(
    String contactId,
  );

  Future<String> getContactId();

  Future<void> deleteContactId();

  Future<DataState<Contact>> getContactById(
    String id,
  );

  Future<DataState<String>> updateContact(
    Contact contact,
  );
}
