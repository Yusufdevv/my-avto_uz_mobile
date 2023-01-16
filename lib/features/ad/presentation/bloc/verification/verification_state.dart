part of 'verification_bloc.dart';

class VerificationState extends Equatable {
  final FormzStatus status;
  final String? session;
  final String? toastMessage;
  const VerificationState(
      {required this.status, this.toastMessage, this.session});

  VerificationState copyWith(
          {FormzStatus? status, String? session, String? toastMessage}) =>
      VerificationState(
        status: status ?? this.status,
        session: session ?? this.session,
        toastMessage: toastMessage ?? this.toastMessage,
      );

  @override
  List<Object?> get props => [
        status,
        session,
        toastMessage,
      ];
}
