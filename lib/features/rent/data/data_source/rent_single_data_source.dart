import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/rent/data/models/rent_list_model.dart';
import 'package:dio/dio.dart';

abstract class RentSingleDataSource {
  Future<RentListModel> getSingleRent({required int params});
}

class RentSingleDataSourceImpl extends RentSingleDataSource {
  final Dio _dio;
  RentSingleDataSourceImpl(this._dio);
  @override
  Future<RentListModel> getSingleRent({required int params}) async {
    final token = StorageRepository.getString('token');
    try {
      print('=======  trying to get rent single');
      final results = await _dio.get('/rent/$params',
          options: token.isNotEmpty
              ? Options(headers: {'Authorization': 'Bearer $token'})
              : null);
      print('=======  the result of rent single ${results.data}');

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return RentListModel.fromJson(results.data);
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
