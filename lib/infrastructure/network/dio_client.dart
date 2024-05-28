import 'package:dio/dio.dart';

import '../../constant/string_constant.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(BaseOptions(
      baseUrl: ConstantString.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
    return dio;
  }
}
