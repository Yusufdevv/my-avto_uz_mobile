import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/comparison/data/models/comparison_model.dart';
import 'package:dio/dio.dart';

abstract class ComparisonCarsDataSource {
  Future getComparisonCars();
}

class ComparisonDataSourceImpl extends ComparisonCarsDataSource {
  final Dio _dio;
  ComparisonDataSourceImpl(this._dio);
  @override
  Future getComparisonCars() async {
    try {
       final response = await _dio.get('car/comparison/',
          options: StorageRepository.getString('token').isNotEmpty
              ? Options(headers: {
                  'Authorization':
                      'Bearer ${StorageRepository.getString('token')}'
                })
              : null);
      print('Results: $response');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data as List)
            .map((e) => ComparisonModel.fromJson(e))
            .toList();
      } else {
        throw ServerException(
            errorMessage: response.data.toString(),
            statusCode: response.statusCode ?? 0);
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
