import 'dart:developer' as dev;

import 'package:alice/alice.dart';
import 'package:auto/assets/constants/app_constants.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: 'https://panel.avto.uz/api/v1/',
    connectTimeout: 35000,
    receiveTimeout: 33000,
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept-Language':
          StorageRepository.getString(StorageKeys.LANGUAGE, defValue: 'uz')
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: 'https://panel.avto.uz/api/v1/',
      connectTimeout: 35000,
      receiveTimeout: 33000,
      headers: <String, dynamic>{'Accept-Language': lang},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  bool get chuck =>
      StorageRepository.getBool(StorageKeys.CHUCK, defValue: false);

  Dio get dio => Dio(_dioBaseOptions)
    ..interceptors.add(LogInterceptor(
      requestBody: kDebugMode,
      request: kDebugMode,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
      responseHeader: kDebugMode,
      error: kDebugMode,
      logPrint: (object) => dev.log(object.toString()),
    ))
    ..interceptors.add(Alice(
      navigatorKey: AppConstants.navigatorKey,
      showNotification: chuck || kDebugMode,
      showInspectorOnShake: chuck || kDebugMode,
      darkTheme: false,
    ).getDioInterceptor());
}
