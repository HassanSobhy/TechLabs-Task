import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tech_labs_task/src/data/sources/remote/api_keys.dart';
import 'package:tech_labs_task/src/data/sources/remote/crm/contacts/entity/remote_contact.dart';
import 'package:tech_labs_task/src/data/sources/remote/crm/contacts/request/add_contact_request.dart';

part 'contacts_api_service.g.dart';

@RestApi()
abstract class ContactsAPIService {
  factory ContactsAPIService(Dio dio) = _ContactsAPIService;

  @POST(APIKeys.addContact)
  Future<HttpResponse> addContact(
    @Body() AddContactRequest request,
  );

  @GET('${APIKeys.addContact}({id})')
  Future<HttpResponse<RemoteContact>> getContactById(
    @Path('id') String id,
  );

  @PATCH('${APIKeys.addContact}({id})')
  Future<HttpResponse> updateContact(
    @Path('id') String id,
    @Body() AddContactRequest request,
  );
}
