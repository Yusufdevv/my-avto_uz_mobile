import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetNotificationsUseCase extends UseCase<GenericPagination<NotificationsEntity>, NotificationParams> {
   final GetUserListRepository repository = serviceLocator<GetUserListRepoImpl>();


  GetNotificationsUseCase();

  @override
  Future<Either<Failure, GenericPagination<NotificationsEntity>>> call(NotificationParams params) async =>
      await repository.getNotifications(filter: params.filter, next: params.next);
}
class NotificationParams {
  final int? filter;
  final String? next;

  NotificationParams ({this.filter, this.next});
}
