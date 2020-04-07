// import 'dart:html';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/serviceUrl.dart';

Future _request(url, {params = const {}, String method = 'post'}) async {
  Dio dio = new Dio();
  Response response;
  try {
    print('开始获取数据 ===> $url');
    if(method.toUpperCase() == 'POST') {
      dio.options.contentType = "application/x-www-form-urlencoded";
      print('POST ===> $params');
      response = await dio.post(url, data: params);
    } else if(method.toUpperCase() == 'GET') {
      print('GET ===> $params');
      response = await dio.get(url);
    }
    if (response.statusCode == 200) {
      print('请求成功。。。');
      print(response.data);
      return response.data;
    } else {
      throw Exception('请求数据失败:' + response.request.path);
    }
  } catch (e) {
    print('ERROR: 请求数据异常========>$e');
  }
}

Future getHomePageContext({params = const {}}) async {
  return await _request(servicePath['homePageContext'], params: params);
}

Future getHomePageBelowConten({params = const {}}) async {
  return await _request(servicePath['homePageBelowConten'], params: params);
}

Future getCategory({params = const {}}) async {
  return await _request(servicePath['getCategory'], params: params);
}