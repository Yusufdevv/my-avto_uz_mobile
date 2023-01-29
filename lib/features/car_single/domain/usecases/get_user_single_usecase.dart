import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/repository/user_single_repository.dart';
import 'package:auto/features/car_single/domain/repository/user_single_repository.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';

class GetUserSingleUseCase extends UseCase<DealerSingleModel, String> {
  final UserSingleRepository repository = serviceLocator<UserSingleRepositoryImpl>();
  GetUserSingleUseCase( );

  @override
  Future<Either<Failure, DealerSingleModel>> call(String params) async =>
      repository.getUserSingle(params);
}
