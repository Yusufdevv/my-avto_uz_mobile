import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/comparison/data/models/car_params_model.dart';
import 'package:dio/dio.dart';

abstract class ComparisonCarsDataSource {
  Future<List<CarParamsModel>> getComparisonCars();
}

class ComparisonDataSourceImpl extends ComparisonCarsDataSource {
  final Dio _dio;
  ComparisonDataSourceImpl(this._dio);
  @override
  Future<List<CarParamsModel>> getComparisonCars() async {
    try {
      final results = await _dio.get('',
          options: StorageRepository.getString('token').isNotEmpty
              ? Options(headers: {
                  'Authorization':
                      'Bearer ${StorageRepository.getString('token')}'
                })
              : null);
      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        final response = (results.data as List)
            .map((e) => CarParamsModel.fromJson(e))
            .toList();
        return response;
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
