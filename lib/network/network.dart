import 'package:dio/dio.dart';

Dio buildNetworkClient() {
  return Dio(
    BaseOptions(
      baseUrl: 'https://worldgolfranking2021api.wagr.com/api/wagr',
    ),
  );
}
