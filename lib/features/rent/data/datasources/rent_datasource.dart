import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/rent/data/models/rent_model.dart';
import 'package:dio/dio.dart';

abstract class RentDataSource {
  Future<GenericPagination<RentModel>> getRents(
      {required String query, String? next});
}

class RentDataSourceImpl extends RentDataSource {
  final Dio _dio;

  RentDataSourceImpl(this._dio);

  @override
  Future<GenericPagination<RentModel>> getRents(
      {required String query, String? next}) async {
    try {
      final response = await _dio.get(next ?? '/rent/list/', queryParameters: {
        'rent_car__has_air_conditioner': query,
        'rent_car__has_baby_seat': query,
      });
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => RentModel.fromJson(p0 as Map<String, dynamic>? ?? {}));
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
