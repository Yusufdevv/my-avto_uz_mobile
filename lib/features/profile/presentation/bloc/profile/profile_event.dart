part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String newPassword;
  final String newPasswordConfirm;

  ChangePasswordEvent({
    required this.newPassword,
    required this.oldPassword,
    required this.newPasswordConfirm,
  });
}
