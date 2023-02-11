import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ads/data/models/search_history_model.dart';
import 'package:auto/features/ads/data/repository/ads_repo_impl.dart';
import 'package:auto/features/ads/domain/repository/ads_repository.dart';

class SaveFilterHistoryUseCase extends UseCase<void, SaveFilterModel> {
  final AdsRepository repo = serviceLocator<AdsRepositoryImpl>();

  SaveFilterHistoryUseCase();

  @override
  Future<Either<Failure, void>> call(SaveFilterModel params) async =>
      await repo.filterHistory(model: params);
}
