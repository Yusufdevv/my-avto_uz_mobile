part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  const MainEvent();
}

class InitialEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class ChangeStatusEvent extends MainEvent {
  final FormzStatus status;

  const ChangeStatusEvent(this.status);

  @override
  List<Object?> get props => [status];
}
