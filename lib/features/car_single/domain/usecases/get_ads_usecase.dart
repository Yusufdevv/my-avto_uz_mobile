import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';

class GetCarSingleUseCase implements UseCase<CarSingleEntity, int> {
  final CarSingleRepository repository =
      serviceLocator<CarSingleRepositoryImpl>();

  GetCarSingleUseCase();

  @override
  Future<Either<Failure, CarSingleEntity>> call(int params) =>
      repository.getCarSingle(id: params);
}
