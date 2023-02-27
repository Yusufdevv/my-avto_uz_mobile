import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/dealer_single_model.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository_impl.dart';

class DealerSingleUseCase extends UseCase<DealerSingleModel, String> {
  final DealerSingleRepositoryImpl dealerSingle =
      serviceLocator<DealerSingleRepositoryImpl>();
  DealerSingleUseCase();

  @override
  Future<Either<Failure, DealerSingleModel>> call(String params) async =>
      dealerSingle.getDealerSingle(params);
}
