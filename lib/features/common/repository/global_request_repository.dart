
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/either.dart';
import 'package:dio/dio.dart';

class GlobalRequestRepository {
  final dio = serviceLocator<DioSettings>().dio;

  Future<Either<Failure, S>> getSingle<S>({
    required S Function(Map<String, dynamic>) fromJson,
    required String endpoint,
    Map<String, dynamic>? query,
    bool sendToken = true,
  }) async {
    try {
      final result = await dio.get(endpoint,
          queryParameters: query,
          options: Options(headers: {
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          }));
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        return Right(fromJson(result.data));
      } else {
        return Left(ServerFailure(errorMessage: '', statusCode: 141));
      }
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: '$e'));
    }
  }

  ///Request for any kind of GET request for retrieving List of models,not a single model
  Future<Either<Failure, List<S>>> getList<S>(
      {required String endpoint,
      Map<String, dynamic>? query,
      required S Function(
        Map<String, dynamic>,
      )
          fromJson,
      String? responseDataKey,
      bool sendToken = true}) async {
    try {
      final result = await dio.get(endpoint,
          queryParameters: query,
          options: Options(
              headers: sendToken
                  ? {
                      'Authorization':
                          "Bearer ${StorageRepository.getString(StorageKeys.TOKEN, defValue: '')}"
                    }
                  : {}));

      List<S> list = [];

      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        if (responseDataKey != null && responseDataKey.isNotEmpty) {
          final data = result.data[responseDataKey] as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        } else {
          final data = result.data as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        }

        return Right(list);
      } else {
        return Left(ServerFailure(errorMessage: '', statusCode: 141));
      }
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
    }
  }

  /// Use for any kind of post map endpoint that retrieves response with single model , not a list
  Future<Either<Failure, S>> postAndSingle<S>({
    required S Function(Map<String, dynamic>) fromJson,
    required String endpoint,
    Map<String, dynamic>? query,
    FormData? formData,
    String? responseDataKey,
    Map<String, dynamic>? data,
    String? errorKey,
    bool sendToken = true,
  }) async {
    try {
      final result = await dio.post(endpoint,
          queryParameters: query,
          data: formData ?? data,
          options: Options(
              headers: sendToken
                  ? {
                      'Authorization':
                          "Bearer ${StorageRepository.getString(StorageKeys.TOKEN, defValue: '')}"
                    }
                  : {}));
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        if (responseDataKey != null && responseDataKey.isNotEmpty) {
          return Right(fromJson(result.data[responseDataKey]));
        } else {
          if (result.data.toString().isEmpty) {
            return Right('' as S);
          }
          return Right(fromJson(result.data));
        }
      } else {
        if (result.data is List && (result.data as List).isNotEmpty) {
          return Left(ServerFailure(
              errorMessage: (result.data as List).first.toString(),
              statusCode: 141));
        }
        var data = result.data[errorKey ?? 'detail'] ?? '';
        if (data.isEmpty) {
          data = result.data.toString();
        }

        return Left(ServerFailure(errorMessage: data, statusCode: 141));
      }
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: e.toString()));
    }
  }

  /// Use for any kind of post map endpoint that retrieves response List of Model , not a single model
  Future<Either<Failure, List<S>>> postAndList<S>({
    required String endpoint,
    required S Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? responseDataKey,
    bool sendToken = true,
  }) async {
    try {
      final result = await dio.post(endpoint,
          queryParameters: query,
          data: data,
          options: Options(
              headers: sendToken
                  ? {
                      'Authorization':
                          "Bearer ${StorageRepository.getString(StorageKeys.TOKEN, defValue: '')}"
                    }
                  : {}));
      var list = <S>[];

      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        if (responseDataKey != null && responseDataKey.isNotEmpty) {
          final data = result.data[responseDataKey] as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        } else {
          final data = result.data as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        }

        return Right(list);
      } else {
        return Left(ServerFailure(errorMessage: '', statusCode: 141));
      }
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: e.toString()));
    }
  }
}
