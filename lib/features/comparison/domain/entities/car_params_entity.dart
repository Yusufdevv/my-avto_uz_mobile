import 'package:equatable/equatable.dart';

class CarParamsEntity extends Equatable {
  final double price;
  final String mark;
  final String model;
  final String generation;
  final int year;
  final int numberOfOwners;
  final String probeg;
  final String state;
  final String color;
  final String razgon;
  final String volume;
  final String type;

  const CarParamsEntity(
      {this.mark = '',
      this.model = '',
      this.price = 0,
      this.generation = '',
      this.year = -1,
      this.numberOfOwners = -1,
      this.probeg = '',
      this.state = '',
      this.color = '',
      this.razgon = '',
      this.volume = '',
      this.type = ''});

  @override
  List<Object> get props => [
        price,
        mark,
        model,
        generation,
        year,
        numberOfOwners,
        probeg,
        state,
        color,
        razgon,
        volume,
        type,
      ];
}
