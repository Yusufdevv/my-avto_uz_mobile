import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/search/data/models/search_suggest_model.dart';

import 'package:dio/dio.dart';

// ignore: one_member_abstracts
abstract class SuggestionDatasource {
  Future<SearchSuggestModel> getSuggestions(String text);
}

class SuggestionDatasourceImpl extends SuggestionDatasource {
  final Dio _dio = serviceLocator<DioSettings>().dio;

  SuggestionDatasourceImpl();

  @override
  Future<SearchSuggestModel> getSuggestions(String text) async {
    try {
      final response = await _dio.get(
        'es/AnnouncementElasticSearch/suggest/',
        queryParameters: {'absolute_car_name_suggest__completion': text},
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return SearchSuggestModel.fromJson(response.data);
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
