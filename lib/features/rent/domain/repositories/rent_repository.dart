import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/rent/domain/entities/rent_entity.dart';
import 'package:auto/utils/either.dart';

abstract class RentRepository {
  Future<Either<Failure, GenericPagination<RentEntity>>> rent(
      {required String query, String? next});
}
