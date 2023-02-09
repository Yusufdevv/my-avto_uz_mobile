import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class AnnouncementListUseCase extends UseCase<
    GenericPagination<AnnouncementListEntity>, Map<String, dynamic>> {
  AdRepositoryImpl repositoryImpl = serviceLocator<AdRepositoryImpl>();
  AnnouncementListUseCase();
  @override
  Future<Either<Failure, GenericPagination<AnnouncementListEntity>>> call(
      Map<String, dynamic> params) async =>
      repositoryImpl.getAnnouncementList(params);
}
