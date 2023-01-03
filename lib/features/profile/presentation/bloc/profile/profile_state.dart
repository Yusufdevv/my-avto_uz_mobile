part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileDataEntity profileEntity;
  final List<AutoEntity> autoEntity;
  final List<TermsOfUseEntity> termsOfUseEntity;
    String phoneNumber;
  final FormzStatus status;
  final FormzStatus editStatus;
  final FormzStatus changeStatus;


    ProfileState({
    required this.status,
    required this.profileEntity,
    required this.autoEntity,
    required this.termsOfUseEntity,
    required this.phoneNumber,
    required this.editStatus,
    required this.changeStatus,
  });

  ProfileState copyWith(
          {ProfileDataEntity? profileEntity,
          List<AutoEntity>? autoEntity,
          List<TermsOfUseEntity>? termsOfUseEntity,
          FormzStatus? status,
          String? phoneNumber,
          FormzStatus? editStatus,
          FormzStatus? changeStatus,}) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
        autoEntity: autoEntity ?? this.autoEntity,
        termsOfUseEntity: termsOfUseEntity ?? this.termsOfUseEntity,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        editStatus: editStatus ?? this.editStatus,
        changeStatus: changeStatus ?? this.changeStatus,
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
