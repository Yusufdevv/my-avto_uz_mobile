import 'dart:io';

import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';

class GetMapScreenShotUseCase extends UseCase<File, Map<String, String>> {
  final AdRepository repository;
  GetMapScreenShotUseCase({required this.repository});

  @override
  Future<Either<Failure, File>> call(Map<String, String> params) async {
    print('=> => => => params in usecase:     $params    <= <= <= <=');
    return await repository.getMapScreenShot(params:params);
  }
}
