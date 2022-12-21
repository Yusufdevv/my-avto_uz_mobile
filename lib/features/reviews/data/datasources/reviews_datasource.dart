import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/data/models/reviews_model.dart';
import 'package:dio/dio.dart';

abstract class ReviewsDatasource {
  Future<GenericPagination<AutoModel>> getReviews({ReviewsModel? model});
}

class ReviewsDatasourceImpl implements ReviewsDatasource {
  final Dio _dio;
  ReviewsDatasourceImpl(this._dio);
  @override
  Future<GenericPagination<AutoModel>> getReviews({
    ReviewsModel? model,
  }) async {
    try {
      final response = await _dio.get('review/list/', queryParameters: {
        'make': model?.make,
        'model': model?.model,
        'generation': model?.generation,
        'year': model?.year,
        'search': model?.search
      });
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => AutoModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
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
