import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetNotificationSingleUseCase extends UseCase<NotificationsEntity, String> {
  final GetUserListRepository repository;

  GetNotificationSingleUseCase({required this.repository});

  @override
  Future<Either<Failure, NotificationsEntity>> call(String id) async =>
      await repository.getNotificationSingle(id);
}
