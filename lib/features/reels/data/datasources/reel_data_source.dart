import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reels/data/models/reel_model.dart';
import 'package:dio/dio.dart';

class ReelDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  Future<GenericPagination<ReelModel>> getReels({
    String? category,
    String? search,
    int? limit,
    int? offset,
  }) async {
    final result = await dio.get('reels/',
        queryParameters: {
          'search': search,
          'limit': limit,
          'offset': offset,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}',
          },
        ));
    return GenericPagination.fromJson(result.data,
        (json) => ReelModel.fromJson(json as Map<String, dynamic>));
  }

}
