import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetDirectoriesUseCase extends UseCase<List<DirectoryEntity>, NoParams> {
  final GetUserListRepository repository;

  GetDirectoriesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<DirectoryEntity>>> call(NoParams params) async =>
      await repository.getDirectories();
}
