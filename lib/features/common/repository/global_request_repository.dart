import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/either.dart';
import 'package:dio/dio.dart';

class GlobalRequestRepository {
  final dio = serviceLocator<DioSettings>().dio;

  Future<Either<Failure, S>> getSingle<S>(
      {required String endpoint,
      Map<String, dynamic>? query,
      required S Function(Map<String, dynamic>) fromJson,
      bool sendToken = true}) async {
    try {
      // print(StorageRepository.getString('token', defValue: ''));
      final result = await dio.get(endpoint,
          queryParameters: query,
          options: Options(
              headers: sendToken
                  ? {
                      'Authorization':
                          "Bearer ${StorageRepository.getString('token', defValue: '')}"
                    }
                  : {}));
      // print(result.realUri);
      // print("====  ${result.data}  =====");
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        return Right(fromJson(result.data));
      } else {
        return Left(ServerFailure(errorMessage: '', statusCode: 141));
      }
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
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
                          "Bearer ${StorageRepository.getString('token', defValue: '')}"
                    }
                  : {}));

      // print(result.realUri);
      // print(result.data);
      List<S> list = [];

      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        if (responseDataKey != null && responseDataKey.isNotEmpty) {
          var data = result.data[responseDataKey] as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        } else {
          var data = result.data as List<dynamic>;
          list = data.map((e) => fromJson(e)).toList();
        }

        return Right(list);
      } else {
        return Left(ServerFailure(errorMessage: '', statusCode: 141));
      }
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
    }
  }

  /// Use for any kind of post map endpoint that retrieves response with single model , not a list
  Future<Either<Failure, S>> postAndSingle<S>(
      {required String endpoint,
      Map<String, dynamic>? query,
      required S Function(Map<String, dynamic>) fromJson,
      FormData? formData,
      String? responseDataKey,
      Map<String, dynamic>? data,
      String? errorKey,
      bool sendToken = true}) async {
    try {
      final result = await dio.post(endpoint,
          queryParameters: query,
          data: formData ?? data,
          options: Options(
              headers: sendToken
                  ? {
                      'Authorization':
                          "Bearer ${StorageRepository.getString('token', defValue: '')}"
                    }
                  : {}));
      // print(result.realUri);
      // print(result.data);
      // print(result.statusCode);
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        if (responseDataKey != null && responseDataKey.isNotEmpty) {
          return Right(fromJson(result.data[responseDataKey]));
        } else {
          return Right(fromJson(result.data));
        }
      } else {
        final data = result.data[errorKey ?? 'detail'] ?? '';

        return Left(ServerFailure(errorMessage: data, statusCode: 141));
      }
    } catch (e) {
      return Left(ServerFailure(statusCode: 141, errorMessage: ''));
    }
  }

  /// Use for any kind of post map endpoint that retrieves response List of Model , not a single model
  Future<Either<Failure, List<S>>> postAndList<S>(
      {required String endpoint,
      Map<String, dynamic>? query,
      required Map<String, dynamic>? data,
      required S Function(Map<String, dynamic>) fromJson,
      String? responseDataKey,
      bool sendToken = true}) async {
    try {
      final result = await dio.post(endpoint,
          queryParameters: query,
          data: data,
          options: Options(
              headers: sendToken
                  ? {
                      'Authorization':
                          "Bearer ${StorageRepository.getString('token', defValue: '')}"
                    }
                  : {}));
      // print(result.realUri);
      // print(result.data);
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
