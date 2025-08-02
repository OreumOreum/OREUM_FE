import 'package:dio/dio.dart';
import 'api_path.dart';

final BaseOptions dioBaseOptions = BaseOptions(
  baseUrl: ApiPath.baseUrl,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  responseType: ResponseType.json,
);