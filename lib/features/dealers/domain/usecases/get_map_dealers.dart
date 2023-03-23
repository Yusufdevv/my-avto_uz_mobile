import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/features/dealers/data/models/map_model.dart';
import 'package:auto/features/dealers/domain/entities/map_parameter.dart';

class GetMapDealersUseCase extends UseCase<List<MapModel>, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, List<MapModel>>> call(String params,
      {MapParameter? param}) {
    var query = <String, dynamic>{};
    if (params.isNotEmpty) {
      query.addAll({'search': params});
    }
    if (param != null) {
      query.addAll({
        'lat': param.lat,
        'lon': param.long,
        'rad': param.radius,
      });
    }
    return repo.getList<MapModel>(
        endpoint: '/users/dealers-map/',
        fromJson: MapModel.fromJson,
        query: query,
        responseDataKey: 'results',
        sendToken: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty);
  }
}
