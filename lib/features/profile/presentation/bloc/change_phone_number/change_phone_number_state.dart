part of 'change_phone_number_bloc.dart';

@immutable
class ChangePhoneNumberState extends Equatable {
  final String phoneNumber;
  final String session;
  final FormzStatus status;

  const ChangePhoneNumberState({
    required this.phoneNumber,
    required this.session,
    required this.status,
  });

  ChangePhoneNumberState copyWith({
    String? phoneNumber,
    String? session,
    FormzStatus? status,
  }) =>
      ChangePhoneNumberState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        session: session ?? this.session,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
        phoneNumber,
        session,
        status,
      ];
}
