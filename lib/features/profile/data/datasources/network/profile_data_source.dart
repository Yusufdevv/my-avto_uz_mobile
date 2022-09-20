import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/profile/data/models/profile_item.dart';
import 'package:auto/utils/either.dart';
import 'package:dio/dio.dart';

class ProfileDataSourceImpl {
  final dio = serviceLocator<DioSettings>().dio;

  Future<Either<Failure, ProfileItemModel>> getProfile() async {
    try {
      final response = await dio.get('uyioieeqw');
      print(response.statusCode);
      print(response.data);
      print(response.realUri);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(ProfileItemModel.fromJson(response.data));
      } else {
        final message =
            '${(response.data as Map<String, dynamic>).values.first}'
                .replaceAll(RegExp(r'[\[\]]'), '');
        return Right(ProfileItemModel.fromJson(response.data));
      }
    } on ServerException {
      rethrow;
    } on DioError catch (error) {
      throw DioException();
    } on Exception catch (error) {
      print(error.toString);
      throw ServerException(
        errorMessage: 'Authentication Repository Error. Error message: $error',
        statusCode: 141,
      );
    }
  }
}
