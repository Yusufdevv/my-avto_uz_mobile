import 'dart:developer';

import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ads/data/repository/ads_repo_impl.dart';
import 'package:auto/features/ads/domain/repository/ads_repository.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetAnnouncementListUseCase extends UseCase<
    GenericPagination<AnnouncementListEntity>, Map<String, dynamic>> {
  AdsRepository repositoryImpl = serviceLocator<AdsRepositoryImpl>();

  GetAnnouncementListUseCase();

  @override
  Future<Either<Failure, GenericPagination<AnnouncementListEntity>>> call(
      Map<String, dynamic> params) async {
    log(':::::::::: GetAnnouncementListUseCase triggered:  params is: ${params}  ::::::::::');
    late Either<Failure, GenericPagination<AnnouncementListEntity>> v;
    try {
      v = await repositoryImpl.getAnnouncementList(params);
      log(':::::::::: GOTTEN VALUE IS:  ${v.right.results} }  ::::::::::');
    } catch (e) {
      log(':::::::::: Announcement exception: $e }  ::::::::::');
    }
    return v;
  }
}
