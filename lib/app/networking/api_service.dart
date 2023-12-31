import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| ApiService
| -------------------------------------------------------------------------
| Define your API endpoints

| Learn more https://nylo.dev/docs/5.x/networking
|--------------------------------------------------------------------------
*/

class ApiService extends BaseApiService {
  ApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  final interceptors = {
    if (getEnv('APP_DEBUG') == true) PrettyDioLogger: PrettyDioLogger()
  };

  Future fetchTestData() async {
    return await network(
      request: (request) => request.get("/endpoint-path"),
    );
  }
}
