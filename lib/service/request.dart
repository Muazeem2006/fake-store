// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

final dio = Dio();
String baseUrl = "https://fakestoreapi.com";

// for http get request 
Future<Response> get(String url, [dynamic data]) async {
  url = baseUrl + url;
  print(url);
  final Response response = await dio.get(url, queryParameters: data);
  print(response.data);
  return response;
}

// for http post request 
Future<Response> post(String url, [dynamic data]) async {
  url = baseUrl + url;
  print(url);
  final Response response = await dio.post(url, queryParameters: data);
  print(response.data);
  return response;
}

// for http delete request 
Future<Response> delete(String url, [dynamic data]) async {
  url = baseUrl + url;
  print(url);
  final Response response = await dio.delete(url, queryParameters: data);
  print(response.data);
  return response;
}


// for http update request 
Future<Response> put(String url, [dynamic data]) async {
  url = baseUrl + url;
  print(url);
  final Response response = await dio.put(url, queryParameters: data);
  print(response.data);
  return response;
}


