part of 'directory_bloc.dart';

class DirectoryEvent {}

class DirectoryGetProductsOfSingleEvent extends DirectoryEvent {
  final String slug;

  DirectoryGetProductsOfSingleEvent({required this.slug});
}

class DirectoryGetCategoriesOfSingleEvent extends DirectoryEvent {
  final String slug;

  DirectoryGetCategoriesOfSingleEvent({required this.slug});
}

class GetDirCategoriesEvent extends DirectoryEvent {}

class GetMoreDirCategoriesEvent extends DirectoryEvent {
  String? next;

  GetMoreDirCategoriesEvent({this.next});
}

class GetDirectoriesEvent extends DirectoryEvent {
  final String search;
  String? next;

  GetDirectoriesEvent({this.search = '', this.next});
}

class GetMoreDirectoriesEvent extends DirectoryEvent {}

class GetDirectorySingleEvent extends DirectoryEvent {
  final String slug;

  GetDirectorySingleEvent({required this.slug});
}

class OnTabIndexChangedEvent extends DirectoryEvent {
  final int index;

  OnTabIndexChangedEvent({required this.index});
}

class DirectorySetRegionEvent extends DirectoryEvent {
  List<RegionEntity> regions;

  DirectorySetRegionEvent({required this.regions});
}
class DirectorySetAllRegionEvent extends DirectoryEvent {
  List<RegionEntity> regions;

  DirectorySetAllRegionEvent({required this.regions});
}

class DirectorySetCategoryEvent extends DirectoryEvent {
  DirCategoryEntity category;

  DirectorySetCategoryEvent({required this.category});
}

class DirectoryClearFilterEvent extends DirectoryEvent {
  DirectoryClearFilterEvent();
}
