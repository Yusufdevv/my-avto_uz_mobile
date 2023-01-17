import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reels/data/models/reel_model.dart';
import 'package:auto/features/reels/domain/entities/reels_post_entity.dart';

abstract class ReelRepository {
  const ReelRepository();

  Future<Either<Failure, GenericPagination<ReelModel>>> getReels({
    String? search,
    int? limit,
    int? offset,
  }) {
    throw Exception('not implemented');
  }

  Future<Either<Failure, ReelsPostEntity>> getReelsLike({
    required int id,
  }) {
    throw Exception('not implemented');
  }

  Future<Either<Failure, ReelsPostEntity>> getReelsShare({
    required int id,
  }) {
    throw Exception('not implemented');
  }
}
