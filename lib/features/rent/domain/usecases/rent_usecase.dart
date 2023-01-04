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
    if (params.regions != null && params.regions!.isNotEmpty) {
      map['region__in'] = params.regions;
    }
    if (params.maker != null && params.maker!.isNotEmpty) {
      map['rent_car__make'] = params.maker;
    }
    if (params.carBodyTypeId != null && params.carBodyTypeId!.isNotEmpty) {
      map['rent_car__body_type'] = params.carBodyTypeId;
    }
    if (params.carDriveTypeId != null && params.carDriveTypeId!.isNotEmpty) {
      map['rent_car__drive_type'] = params.carDriveTypeId;
    }
    if (params.gearboxTypeId != null && params.gearboxTypeId!.isNotEmpty) {
      map['rent_car__gearbox_type'] = params.gearboxTypeId;
    }
    if (params.rentPriceStatart != null && params.rentPriceStatart! > 0) {
      map['rent_price_start'] = params.rentPriceStatart;
    }
    if (params.rentPriceEnd != null && params.rentPriceEnd! > 0) {
      map['rent_price_end'] = params.rentPriceEnd;
    }
    if (params.yearStatart != null && params.yearStatart!.isNotEmpty) {
      map['rent_car_year_start'] = params.yearStatart;
    }
    if (params.yearEnd != null && params.yearEnd!.isNotEmpty) {
      map['rent_car_year_end'] = params.yearEnd;
    }

    final v = await repo.fetchMore(
      url: '/rent/main_page/${params.id}/',
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
  final String? regions;
  final String? maker;
  final String? carBodyTypeId;
  final String? carDriveTypeId;
  final String? gearboxTypeId;
  final num? rentPriceStatart;
  final num? rentPriceEnd;
  final String? yearStatart;
  final String? yearEnd;

  Param({
    this.hasAirConditioner,
    this.next,
    this.id,
    this.hasBabySeat,
    this.rentCarIsClean,
    this.rentCarIsFullFuel,
    this.regions,
    this.maker,
    this.carBodyTypeId,
    this.carDriveTypeId,
    this.gearboxTypeId,
    this.rentPriceEnd,
    this.rentPriceStatart,
    this.yearEnd,
    this.yearStatart,
  });
}
