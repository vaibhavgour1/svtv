import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:svtvs/api/api_repository.dart';
import 'package:svtvs/api/endpoint.dart';
import 'package:svtvs/ui/splash_screen/splash_screen.dart';

BaseOptions baseOptions = BaseOptions(
  baseUrl: EndPoint.baseUrl,
  receiveTimeout: 60000,
  sendTimeout: 60000,
  responseType: ResponseType.json,
  maxRedirects: 3,
);
ApiRepository repository = ApiRepository();
Dio dio = Dio(baseOptions);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dio.interceptors.add(
    LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        logPrint: (text) {
          log(text.toString());
        }),
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
