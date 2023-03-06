import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/dealers/data/models/cars_in_dealer_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

class CarsInDealerDataSource {
  final Dio _dio;
  CarsInDealerDataSource(this._dio);
  Future<GenericPagination<CarsInDealerModel>> getCars({
    required String slug,
    String? next,
  }) async {
    try {
      final results = await _dio.get(
       next ?? 'users/dealers/$slug/cars/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return GenericPagination.fromJson(results.data,
            (p0) => CarsInDealerModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            errorMessage: results.data.toString(),
            statusCode: results.statusCode ?? 0);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
