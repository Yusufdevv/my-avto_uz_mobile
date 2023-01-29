import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/dealers/data/models/cars_in_dealer_model.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class UserSingleDataSource {
  Future<DealerSingleModel> getUserSingle({required String params});
  Future<GenericPagination<CarsInDealerModel>> getUserAds(
      {required String params});
}

class UserSingleDataSourceImpl extends UserSingleDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;
  UserSingleDataSourceImpl();
  @override
  Future<DealerSingleModel> getUserSingle({required String params}) async {
    try {
      final results = await _dio.get('users/dealers/$params/');

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return DealerSingleModel.fromJson(results.data);
      } else {
        throw ServerException(
            errorMessage: results.data.toString(),
            statusCode: results.statusCode ?? 0);
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
  Future<GenericPagination<CarsInDealerModel>> getUserAds(
      {required String params}) async {
    try {
      final results = await _dio.get('users/dealers/$params/cars/');

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return GenericPagination.fromJson(results.data,
            (p0) => CarsInDealerModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            errorMessage: results.data.toString(),
            statusCode: results.statusCode ?? 0);
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
