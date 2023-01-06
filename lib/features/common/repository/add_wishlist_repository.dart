import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/data/datasources/add_wishlist_datasource.dart';

abstract class AddWishlistRepository {
  Future<Either<Failure, void>> addWishlist(int id);
  Future<Either<Failure, void>> removeWishlist(int id);
}

class AddWishlistRepositoryImpl extends AddWishlistRepository {
  final AddWishlistDatasource dataSource;

  AddWishlistRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> addWishlist(int id) async {
    try {
      final result = await dataSource.addWishlist(id);
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

  @override
  Future<Either<Failure, void>> removeWishlist(int id) async {
    try {
      final result = await dataSource.removeWishlist(id);
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
