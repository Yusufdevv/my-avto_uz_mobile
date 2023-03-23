import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

import 'package:dio/dio.dart';

// ignore: one_member_abstracts
abstract class SearchResultsDatasource {
  Future<GenericPagination<AutoModel>> getSearchResults(
      Map<String, dynamic> params);
}

class SearchResultsDatasourceImpl extends SearchResultsDatasource {
  final _dio = serviceLocator<DioSettings>().dio;

  SearchResultsDatasourceImpl();

  @override
  Future<GenericPagination<AutoModel>> getSearchResults(
      Map<String, dynamic> params) async {
    try {
      final response = await _dio.get('es/AnnouncementElasticSearch/',
          queryParameters: params,
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => AutoModel.fromJson(p0 as Map<String, dynamic>));
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
