import 'package:equatable/equatable.dart';

class AdditionalServiceEntity extends Equatable {
  const AdditionalServiceEntity({
    this.id = -1,
    this.name = '',
    this.price = '',
    this.isSelected = false,
  });

  final int id;
  final String name;
  final String price;
  final bool isSelected;

  AdditionalServiceEntity copyWith({
    int? id,
    String? name,
    String? price,
    bool? isSelected,
  }) =>
      AdditionalServiceEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        isSelected,
      ];
}
