import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_marks_datasource.dart';
import 'package:auto/features/dealers/data/models/cars_in_marks_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

// ignore: one_member_abstracts
abstract class CarsInMarksRepository {
  Future<Either<Failure, GenericPagination<CarsInMarksModel>>> getCars(
      CarMarkParams params);
}

class CarsInMarksRepositoryImpl extends CarsInMarksRepository {
  final CarsInMarksDataSource dataSource;

  CarsInMarksRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, GenericPagination<CarsInMarksModel>>> getCars(
      CarMarkParams params) async {
    try {
      final result = await dataSource.getCars(params: params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
