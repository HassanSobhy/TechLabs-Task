import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tech_labs_task/src/core/resources/data_state.dart';
import 'package:tech_labs_task/src/data/sources/local/shared_preferences_keys.dart';
import 'package:tech_labs_task/src/data/sources/remote/crm/contacts/contacts_api_service.dart';
import 'package:tech_labs_task/src/data/sources/remote/crm/contacts/entity/remote_contact.dart';
import 'package:tech_labs_task/src/domain/entities/contacts/contacts.dart';
import 'package:tech_labs_task/src/domain/repositories/contacts_repository.dart';

class ContactsRepositoryImplementation extends ContactsRepository {
  final ContactsAPIService _contactsAPIService;
  final FlutterSecureStorage _secureStorage;

  ContactsRepositoryImplementation(
    this._contactsAPIService,
    this._secureStorage,
  );

  @override
  Future<DataState<String>> addContact(Contact contact) async {
    try {
      final httpResponse =
          await _contactsAPIService.addContact(contact.toRequest());
      if (httpResponse.response.statusCode == HttpStatus.noContent) {
        final entityId = httpResponse.response.headers['OData-EntityId']?.first;
        if (entityId != null) {
          final contactId = entityId.split('(').last.split(')').first;
          return DataSuccess(
            data: contactId,
          );
        } else {
          return DataFailed(
            message: "Something went wrong",
          );
        }
      }

      return DataFailed(
        message: "Something went wrong"
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }

  @override
  Future<void> saveContactId(String contactId) {
    return _secureStorage.write(
      key: SharedPreferenceKeys.contactID,
      value: contactId,
    );
  }

  @override
  Future<String> getContactId() async {
    return await _secureStorage.read(key: SharedPreferenceKeys.contactID) ?? "";
  }

  @override
  Future<DataState<Contact>> getContactById(String id) async {
    try {
      final httpResponse = await _contactsAPIService.getContactById(
        id,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: httpResponse.data.mapToDomain(),
        );

      }

      return DataFailed(
        message: "Something went wrong"
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }

  @override
  Future<DataState<String>> updateContact(Contact contact) async{
    try {
      final httpResponse = await _contactsAPIService.updateContact(
        contact.id,
        contact.toRequest(),
      );
      if (httpResponse.response.statusCode == HttpStatus.noContent) {
        return DataSuccess(
          data: "Success"
        );

      }

      return DataFailed(
          message: "Something went wrong"
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong ${e.message}",
      );
    }
  }

  @override
  Future<void> deleteContactId() async {
    await _secureStorage.delete(key: SharedPreferenceKeys.contactID);
  }
}
