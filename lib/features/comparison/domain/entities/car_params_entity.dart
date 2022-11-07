import 'package:equatable/equatable.dart';

class CarParamsEntity extends Equatable {
  final double price;
  final String mark;
  final String model;
  final String generation;

  const CarParamsEntity(
      {this.mark = '', this.model = '', this.price = 0, this.generation = ''});

  @override
  List<Object> get props => [price, mark, model];
}
