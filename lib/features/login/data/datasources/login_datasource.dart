import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';

// ignore: one_member_abstracts
abstract class LoginDataSource {
  Future<String> sendCode(String phone);
}

class LoginDataSourceImpl extends LoginDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<String> sendCode(String phone) async {
    final response = await dio.post(
        '/users/registration/sms-verification/entrypoint/',
        data: {'phone': '+998${phone.replaceAll(' ', '')}'});
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data['session'];
    } else {}

    throw UnimplementedError();
  }
}
