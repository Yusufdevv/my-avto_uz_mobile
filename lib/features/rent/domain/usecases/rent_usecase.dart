import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/data/models/rent_main_model.dart';

class RentUseCase extends UseCase<GenericPagination<RentMainModel>, Param> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<RentMainModel>>> call(
      Param params) async {
    final map = <String, dynamic>{};
    if (params.hasAirConditioner != null && params.hasAirConditioner! > 0) {
      map['rent_car__has_air_conditioner'] = params.hasAirConditioner;
    }
    if (params.hasBabySeat != null && params.hasBabySeat! > 0) {
      map['rent_car__has_baby_seat'] = params.hasBabySeat;
    }
    if (params.rentCarIsClean != null && params.rentCarIsClean! > 0) {
      map['rent_car__is_clean'] = params.rentCarIsClean;
    }
    if (params.rentCarIsFullFuel != null && params.rentCarIsFullFuel! > 0) {
      map['rent_car__is_full_fuel'] = params.rentCarIsFullFuel;
    }
    if (params.id != null) {
      map['rent_car_type_id'] = params.id;
    }
    print('map ---- map ---- map ---- ${map.toString()}');
    final v = await repo.fetchMore(
      url: 'rent/main_page/${params.id}/',
      fromJson: RentMainModel.fromJson,
      next: params.next,
      query: map,
    );

    return v;
  }
}

class Param {
  final String? next;
  final int? id;
  final int? hasAirConditioner;
  final int? hasBabySeat;
  final int? rentCarIsClean;
  final int? rentCarIsFullFuel;

  Param({
    this.hasAirConditioner,
    this.next,
    this.id,
    this.hasBabySeat,
    this.rentCarIsClean,
    this.rentCarIsFullFuel,
  });
}
