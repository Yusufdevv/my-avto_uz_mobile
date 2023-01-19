import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/type_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class MapRepository {
  Future<Either<Failure, GenericPagination<TypeEntity>>> getTypes({String? next});
}
