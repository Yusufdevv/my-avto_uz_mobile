import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/dealers/domain/entities/map_parameter.dart';

class GetMapDealersUseCase extends UseCase<List<DealerCardModel>, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, List<DealerCardModel>>> call(String dealer,{MapParameter? param}) {
    var query = <String, dynamic>{};
    if (param != null) {
      query.addAll({
        "lat": param.lat,
        "lon": param.long,
        "rad": param.radius,
      });
      }
    return repo.getList<DealerCardModel>(
        endpoint: '/user/dealers/',
        fromJson: DealerCardModel.fromJson,
        query: query,
        sendToken: StorageRepository.getString('token').isNotEmpty);
    }
  }

