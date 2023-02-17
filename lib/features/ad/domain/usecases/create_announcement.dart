import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:dio/dio.dart';

class CreateAnnouncementUseCase extends UseCase<void, FormData> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  CreateAnnouncementUseCase();

  @override
  Future<Either<Failure, void>> call(FormData params) async =>
      repository.createAnnouncement(
        announcementFormData: params,
      );
}
