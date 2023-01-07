import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';

class VerifyRecoveryUseCase extends UseCase<String, VerifyParam> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(VerifyParam param) => repo.postAndSingle(
          endpoint: '/users/forget-pass/sms-verification/verify/',
          sendToken: false,
          fromJson: (data) => data['phone'],
          data: {
            'phone': '+998${param.phone.replaceAll(' ', '')}',
            'code': param.code,
            'session': param.session,
          });
}


