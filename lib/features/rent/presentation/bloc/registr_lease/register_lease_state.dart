part of 'register_lease_bloc.dart';

class RegisterLeaseState extends Equatable {
  final String errorMessage;
  final FormzStatus status;
  const RegisterLeaseState({required this.status, required this.errorMessage});
  RegisterLeaseState copyWith({FormzStatus? status, String? errorMessage}) =>
      RegisterLeaseState(
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage);
  @override
  List<Object?> get props => [status, errorMessage];
}
