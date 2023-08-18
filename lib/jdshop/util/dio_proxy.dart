
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
//DioProxy,可以使用Charles抓包.
class DioProxy {

  // 单例公开访问点
  factory DioProxy() =>_getInstance();

  // 静态私有成员，没有初始化
  static DioProxy? _instance=null;
  late Dio dio;

  // 私有构造函数
  DioProxy._() {
    // 具体初始化代码
    dio=  Dio();;
    //dio.options.contentType = "text";
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.findProxy = (uri) {
        return "PROXY 192.168.2.141:8888";//192.168.2.139为当前电脑的ip
      };
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    };
  }

  // 静态、同步、私有访问点
  static DioProxy _getInstance() {
    if (_instance == null) {
      _instance = DioProxy._();
    }
    return _instance!;
  }

}