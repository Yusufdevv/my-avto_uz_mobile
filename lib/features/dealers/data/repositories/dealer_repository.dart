import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/utils/either.dart';
import 'package:dio/dio.dart';

class DealerRepository {
  final dio = serviceLocator<DioSettings>().dio;

  Future<Either<Failure, List<DealerCardModel>>> getDealersList() async {
    try {
      final response = await dio.get('users/dealers/');
      print(response.statusCode);
      print(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right((response.data['results'] as List)
            .map((e) => DealerCardModel.fromJson(e))
            .toList());
      } else {
        return Left(ServerFailure(errorMessage: '', statusCode: 0));
      }
    } on ServerException {
      rethrow;
    } on DioError catch (e) {
      return Left(ServerFailure(errorMessage: '', statusCode: 0));
    }
  }
}
