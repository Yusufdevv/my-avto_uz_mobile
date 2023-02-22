import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';

class UpdateAnnouncementUseCase extends UseCase<void, Map<String, dynamic>> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async =>
      repository.updateAnnouncement(
        announcementFormData: params['form_data'],
        id: params['id'],
      );
}
