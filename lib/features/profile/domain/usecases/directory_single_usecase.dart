import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/dealer_single_model.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class DirectorySingleSingleUseCase extends UseCase<DealerSingleModel, String> {
  final GetUserListRepository repository = serviceLocator<GetUserListRepoImpl>();

  DirectorySingleSingleUseCase();

  @override
  Future<Either<Failure, DealerSingleModel>> call(String params) async =>
      await repository.getDirectorySingle(params);
}
