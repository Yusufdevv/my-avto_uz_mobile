import 'dart:convert';

import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';

import 'package:dio/dio.dart';

abstract class AddWishlistDatasource {
  Future<void> addWishlist(int id);

  Future<void> removeWishlist(int id);
}

class AddWishlistDatasourceImpl extends AddWishlistDatasource {
  final Dio _dio;

  AddWishlistDatasourceImpl(this._dio);

  @override
  Future<void> addWishlist(int id) async {
    try {
      final response = await _dio.post('/users/wishlist/announcement/add/',
          data: json.encode({'announcement': id}),
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          })
      );
      print(' ${response.realUri}');
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        print('nice ${response.realUri}');
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

  @override
  Future<void> removeWishlist(int id) async {
    try {
      final response = await _dio.post('/users/wishlist/announcement/remove/',
          data: json.encode({'announcement': id}),
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
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
