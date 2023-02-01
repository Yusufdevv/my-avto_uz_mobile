import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/repository/user_single_repository.dart';
import 'package:auto/features/car_single/domain/repository/user_single_repository.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/dealers/data/models/cars_in_dealer_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetUserAdsUseCase extends UseCase<GenericPagination<AutoEntity>, int> {
  final UserSingleRepository repository = serviceLocator<UserSingleRepositoryImpl>();
  GetUserAdsUseCase( );

  @override
  Future<Either<Failure, GenericPagination<AutoEntity>>> call(int params) async =>
      repository.getUserAds(params);
}
