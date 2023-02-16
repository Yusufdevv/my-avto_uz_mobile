import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/repository/user_single_repository.dart';
import 'package:auto/features/car_single/domain/entities/user_single_entity.dart';
import 'package:auto/features/car_single/domain/repository/user_single_repository.dart';

class GetUserSingleUseCase extends UseCase<UserSingleEntity, Params> {
  final UserSingleRepository repository =
      serviceLocator<UserSingleRepositoryImpl>();
  GetUserSingleUseCase();

  @override
  Future<Either<Failure, UserSingleEntity>> call(Params params) async =>
      repository.getUserSingle(params.userId, params.announcementId);
}

class Params {
  final int userId;
  final int announcementId;

  Params(this.userId, this.announcementId);
}
