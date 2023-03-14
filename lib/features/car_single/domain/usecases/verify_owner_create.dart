import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/model/create_owner.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';

class VerifyOwnerCreateUseCase
    extends UseCase<CreateOwnerModel, CreateOwnerModel> {
  final CarSingleRepository repository;

  VerifyOwnerCreateUseCase({required this.repository});

  @override
  Future<Either<Failure, CreateOwnerModel>> call(
          CreateOwnerModel createOwnerModel) async =>
      await repository.verifyOwnerCreate(createOwnerModel: createOwnerModel);
}
