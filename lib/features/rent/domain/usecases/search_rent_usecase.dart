import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/data/models/rent_main_model.dart';
import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/utils/either.dart';

class SearchRentUseCase
    extends UseCase<GenericPagination<RentMainModel>, SearchParams> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<RentMainModel>>> call(
          SearchParams searchParams) async =>
      await repo.fetchMore(
        url: 'rent/list/',
        fromJson: RentMainModel.fromJson,
        next: searchParams.next,
        query:
            searchParams.query != null ? {'search': searchParams.query} : null,
      );
}

class SearchParams {
  final String query;
  final String? next;
  const SearchParams({this.next, required this.query});
  @override
  List<Object?> get props => [
        query,
        next,
      ];
}
