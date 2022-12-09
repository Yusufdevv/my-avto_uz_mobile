import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/entities/other_ads_entity.dart';
import 'package:auto/utils/either.dart';

abstract class CarSingleRepository {
  Future<Either<Failure, CarSingleEntity>> getCarAds();

  Future<Either<Failure, OtherAdsEntity>> getOtherAds();

  Future<Either<Failure, CarSingleEntity>> payInvoice();
}
