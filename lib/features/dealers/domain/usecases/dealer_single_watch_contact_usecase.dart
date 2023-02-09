import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository_impl.dart';

class DealerSingleWatchContactUseCase extends UseCase<bool, int> {
  final DealerSingleRepositoryImpl dealerSingle = serviceLocator<DealerSingleRepositoryImpl>();

  @override
  Future<Either<Failure, bool>> call(int params) async =>
      dealerSingle.watchContact(id:params);
}
