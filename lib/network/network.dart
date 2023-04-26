import 'package:dio/dio.dart';

Dio buildNetworkClient() {
  return Dio(
    BaseOptions(
      baseUrl: 'https://midam-wagr.vercel.app',
    ),
  );
}
