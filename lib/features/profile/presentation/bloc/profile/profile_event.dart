part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}
class GetProfileFavoritesEvent extends ProfileEvent {}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String newPassword;
  final String newPasswordConfirm;
  final Function onSuccess;
  final Function(String text) onError;

  ChangePasswordEvent({
    required this.newPassword,
    required this.oldPassword,
    required this.newPasswordConfirm,
    required this.onSuccess,
    required this.onError,
  });
}

class EditProfileEvent extends ProfileEvent {
  final String? name;
  final String? surName;
  final String? image;
  final int? region;
  final Function onSuccess;
  final Function(String text) onError;

  EditProfileEvent({
    required this.onSuccess,
    required this.onError,
    this.name,
    this.region,
    this.image,
    this.surName,
  });
}
