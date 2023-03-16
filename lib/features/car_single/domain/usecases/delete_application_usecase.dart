import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';

class DeleteApplicationUseCase
    extends UseCase<bool, int> {
  final CarSingleRepository repository =
      serviceLocator<CarSingleRepositoryImpl>();

  DeleteApplicationUseCase();

  @override
  Future<Either<Failure, bool>> call(int params) async =>
      await repository.deleteApplication(params);
}
