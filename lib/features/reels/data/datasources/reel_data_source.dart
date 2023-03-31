import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reels/data/models/reel_model.dart';
import 'package:auto/features/reels/data/models/reels_post_model.dart';
import 'package:dio/dio.dart';

class ReelDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  Future<GenericPagination<ReelModel>> getReels({
    String? category,
    String? search,
    int? limit,
    int? offset,
  }) async {
    try {
      final result = await dio.get('reels/',
          queryParameters: {
            'search': search,
            'limit': limit,
            'offset': offset,
          },
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
            },
          ));
      return GenericPagination.fromJson(result.data,
          (json) => ReelModel.fromJson(json as Map<String, dynamic>));
    } catch (e) {
      throw const ServerException();
    }
  }

  Future<GenericPagination<ReelModel>> getReelsOfDay({
    String? category,
    String? search,
    int? limit,
    int? offset,
  }) async {
    try {
      final result = await dio.get('reels/offer-of-the-day/',
          queryParameters: {
            'search': search,
            'limit': limit,
            'offset': offset,
          },
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
            },
          ));

      final v = GenericPagination.fromJson(result.data,
          (json) => ReelModel.fromJson(json as Map<String, dynamic>));

      return v;
    } catch (e) {
      throw const ServerException();
    }
  }

  Future reelsLike({required int id}) async {
    final result = await dio.post('reels/like/',
        data: {'reel': id},
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
          },
        ));
    return ReelsPostModel.fromJson(result.data);
  }

  Future reelsShare({required int id}) async {
    final result = await dio.post('reels/share/',
        data: {'reel': id},
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
          },
        ));
    return ReelsPostModel.fromJson(result.data);
  }
}
