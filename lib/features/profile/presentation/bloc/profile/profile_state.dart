part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileEntity profileEntity;
  final List<FavoriteEntity> favoriteEntity;
  final String phoneNumber;
  final String session;
  final FormzStatus status;
  final FormzStatus editStatus;
  final FormzStatus changeStatus;

  const ProfileState({
    required this.status,
    required this.profileEntity,
    required this.phoneNumber,
    required this.session,
    required this.favoriteEntity,
    required this.editStatus,
    required this.changeStatus,
  });

  ProfileState copyWith(
          {ProfileEntity? profileEntity,
          List<FavoriteEntity>? favoriteEntity,
          String? phoneNumber,
          String? session,
          FormzStatus? status,
          FormzStatus? editStatus,
          FormzStatus? changeStatus,}) =>
      ProfileState(
        status: status ?? this.status,
        profileEntity: profileEntity ?? this.profileEntity,
        favoriteEntity: favoriteEntity ?? this.favoriteEntity,
        phoneNumber:  phoneNumber ?? this.phoneNumber,
        session:  session ?? this.session,
        editStatus: editStatus ?? this.editStatus,
        changeStatus: changeStatus ?? this.changeStatus,
      );

  @override
  List<Object?> get props => [
        status,
        profileEntity,
        favoriteEntity,
        phoneNumber,
        session,
        editStatus,
        changeStatus,
      ];
}
