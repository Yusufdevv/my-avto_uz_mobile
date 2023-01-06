part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileDataEntity profileEntity;
  final List<AutoEntity> autoEntity;
  final List<TermsOfUseEntity> termsOfUseEntity;
  final FormzStatus status;
  final FormzStatus secondStatus;
  final FormzStatus editStatus;
  final FormzStatus changeStatus;


    ProfileState({
    required this.status,
    required this.profileEntity,
    required this.autoEntity,
    required this.termsOfUseEntity,
    required this.editStatus,
    required this.secondStatus,
    required this.changeStatus,
  });

  ProfileState copyWith(
          {ProfileDataEntity? profileEntity,
          List<AutoEntity>? autoEntity,
          List<TermsOfUseEntity>? termsOfUseEntity,
          FormzStatus? status,
          FormzStatus? editStatus,
          FormzStatus? secondStatus,
          FormzStatus? changeStatus,}) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
        autoEntity: autoEntity ?? this.autoEntity,
        termsOfUseEntity: termsOfUseEntity ?? this.termsOfUseEntity,
        editStatus: editStatus ?? this.editStatus,
        changeStatus: changeStatus ?? this.changeStatus,
        secondStatus: secondStatus ?? this.secondStatus,
      );

  @override
  List<Object?> get props => [
        status,
        profileEntity,
        autoEntity,
        termsOfUseEntity,
        editStatus,
        changeStatus,
      ];
}
