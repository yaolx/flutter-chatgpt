import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_chatgpt/utils/cahce.dart';
import 'package:flutter_chatgpt/utils/string.dart';

class Request {
  // 配置 Dio 实例
  static final BaseOptions _options = BaseOptions(
    baseUrl:
        'https://api.github.com/repos/${StringUtils.setValue(AppCache.githubRepo, 'yaolx/poetry')}',
    headers: {
      'Authorization': 'Bearer ${AppCache.githubToken}',
    },
    connectTimeout: const Duration(seconds: 10), // 连接超时时间
    receiveTimeout: const Duration(seconds: 3), // 响应超时时间
  );

  // 初始化dio
  static final Dio _dio = Dio(_options);

//Fiddler抓包设置代理
  /* static void proxyInit() {
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (url) {
        return "PROXY 192.168.31.220:8861";
      };
      //抓Https包设置
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
  } */

  static Future<T> _request<T>(String path,
      {required String method, queryParameters, data}) async {
    if (queryParameters != null) {
      var params = '';
      queryParameters.forEach((key, value) {
        if (!path.contains(key)) {
          params += key + '=' + value.toString() + '&';
        }
      });

      var url = params.substring(0, params.length - 1);
      path += '?$url';
    }

    try {
      Response response = await _dio.request(path,
          data: data, options: Options(method: method));
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data is Map || response.data is List) {
          return response.data;
        } else {
          return json.decode(response.data.toString());
        }
      } else {
        return Future.error('HTTP错误');
      }
    } on DioError catch (e) {
      print("错误状态码${e.response?.statusCode},错误消息${e.response?.statusMessage}");
    }
    return Future.error('HTTP错误');
  }

  static Future<T> get<T>(String path, {params}) {
    return _request(path, method: 'get', queryParameters: params);
  }

  static Future<T> post<T>(String path, {params, data}) {
    return _request(path, method: 'post', queryParameters: params, data: data);
  }

  static Future<T> delete<T>(String path, {params, data}) {
    return _request(path, method: 'delete', queryParameters: params);
  }

  static Future<T> put<T>(String path, {params, data}) {
    return _request(path, method: 'put', queryParameters: params, data: data);
  }
}
