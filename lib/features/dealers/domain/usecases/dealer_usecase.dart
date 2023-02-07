import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';

class DealerUseCase
    extends UseCase<GenericPagination<DealerCardModel>, DealerParams> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<DealerCardModel>>> call(
      DealerParams params) async {
    final map = <String, dynamic>{'search': params.search};
    if (params.filter?.carType != null) {
      map.putIfAbsent('car_type', () => params.filter?.carType);
    }
    if (params.filter?.regionId != null) {
      map.putIfAbsent('region', () => params.filter?.regionId);
    }
    if (params.filter?.mark != null) {
      map.putIfAbsent('mark', () => params.filter?.mark);
    }
    print('map:$map');

    return await repo.fetchMore(
      url: '/users/dealers/',
      fromJson: DealerCardModel.fromJson,
      next: params.next,
      query: map,
    );
  }
}

class DealerParams {
  final String? next;
  final String? search;
  final DealerFilterParams? filter;

  DealerParams({this.next, this.search, this.filter});
}

class DealerFilterParams {
  final String? carType;
  final String? regionId;
  final String? mark;

  DealerFilterParams({this.regionId, this.carType, this.mark});
}
