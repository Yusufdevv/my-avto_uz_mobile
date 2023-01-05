import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/main/data/repositories/main_repo_impl.dart';
import 'package:auto/features/main/domain/repositories/main_repository.dart';

class ReadStoryUseCase extends UseCase<dynamic, Map<String, dynamic>> {
  final MainRepository repository = serviceLocator<MainRepositoryImpl>();

  @override
  Future<Either<Failure, dynamic>> call(Map<String, dynamic> params) async {
    final v = await repository.readStory(itemId: params['itemId']);
    return v;
  }
}
