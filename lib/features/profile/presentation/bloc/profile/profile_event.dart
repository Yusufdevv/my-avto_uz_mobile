// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}
class GetProfileFavoritesEvent extends ProfileEvent {
  final String endpoint;
  GetProfileFavoritesEvent({
    required this.endpoint,
  });
}
class GetTermsOfUseEvent extends ProfileEvent {}
class ChangePhoneDataEvent extends ProfileEvent {
  final String phone;
  ChangePhoneDataEvent({
    required this.phone,
  });
  
}
class LoginUser extends ProfileEvent {
  final String phone ;
  final String password ;
  LoginUser({required this.password, required this.phone});
}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String newPassword;
  final String newPasswordConfirm;
  final Function(String text) onSuccess;
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
