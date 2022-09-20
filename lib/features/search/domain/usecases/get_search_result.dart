import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/search/data/models/search_item.dart';
import 'package:auto/utils/either.dart';

class GetSearchResultsUseCase
    extends UseCase<GenericPagination<SearchItemModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<SearchItemModel>>> call(
          String params) async =>
      repo.fetchMore<SearchItemModel>(
          url: 'es/AnnouncementElasticSearch/',
          next: params,
          fromJson: SearchItemModel.fromJson);
}
