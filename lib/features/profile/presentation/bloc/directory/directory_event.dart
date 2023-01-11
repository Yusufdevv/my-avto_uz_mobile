part of 'directory_bloc.dart';

class DirectoryEvent {}

class GetDirCategoriesEvent extends DirectoryEvent {}

class GetDirectoriesEvent extends DirectoryEvent {
  final String search;
  GetDirectoriesEvent({this.search = ''});
}

class GetDirectoryEvent extends DirectoryEvent {
  final String id;
  GetDirectoryEvent({required this.id});
}

class DirectoryFilterEvent extends DirectoryEvent {
  String? regions;
  List<DirCategoryEntity>? selectedCategories;
  DirectoryFilterEvent({this.regions, this.selectedCategories});
}
