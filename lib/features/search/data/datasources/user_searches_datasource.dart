import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/models/user_searches_model.dart';

import 'package:dio/dio.dart';

abstract class UserSearchesDatasource {
  Future<GenericPagination<UserSearchesModel>> getUserSearches(String? search);
  // Future<>
}

class UserSearchesDatasourceImpl extends UserSearchesDatasource {
  final Dio _dio;

  UserSearchesDatasourceImpl(this._dio);

  @override
  Future<GenericPagination<UserSearchesModel>> getUserSearches(
      String? search) async {
    try {
      final response = await _dio.get('users/searches/',
          queryParameters: {'search': search},
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => UserSearchesModel.fromJson(p0 as Map<String, dynamic>));
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
