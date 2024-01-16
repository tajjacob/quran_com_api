import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quran_com_api/src/core/constants/api_constants.dart';

abstract class APIBaseHelper {
  factory APIBaseHelper() => APIBase();
  Future<Dio> getDio();
}

class APIBase implements APIBaseHelper {
  String baseUrl = APIConstants.baseUrl;
  @override
  Future<Dio> getDio() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    )..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
        ),
      );
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print,
        retries: 4,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
      ),
    );
    return dio;
  }
}
