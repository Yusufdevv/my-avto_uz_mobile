import 'package:auto/assets/constants/app_constants.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/models/yandex_search_model.dart';
import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class YandexSearchDataSource {
  bool get chuck =>
      StorageRepository.getBool(StorageKeys.CHUCK, defValue: false);

  Dio get dio => Dio(BaseOptions(
        connectTimeout: 35000,
        receiveTimeout: 33000,
        followRedirects: false,
        validateStatus: (status) => status != null && status <= 500,
      ))
        ..interceptors.add(LogInterceptor(
          requestBody: kDebugMode,
          request: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
          error: kDebugMode,
        ))
        ..interceptors.add(Chuck(
          navigatorKey: AppConstants.navigatorKey,
          showNotification: chuck || kDebugMode,
          showInspectorOnShake: chuck || kDebugMode,
          darkTheme: false,
        ).getDioInterceptor());

  Future<YandexSearchModel> getAddress({
    String? type,
    String? long,
    String? lat,
  }) async {
    try {
      final req =
          'https://search-maps.yandex.ru/v1/?type=$type&text=$lat,$long&lang=${StorageRepository.getString(StorageKeys.LANGUAGE, defValue: 'uz')}&apikey=${AppConstants.yandexApiKey}';
      final result = await dio.getUri(Uri.parse(req));

      return YandexSearchModel.fromJson(result.data);
    } catch (e) {
      throw const ServerException();
    }
  }
}
