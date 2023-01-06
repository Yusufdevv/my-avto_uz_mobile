part of 'verify_bloc.dart';

class VerifyState extends Equatable {
  final FormzStatus status;
  final String phone;
  final String toastMessage;
  const VerifyState({
    required this.status,
    this.toastMessage = '',
    this.phone = '',
  });
  VerifyState copyWith(
          {FormzStatus? status, String? phone, String? toastMessage}) =>
      VerifyState(
          phone: phone ?? this.phone,
          status: status ?? this.status,
          toastMessage: toastMessage ?? this.toastMessage);
  @override
  List<Object?> get props => [status, phone, toastMessage];
}
