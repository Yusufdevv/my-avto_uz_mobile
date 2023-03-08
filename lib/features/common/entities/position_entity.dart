import 'package:equatable/equatable.dart';

class DamagePosition extends Equatable {
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;

  const DamagePosition({this.right, this.bottom, this.left, this.top});

  @override
  List<Object?> get props => [right, bottom, left, top];
}
