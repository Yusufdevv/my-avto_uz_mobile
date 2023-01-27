import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/models/region.dart';

import 'package:dio/dio.dart';

// ignore: one_member_abstracts
abstract class GetRegionsDatasourse {
  Future<List<Region>> getRegions();
}

class GetRegionsDatasourceImpl extends GetRegionsDatasourse {
  final _dio = serviceLocator<DioSettings>().dio;

  GetRegionsDatasourceImpl();

  @override
  Future<List<Region>> getRegions() async {
    try {
      final response = await _dio.get('/common/regions/',
          queryParameters: {'limit': 30},
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return (response.data['results'] as List)
            // ignore: unnecessary_lambdas
            .map((e) => Region.fromJson(e))
            .toList();
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
