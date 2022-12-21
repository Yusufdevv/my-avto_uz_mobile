import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/common/domain/model/car_make_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

import 'package:dio/dio.dart';

abstract class SuggestionDatasource {
  Future<GenericPagination<CarMakeModel>> getSuggestions(String text);
  // Future<>
}

class SuggestionDatasourceImpl extends SuggestionDatasource {
  final Dio _dio;

  SuggestionDatasourceImpl(this._dio);

  @override
  Future<GenericPagination<CarMakeModel>> getSuggestions(String text) async {
    try {
      final response = await _dio.get(
        'car/makes/',
        queryParameters: {'ordering': text},
      );
      print(response.realUri);
      print(response.data);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => CarMakeModel.fromJson(p0 as Map<String, dynamic>));
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
