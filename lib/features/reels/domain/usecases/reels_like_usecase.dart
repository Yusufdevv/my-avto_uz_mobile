import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/reels/data/repositories/reel_repo_impl.dart';
import 'package:auto/features/reels/domain/repositories/reel_repository.dart';

class ReelsLikeUsecase extends UseCase<dynamic, int> {
  final ReelRepository repository = serviceLocator<ReelRepositoryImpl>();

  @override
  Future<Either<Failure, dynamic>> call(int params) async {
    final v = await repository.getReelsLike(id: params);

    return v;
  }
}
