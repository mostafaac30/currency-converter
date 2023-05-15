import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:email_app/src/core/error/error_handler.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config/app_prefs.dart';
import '../../config/constants.dart';

const APPLICATION_JSON = 'application/json';
const CONTENT_TYPE = 'content-type';
const ACCEPT = 'accept';
const AUTHORIZATION = 'authorization';

class DioFactory {
  final AppPreferences appPreferences;
  DioFactory({required this.appPreferences});

  Future<Dio> getDio({bool isLogin = false}) async {
    final Dio dio = Dio();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
    };
    if (!isLogin) headers['AUTHORIZATION'] = 'Bearer ${Constants.TOKEN}';

    dio.options = BaseOptions(
      baseUrl: Constants.apiUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut * 50),
      sendTimeout: const Duration(milliseconds: Constants.apiTimeOut * 50),
      connectTimeout: const Duration(milliseconds: Constants.apiTimeOut * 50),
      receiveDataWhenStatusError: true,
    );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          request: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }

  Future<Response> get(String url) async {
    try {
      final client = await getDio();
      return await client.get(url);
    } on DioError catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> post(String url, {dynamic data}) async {
    try {
      final client = await getDio();
      return await client.post(url, data: data);
    } on DioError catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> put(String url, dynamic data) async {
    try {
      final client = await getDio();
      return await client.put(url, data: data);
    } on DioError catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> patch(String url, dynamic data) async {
    try {
      final client = await getDio();
      return await client.patch(url, data: data);
    } on DioError catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> delete(String url) async {
    try {
      final client = await getDio();
      return await client.delete(url);
    } on DioError catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
