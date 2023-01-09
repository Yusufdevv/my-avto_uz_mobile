import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetNotificationsUseCase extends UseCase<List<NotificationsEntity>, NoParams> {
  final GetUserListRepository repository;

  GetNotificationsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<NotificationsEntity>>> call(NoParams params) async =>
      await repository.getNotifications();
}
