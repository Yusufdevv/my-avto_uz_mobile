import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/dealers/data/models/cars_in_marks_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

class CarsInMarksDataSource {
  final Dio _dio;

  CarsInMarksDataSource(this._dio);

  Future<GenericPagination<CarsInMarksModel>> getCars(
      {required CarMarkParams params}) async {
    try {
      final results = await _dio.get(
        params.next ??
            'users/dealers/${params.dealer}/mark/${params.mark}/cars/',
        options: Options(headers: {
          'Authorization':
              'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
        }),
      );

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return GenericPagination.fromJson(results.data,
            (p0) => CarsInMarksModel.fromJson(p0 as Map<String, dynamic>));
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

class CarMarkParams {
  final String dealer;
  final String mark;
  final String? next;

  const CarMarkParams({this.dealer = '', this.mark = '', this.next});
}
