import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';

class ChangePhoneNumberUseCase
    extends UseCase<String, ChangePhoneNumberParams> {
  final ProfileRepository repository;

  ChangePhoneNumberUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(ChangePhoneNumberParams params) async =>
      await repository.changePhoneNumber(phoneNumber: params.phoneNumber);
}

class ChangePhoneNumberParams extends Equatable {
  final String phoneNumber;

  const ChangePhoneNumberParams({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}
