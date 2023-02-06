import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/marks_with_ads_model.dart';
import 'package:auto/features/dealers/data/repositories/marks_in_dealer_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class MarksInDealerUseCase extends UseCase<GenericPagination<MarksWithAdsModel>, Params> {
  final MarksInDealerRepository marks;
  MarksInDealerUseCase({required this.marks});

  @override
  Future<Either<Failure, GenericPagination<MarksWithAdsModel>>> call(Params params) async =>
      marks.getMarks(slug: params.slug, next: params.next);
}

class Params {
  final String slug;
  final String? next;

  Params ({required this.slug, this.next});
}
