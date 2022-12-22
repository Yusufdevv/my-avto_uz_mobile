import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/rent/data/data_source/register_lease_data_source.dart';
import 'package:auto/features/rent/data/models/register_lease_model.dart';
import 'package:auto/features/rent/data/repositories/register_lease_repository.dart';
import 'package:auto/features/rent/domain/entities/register_lease_entity.dart';

class RegisterLeaseUseCase
    extends UseCase<RegisterLeaseModel, RegisterLeaseEntity> {
  RegisterLeaseRepository registerLeaseRepository =
      RegisterLeaseRepository(dataSource: RegisterLeaseDataSource());
  @override
  Future<Either<Failure, RegisterLeaseModel>> call(
          RegisterLeaseEntity params) async =>
      await registerLeaseRepository.register(params);
}
