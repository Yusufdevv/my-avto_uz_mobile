import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/search/data/models/popular_searches_model.dart';

import 'package:dio/dio.dart';

abstract class PopularSearchesDataSource {
  Future<PopularSearchesModel> getPopularSearches();
}

class PopularSearchesSourceImpl extends PopularSearchesDataSource {
  final Dio _dio;

  PopularSearchesSourceImpl(this._dio);

  @override
  Future<PopularSearchesModel> getPopularSearches() async {
    try {
      final response = await _dio.get('/users/searches/');
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return PopularSearchesModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode!,
          errorMessage: response.data.toString(),
        );
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
