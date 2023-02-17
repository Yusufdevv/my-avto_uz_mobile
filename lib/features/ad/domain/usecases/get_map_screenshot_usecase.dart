import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:flutter/services.dart';

class GetMapScreenShotUseCase extends UseCase<Uint8List, Map<String, String>> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();
  GetMapScreenShotUseCase();

  @override
  Future<Either<Failure, Uint8List>> call(Map<String, String> params) async =>
      await repository.getMapScreenShot(params: params);
}
