import 'package:auto/core/error/exeptions.dart';
import 'package:auto/features/profile/data/models/profile_item.dart';
import 'package:auto/utils/dio_settings.dart';
import 'package:auto/utils/service_locator.dart';
import 'package:dio/dio.dart';

abstract class ProfileDataSource {
  /// Calls the https://lentabeta.xn--h28h.uz/api/v1/... endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ProfileItemModel> getProfile();
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<ProfileItemModel> getProfile() => _getProfile();

  Future<ProfileItemModel> _getProfile() async {
    try {
      final response = await dio.get('');
      print(response.statusCode);
      print(response.data);
      print(response.realUri);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProfileItemModel.fromJson(response.data);
      } else {
        final message =
            '${(response.data as Map<String, dynamic>).values.first}'
                .replaceAll(RegExp(r'[\[\]]'), '');
        throw ServerException(
          statusMessage: message,
          statusCode: response.statusCode!,
        );
      }
    } on ServerException {
      rethrow;
    } on DioError catch (error) {
      throw ServerException(
        statusMessage:
            'Authentication Repository Dio Error. Error message: ${error.message}',
        statusCode: error.error,
      );
    } on Exception catch (error) {
      throw ServerException(
        statusMessage: 'Authentication Repository Error. Error message: $error',
        statusCode: 141,
      );
    }
  }
}
