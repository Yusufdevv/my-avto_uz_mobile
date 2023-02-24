import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/dealers/data/models/dealer_single_model.dart';
import 'package:dio/dio.dart';

class DealerSingleDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;
  DealerSingleDataSource();
  Future<DealerSingleModel> getDealerSingle({required String params}) async {
    try {
      final results = await _dio.get(
        'users/dealers/$params/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return DealerSingleModel.fromJson(results.data);
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

  Future<bool> watchContact({required int id}) async {
    try {
      final results = await _dio.post(
        '/users/dealers/watch-contact/$id/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return true;
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
