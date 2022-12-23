part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileEntity profileEntity;
  final List<FavoriteEntity> favoriteEntity;
  final FormzStatus status;
  final FormzStatus editStatus;
  final FormzStatus changeStatus;

  const ProfileState({
    required this.status,
    required this.profileEntity,
    required this.favoriteEntity,
    required this.editStatus,
    required this.changeStatus,
  });

  ProfileState copyWith(
          {ProfileEntity? profileEntity,
          List<FavoriteEntity>? favoriteEntity,
          FormzStatus? status,
          FormzStatus? editStatus,
          FormzStatus? changeStatus}) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
        favoriteEntity: favoriteEntity ?? this.favoriteEntity,
        editStatus: editStatus ?? this.editStatus,
        changeStatus: changeStatus ?? this.changeStatus,
      );

  @override
  List<Object?> get props => [
        status,
        profileEntity,
        favoriteEntity,
        editStatus,
        changeStatus,
      ];
}
