import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetDirectoriesUseCase extends UseCase<GenericPagination<DirectoryEntity>, Params> {
  final GetUserListRepository repository;

  GetDirectoriesUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<DirectoryEntity>>> call(Params params) async =>
      await repository.getDirectories(
          params.search, params.regions, params.categories);
}

class Params {
  String search;
  String regions;
  String categories;

  Params({
    required this.search,
    required this.regions,
    required this.categories,
  });
}
