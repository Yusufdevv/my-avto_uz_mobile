import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reels/data/repositories/reel_repo_impl.dart';
import 'package:auto/features/reels/domain/entities/reel_entity.dart';
import 'package:auto/features/reels/domain/repositories/reel_repository.dart';

class GetReelsOfDayUseCase
    extends UseCase<GenericPagination<ReelEntity>, Map<String, dynamic>> {
  final ReelRepository repository = serviceLocator<ReelRepositoryImpl>();

  @override
  Future<Either<Failure, GenericPagination<ReelEntity>>> call(
      Map<String, dynamic> params) async {
    final v = await repository.getReelsOfDay(
      search: params['search'],
      limit: params['limit'],
      offset: params['offset'],
    );

    return v;
  }
}
