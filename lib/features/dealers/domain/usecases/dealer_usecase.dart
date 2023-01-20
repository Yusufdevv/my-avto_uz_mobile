import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';

class DealerUseCase
    extends UseCase<GenericPagination<DealerCardModel>, DealerParams> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<DealerCardModel>>> call(
      DealerParams params) async {
    final map = <String, dynamic>{'search': params.search};
    if (params.filter?.car_type != null) {
      map.putIfAbsent('car_type', () => params.filter?.car_type);
    }
    if(params.filter?.regionId != null){
      map.putIfAbsent('region', () => params.filter?.regionId);
    }
    if(params.filter?.mark != null){
      map.putIfAbsent('mark', () => params.filter?.mark);
    }
    print('map:$map');

    //final Map<String, dynamic> query = {};
    // if (params.filter?.car_type != null) {
    //   if (params.filter?.car_type != null &&
    //       params.filter!.car_type!.isNotEmpty) {
    //     var value = '';
    //     for (var i = 0; i < params.filter!.car_type!.length; i++) {
    //       value +=
    //       '${params.search![i]}${i == params.search!.length - 1 ? '' : ','}';
    //     }
    //     query.putIfAbsent('category', () => value);
    //   }
    //   if (params. != null) {
    //     query.putIfAbsent(
    //         'organization', () => vacancyParamsEntity.organization);
    //   }
    //   if (vacancyParamsEntity.search != null) {
    //     query.putIfAbsent('search', () => vacancyParamsEntity.search);
    //   }
    //   if (vacancyParamsEntity.salary != null &&
    //       vacancyParamsEntity.salary!.isNotEmpty) {
    //     var value = '';
    //     for (final param in vacancyParamsEntity.salary!) {
    //       value += '$param,';
    //     }
    //     query.putIfAbsent('salary', () => value);
    //   }
    //   if (vacancyParamsEntity.experience != null &&
    //       vacancyParamsEntity.experience!.isNotEmpty) {
    //     var value = '';
    //     for (final param in vacancyParamsEntity.experience!) {
    //       value += '$param,';
    //     }
    //     query.putIfAbsent('experience', () => value);
    //   }
    //   if (vacancyParamsEntity.district != null &&
    //       vacancyParamsEntity.district!.isNotEmpty) {
    //     var value = '';
    //     for (final param in vacancyParamsEntity.district!) {
    //       value += '$param,';
    //     }
    //     query.putIfAbsent('district', () => value);
    //   }
    // }
    //query.putIfAbsent('search', () => params.search);
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
  final String? car_type;
  final String? regionId;
  final String? mark;

  DealerFilterParams({this.regionId, this.car_type, this.mark});
}
