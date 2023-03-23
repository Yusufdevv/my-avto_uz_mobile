import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/dealers/data/models/user_search_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

// ignore: one_member_abstracts
abstract class UserSearchDatasource {
  Future<GenericPagination<UserSearchDealerModel>> getUserSearches(
      String? search);
// Future<>
}

class UserSearchDatasourceImpl extends UserSearchDatasource {
  final Dio _dio;

  UserSearchDatasourceImpl(this._dio);

  @override
  Future<GenericPagination<UserSearchDealerModel>> getUserSearches(
      String? search) async {
    try {
      final response = await _dio.get('users/dealers/',
          queryParameters: {'search': search},
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => UserSearchDealerModel.fromJson(p0 as Map<String, dynamic>));
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
