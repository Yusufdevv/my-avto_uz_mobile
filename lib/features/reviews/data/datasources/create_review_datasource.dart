import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/domain/model/auto_review_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class CreateReviewDatasource {
  Future<GenericPagination<AutoReviewModel>> createReview(
      AutoReviewModel model);
}

class CreateReviewDatasourceImpl implements CreateReviewDatasource {
  final Dio _dio;
  CreateReviewDatasourceImpl(this._dio);
  @override
  Future<GenericPagination<AutoReviewModel>> createReview(
      AutoReviewModel model) async {
    try {
      final response = await _dio.post(
        'review/create/',
        queryParameters: model.toJson(),
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => AutoReviewModel.fromJson(p0 as Map<String, dynamic>));
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
