import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/main/data/repositories/main_repo_impl.dart';
import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:auto/features/main/domain/repositories/main_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetStoriesUseCase
    extends UseCase<GenericPagination<StoryEntity>, Map<String, dynamic>> {
  final MainRepository repository = serviceLocator<MainRepositoryImpl>();

  @override
  Future<Either<Failure, GenericPagination<StoryEntity>>> call(
      Map<String, dynamic> params) async {
    final v = await repository.getStories(
      category: params['category'],
      search: params['search'],
      limit: params['limit'],
      offset: params['offset'],
    );

    return v;
  }
}
