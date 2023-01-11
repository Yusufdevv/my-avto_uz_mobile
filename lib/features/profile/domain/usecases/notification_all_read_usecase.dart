import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';

class NotificationAllReadUseCase extends UseCase<String, NoParams> {
  GetUserListRepoImpl repository = serviceLocator<GetUserListRepoImpl>();
  NotificationAllReadUseCase();

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      await repository.notificationAllRead();
}
