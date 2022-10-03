part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileEntity profileEntity;
  final FormzStatus status;

  const ProfileState({
    required this.status,
    required this.profileEntity,
  });

  ProfileState copyWith({
    ProfileEntity? profileEntity,
    FormzStatus? status,
  }) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
      );

  @override
  List<Object?> get props => [status, profileEntity];
}
