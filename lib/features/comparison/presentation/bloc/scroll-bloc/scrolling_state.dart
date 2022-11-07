part of 'scrolling_bloc.dart';

class ScrollingState extends Equatable {
  final Color color;
  const ScrollingState({required this.color});

  ScrollingState copyWith({Color? color}) =>
      ScrollingState(color: color ?? this.color);

  @override
  List<Object?> get props => [color];
}
