import 'package:dio/dio.dart';
import 'api_path.dart';

final BaseOptions tourDioBaseOptions = BaseOptions(
  baseUrl: ApiPath.tourBaseUrl,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  responseType: ResponseType.json,
);