part of 'directory_bloc.dart';

class DirectoryState extends Equatable {
  final List<DirectoryEntity> directories;
  final DirectoryEntity directory;
  final List<DirCategoryEntity> categories;
  final FormzStatus status;

  const DirectoryState({
    required this.status,
    required this.directories,
    required this.directory,
    required this.categories,
  });

  DirectoryState copyWith(
          {List<DirectoryEntity>? directories,
          DirectoryEntity? directory,
          FormzStatus? status,
          List<DirCategoryEntity>? categories}) =>
      DirectoryState(
        directories: directories ?? this.directories,
        directory: directory ?? this.directory,
        categories: categories ?? this.categories,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [directories, directory, status, categories];
}
