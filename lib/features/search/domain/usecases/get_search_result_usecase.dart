import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/utils/either.dart';

class GetSearchResultsUseCase
    extends UseCase<GenericPagination<AutoModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<AutoModel>>> call(
          String? params) async =>
      await repo.fetchMore<AutoModel>(
        url: 'es/AnnouncementElasticSearch/',
        fromJson: AutoModel.fromJson,
      );
}
