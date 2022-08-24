import 'package:auto/core/error/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/dealers/data/repositories/dealer_repository.dart';
import 'package:auto/utils/either.dart';

class DealerUseCase extends UseCase<List<DealerCardModel>, NoParams> {
  final DealerRepository dealerRepository = DealerRepository();


  @override
  Future<Either<Failure, List<DealerCardModel>>> call(NoParams params) async {
    var result = await dealerRepository.getDealersList();
    if (result.isRight) {
      return Right(result.right);
    } else {
      return Left(ServerFailure());
    }
  }
}
