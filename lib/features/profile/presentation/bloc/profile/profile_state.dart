part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileDataEntity profileEntity;
  final TermsOfUseEntity termsOfUseEntity;
  final FormzStatus status;
  final FormzStatus editStatus;
  final FormzStatus changeStatus;
  final bool isNotificationAllRead;

  const ProfileState({
    required this.status,
    required this.profileEntity,
    required this.termsOfUseEntity,
    required this.editStatus,
    required this.changeStatus,
    required this.isNotificationAllRead,
  });

  ProfileState copyWith({
    ProfileDataEntity? profileEntity,
    List<AutoEntity>? autoEntity,
    TermsOfUseEntity? termsOfUseEntity,
    FormzStatus? status,
    FormzStatus? editStatus,
    FormzStatus? secondStatus,
    FormzStatus? changeStatus,
    bool? isNotificationAllRead,
  }) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
        termsOfUseEntity: termsOfUseEntity ?? this.termsOfUseEntity,
        editStatus: editStatus ?? this.editStatus,
        changeStatus: changeStatus ?? this.changeStatus,
        isNotificationAllRead:
            isNotificationAllRead ?? this.isNotificationAllRead,
      );

  @override
  List<Object?> get props => [
        status,
        profileEntity,
        termsOfUseEntity,
        editStatus,
        changeStatus,
        isNotificationAllRead
      ];
}
