import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository.dart';

class DealerSingleUseCase extends UseCase<DealerSingleModel, String> {
  final DealerSingleRepository dealerSingle;
  DealerSingleUseCase({required this.dealerSingle});

  @override
  Future<Either<Failure, DealerSingleModel>> call(String params) async =>
      dealerSingle.getDealerSingle(params);
}
