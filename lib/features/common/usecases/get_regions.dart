import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';

class GetRegionsUseCase extends UseCase<GenericPagination<Region>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<Region>>> call(String params) =>
      repo.fetchMore(
          url: '/common/regions/',
          fromJson: Region.fromJson,
          next: '',
          query: {'limit': 20});
}
