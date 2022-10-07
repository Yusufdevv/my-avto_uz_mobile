import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/login/domain/usecases/change_password.dart';
import 'package:auto/features/profile/domain/repositories/profile.dart';
import 'package:auto/utils/either.dart';
import 'package:equatable/equatable.dart';

class ChangePasswordUseCase extends UseCase<String, ChangePasswordParams> {
  final ProfileRepository repository;

  ChangePasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(ChangePasswordParams params) async => await repository
      .changePassword(oldPassword: params.oldPassword, newPassword: params.newPassword);
}

class ChangePasswordParams extends Equatable {
  final String oldPassword;
  final String newPassword;

  const ChangePasswordParams({
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [oldPassword, newPassword];
}
