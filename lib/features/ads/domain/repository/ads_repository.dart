import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ads/data/models/min_max_price_year_model.dart';
import 'package:auto/features/ads/data/models/save_filter_model.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class AdsRepository {
  const AdsRepository();

  Future<Either<Failure, MinMaxPriceYearModel>> getMinMaxPriceYear(
      {String? currency});

  Future<Either<Failure, GenericPagination<AnnouncementListEntity>>>
      getAnnouncementList(Map<String, dynamic> params);

  Future<Either<Failure, void>> filterHistory({required SaveFilterModel model});
}
