import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class AnnouncementListUseCase
    extends UseCase<GenericPagination<AnnouncementListEntity>, NoParams> {
  AdRepositoryImpl repositoryImpl;
  AnnouncementListUseCase({required this.repositoryImpl});
  @override
  Future<Either<Failure, GenericPagination<AnnouncementListEntity>>> call(
          NoParams params) async =>
      repositoryImpl.getAnnouncementList();
}
