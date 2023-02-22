part of 'verify_contacts_bloc.dart';

class VerifyContactsState extends Equatable {
  final FormzStatus status;
  final String toastMessage;
  const VerifyContactsState({required this.status, this.toastMessage = ''});
  VerifyContactsState copyWith({FormzStatus? status, String? toastMessage}) =>
      VerifyContactsState(
          status: status ?? this.status,
          toastMessage: toastMessage ?? this.toastMessage);
  @override
  List<Object?> get props => [status, toastMessage];
}
