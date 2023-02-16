import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetDirCategoriesUseCase
    extends UseCase<List<DirCategoryEntity>, NoParams> {
  final GetUserListRepository repository;

  GetDirCategoriesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<DirCategoryEntity>>> call(
          NoParams params) async =>
      await repository.getDirCategory();
}
