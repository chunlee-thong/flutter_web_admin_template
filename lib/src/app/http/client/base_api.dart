import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_web_admin_template/src/app/services/auth_service.dart';
import 'package:sura_flutter/sura_flutter.dart';

import 'http_client.dart';
import 'http_exception.dart';

///Data field from api response
const String kDataField = "data";

///Message field from api response
const String kMessageField = "message";

class API {
  late final Dio dio;
  final CancelToken cancelToken = CancelToken();

  API({Dio? client}) {
    dio = client ?? DioHttpClient.dioInstance;
  }

  ///Create an Http request method that required path and a callback functions [onSuccess]
  ///default Http method is [GET]
  Future<T> httpRequest<T>({
    required String path,
    required T Function(Response) onSuccess,
    String method = HttpMethod.get,
    Map<String, dynamic>? query,
    Map<String, dynamic> headers = const {},
    dynamic data = const {},
    bool requiredToken = true,
    String? customToken,
    Dio? customDioClient,
  }) async {
    Response? response;
    try {
      final httpOption = Options(method: method, headers: {});
      if (requiredToken) {
        String? token = await AuthService.getToken();
        if (token == null) {
          throw SessionExpiredException();
        }
        httpOption.headers!['Authorization'] = "bearer $token";
      }
      if (customToken != null) {
        httpOption.headers!['Authorization'] = "bearer $customToken";
      }
      httpOption.headers!.addAll(headers);
      response = await (customDioClient ?? dio).request(
        path,
        options: httpOption,
        queryParameters: query,
        data: data,
        cancelToken: cancelToken,
      );
      return onSuccess(response);
    } on DioError catch (e) {
      throw _handleDioError(e);
    } catch (e, stackTrace) {
      throw _handleOtherError(e, stackTrace);
    }
  }
}

///Handle another type of exception that relate to runtime exception
HttpRequestErrorWrapper _handleOtherError(dynamic exception, StackTrace stackTrace) {
  errorLog("Http Request Exception Error :=> ${exception.runtimeType}: "
      "$exception"
      "\nStackTrace:  ${stackTrace.toString()}");
  return HttpRequestErrorWrapper(
    "Error: ${HttpErrorMessage.unexpectedTypeError}",
    stackTrace,
  );
}

HttpRequestException _handleDioError(DioError exception) {
  _logDioError(exception);
  if (exception.error is SocketException) {
    return DioErrorException(HttpErrorMessage.connectionError);
  }

  switch (exception.type) {
    case DioErrorType.connectTimeout:
      return DioErrorException(HttpErrorMessage.timeoutError);
    case DioErrorType.response:
      if (exception.response!.statusCode == SessionExpiredException.code) {
        return SessionExpiredException();
      }
      return DioErrorException.response(exception.response);
    default:
      return DioErrorException(HttpErrorMessage.unexpectedError);
  }
}

void _logDioError(DioError exception) {
  String errorMessage = "Dio error :=> ${exception.requestOptions.path}";
  if (exception.response != null) {
    errorMessage += ", Response: ${exception.response?.statusCode} => ${exception.response!.data.toString()}";
  } else {
    errorMessage += ", ${exception.message}";
  }
  httpLog(errorMessage);
}
