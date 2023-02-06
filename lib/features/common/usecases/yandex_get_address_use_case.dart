import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/models/yandex_search_model.dart';
import 'package:auto/features/common/repository/yandex_search_repo.dart';

class YandexGetAddressUseCase
    extends UseCase<YandexSearchModel, Map<String, dynamic>> {
  final YandexSearchRepository repository = YandexSearchRepoImpl();

  @override
  Future<Either<Failure, YandexSearchModel>> call(
      Map<String, dynamic> params) async {
    final v = await repository.getAddress(
      type: params['type'],
      long: params['long'],
      lat: params['lat'],
    );

    return v;
  }
}
