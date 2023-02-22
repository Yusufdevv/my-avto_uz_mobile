import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/dealers/data/models/marks_with_ads_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

class MarksInDealerDataSource {
  final Dio _dio;
  MarksInDealerDataSource(this._dio);
  Future<GenericPagination<MarksWithAdsModel>> getMarks(
      {required String slug, String? next}) async {
    var query = <String, dynamic>{};
    if (next != null) {
      query = {'next': next};
    }
    try {
      final results = await _dio.get(
        'users/dealers/$slug/marks/',
        queryParameters: query,
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return GenericPagination.fromJson(results.data,
            (p0) => MarksWithAdsModel.fromJson(p0 as Map<String, dynamic>));
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
