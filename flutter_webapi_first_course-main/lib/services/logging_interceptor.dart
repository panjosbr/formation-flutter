import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v(
      'Requisição para ${data.baseUrl} \nCabeçalhos: ${data.headers} \nBody: ${data.body}',
    );
    print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode ~/ 100 == 2) {
      logger.i(
        'Resposta de ${data.url} \nStatus da resposta: ${data.statusCode}\nHeader: ${data.headers} \nBody: ${data.body}',
      );
    } else {
      logger.e(
        'Resposta de ${data.url} \nStatus da resposta: ${data.statusCode} \nHeader: ${data.headers} \nBody: ${data.body}',
      );
    }
    return data;
  }
}
