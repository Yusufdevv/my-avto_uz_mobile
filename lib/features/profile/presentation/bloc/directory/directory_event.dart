part of 'directory_bloc.dart';

class DirectoryEvent {
}

class GetDirCategoriesEvent extends DirectoryEvent {
}

class GetDirectoriesEvent extends DirectoryEvent {}

class GetDirectoryEvent extends DirectoryEvent {
  final String id;
  GetDirectoryEvent({required this.id});
}