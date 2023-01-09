import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetMySearchesUseCase extends UseCase<List<MySearchesEntity>, NoParams> {
  final GetUserListRepository repository;

  GetMySearchesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MySearchesEntity>>> call(NoParams params) async =>
      await repository.getMySearches();
}
