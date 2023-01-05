import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/data/models/rent_list_model.dart';
import 'package:equatable/equatable.dart';

class SearchRentUseCase
    extends UseCase<GenericPagination<RentListModel>, SearchParams> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<RentListModel>>> call(
          SearchParams params) async =>
      await repo.fetchMore(
        url: 'rent/list/',
        fromJson: RentListModel.fromJson,
        next: params.next,
        query: params.params,
      );
}

class SearchParams extends Equatable {
  final String query;
  final Map<String, dynamic> params;
  final String? next;
  const SearchParams({
    required this.query,
    required this.params,
    this.next,
  });
  @override
  List<Object?> get props => [query, next, params];
}
