import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/search/data/models/popular_searches_model.dart';
import 'package:auto/features/search/data/models/search_item_model.dart';

import 'package:dio/dio.dart';

abstract class SearchResultsDatasource {
  Future<SearchItemModel> getSearchResults();
}

class PopularSearchesSourceImpl extends SearchResultsDatasource {
  final Dio _dio;

  PopularSearchesSourceImpl(this._dio);

  @override
  Future<SearchItemModel> getSearchResults() async {
    try {
      final response = await _dio.get('es/Announcements/');
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return SearchItemModel.fromJson(response.data);
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
