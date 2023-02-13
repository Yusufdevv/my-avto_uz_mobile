import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ads/data/models/min_max_price_year_model.dart';
import 'package:auto/features/ads/data/models/search_history_model.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class AdsRepository {
  const AdsRepository();

  Future<Either<Failure, MinMaxPriceYearModel>> getMinMaxPriceYear(
      {String? currency}) {
    throw Exception('not implemented');
  }

  Future<Either<Failure, GenericPagination<AnnouncementListEntity>>>
      getAnnouncementList(Map<String, dynamic> params) {
    throw Exception('not implemented');
  }

  Future<Either<Failure, void>> filterHistory(
      {required SaveFilterModel model}) {
    throw Exception('not implemented');
  }
}