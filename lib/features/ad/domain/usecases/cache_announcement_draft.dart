// import 'package:auto/core/exceptions/failures.dart';
// import 'package:auto/core/usecases/usecase.dart';
// import 'package:auto/core/utils/either.dart';
// import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
// import 'package:auto/features/ad/domain/usecases/create_announcement.dart';

// class CacheAnnouncementUseCase extends UseCase<void, AnnouncementParams> {
//   final AdRepository repository;

//   CacheAnnouncementUseCase({required this.repository});

//   @override
//   Future<Either<Failure, void>> call(AnnouncementParams params) => repository
//       .cacheDraftAnnouncement(announcementEntity: params.announcementEntity);
// }
