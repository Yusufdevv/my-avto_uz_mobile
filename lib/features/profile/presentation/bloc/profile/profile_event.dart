// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class GetTermsOfUseEvent extends ProfileEvent {
  final String slug;
  GetTermsOfUseEvent({required this.slug});
}

class ChangeCountDataEvent extends ProfileEvent {
  final bool adding;
  final int? favoritesCount;
  final int? mySearchesCount;
  final int? myAdsCount;

  ChangeCountDataEvent({required this.adding,   this.favoritesCount, this.mySearchesCount,this.myAdsCount,});
}

class LoginUser extends ProfileEvent {
  final String phone;
  final String password;
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
  final String? fullName;
  final String? image;
  final String? email;
  final int? region;
  final Function onSuccess;
  final Function(String text) onError;

  EditProfileEvent({
    required this.onSuccess,
    required this.onError,
    this.fullName,
    this.email,
    this.region,
    this.image,
  });
}

class ChangeNotificationAllRead extends ProfileEvent {}

// ignore: must_be_immutable
class GetNoReadNotificationsEvent extends ProfileEvent {
  int? filter;
  GetNoReadNotificationsEvent({this.filter});
}
