import 'dart:convert';

import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/logging_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class JournalService {
  static const String url = 'http://localhost:3000/';
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

  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(Uri.parse(getUrl()));

    if (response.statusCode != 200) {
      throw Exception();
    }

    List<Journal> list = [];
    List<dynamic> listDynamic = json.decode(response.body);
    for (var jsonMap in listDynamic) {
      list.add(Journal.fromMap(jsonMap));
    }

    return list;
  }

  Future<bool> edit(String id, Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());

    http.Response response = await client.put(
      Uri.parse('${getUrl()}$id'),
      headers: {'Content-type': 'application/json'},
      body: jsonJournal,
    );

    return response.statusCode == 200;
  }

  Future<bool> delete(String id) async {
    http.Response response = await http.delete(Uri.parse('${getUrl()}$id'));

    return response.statusCode == 200;
  }
}
