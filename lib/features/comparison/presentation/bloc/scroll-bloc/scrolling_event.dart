part of 'scrolling_bloc.dart';

@immutable
abstract class ScrollingEvent {}

class ChangeColorEvent extends ScrollingEvent {
  final double offset;
  ChangeColorEvent({required this.offset});
}
