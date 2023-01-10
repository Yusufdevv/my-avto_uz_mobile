import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/models/ad_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/core/utils/either.dart';

class GetTopAdsUseCase extends UseCase<GenericPagination<AdModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<AdModel>>> call(String params) =>
      repo.fetchMore(
        url: '/car/top-announcements/',
        next: '',
        fromJson: AdModel.fromJson,
        query: {'limit': 10},
      );
}
