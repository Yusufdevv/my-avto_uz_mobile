import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:dio/dio.dart';

abstract class GetUserListDatasource {
  Future<List<AutoModel>> getProfileFavorites(String endpoint);

}

class GetUserListDatasourceImpl extends GetUserListDatasource{
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<List<AutoModel>> getProfileFavorites(String endpoint) async {
    try {
      final response = await dio.get(
        endpoint,
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            // ignore: unnecessary_lambdas
            .map((e) => AutoModel.fromJson(e))
            .toList();
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}