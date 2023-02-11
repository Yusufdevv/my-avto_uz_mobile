import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ads/data/models/min_max_price_year_model.dart';
import 'package:auto/features/ads/data/models/search_history_model.dart';
import 'package:auto/features/comparison/data/models/announcement_list_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

class AdsDataSource {
  final _dio = serviceLocator<DioSettings>().dio;

  Future<MinMaxPriceYearModel> getMinMaxPriceYear({
    String? currency,
  }) async {
    try {
      final result = await _dio.get('car/announcements-min-max-price-year/',
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

  Future<void> filterHistory({required SaveFilterModel model}) async {
    try {
      final response = await _dio.post('users/filter-history/create/',
          data: model.toJson(),
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
      } else {
        throw ServerException(
          statusCode: response.statusCode!,
          errorMessage: response.data.toString(),
        );
      }
    } catch (e) {
      throw const ServerException();
    }
  }

  Future<GenericPagination<AnnouncementListModel>> getAnnouncementList(
      Map<String, dynamic> params) async {
    try {
      final response = await _dio.get(
        '/car/announcement/list/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
        queryParameters: params,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
                (p0) => AnnouncementListModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
          statusCode: response.statusCode!,
          errorMessage: response.data.toString(),
        );
      }
    } catch (e) {
      throw const ServerException();
    }
  }

}
