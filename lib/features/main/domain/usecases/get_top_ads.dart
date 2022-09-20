import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/models/ad.dart';
import 'package:auto/features/main/data/models/top_brand.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/utils/either.dart';

class GetTopAdsUseCase extends UseCase<GenericPagination<AdModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<AdModel>>> call(String next) =>
      repo.fetchMore(
          url: '/car/makes/top/', next: next, fromJson: AdModel.fromJson);
}
