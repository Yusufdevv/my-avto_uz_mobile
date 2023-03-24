part of 'directory_products_bloc.dart';

class DirectoryProductsState extends Equatable {
  final FormzStatus status;
  final List<CarProductEntity> products;

  const DirectoryProductsState({
    required this.status,
    this.products = const <CarProductEntity>[],
  });

  DirectoryProductsState copyWith(
          {FormzStatus? status, List<CarProductEntity>? products}) =>
      DirectoryProductsState(
        status: status ?? this.status,
        products: products ?? this.products,
      );

  @override
  List<Object?> get props => [
        status,
        products,
      ];
}
