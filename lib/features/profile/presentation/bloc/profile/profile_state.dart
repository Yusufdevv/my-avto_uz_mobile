part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileDataEntity profileEntity;
  final  TermsOfUseEntity  termsOfUseEntity;
  final FormzStatus status;
  final FormzStatus editStatus;
  final FormzStatus changeStatus;


   const ProfileState({
    required this.status,
    required this.profileEntity,
    required this.termsOfUseEntity,
    required this.editStatus,
    required this.changeStatus,
  });

  ProfileState copyWith(
          {ProfileDataEntity? profileEntity,
          List<AutoEntity>? autoEntity,
           TermsOfUseEntity ? termsOfUseEntity,
          FormzStatus? status,
          FormzStatus? editStatus,
          FormzStatus? secondStatus,
          FormzStatus? changeStatus,}) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
        termsOfUseEntity: termsOfUseEntity ?? this.termsOfUseEntity,
        editStatus: editStatus ?? this.editStatus,
        changeStatus: changeStatus ?? this.changeStatus,
      );

  @override
  List<Object?> get props => [
        status,
        profileEntity,
        termsOfUseEntity,
        editStatus,
        changeStatus,
      ];
}
