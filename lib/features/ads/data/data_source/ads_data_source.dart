import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ads/data/models/min_max_price_year_model.dart';
import 'package:dio/dio.dart';

class AdsDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  Future<MinMaxPriceYearModel> getMinMaxPriceYear({
    String? currency,
  }) async {
    try {
      final result = await dio.get('car/announcements-min-max-price-year/',
          queryParameters: {
            'currency': currency,
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer ${StorageRepository.getString('token')}',
            },
          ));
      return MinMaxPriceYearModel.fromJson(result.data);
    } catch (e) {
      throw const ServerException();
    }
  }
}
