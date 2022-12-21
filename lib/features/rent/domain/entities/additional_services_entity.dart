import 'package:equatable/equatable.dart';

class AdditionalServiceEntity extends Equatable {
  const AdditionalServiceEntity({
    this.id = -1,
    this.name = '',
    this.price = '',
  });

  final int id;
  final String name;
  final String price;

  AdditionalServiceEntity copyWith({
    int? id,
    String? name,
    String? price,
  }) =>
      AdditionalServiceEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        price,
      ];
}
