import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/dealers/domain/repositories/dealer_single_repository.dart';


// ignore: one_member_abstracts


class DealerSingleRepositoryImpl extends DealerSingleRepository{
  final DealerSingleDataSource dataSource = serviceLocator<DealerSingleDataSource>();

  DealerSingleRepositoryImpl();
 @override
  Future<Either<Failure, DealerSingleModel>> getDealerSingle(
      String params) async {
    try {
      final result = await dataSource.getDealerSingle(params: params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
  
  @override
  Future<Either<Failure, bool>> watchContact({required int id}) async {
     try {
      final result = await dataSource.watchContact(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
