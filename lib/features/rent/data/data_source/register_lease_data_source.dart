import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/rent/data/models/register_lease_model.dart';
import 'package:auto/features/rent/domain/entities/register_lease_entity.dart';
import 'package:dio/dio.dart';

class RegisterLeaseDataSource {
  final _dio = serviceLocator<DioSettings>().dio;
  RegisterLeaseDataSource();

  Future<RegisterLeaseModel> register(
      {required RegisterLeaseEntity params}) async {
    final token = StorageRepository.getString('token');
    try {
      final results = await _dio.post('/rent/order/',
          data: params.toApi(),
          options: token.isNotEmpty
              ? Options(headers: {'Authorization': 'Bearer $token'})
              : null);

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return RegisterLeaseModel.fromJson(results.data);
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
