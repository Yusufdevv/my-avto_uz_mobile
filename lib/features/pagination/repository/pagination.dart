import 'package:auto/core/error/failures.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/utils/either.dart';
import 'package:dio/dio.dart';


class PaginationRepository {
  final dio = serviceLocator<DioSettings>().dio;
/// Give empty String for "next" if you don't have next link
  Future<Either<Failure, GenericPagination<T>>> fetchMore<T>(
      {required String url,
      required String next,
      required T Function(Map<String, dynamic>) fromJson,
        Map<String,dynamic>? query
     }) async {
    try {
      final result = await dio.get(
        next.isNotEmpty ? next : url,
        queryParameters: query
      );
      print(query);
      print(result.realUri);
      print(result.data);
      print(result.statusCode);
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        final data = GenericPagination<T>.fromJson((result.data!),
            (data) => fromJson((data as Map<String, dynamic>)));

        return Right(data);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      print(e.toString()+'error read here ');
      return Left(ServerFailure());
    }
  }
}
