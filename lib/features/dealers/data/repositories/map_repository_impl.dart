import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/type_entity.dart';
import 'package:auto/features/dealers/data/datasource/map_datasource.dart';
import 'package:auto/features/dealers/domain/repositories/map_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class MapRepositoryImpl extends MapRepository {
  final MapDatasource datasource;
  MapRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, GenericPagination<TypeEntity>>> getTypes({String? next}) async {
    try {
      final result = await datasource.getTypes(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
