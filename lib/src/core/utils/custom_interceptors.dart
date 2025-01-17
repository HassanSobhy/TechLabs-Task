import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tech_labs_task/src/data/sources/local/shared_preferences_keys.dart';
import 'package:tech_labs_task/src/di/injector.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await injector<FlutterSecureStorage>().read(
      key: SharedPreferenceKeys.token,
    );
    options.headers['Authorization'] = 'Bearer $token';
    debugPrint(
        "REQUEST [${options.method}] URL: ${options.baseUrl + options.path} ${jsonEncode(options.data)}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        "RESPONSE [${response.statusCode}]\n${jsonEncode(response.data)}");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final newToken = await getAccessToken();
        final options = err.requestOptions;
        options.headers['Authorization'] = 'Bearer $newToken';

        final cloneReq = await injector<Dio>().fetch(options);

        return handler.resolve(cloneReq);
      } catch (e) {
        return handler.next(err);
      }
    } else {
      debugPrint(
          "ERROR [${err.response?.statusCode}] error message => ${err.response.toString()} error header => ");
      return super.onError(err, handler);
    }
  }

  Future<String> getAccessToken() async {
    final url =
        'https://login.microsoftonline.com/6960921c-9555-4fa0-ae99-2b5a385deedc/oauth2/v2.0/token';
    String grantType = dotenv.env['GRANT_TYPE']!;
    String clientId = dotenv.env['CLIENT_ID']!;
    String clientSecret = dotenv.env['CLIENT_SECRET']!;
    String scope = dotenv.env['SCOPE']!;

    final body = {
      'grant_type': grantType,
      'client_id': clientId,
      'client_secret': clientSecret,
      'scope': scope,
    };

    final response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final String token = data['access_token'];
      await injector<FlutterSecureStorage>().write(
        key: SharedPreferenceKeys.token,
        value: token,
      );
      return token;
    } else {
      throw Exception('Failed to get access token: ${response.body}');
    }
  }
}
