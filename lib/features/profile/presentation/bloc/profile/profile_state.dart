part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileEntity profileEntity;
  final FormzStatus status;
  final FormzStatus editStatus;

  const ProfileState({
    required this.status,
    required this.profileEntity,
    required this.editStatus,
  });

  ProfileState copyWith({
    ProfileEntity? profileEntity,
    FormzStatus? status,
    FormzStatus? editStatus,
  }) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
        editStatus: editStatus ?? this.editStatus,
      );

  @override
  List<Object?> get props => [
        status,
        profileEntity,
        editStatus,
      ];
}
