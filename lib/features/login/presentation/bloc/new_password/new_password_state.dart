part of 'new_password_bloc.dart';

class NewPasswordState extends Equatable {
  final FormzStatus status;
  final String toastMessage;
  final String phone;
  const NewPasswordState({
    required this.status,
    required this.phone,
    this.toastMessage = '',
  });
  NewPasswordState copyWith(
          {String? toastMessage, FormzStatus? status, String? phone}) =>
      NewPasswordState(
          phone: phone ?? this.phone,
          status: status ?? this.status,
          toastMessage: toastMessage ?? this.toastMessage);
  @override
  List<Object?> get props => [status, toastMessage, phone];
}
