import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reels/data/models/reel_model.dart';

abstract class ReelRepository {
  const ReelRepository();

  Future<Either<Failure, GenericPagination<ReelModel>>> getReels({
    String? search,
    int? limit,
    int? offset,
  }) {
    throw Exception('not implemented');
  }

}
