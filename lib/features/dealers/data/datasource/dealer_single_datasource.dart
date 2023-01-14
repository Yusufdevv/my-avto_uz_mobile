import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:dio/dio.dart';

class DealerSingleDataSource {
  final Dio _dio;
  DealerSingleDataSource(this._dio);
  Future<DealerSingleModel> getDealerSingle({required String params}) async {
    try {
      final results = await _dio.get('users/dealers/$params/'
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
}