part of 'directory_products_bloc.dart';

@immutable
abstract class DirectoryProductsEvent {}

class DirectoryProductsGetEvent extends DirectoryProductsEvent {
  final int id;
  final String slug;

  DirectoryProductsGetEvent({
    required this.id,
    required this.slug,
  });
}
