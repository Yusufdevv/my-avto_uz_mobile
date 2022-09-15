import 'package:auto/core/error/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/utils/either.dart';

class VerifyCodeUseCase extends UseCase<String, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(String params) => repo.postAndSingle(
      endpoint: '/user/registration/sms-verification/verify/',
      fromJson: (data) => '');
}
