import 'package:equatable/equatable.dart';
import 'package:limon_pay/core/error/failures.dart';
import 'package:limon_pay/utils/either.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
