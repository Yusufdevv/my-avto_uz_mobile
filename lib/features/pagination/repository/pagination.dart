// ignore_for_file: avoid_catches_without_on_clauses

import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

class PaginationRepository {
  final dio = serviceLocator<DioSettings>().dio;

  /// Give empty String for "next" if you don't have next link
  Future<Either<Failure, GenericPagination<T>>> fetchMore<T>(
      {required String url,
      String? next,
      bool sendToken = true,
      required T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic>? query}) async {
    try {
      var queryParams = <String, dynamic>{};
      if (query != null) {
        queryParams = query;
      }

      final result = await dio.get(
        next != null && next.isNotEmpty ? next : url,
        options: Options(
            headers: sendToken
                ? {
                    'Authorization':
                        "Bearer ${StorageRepository.getString('token', defValue: '')}"
                  }
                : {}),
        queryParameters: queryParams,
      );
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        final data = GenericPagination<T>.fromJson(
            result.data!, (data) => fromJson(data as Map<String, dynamic>));

        return Right(data);
      } else {
        return Left(ServerFailure(
            statusCode: result.statusCode ?? 0,
            errorMessage: result.statusMessage ?? ''));
      }
    } catch (e) {
      return Left(ServerFailure(errorMessage: '', statusCode: 0));
    }
  }
}
