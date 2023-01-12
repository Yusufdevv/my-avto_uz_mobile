import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/dealers/domain/entities/dealer_info_entity.dart';


abstract class DealerSingleRepository {
  Future<Either<Failure, DealerSingleModel>> getDealerSingle(
      String params);
}

class DealerSingleRepositoryImpl extends DealerSingleRepository{
  final DealerSingleDataSource dataSource;

  DealerSingleRepositoryImpl({required this.dataSource});
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
}
