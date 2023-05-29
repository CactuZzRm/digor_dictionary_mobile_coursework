import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/api_client.dart';

final apiClientProvider = Provider<ApiClient>(
    (ref) => ApiClient(Dio()..interceptors.add(LogInterceptor(requestBody: true, responseBody: true))));
