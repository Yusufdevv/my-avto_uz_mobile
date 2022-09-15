import 'package:auto/core/error/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/search/data/models/search_item.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:auto/utils/either.dart';

class GetSearchResultsUseCase
    extends UseCase<GenericPagination<SearchItemModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<SearchItemModel>>> call(
          String next) async =>
     await repo.fetchMore<SearchItemModel>(
          url: 'es/AnnouncementElasticSearch/',
          next: next,
          fromJson: SearchItemModel.fromJson);
}
