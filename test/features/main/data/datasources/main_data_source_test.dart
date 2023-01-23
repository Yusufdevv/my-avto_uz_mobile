import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/main/data/datasources/main_data_source.dart';
import 'package:auto/features/main/data/models/story_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupLocator();
  group('Main Data Source Test', () {
    final dataSource = MainDataSource();
    test('getStories request test', () async {
      expect(await dataSource.getStories(limit: 10, offset: 0),
          isA<GenericPagination<StoryModel>>());
    });
    test('readStory request test', () async {
      expect(await dataSource.readStory(itemId: 1), isA<dynamic>());
    });
  });
}
