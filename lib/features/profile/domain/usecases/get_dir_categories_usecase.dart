import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetDirCategoriesUseCase
    extends UseCase<GenericPagination<DirCategoryEntity>, String> {
  final GetUserListRepository repository =
      serviceLocator<GetUserListRepoImpl>();

  GetDirCategoriesUseCase();

  @override
  Future<Either<Failure, GenericPagination<DirCategoryEntity>>> call(
          String params) async =>
      await repository.getDirCategory(regions: params);
}
