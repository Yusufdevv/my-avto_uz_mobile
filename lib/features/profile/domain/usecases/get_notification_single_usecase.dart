import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetNotificationSingleUseCase
    extends UseCase<NotificationsEntity, String> {
  final GetUserListRepository repository =
      serviceLocator<GetUserListRepoImpl>();

  GetNotificationSingleUseCase();

  @override
  Future<Either<Failure, NotificationsEntity>> call(String params) async =>
      await repository.getNotificationSingle(params);
}
