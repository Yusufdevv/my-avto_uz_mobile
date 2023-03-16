import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/model/create_owner.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';

class VerifyOwnerCreateUseCase
    extends UseCase<CreateOwnerModel, CreateOwnerModel> {
  final CarSingleRepository repository =
      serviceLocator<CarSingleRepositoryImpl>();

  VerifyOwnerCreateUseCase();

  @override
  Future<Either<Failure, CreateOwnerModel>> call(
          CreateOwnerModel params) async =>
      await repository.verifyOwnerCreate(createOwnerModel: params);
}
