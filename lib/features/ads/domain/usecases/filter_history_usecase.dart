import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ads/data/models/search_history_model.dart';

class FilterHistoryUseCase extends UseCase<void, SearchHistoryModel> {
  final AdRepositoryImpl repo = serviceLocator<AdRepositoryImpl>();

  FilterHistoryUseCase();

  @override
  Future<Either<Failure, void>> call(SearchHistoryModel params) async =>
      await repo.filterHistory(model: params);
}
