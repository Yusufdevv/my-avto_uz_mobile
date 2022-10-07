part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileEntity profileEntity;
  final FormzStatus status;
  final FormzStatus editStatus;
  final FormzStatus changeStatus;

  const ProfileState({
    required this.status,
    required this.profileEntity,
    required this.editStatus,
    required this.changeStatus,
  });

  ProfileState copyWith(
          {ProfileEntity? profileEntity,
          FormzStatus? status,
          FormzStatus? editStatus,
          FormzStatus? changeStatus}) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
        editStatus: editStatus ?? this.editStatus,
        changeStatus: changeStatus ?? this.changeStatus,
      );

  @override
  List<Object?> get props => [
        status,
        profileEntity,
        editStatus,
        changeStatus,
      ];
}
