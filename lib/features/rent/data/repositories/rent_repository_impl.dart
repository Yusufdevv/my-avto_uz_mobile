import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/rent/data/datasources/rent_datasource.dart';
import 'package:auto/features/rent/domain/entities/rent_entity.dart';
import 'package:auto/features/rent/domain/repositories/rent_repository.dart';
import 'package:auto/utils/either.dart';

class RentRepositoryImpl extends RentRepository {
  final RentDataSource dataSource;

  RentRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, GenericPagination<RentEntity>>> rent(
      {required String query, String? next}) async {
    try {
      final result = await dataSource.getRents(query: query, next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
