import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/models/popular_search_model.dart';

import 'package:dio/dio.dart';

// ignore: one_member_abstracts
abstract class PopularSearchesDataSource {
  Future<GenericPagination<PopularSearchModel>> getPopularSearches(
      String? search);
}

class PopularSearchesSourceImpl extends PopularSearchesDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;
  PopularSearchesSourceImpl( );

  @override
  Future<GenericPagination<PopularSearchModel>> getPopularSearches(
      String? search) async {
    try {
      final response = await _dio.get('users/popular-searches/',
          queryParameters: {'search': search},
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => PopularSearchModel.fromJson(p0 as Map<String, dynamic>));
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
