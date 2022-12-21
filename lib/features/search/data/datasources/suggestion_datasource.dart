import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/search/data/models/suggestion_model.dart';

import 'package:dio/dio.dart';

abstract class SuggestionDatasource {
  Future<SuggestionModel> getSuggestions(String text);
  // Future<>
}

class SuggestionDatasourceImpl extends SuggestionDatasource {
  final Dio _dio;

  SuggestionDatasourceImpl(this._dio);

  @override
  Future<SuggestionModel> getSuggestions(String text) async {
    try {
      final response = await _dio.get(
        'es/AnnouncementElasticSearch/suggest/',
        queryParameters: {'absolute_car_name_suggest__completion': text},
      );
      print(response.realUri);
      print(response.data);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return SuggestionModel.fromJson(response.data);
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
