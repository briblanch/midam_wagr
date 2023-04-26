import 'package:dio/dio.dart';

Dio buildNetworkClient() {
  return Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000',
    ),
  );
}
