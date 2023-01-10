import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/comparison/data/models/comparison_model.dart';
import 'package:dio/dio.dart';

// ignore: one_member_abstracts
abstract class ComparisonCarsDataSource {
  Future getComparisonCars();

  Future<void> postComparisonCars(int id);
  Future<void> deleteComparisonCars(int id);
}

class ComparisonDataSourceImpl extends ComparisonCarsDataSource {
  final Dio _dio;

  ComparisonDataSourceImpl(this._dio);

  @override
  Future getComparisonCars() async {
    try {
      final response = await _dio.get('/car/comparison/',
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data as List)
            // ignore: unnecessary_lambdas
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

  @override
  Future<void> postComparisonCars(int id) async {
    print('Bu menga kelgan id $id');
    final response = await _dio.post('/car/comparison/',
        data: {'announcement': id, 'order': id},
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }));
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
    } else {
      throw ServerException(
          statusCode: response.statusCode!,
          errorMessage: response.data['detail']);
    }
  }

  @override
  Future deleteComparisonCars(int id) async {
    final response = await _dio.delete(
        '/car/comparison/$id/delete-announcement/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }));
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
    } else {
      throw ServerException(
        statusCode: response.statusCode!,
        errorMessage: response.data,
      );
    }
  }
}
