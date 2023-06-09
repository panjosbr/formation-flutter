import 'package:flutter_webapi_first_course/services/logging_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class JournalService {
  static const String url = 'http://192.168.0.65:3000/';
  static const String resource = 'learnhttp/';

  http.Client client = InterceptedClient.build(
    interceptors: [
      LoggingInterceptor(),
    ],
  );

  String getUrl() {
    return '$url$resource';
  }

  register(String content) {
    client.post(
      Uri.parse(getUrl()),
      body: {'content': content},
    );
  }

  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}
