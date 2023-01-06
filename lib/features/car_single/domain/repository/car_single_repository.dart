import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/entities/elastic_search_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class CarSingleRepository {
  Future<Either<Failure, CarSingleEntity>> getCarSingle({required int id});

  Future<Either<Failure, GenericPagination<ElasticSearchEntity>>> getOtherAds({required int id});

  Future<Either<Failure, CarSingleEntity>> payInvoice();
}
