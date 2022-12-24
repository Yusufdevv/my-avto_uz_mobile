import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/main/data/models/story_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class MainRepository {
  Future<Either<Failure, GenericPagination<StoryModel>>> getStories({
    String? category,
    String? search,
    int? limit,
    int? offset,
  }) {
    throw 'getStories() is not implemented yet';
  }
}
