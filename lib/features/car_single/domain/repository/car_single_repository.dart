import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/model/create_owner.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class CarSingleRepository {
  Future<Either<Failure, CarSingleEntity>> getCarSingle({required int id});

  Future<Either<Failure, GenericPagination<AutoEntity>>> getOtherAds(
      {required Map<String, dynamic> params});

  Future<Either<Failure, dynamic>> soldAds({required int id});

  Future<Either<Failure, dynamic>> callCount({required int id});

  Future<Either<Failure, CreateOwnerModel>> verifyOwnerCreate(
      {required CreateOwnerModel createOwnerModel});
}
