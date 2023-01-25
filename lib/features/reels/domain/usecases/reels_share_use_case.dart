import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/reels/data/repositories/reel_repo_impl.dart';
import 'package:auto/features/reels/domain/entities/reels_post_entity.dart';
import 'package:auto/features/reels/domain/repositories/reel_repository.dart';

class ReelsShareUsecase extends UseCase<ReelsPostEntity, int> {
  final ReelRepository repository = serviceLocator<ReelRepositoryImpl>();

  @override
  Future<Either<Failure, ReelsPostEntity>> call(int params) async {
    final v = await repository.getReelsShare(id: params);
    return v;
  }
}