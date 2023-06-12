import 'dart:convert';

import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/logging_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class JournalService {
  static const String url = 'http://192.168.0.65:3000/';
  static const String resource = 'journals/';

  http.Client client = InterceptedClient.build(
    interceptors: [
      LoggingInterceptor(),
    ],
  );

  String getUrl() {
    return '$url$resource';
  }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(
      Uri.parse(getUrl()),
      headers: {'Content-type': 'application/json'},
      body: jsonJournal,
    );
    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }

  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}
