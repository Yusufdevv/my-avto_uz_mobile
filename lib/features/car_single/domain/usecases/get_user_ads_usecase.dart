import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/repository/user_single_repository.dart';
import 'package:auto/features/car_single/domain/repository/user_single_repository.dart'; 
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart'; 
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetUserAdsUseCase extends UseCase<GenericPagination<AnnouncementListEntity>, int> {
  final UserSingleRepository repository = serviceLocator<UserSingleRepositoryImpl>();
  GetUserAdsUseCase( );

  @override
  Future<Either<Failure, GenericPagination<AnnouncementListEntity>>> call(int params) async =>
      repository.getUserAds(params);
}
