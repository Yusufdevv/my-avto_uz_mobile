import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class MyReviewsDatasource {
  Future<GenericPagination<AutoModel>> getMyReviews({String? search});
}

class MyReviewsDatasourceImpl implements MyReviewsDatasource {
  final Dio _dio;
  MyReviewsDatasourceImpl(this._dio);
  @override
  Future<GenericPagination<AutoModel>> getMyReviews({String? search}) async {
    try {
      final response = await _dio.get(
        'review/my-reviews/',
        queryParameters: {'search': search},
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
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
