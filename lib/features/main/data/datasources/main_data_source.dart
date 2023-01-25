import 'package:auto/core/exceptions/exceptions.dart';
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
    try {
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
    } catch (e) {
      throw const ServerException();
    }
  }

  Future<dynamic> readStory({required int itemId}) async {
    try {
      final result = await dio.get('stories/item/$itemId/read/',
          options: Options(
            headers: {
              'Authorization': 'Bearer ${StorageRepository.getString('token')}',
            },
          ));
      return result;
    } catch (e) {
      throw const ServerException();
    }
  }
}
