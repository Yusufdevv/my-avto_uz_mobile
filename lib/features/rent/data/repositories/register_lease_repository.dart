import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/rent/data/data_source/register_lease_data_source.dart';
import 'package:auto/features/rent/data/models/register_lease_model.dart';
import 'package:auto/features/rent/domain/entities/register_lease_entity.dart';

class RegisterLeaseRepository {
  final RegisterLeaseDataSource dataSource;

  RegisterLeaseRepository({required this.dataSource});

  Future<Either<Failure, RegisterLeaseModel>> register(
      RegisterLeaseEntity params) async {
    try {
      final result = await dataSource.register(params: params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
