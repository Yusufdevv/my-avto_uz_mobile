import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/repository/rent_single_repository.dart';
import 'package:auto/features/rent/data/data_source/rent_single_data_source.dart';
import 'package:auto/features/rent/data/models/rent_list_model.dart';

class VacanciesRepositoryImpl extends RentSingleRepository {
  final RentSingleDataSource dataSource;

  VacanciesRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, RentListModel>> getSingleRent(int params) async {
    try {
      final result = await dataSource.getSingleRent(params: params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
