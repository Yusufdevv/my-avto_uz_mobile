import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/announcement/announcement.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';

class GetDraftAnnouncementUseCase
    extends UseCase<AnnouncementEntity, NoParams> {
  final AdRepository repository;

  GetDraftAnnouncementUseCase({required this.repository});

  @override
  Future<Either<Failure, AnnouncementEntity>> call(NoParams params) =>
      repository.getDraftAnnouncement();
}
