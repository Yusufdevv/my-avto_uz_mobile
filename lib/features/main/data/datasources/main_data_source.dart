import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/main/data/models/story_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

class MainDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  Future<GenericPagination<StoryModel>> getStories({
    String? category,
    String? search,
    int? limit,
    int? offset,
  }) async {
    final result = await dio.get('stories/',
        queryParameters: {
          'category': category,
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
        (json) => StoryModel.fromJson(json as Map<String, dynamic>));
  }
}
